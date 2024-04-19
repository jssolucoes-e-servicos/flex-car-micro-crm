﻿inherited FormListServices: TFormListServices
  Caption = 'Servi'#231'os'
  StyleElements = [seFont, seClient, seBorder]
  ExplicitLeft = 2
  TextHeight = 15
  inherited pnlBackground: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited pnlBaseForm: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited pnlTitleBar: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited Panel3: TPanel
          StyleElements = [seFont, seClient, seBorder]
          inherited lblDescriptionForm: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited lblTitleForm: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited lblFormName: TLabel
            Width = 42
            Caption = 'servicos'
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 42
          end
          inherited lblStatus: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited lblCount: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited pnlCloseForm: TPanel
            StyleElements = [seFont, seClient, seBorder]
          end
        end
      end
      inherited pnlContent: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited pnlLeft: TPanel
          StyleElements = [seFont, seClient, seBorder]
          inherited pnlDivider: TPanel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited pnlButtonNew: TPanel
            StyleElements = [seFont, seClient, seBorder]
            inherited Panel4: TPanel
              StyleElements = [seFont, seClient, seBorder]
              inherited Label2: TLabel
                StyleElements = [seFont, seClient, seBorder]
              end
              inherited Label4: TLabel
                StyleElements = [seFont, seClient, seBorder]
              end
            end
          end
          inherited pnlButtonPrint: TPanel
            StyleElements = [seFont, seClient, seBorder]
            inherited Panel5: TPanel
              StyleElements = [seFont, seClient, seBorder]
              inherited Label5: TLabel
                StyleElements = [seFont, seClient, seBorder]
              end
              inherited Label6: TLabel
                StyleElements = [seFont, seClient, seBorder]
              end
            end
          end
          inherited pnlButtonUpdate: TPanel
            StyleElements = [seFont, seClient, seBorder]
            inherited Panel6: TPanel
              StyleElements = [seFont, seClient, seBorder]
              inherited Label7: TLabel
                StyleElements = [seFont, seClient, seBorder]
              end
              inherited Label8: TLabel
                StyleElements = [seFont, seClient, seBorder]
              end
            end
          end
        end
        inherited pnlCenter: TPanel
          StyleElements = [seFont, seClient, seBorder]
          inherited pnlFiterBox: TPanel
            StyleElements = [seFont, seClient, seBorder]
            inherited pnlButtonYes: TPanel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited cboField: TJvComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited txtValue: TJvEdit
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          inherited pnlGrid: TPanel
            StyleElements = [seFont, seClient, seBorder]
            inherited dbgList: TDBGrid
              Columns = <
                item
                  Expanded = False
                  FieldName = 'C'#243'digo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Nome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 250
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Descri'#231#227'o'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 350
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Valor'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Valor Ajust'#225'vel'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Grupo do Servi'#231'o'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Ativo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 50
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  inherited fdqList: TFDQuery
    SQL.Strings = (
      'SELECT'
      '  s.id as "C'#243'digo", '
      '  s.nome as "Nome", '
      '  s.descricao as "Descri'#231#227'o", '
      '  s.valor as "Valor", '
      '  s.ajustavel as "Valor Ajust'#225'vel",'
      '  s.ativo as "Ativo",'
      '  g.nome AS "Grupo do Servi'#231'o"'
      'FROM servicos AS s'
      'inner join servicos_grupo AS g on (g.id = s.grupo_id)')
    object fdqListCódigo: TIntegerField
      FieldName = 'C'#243'digo'
      Origin = '"C'#243'digo"'
    end
    object fdqListNome: TWideStringField
      FieldName = 'Nome'
      Origin = '"Nome"'
      Size = 150
    end
    object fdqListDescrição: TWideStringField
      FieldName = 'Descri'#231#227'o'
      Origin = '"Descri'#231#227'o"'
      Size = 255
    end
    object fdqListValor: TFloatField
      FieldName = 'Valor'
      Origin = '"Valor"'
    end
    object fdqListValorAjustável: TSmallintField
      FieldName = 'Valor Ajust'#225'vel'
      Origin = '"Valor Ajust'#225'vel"'
      DisplayFormat = 'Sim;N'#227'o'
    end
    object fdqListGrupodoServiço: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Grupo do Servi'#231'o'
      Origin = '"Grupo do Servi'#231'o"'
      Size = 150
    end
    object fdqListAtivo: TSmallintField
      FieldName = 'Ativo'
      Origin = '"Ativo"'
      DisplayFormat = 'Sim;N'#227'o'
    end
  end
  inherited dsRemote: TDataSource
    DataSet = dmPrincipal.fdqServicos
  end
end
