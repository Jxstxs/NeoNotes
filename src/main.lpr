
Program main;

{$mode objfpc}{$H+}

Uses 
{$IFDEF UNIX} cthreads, {$ENDIF}
{$IFDEF HASAMIGA} athreads, {$ENDIF}
Interfaces, Forms, 
start_form, error_form,
os_funcs, file_funcs,
data_types
{ you can add units after this };

{$R *.res}

Var 
    err_str: String;

Begin
    RequireDerivedFormResource := True;
    Application.Scaled := True;
    Application.Initialize;
    Application.CreateForm(TForm1, Form1);

    getOsType();
    checkDataDir();

    loadSettingsFromFile();

    If (Not nnConfig.open_recent) Then
        Application.CreateForm(TF_start, F_start)
    Else
        Begin
            If (nnConfig.recent_notes = Nil) Then
                Begin
                    Application.CreateForm(TF_error, F_error);
                    F_error.set_error('Fehler beim lesen der letzten Notizen',
                                      'Es wurde noch keine Notiz geöffnet!');

                    Application.CreateForm(TF_start, F_start);
                End
            Else
                Begin
                    If (Not checkCollectionExists(nnConfig.recent_notes[0].collection)) Then
                        Begin
                            Application.CreateForm(TF_error, F_error);
                            err_str := 'Die Notizen Sammlung (' +
                                       nnConfig.recent_notes[0].collection +
                                       ') konnte nicht gefunden werden!';
                            F_error.set_error('Fehler beim Öffnen der Notiz Sammlung', err_str);

                            Application.CreateForm(TF_start, F_start);
                        End
                    Else
                        Begin
                            nnConfig.current_collection := nnConfig.recent_notes[0].collection;
                            If (Not checkNoteExists(nnConfig.recent_notes[0].note)) Then
                                Begin
                                    Application.CreateForm(TF_error, F_error);
                                    err_str := 
                                               'Die zuletzt geöffnete Notiz (' + nnConfig.
                                               recent_notes[0].note +
                                               ') konnte nicht gefunden werden!';
                                    F_error.set_error('Fehler beim Öffnen der Notiz', err_str);

                                    Application.CreateForm(TF_start, F_start);
                                End
                            Else
                                Begin
                                    nnConfig.current_note := nnConfig.recent_notes[0].note;
                                    if (nnConfig.db_already_setup <> True) then setup_database();
                                    link_database();
                                End;
                        End;
                End;
        End;


    Application.Run;
End.
