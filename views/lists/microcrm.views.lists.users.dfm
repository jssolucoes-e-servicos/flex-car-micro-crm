﻿inherited FormListUsers: TFormListUsers
  Caption = 'Usu'#225'rios'
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
              Items.Strings = (
                'NOME'
                'TELEFONE'
                'LOGIN')
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
                  Width = 300
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
                  FieldName = 'Email'
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
                  FieldName = 'Login'
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
                  FieldName = 'Perfil'
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
    Active = False
    SQL.Strings = (
      'select'
      ' u.id as "C'#243'digo",'
      ' u.nome as "Nome",'
      ' u.telefone as "Telefone",'
      ' u.email as "Email",'
      ' u.login as "Login",'
      ' u.perfil as "Perfil",'
      ' u.ativo AS "Ativo"'
      ' from usuarios AS u')
    object fdqListCódigo: TIntegerField
      FieldName = 'C'#243'digo'
      Origin = '"C'#243'digo"'
    end
    object fdqListNome: TWideStringField
      FieldName = 'Nome'
      Origin = '"Nome"'
      Size = 255
    end
    object fdqListTelefone: TWideStringField
      FieldName = 'Telefone'
      Origin = '"Telefone"'
      Size = 11
    end
    object fdqListEmail: TWideStringField
      FieldName = 'Email'
      Origin = '"Email"'
      Size = 255
    end
    object fdqListLogin: TWideStringField
      FieldName = 'Login'
      Origin = '"Login"'
      Size = 32
    end
    object fdqListPerfil: TWideStringField
      FieldName = 'Perfil'
      Origin = '"Perfil"'
    end
    object fdqListAtivo: TSmallintField
      FieldName = 'Ativo'
      Origin = '"Ativo"'
      DisplayFormat = 'Sim;N'#227'o'
    end
  end
end
