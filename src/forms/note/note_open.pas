
unit note_open;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TF_note_open }

  TF_note_open = class(TForm)
    B_clear: TButton;
    B_open: TButton;
    B_cancle: TButton;
    CBX_reversed: TCheckBox;
    CBX_sql: TCheckBox;
    CB_search_type: TComboBox;
    E_search: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    LB_results: TListBox;
    procedure B_clearClick(Sender: TObject);
    procedure B_openClick(Sender: TObject);
    procedure B_cancleClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  F_note_open: TF_note_open;

implementation

{$R *.lfm}

uses
  query_class, SQLDB, start_form;

{ TF_note_open }

procedure TF_note_open.B_cancleClick(Sender: TObject);
begin
  Hide;
  E_search.Text := '';
  F_start.Show;
end;

procedure TF_note_open.FormShow(Sender: TObject);
var
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
  E_search.Text := '';
end;

procedure TF_note_open.B_openClick(Sender: TObject);
begin
  if (LB_results.ItemIndex = -1) then
    showMessage('Sie müssen ein Eintrag ausgewählt haben!')
  else // load through cachmanager
    // open note_edit
  ;
end;

end.
