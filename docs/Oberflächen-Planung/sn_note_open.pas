
Unit sn_note_open;

{$mode objfpc}{$H+}

Interface

Uses 
Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
StdCtrls, DBCtrls;

Type 

  { TForm4 }

    TForm4 =   Class(TForm)
        Button1:   TButton;
        Button2:   TButton;
        Button3:   TButton;
        CheckBox1:   TCheckBox;
        CheckBox2:   TCheckBox;
        ComboBox1:   TComboBox;
        DBListBox1:   TDBListBox;
        Edit1:   TEdit;
        GroupBox1:   TGroupBox;
        Label1:   TLabel;
        Label3:   TLabel;
        Procedure CheckBox2Change(Sender: TObject);
        Procedure ComboBox1Change(Sender: TObject);
        Procedure Label3Click(Sender: TObject);
        Private 

        Public 

    End;

Var 
    Form4:   TForm4;

Implementation

{$R *.lfm}

{ TForm4 }

Procedure TForm4.ComboBox1Change(Sender: TObject);
Begin

End;

Procedure TForm4.CheckBox2Change(Sender: TObject);
Begin

End;

Procedure TForm4.Label3Click(Sender: TObject);
Begin
    // Zeig Tags digger
End;

End.
