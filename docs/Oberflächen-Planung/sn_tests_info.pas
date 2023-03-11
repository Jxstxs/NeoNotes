
Unit sn_tests_info;

{$mode ObjFPC}{$H+}

Interface

Uses 
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
sn_note_new;

Type 

  { TForm5 }

    TForm5 =   Class(TForm)
        Button1:   TButton;
        Button2:   TButton;
        Button3:   TButton;
        Button4:   TButton;
        Button5:   TButton;
        Button6:   TButton;
        Button7:   TButton;
        Edit1:   TEdit;
        Edit2:   TEdit;
        GroupBox1:   TGroupBox;
        GroupBox2:   TGroupBox;
        Label1:   TLabel;
        Label2:   TLabel;
        Label3:   TLabel;
        Label4:   TLabel;
        Label5:   TLabel;
        ListBox1:   TListBox;
        ListBox2:   TListBox;
        ListBox3:   TListBox;
        Memo1:   TMemo;
        RadioButton1:   TRadioButton;
        RadioButton2:   TRadioButton;
        RadioGroup1:   TRadioGroup;
        Procedure GroupBox1Enter(Sender: TObject);
        Private 

        Public 

    End;

Var 
    Form5:   TForm5;

Implementation

{$R *.lfm}

{ TForm5 }

Procedure TForm5.GroupBox1Enter(Sender: TObject);
Begin
    Form8.Show();
End;

End.
