unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmMain = class(TForm)
    pbxEx: TPaintBox;
    pnlButtons: TPanel;
    btnDraw: TButton;
    dtpMain: TDateTimePicker;
    procedure btnDrawClick(Sender: TObject);
  private
    { Private declarations }
    procedure Draw;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnDrawClick(Sender: TObject);
begin
  Draw;
end;

procedure TfrmMain.Draw;
const
  c_Radius = 200;
var
  CenterPoint,
  StartPoint,
  EndPoint : TPoint;

  Angle : Double;
begin
  pbxEx.Canvas.Pen.Color:= clBlack;
  pbxEx.Canvas.Pen.Width:= 2;

  CenterPoint.X := pbxEx.Width div 2;
  CenterPoint.Y := pbxEx.Height div 2;

  pbxEx.Canvas.Ellipse(CenterPoint.X - c_Radius, CenterPoint.Y - c_Radius,
                       CenterPoint.X + c_Radius, CenterPoint.Y + c_Radius);


  Angle := 0;
  while Angle < 2 * Pi do
  begin
    StartPoint.X := CenterPoint.X + Round((c_Radius - 10) * cos(Angle));
    StartPoint.Y := CenterPoint.Y - Round((c_Radius - 10) * sin(Angle));

    EndPoint.X := CenterPoint.X + Round((c_Radius - 40) * cos(Angle));
    EndPoint.Y := CenterPoint.Y - Round((c_Radius - 40) * sin(Angle));

    pbxEx.Canvas.MoveTo(StartPoint.X, StartPoint.Y);
    pbxEx.Canvas.LineTo(EndPoint.X, EndPoint.Y);
    Angle := Angle + Pi / 6;
  end;
end;


end.
