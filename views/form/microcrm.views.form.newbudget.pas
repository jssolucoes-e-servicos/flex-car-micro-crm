unit microcrm.views.form.newbudget;

interface

uses
  ACBrBase,
  ACBrEnterTab,
  JvCombobox,
  JvEdit,
  JvExControls,
  JvExStdCtrls,
  JvLabel,
  ManagerFunctions,

  Data.DB,

  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Async,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,

  System.Classes,
  System.SysUtils,
  System.Variants,

  Vcl.Buttons,
  Vcl.Controls,
  Vcl.DBCtrls,
  Vcl.DBGrids,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Grids,
  Vcl.Imaging.pngimage,
  Vcl.Mask,
  Vcl.StdCtrls,

  Winapi.Messages,
  Winapi.Windows,

  microcrm.models.principal, Vcl.Menus;

type
  TFormNewBudget = class(TForm)
    pnlBackground: TPanel;
    pnlBaseForm: TPanel;
    pnlTitleBar: TPanel;
    Panel3: TPanel;
    lblDescriptionForm: TLabel;
    lblTitleForm: TLabel;
    pnlCloseForm: TPanel;
    imgCloseForm: TImage;
    pnlContent: TPanel;
    pnlCenter: TPanel;
    panelActions: TPanel;
    igmButtonCancel: TImage;
    btnSalva: TSpeedButton;
    pnlFilterCliente: TPanel;
    dbgrd1: TDBGrid;
    panelForm: TPanel;
    panelContentTop: TPanel;
    Label1: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    labelDataCadastro: TLabel;
    labelId: TLabel;
    labelMarca: TLabel;
    edtnome: TDBEdit;
    btnCadastraCliente: TButton;
    btnGravaCliente: TButton;
    edtveiculo_marca: TDBEdit;
    edtdocumento: TDBEdit;
    edtbairro: TDBEdit;
    edtcidade: TDBEdit;
    edtveiculo_modelo: TDBEdit;
    edtveiculo_ano: TDBEdit;
    edtveiculo_km: TDBEdit;
    edtveiculo_placa: TDBEdit;
    edttelefone: TDBEdit;
    edtemail: TDBEdit;
    edtcep: TDBEdit;
    edtlogradouro: TDBEdit;
    dbmmoDETALHES: TDBMemo;
    txtClienteNome: TEdit;
    edtcriado_em: TDBEdit;
    edtid: TDBEdit;
    edtnumero: TDBEdit;
    edtcomplemento: TDBEdit;
    btnIrParaItens: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Label10: TLabel;
    lblValorTotal: TLabel;
    panelItens: TPanel;
    GroupBox1: TGroupBox;
    Label20: TLabel;
    Label22: TLabel;
    txtItemNome: TEdit;
    txtCobrado: TEdit;
    btnIncluirItem: TButton;
    acbrntrtb1: TACBrEnterTab;
    dsClientes: TDataSource;
    dsItens: TDataSource;
    dsOrcamentos: TDataSource;
    fdqClientes: TFDQuery;
    fdqClientesid: TIntegerField;
    fdqClientesnome: TWideStringField;
    fdqClientesdocumento: TWideStringField;
    fdqClientestelefone: TWideStringField;
    fdqClientesemail: TWideStringField;
    fdqClientescep: TWideStringField;
    fdqClienteslogradouro: TWideStringField;
    fdqClientesnumero: TWideStringField;
    fdqClientescomplemento: TWideStringField;
    fdqClientesbairro: TWideStringField;
    fdqClientescidade: TWideStringField;
    fdqClientesveiculo_marca: TWideStringField;
    fdqClientesveiculo_modelo: TWideStringField;
    fdqClientesveiculo_placa: TWideStringField;
    fdqClientesveiculo_ano: TWideStringField;
    fdqClientesveiculo_km: TWideStringField;
    fdqClientesstatus_id: TIntegerField;
    fdqClientesativo: TSmallintField;
    fdqClientescriado_em: TSQLTimeStampField;
    fdqClientesalterado_em: TSQLTimeStampField;
    fdqClientescriado_por: TIntegerField;
    fdqClientesalterado_por: TIntegerField;
    pnlGrid: TPanel;
    dbgItens: TDBGrid;
    pmNewBudget: TPopupMenu;
    AlterarItem1: TMenuItem;
    RemoverItem1: TMenuItem;
    fdqTotalize: TFDQuery;
    procedure pnlCloseFormMouseEnter(Sender: TObject);
    procedure pnlCloseFormMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvaClick(Sender: TObject);
    procedure igmButtonCancelClick(Sender: TObject);
    procedure btnIrParaItensClick(Sender: TObject);
    procedure btnIncluirItemClick(Sender: TObject);
    procedure pnlCloseFormClick(Sender: TObject);
    procedure dsItensDataChange(Sender: TObject; Field: TField);
    procedure dbgItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AlterarItem1Click(Sender: TObject);
    procedure RemoverItem1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SaveItem(pName, pValue: String);
    procedure RemoveItem();
  public
    { Public declarations }
  end;

   type
    TDBGridDefault = class(TCustomGrid);


var
  FormNewBudget: TFormNewBudget;

implementation
  uses
    microcrm.views.principal,
    microcrm.views.modals.edititem;

{$R *.dfm}

procedure TFormNewBudget.AlterarItem1Click(Sender: TObject);
begin
  FormEditItem := TFormEditItem.Create(Self);
   try
     FormEditItem.ShowModal();
     lblValorTotal.Caption := 'R$ ' + dmPrincipal.fdqOrcamentosValor_Total.Value.ToString;
   finally
     FreeAndNil(FormEditItem);
   end;
end;

procedure TFormNewBudget.btnIncluirItemClick(Sender: TObject);
begin
    if (txtItemNome.Text = '' ) then
    begin
      ManagerFunctions.
        CreateMessage('Campos obrigat�rio, n�o preenchido',
                      'A Descri��o do servi�o � necess�ria',
                      'error');
        txtItemNome.SetFocus();
    end
    else if (txtCobrado.Text = '') then
    begin
        ManagerFunctions.
          CreateMessage('Campos obrigat�rio, n�o preenchido',
                        'O valor do servi�o � necess�rio',
                        'error');
        txtCobrado.SetFocus();
    end
    else
    begin
      SaveItem(txtItemNome.Text, txtCobrado.Text);
    end;
end;

procedure TFormNewBudget.btnIrParaItensClick(Sender: TObject);
begin
  fdqClientes.Post;
  fdqClientes.Refresh;
  dmPrincipal.fdqOrcamentoscliente_id.AsInteger := fdqClientesid.Value;
  dmPrincipal.fdqOrcamentos.Post;
  dmPrincipal.fdqOrcamentos.Refresh;
  dmPrincipal.fdqListItensBudget.ParamByName('BudgetId').AsInteger := dmPrincipal.fdqOrcamentosID.Value;
  dmPrincipal.fdqListItensBudget.Active  := True;
  panelItens.Visible     := True;
  btnIrParaItens.Visible := False;
  txtItemNome.Clear;
  txtItemNome.SetFocus;
  lblValorTotal.Caption                     := dmPrincipal.fdqOrcamentosvalor_total.Value.ToString;
end;

procedure TFormNewBudget.btnSalvaClick(Sender: TObject);
begin
  FormPrincipal.HandleFinalizeBudget(dmPrincipal.fdqOrcamentosID.Value.ToString());
end;

procedure TFormNewBudget.dbgItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   //create z effect
  if Odd( dbgItens.DataSource.DataSet.RecNo) then
    dbgItens.Canvas.Brush.Color := $00E9E9E9
  else
    dbgItens.Canvas.Brush.Color := clWhite;

    //change color of selected
  if ( gdSelected in State) then
  begin
     dbgItens.Canvas.Brush.Color := $00F19729;
     dbgItens.Canvas.Font.Color  := $00525252;
     dbgItens.Canvas.Font.Style  := [fsBold];
  end;

  dbgItens.Canvas.FillRect(Rect);
  dbgItens.DefaultDrawColumnCell( Rect, DataCol, Column, State);

  //change position of vertical align
  dbgItens.Canvas.TextRect( Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText );
end;

procedure TFormNewBudget.dsItensDataChange(Sender: TObject; Field: TField);
begin
  if dsItens.DataSet.RecordCount > 0 then
    pnlGrid.Visible := True;
  TDBGridDefault(dbgItens).DefaultRowHeight := 30;
  TDBGridDefault(dbgItens).ClientHeight := ( 30 + TDBGridDefault(dbgItens).RowCount ) + 30;
end;

procedure TFormNewBudget.FormShow(Sender: TObject);
begin
  pnlCloseForm.Color                  := $00525252;
  //customize grid
  TDBGridDefault(dbgItens).DefaultRowHeight := 30;
  TDBGridDefault(dbgItens).ClientHeight := ( 30 + TDBGridDefault(dbgItens).RowCount ) + 30;
  fdqClientes.Active                  := True;
  fdqClientes.Append();
  dmPrincipal.fdqOrcamentos.Active    := True;
  dmPrincipal.fdqOrcamentos.Append();
  edtnome.SetFocus();
  btnIrParaItens.Visible              := True;
  btnCadastraCliente.Visible          := False;
  btnSalva.Visible                    := False;
  pnlGrid.Visible                    := False;
end;

procedure TFormNewBudget.igmButtonCancelClick(Sender: TObject);
begin
  dmPrincipal.fdqOrcamentos.Cancel;
  ModalResult := mrCancel;
end;

procedure TFormNewBudget.pnlCloseFormClick(Sender: TObject);
begin
  dmPrincipal.fdqOrcamentos.Cancel;
  ModalResult := mrCancel;
end;

procedure TFormNewBudget.pnlCloseFormMouseEnter(Sender: TObject);
begin
  pnlCloseForm.Color := $002828FF;
end;

procedure TFormNewBudget.pnlCloseFormMouseLeave(Sender: TObject);
begin
   pnlCloseForm.Color := $00525252;
end;

procedure TFormNewBudget.RemoveItem;
var
  CanDelete : Boolean;
  vActualTotal, vItemValue: Double;
begin
  CanDelete := ManagerFunctions.
    CreateMessage(
      'Confirmar Remo��o',
      'Realmente deseja remover i item: '+ dmPrincipal.fdqListItensBudgetservico_nome.Value +'?',
      'quest'
    );
  if CanDelete then
  begin
    vItemValue := dmPrincipal.fdqListItensBudgetvalor.AsFloat;
    vActualTotal := dmPrincipal.fdqOrcamentosvalor_total.AsFloat;

    dmPrincipal.fdqListItensBudget.Delete;
    dmPrincipal.fdqListItensBudget.Refresh;

    dmPrincipal.fdqOrcamentos.Edit;
    dmPrincipal.fdqOrcamentos.FieldByName('valor_total').AsFloat := vActualTotal - vItemValue;
    dmPrincipal.fdqOrcamentos.Post;
    lblValorTotal.Caption := 'R$ ' + dmPrincipal.fdqOrcamentosValor_Total.Value.ToString;
  end;
end;

procedure TFormNewBudget.RemoverItem1Click(Sender: TObject);
begin
  RemoveItem();
end;

procedure TFormNewBudget.SaveItem(pName, pValue: String);
var
  vActualTotal, vItemValue: Double;
  vValueNotFormated: String;
begin
  vValueNotFormated := Trim(StringReplace(pValue, 'R$', '', [rfReplaceAll, rfIgnoreCase]));
  vValueNotFormated := Trim(StringReplace(vValueNotFormated, ' ', '', [rfReplaceAll]));
  vValueNotFormated := Trim(StringReplace(vValueNotFormated, '.00', '', [rfReplaceAll]));
  vValueNotFormated := StringReplace(vValueNotFormated, ',00', '', [rfReplaceAll]);

  dmPrincipal.fdqOrcamentos_Itens.Active := True;
  dmPrincipal.fdqOrcamentos_Itens.Append;
  dmPrincipal.fdqOrcamentos_Itensorcamento_id.AsInteger := dmPrincipal.fdqOrcamentosID.Value;
  dmPrincipal.fdqOrcamentos_Itensservico_nome.AsString  := pName;
  dmPrincipal.fdqOrcamentos_ItensValor.AsString := vValueNotFormated;
  dmPrincipal.fdqOrcamentos_ItensRemovido.AsInteger := 0;
  dmPrincipal.fdqOrcamentos_Itens.Post;
  dmPrincipal.fdqOrcamentos_Itens.Refresh;
  dmPrincipal.fdqListItensBudget.ParamByName('BudgetId').AsInteger := dmPrincipal.fdqOrcamentosID.Value;
  dmPrincipal.fdqListItensBudget.Active;
  dmPrincipal.fdqListItensBudget.Refresh;
  dmPrincipal.fdqOrcamentos.Edit;
  vActualTotal := dmPrincipal.fdqOrcamentos.FieldByName('VALOR_TOTAL').AsFloat;
  vItemValue := dmPrincipal.fdqOrcamentos_ItensVALOR.AsFloat;
  dmPrincipal.fdqOrcamentos.FieldByName('valor_total').AsFloat := vActualTotal + vItemValue;
  dmPrincipal.fdqOrcamentos.Post;
  dmPrincipal.fdqOrcamentos.Refresh;
  lblValorTotal.Caption := 'R$ ' + dmPrincipal.fdqOrcamentosValor_Total.Value.ToString;
  btnSalva.Visible := True;
  pnlGrid.Visible := True;
  txtItemNome.Clear();
  txtCobrado.Clear();
  txtItemNome.SetFocus();
end;

end.
