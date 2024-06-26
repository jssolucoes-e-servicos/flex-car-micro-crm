unit microcrm.views.lists.budgets;

interface

uses
  JvCombobox,
  JvEdit,
  JvExControls,
  JvExStdCtrls,
  JvLabel,

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

  System.Actions,
  System.Classes,
  System.SysUtils,
  System.Variants,

  Vcl.ActnList,
  Vcl.Controls,
  Vcl.DBGrids,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Grids,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,

  Winapi.Messages,
  Winapi.Windows,

  microcrm.models.principal,
  microcrm.models.reports,
  microcrm.views.miscellaneous.model_list,
  microcrm.views.principal;

type
  TFormListBudget = class(TFormMODELO_LIST)
    fdqListOr�amento: TIntegerField;
    fdqListNome: TWideStringField;
    fdqListDocumento: TWideStringField;
    fdqListTelefone: TWideStringField;
    fdqListEmail: TWideStringField;
    fdqListMarca: TWideStringField;
    fdqListModelo: TWideStringField;
    fdqListPlaca: TWideStringField;
    fdqListAno: TWideStringField;
    fdqListKM: TWideStringField;
    fdqListValor: TFloatField;
    fdqListRecebido: TFloatField;
    fdqListEmiss�o: TSQLTimeStampField;
    fdqListValidade: TSQLTimeStampField;
    fdqListAprovado: TSmallintField;
    procedure pnlButtonPrintClick(Sender: TObject);
    procedure dbgListDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 
var
  FormListBudget: TFormListBudget;

implementation

{$R *.dfm}

procedure TFormListBudget.dbgListDblClick(Sender: TObject);
var
  BudgetId: String;
begin
  //inherited;
  //abre tela de listagem
  FormPrincipal.OpenDetailBudget(dmPrincipal.fdqBudgetViewOr�amento.Value.ToString())
end;

procedure TFormListBudget.pnlButtonPrintClick(Sender: TObject);
begin
  //inherited;
  dmReports.printOrcamentoParaAprovar(dmPrincipal.fdqBudgetDetailsid.Value.ToString());
end;

end.
