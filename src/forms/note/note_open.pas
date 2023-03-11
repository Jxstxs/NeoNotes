
Unit note_open;

{$mode ObjFPC}{$H+}

Interface

Uses 
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

Type 

    { TF_note_open }

    TF_note_open =   Class(TForm)
        B_clear:   TButton;
        B_open:   TButton;
        B_cancle:   TButton;
        CBX_reversed: TCheckBox;
        CBX_sql: TCheckBox;
        CB_search_type:   TComboBox;
        E_search:   TEdit;
        GroupBox1:   TGroupBox;
        Label1:   TLabel;
        Label3:   TLabel;
        LB_results: TListBox;
        procedure B_clearClick(Sender: TObject);
        procedure B_openClick(Sender: TObject);
        procedure B_cancleClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        Private 

        Public 

    End;

Var 
    F_note_open:   TF_note_open;

Implementation

{$R *.lfm}

Uses
    query_class, sqldb, start_form;

{ TF_note_open }

procedure TF_note_open.B_cancleClick(Sender: TObject);
begin
   Hide;
   E_search.Text:= '';
   F_start.Show;
end;

procedure TF_note_open.FormShow(Sender: TObject);
Var
    query: cDbQuery;
    data: TSQLQuery;
begin
    query := cDbQuery.Create('SELECT * FROM note;');
    data := query.getQuery();

    repeat
        LB_results.Items.Add(data.FieldByName('title').AsString);
        data.next;
    until data.EOF;

    query.free;
end;

procedure TF_note_open.B_clearClick(Sender: TObject);
begin
   E_search.Text:= '';
end;

procedure TF_note_open.B_openClick(Sender: TObject);
begin
    ShowMessage('Fisch dich selbst in bein!');
end;

End.
