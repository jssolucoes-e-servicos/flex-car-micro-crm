unit microcrm.views.form.BudgetDetails;

interface

uses
  ACBrBase,
  ACBrEnterTab,

  Data.DB,

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
  Winapi.ShellAPI,
  Winapi.Windows,

  microcrm.models.principal,
  microcrm.models.reports;

type
  TFormBudgetDetails = class(TForm)
    acbrntrtb1: TACBrEnterTab;
    pnlBackground: TPanel;
    pnlFilterCliente: TPanel;
    dbgrd1: TDBGrid;
    pnlBaseForm: TPanel;
    pnlTitleBar: TPanel;
    Panel3: TPanel;
    lblDescriptionForm: TLabel;
    lblTitleForm: TLabel;
    pnlCloseForm: TPanel;
    imgCloseForm: TImage;
    pnlContent: TPanel;
    pnlCenter: TPanel;
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
    edtnome: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label10: TLabel;
    lblValorTotal: TLabel;
    panelItens: TPanel;
    pnlGrid: TPanel;
    dbgItens: TDBGrid;
    panelActions: TPanel;
    dsOrcamentoDetalhes: TDataSource;
    dsItens: TDataSource;
    btnWhatsapp: TButton;
    btnGerarPDF: TButton;
    btnUpdateItens: TButton;
    btnUpdateDetails: TButton;
    btnSave: TButton;
    btnIncluirItem: TButton;
    procedure btnWhatsappClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnGerarPDFClick(Sender: TObject);
    procedure pnlCloseFormMouseEnter(Sender: TObject);
    procedure pnlCloseFormMouseLeave(Sender: TObject);
    procedure pnlCloseFormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBudgetDetails: TFormBudgetDetails;

implementation

{$R *.dfm}

procedure TFormBudgetDetails.btnGerarPDFClick(Sender: TObject);
begin
  dmReports.printOrcamentoParaAprovar(dmPrincipal.fdqBudgetDetailsid.Value.ToString());
end;

procedure TFormBudgetDetails.btnWhatsappClick(Sender: TObject);
var
  Telefone: WideString;
begin
  // Verifica se o valor n�o � vazio e tem 11 d�gitos
  if (Trim(dmPrincipal.fdqBudgetDetailsTELEFONE.Value) <> '') and
     (Length(Trim(dmPrincipal.fdqBudgetDetailsTELEFONE.Value)) = 11) then
  begin
    Telefone := 'https://api.whatsapp.com/send/?phone=55' +
                WideString(dmPrincipal.fdqBudgetViewTELEFONE.Value) +
                '&text=Segue or�amento&type=phone_number&app_absent=1';

    ShellExecute(Handle, 'open', PWideChar(Telefone), '', '', SW_SHOWNORMAL);
  end
  else
  begin
   ShowMessage('Telefone n�o preenchido corretamente')
  end;
end;

procedure TFormBudgetDetails.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmPrincipal.fdqBudgetView.Active := False;
  dmPrincipal.fdqBudgetDetails.Active := False;
  dmPrincipal.fdqBudgetView.Filtered := False;
  dmPrincipal.fdqBudgetView.Active := True;
  dmPrincipal.fdqBudgetView.Last;
end;

procedure TFormBudgetDetails.FormShow(Sender: TObject);
begin
  // Detalhes o Or�amento
  lblTitleForm.Caption := 'Detalhes do Or�amento';
  lblDescriptionForm.Caption := 'de n�mero ' + dmPrincipal.fdqBudgetDetailsID.Value.ToString();
  dmPrincipal.fdqListItensBudget.Active  := False;
  dmPrincipal.fdqListItensBudget.ParamByName('BudgetId').AsInteger  := dmPrincipal.fdqBudgetDetailsID.Value;
  dmPrincipal.fdqListItensBudget.Active  := True;
  lblValorTotal.Caption := 'R$ ' + dmPrincipal.fdqBudgetDetailsvalor_total.Value.ToString();
end;

procedure TFormBudgetDetails.pnlCloseFormClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

procedure TFormBudgetDetails.pnlCloseFormMouseEnter(Sender: TObject);
begin
   pnlCloseForm.Color := $002828FF;
end;

procedure TFormBudgetDetails.pnlCloseFormMouseLeave(Sender: TObject);
begin
   pnlCloseForm.Color := $00525252;
end;

end.
