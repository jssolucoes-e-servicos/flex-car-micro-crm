unit microcrm.utils.resolve_exception;

interface
  uses
  System.Classes,System.SysUtils, Vcl.Forms, Vcl.Dialogs;
  type
    TResolveException = class
      private
        FLogFile :  string;
      public
        constructor Create;
        procedure ResolveException(Sender : TObject; E : Exception);
        procedure SaveLog(Value : String);
    end;

implementation


{ TException }

constructor TResolveException.Create;
  var
    filePath : string;
begin
  FLogFile := ChangeFileExt(ParamStr(0), '.log');
  Application.OnException := ResolveException;
end;

procedure TResolveException.SaveLog(Value: String);
var
  txtLog : TextFile;
begin
  AssignFile(txtLog, FLogFile);
  if FileExists(FLogFile) then
    Append(txtLog)
  else
    Rewrite(txtLog);
    Writeln(txtLog, Value);
    CloseFile(txtLog);
end;

procedure TResolveException.ResolveException(Sender: TObject; E: Exception);
begin
  SaveLog('=======================================================================');
  if TComponent(Sender) is TForm then
  begin
    SaveLog(FormatDateTime('dd/mm/yyyy hh:nn:ss - ', Now) + 'Form: ' + TForm(Sender).Name);
    SaveLog(FormatDateTime('dd/mm/yyyy hh:nn:ss - ', Now) + 'Caption: ' + TForm(Sender).Caption);
    SaveLog(FormatDateTime('dd/mm/yyyy hh:nn:ss - ', Now) + 'Class: ' + TForm(Sender).ClassName);
    SaveLog(FormatDateTime('dd/mm/yyyy hh:nn:ss - ', Now) + 'Error: ' + E.Message);
  end
  else
  begin
    SaveLog(FormatDateTime('dd/mm/yyyy hh:nn:ss - ', Now) + 'Form: ' + TForm(TComponent(Sender).Owner).Name);
    SaveLog(FormatDateTime('dd/mm/yyyy hh:nn:ss - ', Now) + 'Caption: ' + TForm(TComponent(Sender).Owner).Caption);
    SaveLog(FormatDateTime('dd/mm/yyyy hh:nn:ss - ', Now) + 'Class: ' + TForm(TComponent(Sender).Owner).ClassName);
    SaveLog(FormatDateTime('dd/mm/yyyy hh:nn:ss - ', Now) + 'Error: ' + E.Message);
  end;

  ShowMessage(E.Message);
end;

  var
    controlException : TResolveException;

    initialization
      controlException := TResolveException.Create;

    finalization
      controlException.Free
end.
