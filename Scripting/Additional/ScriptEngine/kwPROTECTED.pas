unit kwPROTECTED;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "ScriptEngine"
// ������: "kwPROTECTED.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::PROTECTED
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwModifier,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPROTECTED = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPROTECTED
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPROTECTED

function TkwPROTECTED.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F3D1517023Eget_var*
//#UC END# *4DCACED80361_4F3D1517023Eget_var*
begin
//#UC START# *4DCACED80361_4F3D1517023Eget_impl*
 Result := tfw_wmProtected;
//#UC END# *4DCACED80361_4F3D1517023Eget_impl*
end;//TkwPROTECTED.pm_GetModifier

class function TkwPROTECTED.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'PROTECTED';
end;//TkwPROTECTED.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// ����������� PROTECTED
 TkwPROTECTED.RegisterInEngine;
{$IfEnd} //not NoScripts

end.