
{$HINTS OFF}

program main;

{$mode objfpc}{$H+}

uses
 {$IFDEF UNIX} cthreads,
 {$ENDIF} {$IFDEF HASAMIGA} athreads, {$ENDIF}
  Interfaces,
  Forms,
  start_form,
  error_form,
  os_funcs,
  file_funcs,
  data_types,
  db_manager;

{$R *.res}

var
  err_str: string;

begin
  RequireDerivedFormResource := true;
  Application.Scaled := true;
  Application.Initialize;

  getOsType();
  checkDataDir();
  loadSettingsFromFile();

  nnConfig.db_mng := cDatabaseManager.Create();

  if (not nnConfig.openRecent) then Application.CreateForm(TF_start, F_start)
  else
  if (nnConfig.recentNotes = nil) then
  begin
    Application.CreateForm(TF_error, F_error);
    F_error.set_error('Fehler beim lesen der letzten Notizen',
      'Es wurde noch keine Notiz geöffnet!');
    Application.CreateForm(TF_start, F_start);
  end
  else writeLn('ERROR: Not Implemented')
  // FIX: need to handle recent note opening
  // open collection and check that it exists
  // open note and check that it exists
  ;

  Application.Run;
end.
