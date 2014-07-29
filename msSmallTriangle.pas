unit msSmallTriangle;

interface

uses
 msTriangle,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes
 ;

type
 TmsSmallTriangle = class(TmsTriangle)
 protected
  class function InitialHeight: Single; override;
  function FillColor: TAlphaColor; override;

 end;//TmsSmallTriangle

implementation

uses
 System.Math
 ;

{ TmsSmallTriangle }

function TmsSmallTriangle.FillColor: TAlphaColor;
begin
  Result := TAlphaColorRec.Aquamarine;
end;

class function TmsSmallTriangle.InitialHeight: Single;
begin
 Result := 20;
end;

initialization
 TmsSmallTriangle.Register;

end.
