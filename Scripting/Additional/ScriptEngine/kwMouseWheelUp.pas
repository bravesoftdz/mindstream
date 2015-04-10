unit kwMouseWheelUp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "ScriptEngine"
// ������: "w:/common/components/rtl/Garant/ScriptEngine/kwMouseWheelUp.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MouseInput::Mouse_WheelUp
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  Windows,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwMouseWheelSupport.imp.pas}
 TkwMouseWheelUp = {final} class(_kwMouseWheelSupport_)
 protected
 // realized methods
   function GetLineCount(const aCtx: TtfwContext): Integer; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseWheelUp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwMouseWheelUp;

{$Include ..\ScriptEngine\kwMouseWheelSupport.imp.pas}

// start class TkwMouseWheelUp

function TkwMouseWheelUp.GetLineCount(const aCtx: TtfwContext): Integer;
//#UC START# *50C861750031_50C8531900E4_var*
//#UC END# *50C861750031_50C8531900E4_var*
begin
//#UC START# *50C861750031_50C8531900E4_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, '�� ������ ���������� ����� ��� ���������', aCtx);
 Result := aCtx.rEngine.PopInt;
//#UC END# *50C861750031_50C8531900E4_impl*
end;//TkwMouseWheelUp.GetLineCount

class function TkwMouseWheelUp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Mouse:WheelUp';
end;//TkwMouseWheelUp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwMouseWheelSupport.imp.pas}
{$IfEnd} //not NoScripts

end.