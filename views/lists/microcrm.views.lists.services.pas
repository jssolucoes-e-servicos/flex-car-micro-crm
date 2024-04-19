unit microcrm.views.lists.services;

interface

uses
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
  TFormListServices = class(TFormMODELO_LIST)
    fdqListCódigo: TIntegerField;
    fdqListNome: TWideStringField;
    fdqListDescrição: TWideStringField;
    fdqListValor: TFloatField;
    fdqListValorAjustável: TSmallintField;
    fdqListAtivo: TSmallintField;
    fdqListGrupodoServiço: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormListServices: TFormListServices;

implementation

{$R *.dfm}

end.
