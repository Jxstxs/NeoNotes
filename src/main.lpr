
{$HINTS OFF}

program main;

{$mode objfpc}{$H+}

uses
 {$IFDEF UNIX} cthreads,  {$ENDIF} {$IFDEF HASAMIGA} athreads,  {$ENDIF}
  Interfaces,
  Forms,
  start_form,
  error_form,
  os_funcs,
  file_funcs,
  data_types,
  db_manager
  { you can add units after this };

{$R *.res}

var
  err_str: string;

begin
  RequireDerivedFormResource := True;
  Application.Scaled := True;
  Application.Initialize;

  getOsType();
  checkDataDir();
  loadSettingsFromFile();

  nnConfig.db_mng := cDatabaseManager.Create();

  if (not nnConfig.openRecent) then
    Application.CreateForm(TF_start, F_start)
  else
  begin
    if (nnConfig.recentNotes = nil) then
    begin
      Application.CreateForm(TF_error, F_error);
      F_error.set_error('Fehler beim lesen der letzten Notizen', 'Es wurde noch keine Notiz geöffnet!');
      Application.CreateForm(TF_start, F_start);
    end
    else
    begin
        // FIX: need to handle recent note opening
        writeln('ERROR: Not Implemented');
    end;
  end;

  Application.Run;
end.
