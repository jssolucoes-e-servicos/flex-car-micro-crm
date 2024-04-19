unit microcrm.views.principal;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Variants,

  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.FormTabsBar,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,

  Winapi.Messages,
  Winapi.Windows;

type
  TFormPrincipal = class(TForm)
    pnlHeaderApp: TPanel;
    pnlCloseForm: TPanel;
    pnlHeaderContents: TPanel;
    lblNameEmpresa: TLabel;
    pnlHeaderLeft: TPanel;
    imgLogoEmpresa: TImage;
    imgCloseForm: TImage;
    pgcMenu: TPageControl;
    tsAtendimento: TTabSheet;
    pnlAtendimentoContent: TPanel;
    pnlGropupOrcamento: TPanel;
    pnlMenuOrcLayoutBottom: TPanel;
    lblMenuGroupOrcTitle: TLabel;
    pnlMenuOrcLayoutContent: TPanel;
    btnOrcamentosNovo: TSpeedButton;
    shpLine1: TShape;
    btnOrcamentosLista: TSpeedButton;
    pnlGropupFinanceiro: TPanel;
    pnl: TPanel;
    lblMenuGroupFinTitle1: TLabel;
    pnlGropupFinanceiro2: TPanel;
    btnFianceiroEmitirRecibo: TSpeedButton;
    shpLine11: TShape;
    btnFianceiroListarRecibos: TSpeedButton;
    tsCadastros: TTabSheet;
    pnl1: TPanel;
    pnlGropupCadastrosBasicos: TPanel;
    pnl2: TPanel;
    lblMenuGroupOrcTitle1: TLabel;
    pnlGropupOrcamento2: TPanel;
    btnListServicos: TSpeedButton;
    btnListClientes: TSpeedButton;
    shpLine14: TShape;
    Shape1: TShape;
    btnUsu�rios: TSpeedButton;
    pnlGropupFinanceiro1: TPanel;
    pnl3: TPanel;
    lblMenuGroupFinTitle11: TLabel;
    pnlGropupOrcamento3: TPanel;
    btnMeuPerfil: TSpeedButton;
    imgLogo: TImage;
    pnlBottom: TPanel;
    tbbMain: TFormTabsBar;
    lblOperador: TLabel;
    Label2: TLabel;
    lblVersion: TLabel;
    Label3: TLabel;
    lblEmpresa: TLabel;
    Label4: TLabel;
    pnlFundoBack: TPanel;
    procedure CloseForm(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure pnlCloseFormMouseEnter(Sender: TObject);
    procedure pnlCloseFormMouseLeave(Sender: TObject);
    procedure btnOrcamentosNovoClick(Sender: TObject);
    procedure btnOrcamentosListaClick(Sender: TObject);
    procedure btnListServicosClick(Sender: TObject);
    procedure btnListClientesClick(Sender: TObject);
    procedure btnUsu�riosClick(Sender: TObject);
    procedure btnMeuPerfilClick(Sender: TObject);
    procedure btnFianceiroEmitirReciboClick(Sender: TObject);
    procedure btnFianceiroListarRecibosClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure OpenActionsForm(pClass, pAction: string);
    procedure OpenViewForm(pClass: string);
    procedure OpenNewBudget;
    procedure OpenListBudgets(BudgetId: string);
    procedure HandleFinalizeBudget(BudgetId: String);
    procedure OpenDetailBudget(BudgetId: String);
    procedure CloseViewForm(NameForm: String);
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  ManagerFunctions,
  microcrm.models.principal,
  microcrm.views.lists.services,
  microcrm.views.lists.users,
  microcrm.views.lists.customers,
  microcrm.views.lists.budgets,
  microcrm.views.lists.receipts,
  microcrm.views.form.newbudget,
  microcrm.views.form.BudgetDetails;
{$R *.dfm}

{ TFormPrincipal }

procedure TFormPrincipal.btnFianceiroListarRecibosClick(Sender: TObject);
begin
   OpenViewForm('receipts')
end;

procedure TFormPrincipal.btnFianceiroEmitirReciboClick(Sender: TObject);
begin
  //
end;

procedure TFormPrincipal.btnListClientesClick(Sender: TObject);
begin
  OpenViewForm('FormListCustomers')
end;

procedure TFormPrincipal.btnListServicosClick(Sender: TObject);
begin
  OpenViewForm('FormListServices');
end;

procedure TFormPrincipal.btnMeuPerfilClick(Sender: TObject);
begin
  OpenViewForm('profile')
end;

procedure TFormPrincipal.btnOrcamentosListaClick(Sender: TObject);
begin
  OpenViewForm('FormListBudgets')
end;

procedure TFormPrincipal.btnOrcamentosNovoClick(Sender: TObject);
begin
  OpenNewBudget();
end;

procedure TFormPrincipal.btnUsu�riosClick(Sender: TObject);
begin
  OpenViewForm('FormListUsers')
end;

procedure TFormPrincipal.CloseViewForm(NameForm: String);
begin
  if (NameForm = 'FormListBudget') then
    FreeAndNil(FormListBudget);
  if (NameForm = 'FormListCustomers') then
    FreeAndNil(FormListCustomers);
  if (NameForm = 'FormListServices') then
    FreeAndNil(FormListServices);
  if (NameForm = 'FormListUsers') then
    FreeAndNil(FormListUsers);
  if (NameForm = 'FormListReceipts') then
    FreeAndNil(FormListReceipts);
end;

procedure TFormPrincipal.CloseForm(Sender: TObject);
begin
  Self.Close();
end;

procedure TFormPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := ManagerFunctions.
    CreateMessage(
      'Fechar aplica��o',
      'Realmente deseja sair so sistema?',
      'exit'
    );
  if CanClose then
  begin
    //rotinas de grava��o
    Application.Terminate;
    ExitProcess(0);
  end;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  pgcMenu.ActivePage      := tsAtendimento;
  //pnlCloseForm.Color      := $002828FF;
  pnlCloseForm.Color := $00525252;
  lblNameEmpresa.Caption  := ManagerFunctions.GetSistemInfo('name') +
                          ' - ' +
                          ManagerFunctions.GetSistemInfo('version');
  //lblNameEmpresa.Caption CLOSE
  lblEmpresa.Caption      := ' [ ' +
                            dmPrincipal.fdqEmpresacnpj.Value +
                            ' ] ' +
                            dmPrincipal.fdqEmpresarazao_social.Value;
  // lblNameEmpresa.Caption CLOSE
  lblOperador.Caption     := ' [ ' +
                            dmPrincipal.fdqLoginlogin.Value +
                             ' ] ' +
                             dmPrincipal.fdqLoginnome.Value;
  //  lblOperador.Caption CLOSE
  lblVersion.Caption      := ManagerFunctions.GetSistemInfo('build');
end;

procedure TFormPrincipal.HandleFinalizeBudget(BudgetId: String);
begin
  try
    FormNewBudget.ModalResult           := mrOK;
    FreeAndNil(FormNewBudget);
    dmPrincipal.fdqBudgetView.Active    := False;
    dmPrincipal.fdqBudgetView.Filtered  := False;
    dmPrincipal.fdqBudgetView.Filter    :=  'ID = '+ BudgetId;
    dmPrincipal.fdqBudgetView.Filtered  := True;
    dmPrincipal.fdqBudgetView.Active    := True;

    //abre tela de listagem
    OpenListBudgets(BudgetId);

    OpenDetailBudget(BudgetId)
  except on E: Exception do

  end;
end;

procedure TFormPrincipal.OpenDetailBudget(BudgetId: String);
begin
  try
    //carrega itens
    dmPrincipal.fdqBudgetDetails.Active                               := False;
    dmPrincipal.fdqBudgetDetails.SQL.Clear;
    dmPrincipal.fdqBudgetDetails.SQL.Add('select orcamentos.*, clientes.* from orcamentos ' +
                      'inner join clientes on (clientes.id = orcamentos.cliente_id) where orcamentos.id = :BudgetId');
    dmPrincipal.fdqBudgetDetails.ParamByName('BudgetId').AsInteger    := StrToInt(BudgetId);
    dmPrincipal.fdqBudgetDetails.Active                               := True;

    dmPrincipal.fdqListItensBudget.Active                             := False;
    dmPrincipal.fdqListItensBudget.ParamByName('BudgetId').AsInteger  := StrToInt(BudgetId);
    dmPrincipal.fdqListItensBudget.Active                             := True;
  except on E: Exception do
  end;

  try
    //prepara e abre tela de detalhamento
    if not Assigned(FormBudgetDetails) then
      FormBudgetDetails := TFormBudgetDetails.Create(Self);
    FormBudgetDetails.lblTitleForm.Caption                            := 'Detalhes do Or�amento';
    FormBudgetDetails.lblDescriptionForm.Caption                      := 'de n�mero ' + BudgetId;
    FormBudgetDetails.ShowModal();
  finally
    FreeAndNil(FormBudgetDetails);
  end;
end;

procedure TFormPrincipal.OpenActionsForm(pClass, pAction: string);
begin

end;

procedure TFormPrincipal.OpenListBudgets(BudgetId: String);
begin
  if not Assigned(FormListBudget)then
    FormListBudget := TFormListBudget.Create(Application);
  dmPrincipal.fdqListItensBudget.Active  := True;
  FormListBudget.lblFormName.Caption := 'FormListBudgets';
  //FormListBudget.cboField.Text       := 'OR�AMENTO';
  //FormListBudget.txtValue.Text       := BudgetId;
  dmPrincipal.fdqBudgetView.Active    := False;
  dmPrincipal.fdqBudgetView.Filtered  := False;
  dmPrincipal.fdqBudgetView.Filter    :=  'ID = '+ BudgetId;
  dmPrincipal.fdqBudgetView.Filtered  := True;
  dmPrincipal.fdqBudgetView.Active    := True;
  FormListBudget.show();
end;

procedure TFormPrincipal.OpenNewBudget;
begin
  FormNewBudget := TFormNewBudget.Create(Self);
  try
    FormNewBudget.ShowModal;
  finally
    FormNewBudget.Free;
  end;
end;

procedure TFormPrincipal.OpenViewForm(pClass: string);
begin
   // Or�amentos
  if (pClass = 'FormListBudgets') then
  begin
    if not Assigned(FormListBudget)then
      FormListBudget := TFormListBudget.Create(Application);
    FormListBudget.lblFormName.Caption := 'FormListBudgets';
    FormListBudget.show();
   end;
  // Servi�os
  if (pClass = 'FormListServices') then
  begin
    if not Assigned(FormListServices) then
      FormListServices := TFormListServices.Create(Application);
    FormListServices.lblFormName.Caption := 'FormListServices';
    FormListServices.show();
  end;
  // Clientes
  if (pClass = 'FormListCustomers') then
  begin
    if not Assigned(FormListCustomers) then
      FormListCustomers := TFormListCustomers.Create(Application);
    FormListCustomers.lblFormName.Caption := 'FormListCustomers';
    FormListCustomers.show();
  end;
  // Usuarios
  if (pClass = 'FormListUsers') then
  begin
    if not Assigned(FormListUsers) then
      FormListUsers := TFormListUsers.Create(Application);
    FormListUsers.lblFormName.Caption := 'FormListUsers';
    FormListUsers.show();
  end;
   // Recibos
  if (pClass = 'FormListReceipts') then
  begin
    if not Assigned(FormListReceipts) then
      FormListReceipts := TFormListReceipts.Create(Application);
    FormListReceipts.lblFormName.Caption := 'FormListReceipts';
    FormListReceipts.show();
  end;
end;

procedure TFormPrincipal.pnlCloseFormMouseEnter(Sender: TObject);
begin
  pnlCloseForm.Color := $002828FF;
end;

procedure TFormPrincipal.pnlCloseFormMouseLeave(Sender: TObject);
begin
  pnlCloseForm.Color := $00525252;
end;

end.
