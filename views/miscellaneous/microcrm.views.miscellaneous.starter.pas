unit microcrm.views.miscellaneous.starter;

interface

uses
  JvExComCtrls,
  JvProgressBar,

  System.Classes,
  System.SysUtils,
  System.Variants,

  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,

  Winapi.Messages,
  Winapi.ShellAPI,
  Winapi.Windows;

type
  TFormStarter = class(TForm)
    Panel3: TPanel;
    memoLoad: TMemo;
    Panel4: TPanel;
    Image1: TImage;
    Timer1: TTimer;
    pgbLoad: TJvProgressBar;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ToogleLoad();
    procedure GenerateModules;
    procedure ConnectDatabase;
    procedure OpenConfigurator;
    procedure OpenTables;
    procedure LoadInterface;
  public
    { Public declarations }
  end;

var
  FormStarter: TFormStarter;

implementation

uses
  ManagerFunctions,

  microcrm.models.principal,
  microcrm.models.reports,
  microcrm.utils.dialog_await;

{$R *.dfm}

procedure TFormStarter.ConnectDatabase;
  var
  bConfigurationExists, bConected :Boolean;
begin
  ToogleLoad();
  memoLoad.Lines.Add('Verificando conex�o com servidor');
  try
    bConfigurationExists := dmPrincipal.verifyConfigurationExists;
    if(bConfigurationExists = False) then
      OpenConfigurator()
    else
      bConected := dmPrincipal.openConnection();
    if (bConected = True) then
    begin
      memoLoad.Lines.Add('Conectado.');
    end;
    ToogleLoad();
  except on E: Exception do
    begin
      memoLoad.Lines.Add('Falha ao comunicar com servidor');
      ManagerFunctions.
          CreateMessage(
            'Falha ao comunicar com servidor',
            E.Message,
            'error'
          );
      ModalResult := mrAbort;
    end;
  end;
end;

procedure TFormStarter.FormShow(Sender: TObject);
begin
  memoLoad.Lines.Clear;
  memoLoad.Lines.Add('Inicializando...');
  ToogleLoad();
end;

procedure TFormStarter.GenerateModules;
begin
   ToogleLoad();
    memoLoad.Lines.Add('Carregando bibliotecas');
    try
      Application.CreateForm(TdmPrincipal, dmPrincipal);
      Application.CreateForm(TdmReports, dmReports);
    except on E: Exception do
      begin
        memoLoad.Lines.Add('Falha ao carregar bibliotecas');
        ManagerFunctions.
          CreateMessage(
            'Entre em contato com o Suporte',
            E.Message,
            'error'
          );
        ModalResult := mrAbort;
      end;
    end;
    ToogleLoad();
end;

procedure TFormStarter.LoadInterface;
begin
  ToogleLoad();
  memoLoad.Lines.Add('Carregando interface do sistema');
  ToogleLoad();
end;

procedure TFormStarter.OpenConfigurator;
var
  appPath : String;
begin
    memoLoad.Lines.Add('Abrindo configurador do sistema');
    appPath := ExtractFilePath(Application.ExeName);
    appPath := appPath + 'Configurator.exe';
    ManagerFunctions.
      CreateMessage(
        'Configura��es Pendentes',
        'N�o foram encontradas as configura��es do servidor, vamos encerrar o sistema e configurar agora.',
        'error'
      );
    ShellExecute( Handle, 'open', PChar(appPath),'','',SW_SHOWNORMAL);

    ModalResult := mrAbort;
end;

procedure TFormStarter.OpenTables;
begin
   ToogleLoad();
  memoLoad.Lines.Add('Carregando tabelas');
  try
     memoLoad.Lines.Add('Carregando clientes');
     dmPrincipal.fdqClientes.Active := True;
     ToogleLoad();
     ToogleLoad();
     memoLoad.Lines.Add('Carregando cliente_status');
     dmPrincipal.fdqClientes_Status.Active := True;
     ToogleLoad();
     ToogleLoad();
     memoLoad.Lines.Add('Carregando consfigs');
     dmPrincipal.fdqConfigs.Active := True;
     ToogleLoad();
     ToogleLoad();
     memoLoad.Lines.Add('Carregando empresa');
     dmPrincipal.fdqEmpresa.Active := True;
     ToogleLoad();
     ToogleLoad();
     memoLoad.Lines.Add('Carregando usu�rios');
     dmPrincipal.fdqUsuarios.Active := True;
     ToogleLoad();
     ToogleLoad();
     memoLoad.Lines.Add('Carregando orcamentos');
     dmPrincipal.fdqOrcamentos.Active := True;
     ToogleLoad();
     ToogleLoad();
     memoLoad.Lines.Add('Carregando orcamento_servicos');
     dmPrincipal.fdqOrcamentos_Itens.Active := True;
     ToogleLoad();
     ToogleLoad();
     memoLoad.Lines.Add('Carregando orcamento_status');
     dmPrincipal.fdqOrcamentos_Status.Active := True;
     ToogleLoad();
     ToogleLoad();
     memoLoad.Lines.Add('Carregando servicos_grupos');
     dmPrincipal.fdqServicos_Grupos.Active := True;
     ToogleLoad();
     ToogleLoad();
     memoLoad.Lines.Add('Carregando servicos');
     dmPrincipal.fdqServicos.Active := True;
     ToogleLoad();
     ToogleLoad();
     //fim
     memoLoad.Lines.Add('tabelas carregadas');
     ToogleLoad();
  except on E: Exception do
  begin
      memoLoad.Lines.Add('Falha ao carregar tabela');
      ManagerFunctions.
        CreateMessage(
          'Falha ao comunicar com servidor',
          E.Message,
          'error'
        );
      ModalResult := mrAbort;
    end;
  end;
end;

procedure TFormStarter.Timer1Timer(Sender: TObject);
begin
  if(pgbLoad.Position < 100) then
  begin
    pgbLoad.Position := pgbLoad.Position + 12;
    case pgbLoad.Position of
      12: GenerateModules;
      48: ConnectDatabase;
      60: OpenTables;
      72: LoadInterface;
      96: memoLoad.Lines.Add('Pronto!');
    end;
  end
  else
  begin
    ToogleLoad();
    ModalResult := mrOk;
  end;
end;

procedure TFormStarter.ToogleLoad;
begin
  if(Timer1.Enabled = False) then
    Timer1.Enabled := True
  else
    Timer1.Enabled := False;
end;

end.
