unit kwIterateSubDecriptorsOnSubPanelEX;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "ScriptEngine"
// ������: "w:/common/components/rtl/Garant/ScriptEngine/kwIterateSubDecriptorsOnSubPanelEX.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SubPanelWords::IterateSubDecriptorsOnSubPanelEX
//
// ���������� ��� SubDescriptot �� SubPanel, ������� *����� ����* ���������� (!). �.�. �������� ��
// Visible �� ������������. ���� ��� �����, �� ����� ���������� � ��������.
// ������:
// {code}
// @ aWord aLayerID aSubPanel IterateSubDecriptorsOnSubPanelEX
// {code}
// aLayerID - ����, � ������� ������������ ��������
// aSubPanel - ������� ���������.
// aWord - ������� ��� ��������� ����:
// {code}
// PROCEDURE CheckDescription OBJECT IN aSubDescription OBJECT IN aSubPanelSub
// // � ����� ������������ ���������� aSubDescription
// ;
// {code}
// ��� ���������� ������ ��������� �� aSubDescription ���� ����� �������: subdescriptor:GetDrawType
// � �.�.
// aSubPanelSub - ���������� ������������� �����.
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
  kwIterateSubDecriptorsOnSubPanel,
  evSubPanelSub,
  tfwScriptingInterfaces,
  evSubPn
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwIterateSubDecriptorsOnSubPanelEX = {final} class(TkwIterateSubDecriptorsOnSubPanel)
  {* ���������� ��� SubDescriptot �� SubPanel, ������� *����� ����* ���������� (!). �.�. �������� �� Visible �� ������������. ���� ��� �����, �� ����� ���������� � ��������. 
������:
[code]
@ aWord aLayerID aSubPanel IterateSubDecriptorsOnSubPanelEX
[code]
aLayerID - ����, � ������� ������������ ��������
aSubPanel - ������� ���������.
aWord - ������� ��� ��������� ����:
[code]
PROCEDURE CheckDescription OBJECT IN aSubDescription OBJECT IN aSubPanelSub
 // � ����� ������������ ���������� aSubDescription
;
[code]
��� ���������� ������ ��������� �� aSubDescription ���� ����� �������: subdescriptor:GetDrawType � �.�.
aSubPanelSub - ���������� ������������� �����. }
 protected
 // overridden protected methods
   procedure PushObjData(const aCtx: TtfwContext;
     aSubDescription: TevSubDescriptor;
     aSubPanelSub: TevSubPanelSub); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIterateSubDecriptorsOnSubPanelEX
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evSubPanelSubArray,
  evSubPanelSubCollection
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwIterateSubDecriptorsOnSubPanelEX

class function TkwIterateSubDecriptorsOnSubPanelEX.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IterateSubDecriptorsOnSubPanelEX';
end;//TkwIterateSubDecriptorsOnSubPanelEX.GetWordNameForRegister

procedure TkwIterateSubDecriptorsOnSubPanelEX.PushObjData(const aCtx: TtfwContext;
  aSubDescription: TevSubDescriptor;
  aSubPanelSub: TevSubPanelSub);
//#UC START# *53EDFA0401B8_53EDF0A20129_var*
//#UC END# *53EDFA0401B8_53EDF0A20129_var*
begin
//#UC START# *53EDFA0401B8_53EDF0A20129_impl*
 aCtx.rEngine.PushObj(aSubDescription);
 aCtx.rEngine.PushObj(aSubPanelSub);
//#UC END# *53EDFA0401B8_53EDF0A20129_impl*
end;//TkwIterateSubDecriptorsOnSubPanelEX.PushObjData

{$IfEnd} //not NoScripts

end.