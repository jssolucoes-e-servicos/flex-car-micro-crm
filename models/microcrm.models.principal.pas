unit microcrm.models.principal;

interface

uses
  Data.DB,

  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.UI,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Async,
  FireDAC.Stan.Def,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,

  System.Classes,
  System.IniFiles,
  System.SysUtils,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG, System.ImageList, Vcl.ImgList,
  Vcl.Controls;

type
  TdmPrincipal = class(TDataModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    fdcPrincipal: TFDConnection;
    fdqEmpresa: TFDQuery;
    fdqEmpresaid: TIntegerField;
    fdqEmpresarazao_social: TWideStringField;
    fdqEmpresanome_fantasia: TWideStringField;
    fdqEmpresacnpj: TWideStringField;
    fdqEmpresaie: TWideStringField;
    fdqEmpresacep: TWideStringField;
    fdqEmpresalogradouro: TWideStringField;
    fdqEmpresanumero: TWideStringField;
    fdqEmpresacomplemento: TWideStringField;
    fdqEmpresabairro: TWideStringField;
    fdqEmpresacidade: TWideStringField;
    fdqEmpresatelefone: TWideStringField;
    fdqEmpresatelefone2: TWideStringField;
    fdqEmpresaemail: TWideStringField;
    fdqEmpresasite: TWideStringField;
    fdqEmpresalogo: TWideStringField;
    fdqEmpresahashmaster: TWideStringField;
    fdqConfigs: TFDQuery;
    fdqRecibos: TFDQuery;
    fdqUsuarios: TFDQuery;
    fdqClientes_Status: TFDQuery;
    fdqClientes: TFDQuery;
    fdqServicos_Grupos: TFDQuery;
    fdqServicos: TFDQuery;
    fdqOrcamentos_Status: TFDQuery;
    fdqOrcamentos: TFDQuery;
    fdqConfigsid: TIntegerField;
    fdqConfigsname: TWideStringField;
    fdqConfigsvalor: TWideStringField;
    fdqRecibosid: TIntegerField;
    fdqRecibosreverso: TSmallintField;
    fdqReciboscliente_nome: TWideStringField;
    fdqReciboscliente_documento: TWideStringField;
    fdqRecibosdata_emissao: TSQLTimeStampField;
    fdqRecibosdescricao: TWideStringField;
    fdqRecibosvalor: TFloatField;
    fdqRecibosvalor_descritivo: TWideStringField;
    fdqRecibosforma_pagamento: TWideStringField;
    fdqReciboscriado_em: TSQLTimeStampField;
    fdqRecibosalterado_em: TSQLTimeStampField;
    fdqRecibosusuario_id: TIntegerField;
    fdqUsuariosid: TIntegerField;
    fdqUsuariosnome: TWideStringField;
    fdqUsuariostelefone: TWideStringField;
    fdqUsuariosemail: TWideStringField;
    fdqUsuarioslogin: TWideStringField;
    fdqUsuariossenha: TWideStringField;
    fdqUsuariosperfil: TWideStringField;
    fdqUsuariosativo: TSmallintField;
    fdqUsuarioscriado_em: TSQLTimeStampField;
    fdqUsuariosalterado_em: TSQLTimeStampField;
    fdqClientes_Statusid: TIntegerField;
    fdqClientes_Statusnome: TWideStringField;
    fdqClientes_Statusdescricao: TWideStringField;
    fdqClientes_Statuscor: TWideStringField;
    fdqClientes_Statuscriado_em: TSQLTimeStampField;
    fdqClientes_Statusalterado_em: TSQLTimeStampField;
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
    fdqServicosid: TIntegerField;
    fdqServicosnome: TWideStringField;
    fdqServicosdescricao: TWideStringField;
    fdqServicosvalor: TFloatField;
    fdqServicosajustavel: TSmallintField;
    fdqServicosgrupo_id: TIntegerField;
    fdqServicosativo: TSmallintField;
    fdqServicoscriado_em: TSQLTimeStampField;
    fdqServicosalterado_em: TSQLTimeStampField;
    fdqOrcamentos_Statusid: TIntegerField;
    fdqOrcamentos_Statusnome: TWideStringField;
    fdqOrcamentos_Statuscor: TWideStringField;
    fdqOrcamentos_Statusis_active: TSmallintField;
    fdqOrcamentosid: TIntegerField;
    fdqOrcamentoscliente_id: TIntegerField;
    fdqOrcamentosvalor_subtotal: TFloatField;
    fdqOrcamentosvalor_deconto: TFloatField;
    fdqOrcamentosvalor_total: TFloatField;
    fdqOrcamentosvalor_recebido: TFloatField;
    fdqOrcamentosdetalhes: TWideStringField;
    fdqOrcamentosdata_emissao: TSQLTimeStampField;
    fdqOrcamentosvalidade: TSQLTimeStampField;
    fdqOrcamentosautorizado: TSmallintField;
    fdqOrcamentosautorizado_em: TSQLTimeStampField;
    fdqOrcamentosautorizado_cliente: TWideStringField;
    fdqOrcamentosautorizado_operador: TIntegerField;
    fdqOrcamentosstatus_id: TIntegerField;
    fdqOrcamentoscriado_em: TSQLTimeStampField;
    fdqOrcamentoscriado_por: TIntegerField;
    fdqOrcamentosalterado_em: TSQLTimeStampField;
    fdqOrcamentosalterado_por: TIntegerField;
    fdqOrcamentosPagamentos: TFDQuery;
    fdqFormasPagamento: TFDQuery;
    fdqLogin: TFDQuery;
    fdqFilterClientes: TFDQuery;
    fdqListItensBudget: TFDQuery;
    fdqFilterServicos: TFDQuery;
    fdqBudgetDetails: TFDQuery;
    fdqBudgetDetailsid: TIntegerField;
    fdqBudgetDetailscliente_id: TIntegerField;
    fdqBudgetDetailsvalor_subtotal: TFloatField;
    fdqBudgetDetailsvalor_deconto: TFloatField;
    fdqBudgetDetailsvalor_total: TFloatField;
    fdqBudgetDetailsvalor_recebido: TFloatField;
    fdqBudgetDetailsdetalhes: TWideStringField;
    fdqBudgetDetailsdata_emissao: TSQLTimeStampField;
    fdqBudgetDetailsvalidade: TSQLTimeStampField;
    fdqBudgetDetailsautorizado: TSmallintField;
    fdqBudgetDetailsautorizado_em: TSQLTimeStampField;
    fdqBudgetDetailsautorizado_cliente: TWideStringField;
    fdqBudgetDetailsautorizado_operador: TIntegerField;
    fdqBudgetDetailsstatus_id: TIntegerField;
    fdqBudgetDetailscriado_em: TSQLTimeStampField;
    fdqBudgetDetailscriado_por: TIntegerField;
    fdqBudgetDetailsalterado_em: TSQLTimeStampField;
    fdqBudgetDetailsalterado_por: TIntegerField;
    fdqBudgetDetailsid_1: TIntegerField;
    fdqBudgetDetailsnome: TWideStringField;
    fdqBudgetDetailsdocumento: TWideStringField;
    fdqBudgetDetailstelefone: TWideStringField;
    fdqBudgetDetailsemail: TWideStringField;
    fdqBudgetDetailscep: TWideStringField;
    fdqBudgetDetailslogradouro: TWideStringField;
    fdqBudgetDetailsnumero: TWideStringField;
    fdqBudgetDetailscomplemento: TWideStringField;
    fdqBudgetDetailsbairro: TWideStringField;
    fdqBudgetDetailscidade: TWideStringField;
    fdqBudgetDetailsveiculo_marca: TWideStringField;
    fdqBudgetDetailsveiculo_modelo: TWideStringField;
    fdqBudgetDetailsveiculo_placa: TWideStringField;
    fdqBudgetDetailsveiculo_ano: TWideStringField;
    fdqBudgetDetailsveiculo_km: TWideStringField;
    fdqBudgetDetailsstatus_id_1: TIntegerField;
    fdqBudgetDetailsativo: TSmallintField;
    fdqBudgetDetailscriado_em_1: TSQLTimeStampField;
    fdqBudgetDetailsalterado_em_1: TSQLTimeStampField;
    fdqBudgetDetailscriado_por_1: TIntegerField;
    fdqBudgetDetailsalterado_por_1: TIntegerField;
    fdqFilterClientesid: TIntegerField;
    fdqFilterClientesnome: TWideStringField;
    fdqFilterClientesdocumento: TWideStringField;
    fdqFilterClientestelefone: TWideStringField;
    fdqFilterClientesemail: TWideStringField;
    fdqFilterClientescep: TWideStringField;
    fdqFilterClienteslogradouro: TWideStringField;
    fdqFilterClientesnumero: TWideStringField;
    fdqFilterClientescomplemento: TWideStringField;
    fdqFilterClientesbairro: TWideStringField;
    fdqFilterClientescidade: TWideStringField;
    fdqFilterClientesveiculo_marca: TWideStringField;
    fdqFilterClientesveiculo_modelo: TWideStringField;
    fdqFilterClientesveiculo_placa: TWideStringField;
    fdqFilterClientesveiculo_ano: TWideStringField;
    fdqFilterClientesveiculo_km: TWideStringField;
    fdqFilterClientesstatus_id: TIntegerField;
    fdqFilterClientesativo: TSmallintField;
    fdqFilterClientescriado_em: TSQLTimeStampField;
    fdqFilterClientesalterado_em: TSQLTimeStampField;
    fdqFilterClientescriado_por: TIntegerField;
    fdqFilterClientesalterado_por: TIntegerField;
    fdqFilterServicosid: TIntegerField;
    fdqFilterServicosnome: TWideStringField;
    fdqFilterServicosdescricao: TWideStringField;
    fdqFilterServicosvalor: TFloatField;
    fdqFilterServicosajustavel: TSmallintField;
    fdqFilterServicosgrupo_id: TIntegerField;
    fdqFilterServicosativo: TSmallintField;
    fdqFilterServicoscriado_em: TSQLTimeStampField;
    fdqFilterServicosalterado_em: TSQLTimeStampField;
    fdqOrcamentos_Itens: TFDQuery;
    fdqOrcamentos_Itensid: TIntegerField;
    fdqOrcamentos_Itensorcamento_id: TIntegerField;
    fdqOrcamentos_Itensservico_id: TIntegerField;
    fdqOrcamentos_Itensservico_nome: TWideStringField;
    fdqOrcamentos_Itensservico_valor: TFloatField;
    fdqOrcamentos_Itensvalor: TFloatField;
    fdqOrcamentos_Itensremovido: TSmallintField;
    fdqOrcamentos_Itenscriado_em: TSQLTimeStampField;
    fdqOrcamentos_Itenscriado_por: TIntegerField;
    fdqOrcamentos_Itensalterado_em: TSQLTimeStampField;
    fdqOrcamentos_Itensalterado_por: TIntegerField;
    fdqLoginid: TIntegerField;
    fdqLoginnome: TWideStringField;
    fdqLogintelefone: TWideStringField;
    fdqLoginemail: TWideStringField;
    fdqLoginlogin: TWideStringField;
    fdqLoginsenha: TWideStringField;
    fdqLoginperfil: TWideStringField;
    fdqLoginativo: TSmallintField;
    fdqLogincriado_em: TSQLTimeStampField;
    fdqLoginalterado_em: TSQLTimeStampField;
    ilMaster: TImageList;
    fdqBudgetView: TFDQuery;
    fdqBudgetViewOr�amento: TIntegerField;
    fdqBudgetViewNome: TWideStringField;
    fdqBudgetViewDocumento: TWideStringField;
    fdqBudgetViewTelefone: TWideStringField;
    fdqBudgetViewEmail: TWideStringField;
    fdqBudgetViewMarca: TWideStringField;
    fdqBudgetViewModelo: TWideStringField;
    fdqBudgetViewPlaca: TWideStringField;
    fdqBudgetViewAno: TWideStringField;
    fdqBudgetViewKM: TWideStringField;
    fdqBudgetViewValor: TFloatField;
    fdqBudgetViewRecebido: TFloatField;
    fdqBudgetViewEmiss�o: TSQLTimeStampField;
    fdqBudgetViewValidade: TSQLTimeStampField;
    fdqBudgetViewAprovado: TSmallintField;
    fdqListItensBudgetid: TIntegerField;
    fdqListItensBudgetorcamento_id: TIntegerField;
    fdqListItensBudgetservico_id: TIntegerField;
    fdqListItensBudgetservico_nome: TWideStringField;
    fdqListItensBudgetservico_valor: TFloatField;
    fdqListItensBudgetvalor: TFloatField;
    fdqListItensBudgetremovido: TSmallintField;
    fdqListItensBudgetcriado_em: TSQLTimeStampField;
    fdqListItensBudgetcriado_por: TIntegerField;
    fdqListItensBudgetalterado_em: TSQLTimeStampField;
    fdqListItensBudgetalterado_por: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function getString(section : String; tag : String): String;
    procedure setString(section : String; tag : String);
    function openConnection(): Boolean;
    procedure closeConnection();
    function verifyConfigurationExists(): Boolean;
  end;

var
  dmPrincipal: TdmPrincipal;
  iniconf: TIniFile;
  iniPath: String;

implementation

uses
    ManagerFunctions;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmPrincipal }

procedure TdmPrincipal.closeConnection;
begin
  fdcPrincipal.Connected := False;
end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  //iniPath := ManagerFunctions.ObterDiretorio + 'stack.ini';
end;

procedure TdmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  fdcPrincipal.Connected := False;
end;

function TdmPrincipal.getString(section, tag: String): String;
begin
  try
    try
    iniconf := TIniFile.Create(iniPath);
    Result := iniconf.ReadString(section,tag,'null');
    except on E: Exception do
    end;
  finally
    iniconf.Free;
  end;
end;

function TdmPrincipal.openConnection: Boolean;
var
 vServer, vDbPath: string;
begin
  try
    fdcPrincipal.Connected := False;
    vDbPath := ManagerFunctions.ObterDiretorio;
    //vServer := getString('FDB','TYPE');
    fdcPrincipal.Params.LoadFromFile(vDbPath + 'cpg.inf');
    //if (vServer = 'local') then
    //begin
      //fdcPrincipal.Params.Database := 'fxcar_micrm';
      //fdcPrincipal.Params.UserName := 'root';
      //fdcPrincipal.Params.Password := '';

    //end
    //else
    //begin
      //fdcPrincipal.Params.Database := getString('FDB','PATH') + getString('FDB','FILE') + '.FDB';
      //fdcPrincipal.Params.UserName := 'SYSDBA';
      //fdcPrincipal.Params.Password := 'masterkey';
    //end;
    //FDPhysFBDriverLink1.VendorLib := ManagerFunctions.ObterDiretorio + 'fbclient.dll';
    fdcPrincipal.LoginPrompt  := False;
    fdcPrincipal.Connected    := True;
    Result := fdcPrincipal.Connected;
  except on E: Exception do
  end;
end;

procedure TdmPrincipal.setString(section, tag: String);
begin

end;

function TdmPrincipal.verifyConfigurationExists: Boolean;
var
  vServer, sConfigFile: string;
begin
  try
    sConfigFile := ManagerFunctions.ObterDiretorio + 'cpg.inf';
    if FileExists(sConfigFile) then
      Result    := True
    else
      Result    := False;


    //vServer := getString('FDB','TYPE');
    //ShowMessage(vServer);
    //if vServer = 'local' then
    //  Result := True
   // else
   //   Result := False;
  except on E: Exception do
    Result      := False;
  end;
end;

end.
