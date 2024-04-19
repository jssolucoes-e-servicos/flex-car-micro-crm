object FormEditItem: TFormEditItem
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 167
  ClientWidth = 593
  Color = 15832873
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object pnlContent: TPanel
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 583
    Height = 157
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    BevelOuter = bvNone
    Color = 7697781
    ParentBackground = False
    TabOrder = 0
    object Label20: TLabel
      Left = 11
      Top = 50
      Width = 33
      Height = 15
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15329769
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 454
      Top = 47
      Width = 75
      Height = 15
      Caption = 'Valor Cobrado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15329769
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object pnlHeader: TPanel
      Left = 0
      Top = 0
      Width = 583
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = 5395026
      ParentBackground = False
      TabOrder = 0
      object lblFormTitle: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 3
        Width = 570
        Height = 35
        Margins.Left = 10
        Align = alClient
        Caption = 'Altera'#231#227'o de Item'
        Color = 14211288
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15329769
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 203
        ExplicitHeight = 32
      end
    end
    object pnlActions: TPanel
      Left = 0
      Top = 116
      Width = 583
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Color = 5395026
      ParentBackground = False
      TabOrder = 1
      object btnSave: TButton
        AlignWithMargins = True
        Left = 480
        Top = 3
        Width = 100
        Height = 35
        Align = alRight
        Caption = 'Gravar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ImageIndex = 31
        ImageMargins.Left = 5
        Images = dmPrincipal.ilMaster
        ParentFont = False
        TabOrder = 0
        WordWrap = True
        OnClick = btnSaveClick
      end
    end
    object edtItemName: TDBEdit
      Left = 10
      Top = 68
      Width = 438
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 14211288
      DataField = 'servico_nome'
      DataSource = dsEdit
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtValue: TDBEdit
      Left = 454
      Top = 68
      Width = 121
      Height = 23
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 14211288
      DataField = 'servico_valor'
      DataSource = dsEdit
      TabOrder = 3
    end
  end
  object dsEdit: TDataSource
    DataSet = dmPrincipal.fdqListItensBudget
    Left = 280
    Top = 72
  end
end
