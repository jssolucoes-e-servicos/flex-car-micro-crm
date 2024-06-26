unit microcrm.views.lists.receipts;

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
  TFormListReceipts = class(TFormMODELO_LIST)
    fdqListN�mero: TIntegerField;
    fdqListDescri��o: TWideStringField;
    fdqListValor: TFloatField;
    fdqListEmiss�o: TSQLTimeStampField;
    fdqListReverso: TSmallintField;
    fdqListFormadepagamento: TWideStringField;
    fdqListNomedoCLiente: TWideStringField;
    fdqListCPFCNPJ: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormListReceipts: TFormListReceipts;

implementation

{$R *.dfm}

end.
