unit msDiagramm;

interface

uses
 {$Include msItemsHolder.mixin.pas}
 ,
 {$Include msPersistent.mixin.pas}
 ,
 {$Include msShapesProvider.mixin.pas}
 msInterfaces,
 FMX.Graphics,
 System.SysUtils,
 System.Types,
 System.UITypes,
 msShape,
 msPointCircle,
 System.Classes,
 FMX.Objects,
 msRegisteredShapes,
 FMX.Dialogs,
 System.JSON,
 msCoreObjects,
 msInterfacedRefcounted
 ;

type
 TmsItemsHolderParent = TmsInterfacedRefcounted;
 TmsItem = ImsShape;
 {$Include msItemsHolder.mixin.pas}
 TmsPersistentParent = TmsItemsHolder;
 {$Include msPersistent.mixin.pas}
 TmsShapesProviderParent = TmsPersistent;
 {$Include msShapesProvider.mixin.pas}
 TmsDiagramm = class(TmsShapesProvider, ImsDiagramm, ImsShapeByPt, ImsShapesController)
 // - �������� ��������� ImsObjectWrap.
 //   ������ - ���� TmsDiagramm ��� �������� ��������, �� �� ������.
 //   � ���� ����� ImsSerializable, �� - AV.
 //   ��� ��� ����� ������ ��������� ������.
 private
  [JSONMarshalled(False)]
  FCurrentClass: RmsShape;
  [JSONMarshalled(False)]
  FCurrentAddedShape: ImsShape;
  [JSONMarshalled(True)]
  fName: String;
 private
  function CurrentAddedShape: ImsShape;
  procedure BeginShape(const aCurrentClass: RmsShape; const aStart: TPointF);
  procedure EndShape(const aFinish: TPointF);
  function ShapeIsEnded: Boolean;
  function ShapeByPt(const aPoint: TPointF): ImsShape;
  procedure RemoveShape(const aShape: ImsShape);
  function Get_Name: String;
  constructor CreatePrim(const aName: String);
  procedure SaveTo(const aFileName: String); override;
  procedure LoadFrom(const aFileName: String); override;
  function AddShape(const aShape: ImsShape): ImsShape;
 public
  class function Create(const aName: String): ImsDiagramm;
  procedure DrawTo(const aCanvas: TCanvas);
  procedure ProcessClick(const aCurrentClass: TClass; const aStart: TPointF);
  procedure Clear;
  procedure Invalidate;
  procedure SelectShape(aList: TStrings; anIndex: Integer);
  property Name: String read fName write fName;
  procedure Serialize;
  procedure DeSerialize;
  procedure Assign(const anOther : TmsDiagramm);
  property CurrentClass: RmsShape read FCurrentClass write FCurrentClass;
 end;//TmsDiagramm

implementation

uses
 {$Include msItemsHolder.mixin.pas}
 {$Include msPersistent.mixin.pas}
 ,
 {$Include msShapesProvider.mixin.pas}
 msMover,
 msCircle,
 msDiagrammMarshal,
 msInvalidators,
 msShapesForToolbar
 ;

{$Include msItemsHolder.mixin.pas}

{$Include msPersistent.mixin.pas}

{$Include msShapesProvider.mixin.pas}

const
 c_FileName = '.json';

procedure TmsDiagramm.SelectShape(aList: TStrings; anIndex: Integer);
begin
 if (anIndex < 0) then
  CurrentClass :=  TmsShapesForToolbar.Instance.First
 else
  CurrentClass := RmsShape(aList.Objects[anIndex]);
end;

procedure TmsDiagramm.Serialize;
begin
 TmsDiagrammMarshal.Serialize(Self.Name + c_FileName, self);
end;

procedure TmsDiagramm.ProcessClick(const aCurrentClass: TClass; const aStart: TPointF);
begin
 Assert(aCurrentClass.InheritsFrom(TmsShape));
 if ShapeIsEnded then
  // - �� �� ��������� ��������� - ���� ��� ��������
  BeginShape(RmsShape(aCurrentClass), aStart)
 else
  EndShape(aStart);
end;

procedure TmsDiagramm.BeginShape(const aCurrentClass: RmsShape; const aStart: TPointF);
begin
 assert(CurrentClass <> nil);
 FCurrentAddedShape := CurrentClass.Create(TmsMakeShapeContext.Create(aStart, Self));
 if (FCurrentAddedShape <> nil) then
 begin
  Items.Add(FCurrentAddedShape);
  if not FCurrentAddedShape.IsNeedsSecondClick then
   // - ���� �� ���� SecondClick, �� ��� �������� - ��������
   FCurrentAddedShape := nil;
  Invalidate;
 end; // FCurrentAddedShape <> nil
end;

procedure TmsDiagramm.Clear;
begin
 if (f_Items <> nil) then
  f_Items.Clear;
 Invalidate;
end;

class function TmsDiagramm.Create(const aName: String): ImsDiagramm;
begin
 Result := CreatePrim(aName);
end;

constructor TmsDiagramm.CreatePrim(const aName: String);
begin
 inherited Create;
 FCurrentAddedShape := nil;
 FCurrentClass := TmsShapesForToolbar.Instance.First;
 fName := aName;
end;

procedure TmsDiagramm.SaveTo(const aFileName: String);
begin
 TmsDiagrammMarshal.Serialize(aFileName, Self);
end;

procedure TmsDiagramm.LoadFrom(const aFileName: String);
begin
 TmsDiagrammMarshal.DeSerialize(aFileName, Self);
end;

function TmsDiagramm.AddShape(const aShape: ImsShape): ImsShape;
begin
 Items.Add(aShape);
 Result := aShape;
end;

function TmsDiagramm.Get_Name: String;
begin
 Result := FName;
end;

function TmsDiagramm.CurrentAddedShape: ImsShape;
begin
 Result := FCurrentAddedShape;
end;

procedure TmsDiagramm.Assign(const anOther : TmsDiagramm);
begin
 inherited Assign(anOther);
 Self.Name := anOther.Name;
 Self.Invalidate;
end;

procedure TmsDiagramm.DeSerialize;
begin
 Clear;
 try
  TmsDiagrammMarshal.DeSerialize(Self.Name + c_FileName, Self);
 except
  on EFOpenError do
   Exit;
 end;//try..except
end;

procedure TmsDiagramm.DrawTo(const aCanvas: TCanvas);
var
 l_Shape: ImsShape;
begin
 aCanvas.BeginScene;
 try
  Assert(f_Items <> nil);
  for l_Shape in f_Items do
   l_Shape.DrawTo(TmsDrawContext.Create(aCanvas));
 finally
  aCanvas.EndScene;
 end; // try..finally
end;

procedure TmsDiagramm.EndShape(const aFinish: TPointF);
begin
 assert(CurrentAddedShape <> nil);
 CurrentAddedShape.EndTo(TmsEndShapeContext.Create(aFinish, Self));
 FCurrentAddedShape := nil;
 Invalidate;
end;

procedure TmsDiagramm.Invalidate;
begin
 TmsInvalidators.InvalidateDiagramm(Self);
end;

function TmsDiagramm.ShapeIsEnded: Boolean;
begin
 Result := (CurrentAddedShape = nil);
end;

function TmsDiagramm.ShapeByPt(const aPoint: TPointF): ImsShape;
var
 l_Shape: ImsShape;
 l_Index: Integer;
begin
 Result := nil;
 for l_Index := f_Items.Count - 1 downto 0 do
 begin
  l_Shape := f_Items.Items[l_Index];
  if l_Shape.ContainsPt(aPoint) then
  begin
   Result := l_Shape;
   Exit;
  end; // l_Shape.ContainsPt(aPoint)
 end; // for l_Index
end;

procedure TmsDiagramm.RemoveShape(const aShape: ImsShape);
begin
 Assert(f_Items <> nil);
 f_Items.Remove(aShape);
end;

end.
