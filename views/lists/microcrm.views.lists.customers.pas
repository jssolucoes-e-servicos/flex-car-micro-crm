unit microcrm.views.lists.customers;

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
  TFormListCustomers = class(TFormMODELO_LIST)
    fdqListNome: TWideStringField;
    fdqListDocumento: TWideStringField;
    fdqListTelefone: TWideStringField;
    fdqListEmail: TWideStringField;
    fdqListPlaca: TWideStringField;
    fdqListMarca: TWideStringField;
    fdqListModelo: TWideStringField;
    fdqListAno: TWideStringField;
    fdqListKM: TWideStringField;
    fdqListstatus: TWideStringField;
    fdqListAtivo: TSmallintField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormListCustomers: TFormListCustomers;

implementation

{$R *.dfm}

end.
