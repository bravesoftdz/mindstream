program FMX.DUnit;
uses
  FMX.Forms,
  u_fmGUITestRunner in 'u_fmGUITestRunner.pas' {fmGUITestRunner},
  u_FirstTest in 'u_FirstTest.pas',
  u_TCounter in 'u_TCounter.pas';

{$R *.res}

begin
 Application.Initialize;
 u_fmGUITestRunner.RunRegisteredTestsModeless;
 Application.Run;
end.
