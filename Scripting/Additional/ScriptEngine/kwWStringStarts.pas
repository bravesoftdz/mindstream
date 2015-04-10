unit kwWStringStarts;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "ScriptEngine"
// ������: "w:/common/components/rtl/Garant/ScriptEngine/kwWStringStarts.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::WString_Starts
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
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwDualWStrWord.imp.pas}
 TkwWStringStarts = {final} class(_tfwDualWStrWord_)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Tl3WString;
     const aStr2: Tl3WString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringStarts
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  SysUtils,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwWStringStarts;

{$Include ..\ScriptEngine\tfwDualWStrWord.imp.pas}

// start class TkwWStringStarts

procedure TkwWStringStarts.DoStrings(const aCtx: TtfwContext;
  const aStr1: Tl3WString;
  const aStr2: Tl3WString);
//#UC START# *4F4FE58702AD_4F4FE3E701E5_var*
//#UC END# *4F4FE58702AD_4F4FE3E701E5_var*
begin
//#UC START# *4F4FE58702AD_4F4FE3E701E5_impl*
 aCtx.rEngine.PushBool(l3Starts(aStr1, aStr2, false));
//#UC END# *4F4FE58702AD_4F4FE3E701E5_impl*
end;//TkwWStringStarts.DoStrings

class function TkwWStringStarts.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:Starts';
end;//TkwWStringStarts.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwDualWStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.