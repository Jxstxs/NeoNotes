
Unit collection_new;

{$mode ObjFPC}{$H+}

Interface

Uses 
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
file_funcs,
notiz_oeffnen;

Type 

  { TForm7 }

    TF_collection_new =   Class(TForm)
        B_create:   TButton;
        B_cancle:   TButton;
        E_title:   TEdit;
        E_author:   TEdit;
        GroupBox1:   TGroupBox;
        Label1:   TLabel;
        Label2:   TLabel;
        Procedure B_createClick(Sender: TObject);
        Procedure B_cancleClick(Sender: TObject);
        Private 

        Public 

    End;

Var 
    F_collection_new:   TF_collection_new;

Implementation

{$R *.lfm}

Procedure TF_collection_new.B_createClick(Sender: TObject);
Begin
    If (E_title.Text <> '') Then
        Begin
            createCollection(E_title.Text, E_author.Text);
            If (MessageDlg('Sammlung Erfolgreich erstellt. Wollen Sie sie öffnen?', mtConfirmation,
                [mbYes, mbNo], 0, mbYes) = mrYes) Then
                Begin
                    Application.CreateForm(TF_notiz_oeffnen, F_notiz_oeffnen);
                    F_notiz_oeffnen.show;
                End;
        End
    Else ShowMessage('Es muss ein Titel für die Sammlung angegeben werden');
End;

Procedure TF_collection_new.B_cancleClick(Sender: TObject);
Begin
    E_title.Text := '';
    E_author.Text := '';
    Hide;
End;

End.
