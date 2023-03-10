
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
  frage_info,
  collection_new,
  test_info { you can add units after this };

{$R *.res}

var
  err_str: string;

begin
  RequireDerivedFormResource := True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);

  getOsType();
  checkDataDir();

  loadSettingsFromFile();

  if (not nnConfig.open_recent) then
    Application.CreateForm(TF_start, F_start)
  else
  begin
    if (nnConfig.recent_notes = nil) then
    begin
      Application.CreateForm(TF_error, F_error);
      F_error.set_error('Fehler beim lesen der letzten Notizen',
        'Es wurde noch keine Notiz geöffnet!');

      Application.CreateForm(TF_start, F_start);
    end
    else
    begin
      if (not checkCollectionExists(
        nnConfig.recent_notes[0].collection)) then
      begin
        Application.CreateForm(TF_error, F_error);
        err_str :=
          'Die Notizen Sammlung (' + nnConfig.recent_notes[
          0].collection + ') konnte nicht gefunden werden!';
        F_error.set_error(
          'Fehler beim Öffnen der Notiz Sammlung', err_str);

        Application.CreateForm(TF_start, F_start);
      end
      else
      begin
        nnConfig.current_collection :=
          nnConfig.recent_notes[0].collection;
        if (not checkNoteExists(nnConfig.recent_notes[0].note)) then
        begin
          Application.CreateForm(TF_error, F_error);
          err_str :=
            'Die zuletzt geöffnete Notiz (' +
            nnConfig.recent_notes[0].note +
            ') konnte nicht gefunden werden!';
          F_error.set_error(
            'Fehler beim Öffnen der Notiz', err_str);

          Application.CreateForm(TF_start, F_start);
        end
        else
        begin
          nnConfig.current_note :=
            nnConfig.recent_notes[0].note;
          if (nnConfig.db_already_setup <> True) then
            setup_database();
          link_database();
        end;
      end;
    end;
  end;


  Application.Run;
end.
