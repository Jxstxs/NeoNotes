
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
      if (not checkCollectionExists(
        nnConfig.recentNotes[0].collection)) then
      begin
        Application.CreateForm(TF_error, F_error);
        err_str := 'Die Notizen Sammlung (' + nnConfig.recentNotes[ 0].collection + ') konnte nicht gefunden werden!';
        F_error.set_error( 'Fehler beim Öffnen der Notiz Sammlung', err_str);

        Application.CreateForm(TF_start, F_start);
      end
      else
      begin
        nnConfig.currentCollection :=
          nnConfig.recentNotes[0].collection;
        if (not checkNoteExists(nnConfig.recentNotes[0].id)) then
        begin
          Application.CreateForm(TF_error, F_error);
          err_str := 'Die zuletzt geöffnete Notiz (' + nnConfig.recentNotes[0].title + ') konnte nicht gefunden werden!';
          F_error.set_error( 'Fehler beim Öffnen der Notiz', err_str);

          Application.CreateForm(TF_start, F_start);
        end
        else
        begin
          nnConfig.currentNote := nnConfig.recentNotes[0].id;
        end;
      end;
    end;
  end;


  Application.Run;
end.
