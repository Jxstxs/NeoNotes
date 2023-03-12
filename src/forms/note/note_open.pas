
unit note_open;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TF_note_open }

  TF_note_open = class(TForm)
    B_neu: TButton;
    B_clear: TButton;
    B_open: TButton;
    B_cancle: TButton;
    CB_search_type: TComboBox;
    E_search: TEdit;
    LB_results: TListBox;
    procedure B_clearClick(Sender: TObject);
    procedure B_neuClick(Sender: TObject);
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
  start_form, note_edit, note_new;

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
  Data: TSQLQuery;
  q: string;
begin
  q := 'SELECT title FROM note WHERE ' +
    CB_search_type.Items[CB_search_type.ItemIndex] + ' LIKE ' +
    #39 + '%' + E_search.Text + '%' + #39 + ';';
  query := cDbQuery.Create(q);
  Data := query.getQuery();

  LB_results.Items.Clear;
  repeat
    LB_results.Items.Add(Data.FieldByName('title').AsString);
    Data.Next;
  until Data.EOF;

  query.Free;
end;

procedure TF_note_open.FormShow(Sender: TObject);
var
  query: cDbQuery;
  Data: TSQLQuery;
begin
  query := cDbQuery.Create('SELECT title FROM note;');
  Data := query.getQuery();

  repeat
    LB_results.Items.Add(Data.FieldByName('title').AsString);
    Data.Next;
  until Data.EOF;

  query.Free;
end;

procedure TF_note_open.B_clearClick(Sender: TObject);
begin
  E_search.Text := '';
end;

procedure TF_note_open.B_neuClick(Sender: TObject);
begin
  Application.CreateForm(TF_note_new, F_note_new);
  F_note_new.Show;
end;

procedure TF_note_open.B_openClick(Sender: TObject);
var
  query: cDbQuery;
  Data: TSQLQuery;
begin
  if (LB_results.ItemIndex = -1) then
    ShowMessage('Sie müssen ein Eintrag ausgewählt haben!')
  else
  begin
    query := cDbQuery.Create('SELECT * FROM note WHERE title=' +
      #39 + LB_results.Items[LB_results.ItemIndex] + #39 + ';');
    Data := query.getQuery();

    nnConfig.currentNote := cNote.Create;
    nnConfig.currentNote._set('id',
      MT(i, Data.FieldByName('id').AsInteger));
    nnConfig.currentNote._set('title',
      MT(s, Data.FieldByName('title').AsString));
    nnConfig.currentNote._set('content',
      MT(s, Data.FieldByName('content').AsString));

    query.free;
    Application.CreateForm(TF_note_edit, F_note_edit);
    F_note_edit.Show;
  end;
end;

end.
