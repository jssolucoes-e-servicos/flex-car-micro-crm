unit microcrm.utils.dialog_await;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFormDialogAwait = class(TForm)
    panelLoading: TPanel;
    lblMessage: TLabel;
    aciLoad: TActivityIndicator;
    pnlLoad: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sMessage: String;
    bLoad : Boolean;
  end;

var
  FormDialogAwait: TFormDialogAwait;

implementation

{$R *.dfm}

procedure TFormDialogAwait.FormShow(Sender: TObject);
begin
  lblMessage.Caption  := sMessage;
  pnlLoad.Visible     :=bLoad;
end;

end.
