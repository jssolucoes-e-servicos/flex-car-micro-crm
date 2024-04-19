unit microcrm.views.auth.login;

interface

uses
  BCrypt,

  Data.DB,

  System.Actions,
  System.Classes,
  System.SysUtils,
  System.Threading,
  System.Variants,

  Vcl.ActnList,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,
  Vcl.WinXCtrls,

  Winapi.Messages,
  Winapi.Windows,

  microcrm.models.principal;

type
  TFormLogin = class(TForm)
    ActionList1: TActionList;
    actDevLogin: TAction;
    Label7: TLabel;
    Panel3: TPanel;
    lblLicenciado: TLabel;
    lblEmpresaNome: TLabel;
    lblCNPJ: TLabel;
    Panel4: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Panel1: TPanel;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtUsuario: TEdit;
    txtSenha: TEdit;
    btnEntrar: TPanel;
    panelClose: TPanel;
    panelLoading: TPanel;
    Label4: TLabel;
    ActivityIndicator1: TActivityIndicator;
    dsLogin: TDataSource;
    Panel5: TPanel;
    img1: TImage;
    procedure actDevLoginExecute(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure panelCloseClick(Sender: TObject);
    procedure txtUsuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure panelCloseMouseEnter(Sender: TObject);
    procedure panelCloseMouseLeave(Sender: TObject);
  private
    { Private declarations }
    procedure ValidarLogin;
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

uses
  ManagerFunctions;

  {$R *.dfm}



procedure TFormLogin.actDevLoginExecute(Sender: TObject);

begin
  txtUsuario.Text     := 'JSSOLUCOES';
  txtSenha.Text       := 'DEV1@jssolucoes';
  ValidarLogin();
end;

procedure TFormLogin.btnEntrarClick(Sender: TObject);
begin
  ValidarLogin();
end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
  panelClose.Color := $00525252;
  dmPrincipal.fdqEmpresa.Active := True;
  if (dmPrincipal.fdqEmpresa.RecordCount > 0) then
  begin
    dmPrincipal.fdqEmpresa.First;
    lblCNPJ.Caption             := dmPrincipal.fdqEmpresaCNPJ.Value;
    lblEmpresaNome.Caption      := dmPrincipal.fdqEmpresarazao_social.Value;
  end
  else
  begin
    lblLicenciado.Caption       := 'VERSÃO DE DEMONSTRAÇÃO';
    lblCNPJ.Caption             := '';
    lblEmpresaNome.Caption      := '';
  end;

  txtUsuario.SetFocus();
end;

procedure TFormLogin.panelCloseClick(Sender: TObject);
var
  CanClose: Boolean;
begin
  CanClose      := ManagerFunctions.CreateMessage('Fechar aplicação', 'Realmente deseja sair so sistema?', 'exit');
  if CanClose then
    ModalResult := mrAbort;
end;

procedure TFormLogin.panelCloseMouseEnter(Sender: TObject);
begin
  panelClose.Color := $002828FF;
end;

procedure TFormLogin.panelCloseMouseLeave(Sender: TObject);
begin
  panelClose.Color := $00525252;
end;

procedure TFormLogin.txtSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    ValidarLogin;
end;

procedure TFormLogin.txtUsuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    txtSenha.SetFocus();
end;

procedure TFormLogin.ValidarLogin;
var
  LVerify : Boolean;
  Task: ITask;
begin
  try
    //panelLoading.Visible := True;
    ManagerFunctions.ShowLoad();
    if (txtUsuario.Text <> '') then
    begin
      if (txtSenha.Text <> '') then
      begin
      	//sleep(5000);
        with dmPrincipal.fdqLogin do
        begin
          Active := False;
          ParamByName('pLogin').AsString := txtUsuario.Text;
          Active := True;
        end;
        //panelLoading.Visible := False;

        Self.Caption := dmPrincipal.fdqLogin.RecordCount.ToString;
        if dmPrincipal.fdqLogin.RecordCount > 0 then
        begin
          LVerify := TBCrypt.CompareHash(txtSenha.Text, dmPrincipal.fdqLoginsenha.Value);
          ManagerFunctions.CloseLoad();
          if LVerify = True then
            ModalResult := mrYes
          else
            ManagerFunctions.CreateMessage('Acesso não autorizado', 'Usuártio ou senha incorereto, ou usuário sem permissão de entrar', 'error');
        end
        else
        begin
          ManagerFunctions.CloseLoad();
          ManagerFunctions.CreateMessage('Acesso não autorizado', 'Usuártio ou senha incorereto, ou usuário sem permissão de entrar', 'error');
        end;

      end
      else
      begin
        //panelLoading.Visible := False;
        ManagerFunctions.CloseLoad();
        ManagerFunctions.CreateMessage('Campo não preenchido', 'Você esqueceu de preencher algum campo obrigatório', 'info');
      end;
    end
    else
    begin
      //panelLoading.Visible := False;
      ManagerFunctions.CloseLoad();
      ManagerFunctions.CreateMessage('Campo não preenchido', 'Você esqueceu de preencher algum campo obrigatório', 'info');
    end;
  except
    on E: Exception do
    begin
      //panelLoading.Visible := False;
      ManagerFunctions.CloseLoad();
      ManagerFunctions.CreateMessage('Falha no processamento', E.Message, 'error');
    end;
  end;
end;

end.

