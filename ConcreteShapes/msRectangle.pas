﻿unit msRectangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes,
 msInterfaces,
 msRectangularShape
 ;

type
 TmsRectangle = class(TmsRectangularShape)
 protected
  class function CornerRadius: Single; override;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsRectangle

implementation

// TmsRectangle

class function TmsRectangle.CornerRadius: Single;
begin
 Result := 0;
end;

procedure TmsRectangle.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_msPointContext: TRectF;
begin
 l_msPointContext := DrawBounds;
 aCtx.rCanvas.DrawRect(l_msPointContext,
                  CornerRadius,
                  CornerRadius,
                  AllCorners,
                  aCtx.rLineOpacity,
                  TCornerType.Round);
 aCtx.rCanvas.FillRect(l_msPointContext,
                  CornerRadius,
                  CornerRadius,
                  AllCorners,
                  aCtx.rOpacity,
                  TCornerType.Round);
end;

end.


