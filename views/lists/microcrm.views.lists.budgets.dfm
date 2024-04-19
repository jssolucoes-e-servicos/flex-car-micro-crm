﻿inherited FormListBudget: TFormListBudget
  Caption = 'Or'#231'amentos'
  StyleElements = [seFont, seClient, seBorder]
  ExplicitTop = -18
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
            Width = 909
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited lblTitleForm: TLabel
            Width = 874
            Height = 38
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited lblFormName: TLabel
            StyleElements = [seFont, seClient, seBorder]
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
                Width = 128
                StyleElements = [seFont, seClient, seBorder]
              end
              inherited Label4: TLabel
                Width = 128
                StyleElements = [seFont, seClient, seBorder]
              end
            end
          end
          inherited pnlButtonPrint: TPanel
            StyleElements = [seFont, seClient, seBorder]
            inherited Panel5: TPanel
              StyleElements = [seFont, seClient, seBorder]
              inherited Label5: TLabel
                Width = 128
                StyleElements = [seFont, seClient, seBorder]
              end
              inherited Label6: TLabel
                Width = 128
                StyleElements = [seFont, seClient, seBorder]
              end
            end
          end
          inherited pnlButtonUpdate: TPanel
            StyleElements = [seFont, seClient, seBorder]
            inherited Panel6: TPanel
              StyleElements = [seFont, seClient, seBorder]
              inherited Label7: TLabel
                Width = 128
                StyleElements = [seFont, seClient, seBorder]
              end
              inherited Label8: TLabel
                Width = 128
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
              Color = 15329769
              Font.Color = clBlack
              Items.Strings = (
                'NOME'
                'OR'#199'AMENTO'
                'TELEFONE'
                'EMAIL'
                'PLACA')
            end
            inherited txtValue: TJvEdit
              StyleElements = [seFont, seClient, seBorder]
              Flat = True
              Color = 15329769
              Font.Color = clBlack
            end
          end
          inherited pnlGrid: TPanel
            StyleElements = [seFont, seClient, seBorder]
            inherited dbgList: TDBGrid
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Or'#231'amento'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
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
                  Width = 240
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Telefone'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'E-mail'
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
                  FieldName = 'Marca'
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
                  FieldName = 'Modelo'
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
                  FieldName = 'Placa'
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
                  FieldName = 'Ano'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KM'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 80
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
                  FieldName = 'Recebido'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = -1
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'Emiss'#227'o'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Validade'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = -1
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'Aprovado'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -12
                  Title.Font.Name = 'Segoe UI'
                  Title.Font.Style = [fsBold]
                  Width = 90
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  inherited dsList: TDataSource
    DataSet = dmPrincipal.fdqBudgetView
  end
  inherited fdqList: TFDQuery
    SQL.Strings = (
      'SELECT'
      '  o.id AS "Or'#231'amento",'
      '  c.nome AS "Nome",'
      '  c.documento AS "Documento",'
      '  c.telefone AS "Telefone",'
      '  c.email AS "E-mail",'
      '  c.veiculo_marca AS "Marca",'
      '  c.veiculo_modelo AS "Modelo",'
      '  c.veiculo_placa AS "Placa",'
      '  c.veiculo_ano AS "Ano",'
      '  c.veiculo_km AS "KM",'
      '  o.valor_total AS "Valor",'
      '  o.valor_recebido AS "Recebido",'
      '  o.data_emissao AS "Emiss'#227'o",'
      '  o.validade AS "Validade",'
      '  o.autorizado AS "Aprovado"'
      '  '
      'FROM orcamentos AS o'
      'INNER JOIN clientes AS c ON (c.id = o.cliente_id)')
    object fdqListOrçamento: TIntegerField
      FieldName = 'Or'#231'amento'
      Origin = '"Or'#231'amento"'
    end
    object fdqListNome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Nome'
      Origin = '"Nome"'
      Size = 255
    end
    object fdqListDocumento: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Documento'
      Origin = '"Documento"'
    end
    object fdqListTelefone: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Telefone'
      Origin = '"Telefone"'
      Size = 11
    end
    object fdqListEmail: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'E-mail'
      Origin = '"E-mail"'
      Size = 255
    end
    object fdqListMarca: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Marca'
      Origin = '"Marca"'
      Size = 150
    end
    object fdqListModelo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Modelo'
      Origin = '"Modelo"'
      Size = 150
    end
    object fdqListPlaca: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Placa'
      Origin = '"Placa"'
      Size = 8
    end
    object fdqListAno: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Ano'
      Origin = '"Ano"'
      Size = 4
    end
    object fdqListKM: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'KM'
      Origin = '"KM"'
      Size = 10
    end
    object fdqListValor: TFloatField
      FieldName = 'Valor'
      Origin = '"Valor"'
    end
    object fdqListRecebido: TFloatField
      FieldName = 'Recebido'
      Origin = '"Recebido"'
    end
    object fdqListEmissão: TSQLTimeStampField
      FieldName = 'Emiss'#227'o'
      Origin = '"Emiss'#227'o"'
      ProviderFlags = [pfInUpdate]
    end
    object fdqListValidade: TSQLTimeStampField
      FieldName = 'Validade'
      Origin = '"Validade"'
      ProviderFlags = [pfInUpdate]
    end
    object fdqListAprovado: TSmallintField
      FieldName = 'Aprovado'
      Origin = '"Aprovado"'
      DisplayFormat = 'Sim;N'#227'o'
    end
  end
  inherited dsRemote: TDataSource
    DataSet = dmPrincipal.fdqOrcamentos
  end
end
