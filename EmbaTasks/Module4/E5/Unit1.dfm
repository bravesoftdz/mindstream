object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 242
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbHeight: TLabel
    Left = 8
    Top = 64
    Width = 39
    Height = 13
    Caption = 'lbHeight'
  end
  object DoIt: TButton
    Left = 160
    Top = 8
    Width = 75
    Height = 25
    Caption = 'DoIt'
    TabOrder = 0
    OnClick = DoItClick
  end
  object L: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'L'
  end
  object alpha: TEdit
    Left = 8
    Top = 37
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'alpha'
  end
end