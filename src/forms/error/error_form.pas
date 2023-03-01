
Unit error_form;

{$mode ObjFPC}{$H+}

Interface

Uses 
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

Type 

  { TF_error }

    TF_error =   Class(TForm)
        B_start:   TButton;
        B_beenden:   TButton;
        M_error_field:   TMemo;
        Procedure B_startClick(Sender: TObject);
        Procedure B_beendenClick(Sender: TObject);
        Procedure set_error(title, desc: String);
        Private 
        Public 
    End;

Var 
    F_error:   TF_error;

Implementation

{$R *.lfm}

Uses
data_types, start_form;

{ TF_error }

Procedure TF_error.set_error(title, desc: String);
Begin
    M_error_field.Lines.clear();
    M_error_field.Lines.add(title);
    M_error_field.Lines.add('');
    M_error_field.Lines.add(desc);
End;

Procedure TF_error.B_startClick(Sender: TObject);
Begin
    Hide;
    F_start.Show;
End;

Procedure TF_error.B_beendenClick(Sender: TObject);
Begin
    Application.Terminate;
End;

End.
