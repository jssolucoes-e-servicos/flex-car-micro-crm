program MicroCRM;

uses
  Forms,
  Winapi.Windows,
  Dialogs,
  System.UITypes,
  microcrm.views.principal in 'views\microcrm.views.principal.pas' {FormPrincipal},
  microcrm.models.principal in 'models\microcrm.models.principal.pas' {dmPrincipal: TDataModule},
  microcrm.models.reports in 'models\microcrm.models.reports.pas' {dmReports: TDataModule},
  microcrm.utils.resolve_exception in 'utils\microcrm.utils.resolve_exception.pas',
  microcrm.utils.modal_messages in 'utils\microcrm.utils.modal_messages.pas' {FormDialogMessages},
  microcrm.utils.manager_functions in 'utils\microcrm.utils.manager_functions.pas',
  microcrm.views.miscellaneous.starter in 'views\miscellaneous\microcrm.views.miscellaneous.starter.pas' {FormStarter},
  microcrm.views.auth.login in 'views\auth\microcrm.views.auth.login.pas' {FormLogin},
  microcrm.views.miscellaneous.model_list in 'views\miscellaneous\microcrm.views.miscellaneous.model_list.pas' {FormMODELO_LIST},
  microcrm.utils.dialog_await in 'utils\microcrm.utils.dialog_await.pas' {FormDialogAwait},
  microcrm.views.lists.services in 'views\lists\microcrm.views.lists.services.pas' {FormListServices},
  microcrm.views.lists.users in 'views\lists\microcrm.views.lists.users.pas' {FormListUsers},
  microcrm.views.lists.customers in 'views\lists\microcrm.views.lists.customers.pas' {FormListCustomers},
  microcrm.views.lists.receipts in 'views\lists\microcrm.views.lists.receipts.pas' {FormListReceipts},
  microcrm.views.lists.budgets in 'views\lists\microcrm.views.lists.budgets.pas' {FormListBudget},
  microcrm.views.form.newbudget in 'views\form\microcrm.views.form.newbudget.pas' {FormNewBudget},
  microcrm.views.miscellaneous.model_crud in 'views\miscellaneous\microcrm.views.miscellaneous.model_crud.pas' {Form1},
  microcrm.views.form.BudgetDetails in 'views\form\microcrm.views.form.BudgetDetails.pas' {FormBudgetDetails},
  microcrm.views.modals.edititem in 'views\modals\microcrm.views.modals.edititem.pas' {FormEditItem};

{$R *.res}
var
  MutexHandle: THandle;

begin
  // Tentar criar um mutex com um nome �nico para o seu aplicativo
  MutexHandle := CreateMutex(nil, True, 'FLEX_CAR_MICRO_CRM');
  // Verificar se j� existe uma inst�ncia do mutex
  if (MutexHandle <> 0) and (GetLastError = ERROR_ALREADY_EXISTS) then
  begin
    // Se j� existe uma inst�ncia, encerrar o aplicativo
    CloseHandle(MutexHandle);
    ExitProcess(0); // Encerrar o processo atual
  end;
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'flexCar - Micro CRM';
  FormStarter := TFormStarter.Create(Application);
  if (FormStarter.ShowModal = mrOk) then
  begin
      FormLogin := TFormLogin.Create(Application);
    if (FormLogin.ShowModal = mrYes) then
    begin
      //apagar os demais
      Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;

    // Ao finalizar o aplicativo, liberar o mutex
    if MutexHandle <> 0 then
      CloseHandle(MutexHandle);
      end
      else
      begin
      // Ao finalizar o aplicativo, liberar o mutex
      if MutexHandle <> 0 then
        CloseHandle(MutexHandle);
        Application.Terminate;
        ExitProcess(0);
      end;
  end
  else
  begin
    // Ao finalizar o aplicativo, liberar o mutex
    if MutexHandle <> 0 then
      CloseHandle(MutexHandle);
    Application.Terminate;
    ExitProcess(0);
  end;
end.
