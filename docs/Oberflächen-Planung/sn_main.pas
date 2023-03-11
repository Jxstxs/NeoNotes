
Unit sn_main;

{$mode objfpc}{$H+}

Interface

Uses 
Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
StdCtrls,
sn_tests_open, sn_tests_info,
sn_note_open,
sn_question_info;

Type 

  { TForm1 }

    TForm1 =   Class(TForm)
        Button1:   TButton;
        Button2:   TButton;
        Button3:   TButton;
        MainMenu1:   TMainMenu;
        Memo1:   TMemo;
        MenuItem1:   TMenuItem;
        MenuItem10:   TMenuItem;
        MenuItem11:   TMenuItem;
        MenuItem12:   TMenuItem;
        MenuItem13:   TMenuItem;
        MenuItem14:   TMenuItem;
        MenuItem15:   TMenuItem;
        MenuItem16:   TMenuItem;
        MenuItem17:   TMenuItem;
        MenuItem18:   TMenuItem;
        MenuItem19:   TMenuItem;
        MenuItem2:   TMenuItem;
        MenuItem20:   TMenuItem;
        MenuItem21:   TMenuItem;
        MenuItem22:   TMenuItem;
        MenuItem3:   TMenuItem;
        MenuItem4:   TMenuItem;
        MenuItem5:   TMenuItem;
        MenuItem6:   TMenuItem;
        MenuItem7:   TMenuItem;
        MenuItem8:   TMenuItem;
        MenuItem9:   TMenuItem;
        Procedure FormCreate(Sender: TObject);
        Procedure FormResize(Sender: TObject);
        Private 

        Public 

    End;

Var 
    Form1:   TForm1;

Implementation

{$R *.lfm}

{ TForm1 }

End.
