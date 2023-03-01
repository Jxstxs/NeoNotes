
Unit notiz_oeffnen;

{$mode ObjFPC}{$H+}

Interface

Uses 
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls;

Type 

    { TF_notiz_oeffnen }

    TF_notiz_oeffnen =   Class(TForm)
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
        procedure Button1Click(Sender: TObject);
        procedure Button2Click(Sender: TObject);
        procedure Button3Click(Sender: TObject);
        Private 

        Public 

    End;

Var 
    F_notiz_oeffnen:   TF_notiz_oeffnen;

Implementation

{$R *.lfm}

{ TF_notiz_oeffnen }

procedure TF_notiz_oeffnen.Button3Click(Sender: TObject);
begin

end;

procedure TF_notiz_oeffnen.Button1Click(Sender: TObject);
begin

end;

procedure TF_notiz_oeffnen.Button2Click(Sender: TObject);
begin

end;

End.
