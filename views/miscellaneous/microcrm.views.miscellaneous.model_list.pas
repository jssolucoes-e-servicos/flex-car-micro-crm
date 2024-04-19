unit microcrm.views.miscellaneous.model_list;

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
  Vcl.ComCtrls,
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
  ManagerFunctions,

  microcrm.models.principal,
  microcrm.models.reports,
  microcrm.views.principal;

type
  TFormMODELO_LIST = class(TForm)
    dsList: TDataSource;
    pnlBackground: TPanel;
    pnlBaseForm: TPanel;
    pnlTitleBar: TPanel;
    Panel3: TPanel;
    lblDescriptionForm: TLabel;
    lblTitleForm: TLabel;
    lblFormName: TLabel;
    pnlCloseForm: TPanel;
    imgCloseForm: TImage;
    pnlContent: TPanel;
    pnlLeft: TPanel;
    pnlDivider: TPanel;
    pnlButtonNew: TPanel;
    Image1: TImage;
    Panel4: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    pnlButtonPrint: TPanel;
    Image2: TImage;
    Panel5: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    pnlButtonUpdate: TPanel;
    Image3: TImage;
    Panel6: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    pnlCenter: TPanel;
    pnlFiterBox: TPanel;
    lblCboField: TJvLabel;
    lblTxtValue: TJvLabel;
    pnlButtonYes: TPanel;
    cboField: TJvComboBox;
    txtValue: TJvEdit;
    pnlGrid: TPanel;
    dbgList: TDBGrid;
    fdqList: TFDQuery;
    dsRemote: TDataSource;
    aclFormPage: TActionList;
    actEdit: TAction;
    actPrinting: TAction;
    actInsert: TAction;
    actClearFind: TAction;
    tmrCount: TTimer;
    lblStatus: TLabel;
    lblCount: TLabel;
    actViewer: TAction;
    procedure dbgListDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure pnlCloseFormMouseEnter(Sender: TObject);
    procedure pnlCloseFormMouseLeave(Sender: TObject);
    procedure dsListDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure tmrCountTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
    procedure dbgListDblClick(Sender: TObject);
    procedure dsRemoteDataChange(Sender: TObject; Field: TField);
    procedure pnlButtonNewClick(Sender: TObject);
    procedure pnlButtonUpdateClick(Sender: TObject);
    procedure pnlButtonPrintClick(Sender: TObject);
    procedure txtValueChange(Sender: TObject);
    procedure actClearFindExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPrintingExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure pnlButtonYesClick(Sender: TObject);
    procedure pnlCloseFormClick(Sender: TObject);
    procedure cboFieldClick(Sender: TObject);
    procedure actViewerExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure HandleStatus;
  end;

  type
    TDBGridDefault = class(TCustomGrid);

var
  FormMODELO_LIST: TFormMODELO_LIST;

implementation


{$R *.dfm}

procedure TFormMODELO_LIST.actClearFindExecute(Sender: TObject);
begin
  dsList.DataSet.Filtered:= False;
  txtValue.Clear;
  cboField.ItemIndex := 0;
  dsList.DataSet.Refresh;
  dsList.DataSet.Last();
end;

procedure TFormMODELO_LIST.actEditExecute(Sender: TObject);
begin
  FormPrincipal.OpenActionsForm(Self.Name,'update');
end;

procedure TFormMODELO_LIST.actInsertExecute(Sender: TObject);
begin
  FormPrincipal.OpenActionsForm(Self.Name,'insert');
end;

procedure TFormMODELO_LIST.actPrintingExecute(Sender: TObject);
begin
   dmReports.HandelReportByClass(Self.Name);
end;

procedure TFormMODELO_LIST.actViewerExecute(Sender: TObject);
begin
   FormPrincipal.OpenActionsForm(Self.Name,'view');
end;

procedure TFormMODELO_LIST.cboFieldClick(Sender: TObject);
begin
  dsList.DataSet.Active := True;
  dsList.DataSet.Filtered := False;
  txtValue.Clear();
  dsList.DataSet.Last();
end;

procedure TFormMODELO_LIST.dbgListDblClick(Sender: TObject);
begin
   actViewer.Execute();
end;

procedure TFormMODELO_LIST.dbgListDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  //create z effect
  if Odd( dbgList.DataSource.DataSet.RecNo) then
    dbgList.Canvas.Brush.Color := $00E9E9E9
  else
    dbgList.Canvas.Brush.Color := clWhite;

    //change color of selected
  if ( gdSelected in State) then
  begin
     dbgList.Canvas.Brush.Color := $00F19729;
     dbgList.Canvas.Font.Color  := $00525252;
     dbgList.Canvas.Font.Style  := [fsBold];
  end;

  dbgList.Canvas.FillRect(Rect);
  dbgList.DefaultDrawColumnCell( Rect, DataCol, Column, State);

  //change position of vertical align
  dbgList.Canvas.TextRect( Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText );
end;

procedure TFormMODELO_LIST.dsListDataChange(Sender: TObject; Field: TField);
begin
  TDBGridDefault(dbgList).DefaultRowHeight := 30;
  TDBGridDefault(dbgList).ClientHeight := ( 30 + TDBGridDefault(dbgList).RowCount ) + 30;
end;

procedure TFormMODELO_LIST.dsRemoteDataChange(Sender: TObject; Field: TField);
begin
  HandleStatus();
end;

procedure TFormMODELO_LIST.FormActivate(Sender: TObject);
begin
  txtValue.SetFocus();
end;

procedure TFormMODELO_LIST.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FormPrincipal.CloseViewForm(Self.Name)
end;

procedure TFormMODELO_LIST.FormDeactivate(Sender: TObject);
begin
  tmrCount.Enabled := False;
end;

procedure TFormMODELO_LIST.FormShow(Sender: TObject);
begin
  try
    //change color CloseButton
    pnlCloseForm.Color := $00525252;
    //customize grid
    TDBGridDefault(dbgList).DefaultRowHeight := 30;
    TDBGridDefault(dbgList).ClientHeight := ( 30 + TDBGridDefault(dbgList).RowCount ) + 30;

    dsList.DataSet.Active := True;
    txtValue.Clear();
    txtValue.SetFocus();
  except on E: Exception do
    ManagerFunctions.CreateMessage('Falha de comunica��o',
                                  'N�o foi poss�vel acessar tebela de dados',
                                  'error');
  end;
end;

procedure TFormMODELO_LIST.HandleStatus;
begin
  if(dsRemote.State = dsEdit) then
    lblStatus.Caption := 'EM EDI��O';
  if(dsRemote.State = dsInsert) then
    lblStatus.Caption := 'EM CADASTRAMENTO';
  if(dsRemote.State = dsFilter) then
    lblStatus.Caption := 'PESQUISANDO';
  if(dsRemote.State = dsBrowse) then
    lblStatus.Caption := 'PRONTO';
  if(dsRemote.State = dsOpening) then
    lblStatus.Caption := 'CARREGANDO';
  if(dsRemote.State = dsBlockRead) then
    lblStatus.Caption := 'BLOQUADO';
  if(dsRemote.State = dsInactive) then
    lblStatus.Caption := 'AGUARDANDO';
end;

procedure TFormMODELO_LIST.pnlButtonNewClick(Sender: TObject);
begin
   actInsert.Execute();
end;

procedure TFormMODELO_LIST.pnlButtonPrintClick(Sender: TObject);
begin
   actPrinting.Execute();
end;

procedure TFormMODELO_LIST.pnlButtonUpdateClick(Sender: TObject);
begin
  actEdit.Execute();
end;

procedure TFormMODELO_LIST.pnlButtonYesClick(Sender: TObject);
begin
  actClearFind.Execute();
end;

procedure TFormMODELO_LIST.pnlCloseFormClick(Sender: TObject);
begin
  FormPrincipal.CloseViewForm(Self.Name);
end;

procedure TFormMODELO_LIST.pnlCloseFormMouseEnter(Sender: TObject);
begin
  pnlCloseForm.Color := $002828FF;
end;

procedure TFormMODELO_LIST.pnlCloseFormMouseLeave(Sender: TObject);
begin
  pnlCloseForm.Color := $00525252;
end;

procedure TFormMODELO_LIST.tmrCountTimer(Sender: TObject);
begin
  HandleStatus();
  dsRemote.DataSet.Active := True;
  lblCount.Caption :=  dsRemote.DataSet.RecordCount.ToString();
end;

procedure TFormMODELO_LIST.txtValueChange(Sender: TObject);
begin
  try
    dsList.DataSet.Active := True;
    dsList.DataSet.Filtered := False;
    dsList.DataSet.First();
    if cboField.Text = 'NOME' then
      dsList.DataSet.Filter   := 'nome like' +QuotedStr('%'+txtValue.Text+'%');
    if cboField.Text = 'DOCUMENTO' then
      dsList.DataSet.Filter   := 'documento like' +QuotedStr(txtValue.Text+'%');
    if cboField.Text = 'TELEFONE' then
      dsList.DataSet.Filter   := 'telefone like' +QuotedStr('%'+txtValue.Text+'%');
    if cboField.Text = 'EMAIL' then
      dsList.DataSet.Filter   := 'email like' +QuotedStr('%'+txtValue.Text+'%');
    if cboField.Text = 'PLACA' then
      dsList.DataSet.Filter   := 'placa like' +QuotedStr('%'+txtValue.Text+'%');
    if cboField.Text = 'MARCA' then
      dsList.DataSet.Filter   := 'marca like' +QuotedStr('%'+txtValue.Text+'%');
    if cboField.Text = 'MODELO' then
      dsList.DataSet.Filter   := 'modelo like' +QuotedStr('%'+txtValue.Text+'%');
    if cboField.Text = 'N�MERO' then //recibos
      dsList.DataSet.Filter   := 'N�mero =' + txtValue.Text;
    if cboField.Text = 'OR�AMENTO' then //or�amentos
      dsList.DataSet.Filter   := 'ID =' + txtValue.Text;
    if cboField.Text = 'NOME DO CLIENTE' then
      dsList.DataSet.Filter   := 'cliente_nome like' +QuotedStr('%'+txtValue.Text+'%');
    if cboField.Text = 'CPF/CNPJ' then
      dsList.DataSet.Filter   := 'cliente_documento like' +QuotedStr('%'+txtValue.Text+'%');
    if cboField.Text = 'LOGIN' then
      dsList.DataSet.Filter   := 'login like' +QuotedStr('%'+txtValue.Text+'%');

    dsList.DataSet.Filtered := True;
  except on E: Exception do
    begin
      dsList.DataSet.Active := True;
      dsList.DataSet.Filtered := False;
    end;
  end;

end;

end.

