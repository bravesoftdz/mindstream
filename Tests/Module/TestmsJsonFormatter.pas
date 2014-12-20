unit TestmsJsonFormatter;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework,
  Data.DBXJSONReflect,
  JSON,
  FMX.Objects,
  msFormatter
  ;

type
  // Test methods for class TmsSerializeController

  TestTmsSerializeController = class(TTestCase)
  strict private
  published
    procedure TestFormat;
  end;

implementation

 uses
  System.SysUtils,
  System.Types,
  System.Classes
  ;

 const
  c_JsonBeforeFormat = 'JsonBeforeFormat.json';
  c_FileNameEtalon = 'JsonFormatEtalon.json';

procedure TestTmsSerializeController.TestFormat;
var
  l_JsonFileBeforeFormat,
  l_FileEtalon, l_Result: TStringList;
begin
 l_JsonFileBeforeFormat := TStringList.Create;
 l_JsonFileBeforeFormat.LoadFromFile(c_JsonBeforeFormat);

 l_FileEtalon := TStringList.Create;
 l_FileEtalon.LoadFromFile(c_FileNameEtalon);

 l_Result := TStringList.Create;
 // TODO: Setup method call parameters
 l_Result.Text:= TmsFormatter.FormatJson(l_JsonFileBeforeFormat.Text);
 // TODO: Validate method results
 CheckTrue(l_FileEtalon.Equals(l_Result));

 FreeAndNil(l_Result);
 FreeAndNil(l_JsonFileBeforeFormat);
 FreeAndNil(l_FileEtalon);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTmsSerializeController.Suite);
end.


