unit kwWordWorkerWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "ScriptEngine"
// �����: ����� �.�.
// ������: "w:/common/components/rtl/Garant/ScriptEngine/kwWordWorkerWord.pas"
// �����: 26.01.2012 22:09
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WordsDefinition::WordWorkerWord
//
// ���������� �����, ������� ����� �������� �� ������ ���������� �� ��� ��������������� � ����.
// �������� ��� @
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
  kwCompiledWordWorkerWord,
  kwCompiledWordPrim,
  l3ParserInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwWordWorkerWord.imp.pas}
 TkwWordWorkerWord = class(_kwWordWorkerWord_)
  {* ���������� �����, ������� ����� �������� �� ������ ���������� �� ��� ��������������� � ����. �������� ��� @ }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWordWorkerWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledPopToVar,
  kwCompiledVar,
  kwLeftParam,
  l3Base,
  kwCompiledFunction,
  kwCompiledProcedureWithStackChecking,
  kwCompiledImmediateWordWorkerWord,
  kwInlinedWord,
  kwStandardProcedureCloseBracket,
  kwCompiledProcedure,
  SysUtils,
  l3String,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  TypInfo,
  kwIntegerFactory,
  kwStringFactory,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwWordWorkerWord;

{$Include ..\ScriptEngine\kwWordWorkerWord.imp.pas}

// start class TkwWordWorkerWord

class function TkwWordWorkerWord.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WORDWORKER';
end;//TkwWordWorkerWord.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWordWorkerWord.imp.pas}
{$IfEnd} //not NoScripts

end.