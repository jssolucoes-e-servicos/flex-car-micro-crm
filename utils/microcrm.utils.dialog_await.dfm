object FormDialogAwait: TFormDialogAwait
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 115
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object panelLoading: TPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 115
    Align = alClient
    BevelOuter = bvNone
    Color = 14211288
    ParentBackground = False
    TabOrder = 0
    object lblMessage: TLabel
      AlignWithMargins = True
      Left = 115
      Top = 3
      Width = 402
      Height = 109
      Margins.Left = 10
      Align = alClient
      AutoSize = False
      Caption = 'Processando. Por favor, aguarde...'
      Color = 5395026
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5395026
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      ExplicitLeft = 100
      ExplicitTop = 38
      ExplicitWidth = 409
      ExplicitHeight = 30
    end
    object pnlLoad: TPanel
      Left = 0
      Top = 0
      Width = 105
      Height = 115
      Align = alLeft
      BevelOuter = bvNone
      Color = 14211288
      ParentBackground = False
      TabOrder = 0
      object aciLoad: TActivityIndicator
        AlignWithMargins = True
        Left = 30
        Top = 25
        Margins.Left = 30
        Margins.Top = 25
        Align = alLeft
        Animate = True
        IndicatorColor = aicCustom
        IndicatorCustomColor = 5395026
        IndicatorSize = aisXLarge
        IndicatorType = aitRotatingSector
      end
    end
  end
end
