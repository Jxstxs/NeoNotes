
unit note_new;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TF_note_new }

  TF_note_new = class(TForm)
    B_tag_add: TButton;
    B_tag_remove: TButton;
    B_cancle: TButton;
    B_save: TButton;
    E_name: TEdit;
    E_tag: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    LB_tags: TListBox;
    LB_tags_using: TListBox;
    procedure B_cancleClick(Sender: TObject);
    procedure B_saveClick(Sender: TObject);
    procedure B_tag_addClick(Sender: TObject);
    procedure B_tag_removeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  F_note_new: TF_note_new;

implementation

{$R *.lfm}

uses
  query_class, db_manager, SQLDB, data_types;

{ TF_note_new }

procedure TF_note_new.B_cancleClick(Sender: TObject);
begin

end;

procedure TF_note_new.B_saveClick(Sender: TObject);
var
  query: cDbQuery;
  Data: TSQLQuery;
  sqls: TSQLScript;
  db: rDb;
  duplicate: boolean;
  insert: string;
  last_id: integer;
begin
  if E_name.Text <> '' then
  begin
    // check if note already exists
    query := cDbQuery.Create('SELECT * FROM note;');
    Data := query.getQuery();
    duplicate := false;

    repeat
      if E_name.Text = Data.FieldByName('title').AsString then
      begin
        duplicate := true;
        break;
      end
      else Data.Next;
    until Data.EOF;

    if not duplicate then
    begin
      query.setStmt('SELECT id FROM note;');
      Data.last;

      if Data.IsEmpty then last_id := 0
      else last_id := Data.FieldByName('id').AsInteger + 1;

      insert := 'INSERT INTO note(id, title) VALUES(' +
        IntToStr(last_id) + ',' + #39 + E_name.Text + #39 + ');';
      writeLn(insert);
      sqls := TSQLScript.Create(nil);
      db := nnConfig.db_mng.getDb;
      sqls.DataBase := DB.connection;
      sqls.Transaction := DB.transaction;
      sqls.Script.Text := insert;
      sqls.Execute;
      // add tags
      // öffnen oder nicht
      nnConfig.db_mng.commit;
      sqls.Free;
    end
    else ShowMessage('Titel Bereits vorhanden');

    query.Free;
  end
  else ShowMessage('Es muss ein Titel gegeben sein!');
end;

procedure TF_note_new.B_tag_addClick(Sender: TObject);
begin

end;

procedure TF_note_new.B_tag_removeClick(Sender: TObject);
begin

end;

procedure TF_note_new.FormShow(Sender: TObject);
begin

end;


end.
