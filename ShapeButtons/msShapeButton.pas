﻿unit msShapeButton;

interface

uses
 msShape,
 FMX.StdCtrls,
 FMX.Controls,
 FMX.Graphics,
 System.Types,
 msInterfaces,
 System.Classes,
 FMX.ListBox
 ;

type
 TmsShapeButton = class(TButton)
  private
   f_Shape: ImsShape;
   f_ShapeIndex: Integer;
   f_Shapes: TComboBox;
   f_Holder : ImsDiagrammsHolder;
   function ScaleShapeToButton: TPointF;
   procedure MyPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
   procedure MyClick(Sender: TObject);
  public
   constructor Create(AOwner: TComponent;
                      aShape: RmsShape;
                      aShapes: TComboBox;
                      aColumn: Integer;
                      aRow: Integer;
                      const aHolder: ImsDiagrammsHolder);
 end;

implementation

uses
 System.Math.Vectors,
 FMX.Dialogs,
 System.SysUtils,
 msPaletteShapeCreator,
 msShapesForToolbar
 ;


// TmsShapeButton

constructor TmsShapeButton.Create(AOwner: TComponent;
                                  aShape: RmsShape;
                                  aShapes: TComboBox;
                                  aColumn: Integer;
                                  aRow: Integer;
                                  const aHolder: ImsDiagrammsHolder);
begin
 Assert(aShapes <> nil);
 Assert(aShape <> nil);
 Assert(aHolder <> nil);
 inherited Create(AOwner);
 f_Holder := aHolder;

 Width := TmsPaletteShapeCreator.ButtonSize;
 Height := TmsPaletteShapeCreator.ButtonSize;

 f_ShapeIndex := TmsShapesForToolbar.Instance.IndexOf(aShape);
 Assert(f_ShapeIndex >= 0);
 f_Shape := TmsPaletteShapeCreator.Create(aShape).CreateShape
                                     (TmsMakeShapeContext.Create
                                      (TPointF.Create
                                       (TmsPaletteShapeCreator.ButtonSize / 2,
                                        TmsPaletteShapeCreator.ButtonSize / 2),
                                        nil,
                                        nil)
                                      );
 f_Shapes := aShapes;
 OnPaint := MyPaint;
 OnClick := MyClick;

 Assert(f_Shape <> nil);
 Assert(f_Shape.IsClassTypeNamedAs(f_Shapes.Items[f_ShapeIndex]));

 Self.Position.X := aColumn * TmsPaletteShapeCreator.ButtonSize;
 Self.Position.Y := aRow * TmsPaletteShapeCreator.ButtonSize;

end;

const
 cBorder = 10;
 // - отступ от края кнопки до фигуры

procedure TmsShapeButton.MyPaint(Sender: TObject;
                                 Canvas: TCanvas;
                                 const ARect: TRectF);
var
 l_OriginalMatrix: TMatrix;
 l_Matrix: TMatrix;
 l_CenterPoint: TPointF;
 l_Scale: TPointF;
begin
 if (f_Shape = nil) then
 begin
  Exit;
 end;//f_Shape = nil
 l_OriginalMatrix := Canvas.Matrix;
 try
//  l_CenterPoint := f_Shape.StartPoint;
  l_CenterPoint := f_Shape.DrawBounds.TopLeft;

  l_Matrix := TMatrix.Identity;
  // - СНИМАЕМ оригинальную матрицу, точнее берём ЕДИНИЧНУЮ матрицу
  // https://ru.wikipedia.org/wiki/%D0%95%D0%B4%D0%B8%D0%BD%D0%B8%D1%87%D0%BD%D0%B0%D1%8F_%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D1%86%D0%B0
  l_Matrix := l_Matrix * TMatrix.CreateTranslation(-l_CenterPoint.X, -l_CenterPoint.Y);
  // - сдвигаем начало координат для фигуры

  l_Scale := ScaleShapeToButton;

  l_Matrix := l_Matrix * TMatrix.CreateScaling(l_Scale.X, l_Scale.Y);
  // - задаём  шкалу
  l_Matrix := l_Matrix * TMatrix.CreateTranslation(cBorder, cBorder);
  // - задаём начало координат - относительно кнопки
  l_Matrix := l_Matrix * l_OriginalMatrix;
  // - ПРИМЕНЯЕМ оригинальную матрицу
  // Иначе например ОРИГИНАЛЬНЫЙ параллельный перенос - не будет работать.
  // https://ru.wikipedia.org/wiki/%D0%9F%D0%B0%D1%80%D0%B0%D0%BB%D0%BB%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%BF%D0%B5%D1%80%D0%B5%D0%BD%D0%BE%D1%81

  Canvas.SetMatrix(l_Matrix);
  // - применяем нашу "комплексную" матрицу

  f_Shape.DrawTo(TmsDrawContext.Create(Canvas));
  // - отрисовываем примитив с учётом матрицы преобразований
 finally
  Canvas.SetMatrix(l_OriginalMatrix);
  // - восстанавливаем ОРИГИНАЛЬНУЮ матрицу
 end;//try..finally
end;

procedure TmsShapeButton.MyClick(Sender: TObject);
begin
 Assert(f_Shape.IsClassTypeNamedAs(f_Shapes.Items[f_ShapeIndex]));
 if not f_Shape.NullClick(ImsDiagrammsHolder(f_Holder)) then
  f_Shapes.ItemIndex := f_ShapeIndex;
end;

function TmsShapeButton.ScaleShapeToButton: TPointF;
var
 l_B : TRectF;
begin
 l_B := f_Shape.DrawBounds;
 Result:= TPointF.Create((Self.Width - cBorder * 2) / Abs(l_B.Right - l_B.Left),
                         // 100 тут это "ширина фигуры" мы потом её честно посчитаем
                         (Self.Height - cBorder * 2) / Abs(l_B.Bottom - l_B.Top));
end;

end.
