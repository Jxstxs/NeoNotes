
Unit sn_tests_open;

{$mode objfpc}{$H+}

Interface

Uses 
Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
StdCtrls, DBCtrls;

Type 

  { TForm2 }

    TForm2 =   Class(TForm)
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
        Label2:   TLabel;
        Label3:   TLabel;
        MainMenu1:   TMainMenu;
        Procedure FormCreate(Sender: TObject);
        Private 

        Public 

    End;

Var 
    Form2:   TForm2;

Implementation

{$R *.lfm}

{ TForm2 }

Procedure TForm2.FormCreate(Sender: TObject);
Begin

End;

End.
