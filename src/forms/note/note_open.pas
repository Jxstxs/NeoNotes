
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
    CB_search_type: TComboBox;
    E_search: TEdit;
    LB_results: TListBox;
    procedure B_clearClick(Sender: TObject);
    procedure B_openClick(Sender: TObject);
    procedure B_cancleClick(Sender: TObject);
    procedure E_searchExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  F_note_open: TF_note_open;

implementation

{$R *.lfm}

uses
  SQLDB, data_types, multitype, query_class, notes_class,
  start_form, note_edit;

{ TF_note_open }

procedure TF_note_open.B_cancleClick(Sender: TObject);
begin
  Hide;
  E_search.Text := '';
  F_start.Show;
end;

procedure TF_note_open.E_searchExit(Sender: TObject);
var
  query: cDbQuery;
  data: TSQLQuery;
  q: String;
begin
  q := 'SELECT title FROM note WHERE ' + CB_search_type.Items[CB_search_type.ItemIndex] + ' LIKE ' + #39 + '%' + E_search.Text + '%' + #39 + ';';
  query := cDbQuery.Create(q);
  data := query.getQuery();

  LB_results.Items.Clear;
  repeat
    LB_results.Items.Add(data.FieldByName('title').AsString);
    data.Next;
  until data.EOF;

  query.free;
end;

procedure TF_note_open.FormShow(Sender: TObject);
var
  query: cDbQuery;
  data: TSQLQuery;
begin
  query := cDbQuery.Create('SELECT title FROM note;');
  data := query.getQuery();

  repeat
    LB_results.Items.Add(data.FieldByName('title').AsString);
    data.Next;
  until data.EOF;

  query.free;
end;

procedure TF_note_open.B_clearClick(Sender: TObject);
begin
  E_search.Text := '';
end;

procedure TF_note_open.B_openClick(Sender: TObject);
var
  query: cDbQuery;
  data: TSQLQuery;
begin
  if (LB_results.ItemIndex = -1) then
    showMessage('Sie müssen ein Eintrag ausgewählt haben!')
  else
  begin
    query := cDbQuery.Create('SELECT * FROM note WHERE title=' +
      #39 + LB_results.Items[LB_results.ItemIndex] + #39 + ';');
    data := query.getQuery();

    nnConfig.currentNote := cNote.Create;
    nnConfig.currentNote._set('title',
      MT(s, data.FieldByName('title').AsString));
    nnConfig.currentNote._set('content',
      MT(s, data.FieldByName('content').AsString));

    // FIX: Add rest of the attributes

    Application.CreateForm(TF_note_edit, F_note_edit);
    F_note_edit.Show;
  end;
end;

end.
