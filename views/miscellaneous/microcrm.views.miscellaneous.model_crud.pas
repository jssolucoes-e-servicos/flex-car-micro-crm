unit microcrm.views.miscellaneous.model_crud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit,
  JvCombobox, JvExControls, JvLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    pnlBackground: TPanel;
    pnlBaseForm: TPanel;
    pnlTitleBar: TPanel;
    Panel3: TPanel;
    lblDescriptionForm: TLabel;
    lblTitleForm: TLabel;
    lblFormName: TLabel;
    lblStatus: TLabel;
    lblCount: TLabel;
    pnlCloseForm: TPanel;
    imgCloseForm: TImage;
    pnlContent: TPanel;
    pnlCenter: TPanel;
    pnlFiterBox: TPanel;
    lblCboField: TJvLabel;
    lblTxtValue: TJvLabel;
    pnlButtonYes: TPanel;
    cboField: TJvComboBox;
    txtValue: TJvEdit;
    procedure pnlCloseFormMouseLeave(Sender: TObject);
    procedure pnlCloseFormMouseEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  pnlCloseForm.Color := $00525252;
end;

procedure TForm1.pnlCloseFormMouseEnter(Sender: TObject);
begin
  pnlCloseForm.Color := $002828FF;
end;

procedure TForm1.pnlCloseFormMouseLeave(Sender: TObject);
begin
  pnlCloseForm.Color := $00525252;
end;

end.
