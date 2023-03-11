
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
    E_search: TEdit;
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
  data_types, query_class, notes_class, file_funcs, SQLDB,
  start_form, note_edit;

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
  // FIX: Update Setting => Recent Notes
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

    Application.CreateForm(TF_note_edit, F_note_edit);
    F_note_edit.Show;
  end;
end;

end.
