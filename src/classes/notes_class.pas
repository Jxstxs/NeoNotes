
unit notes_class;

{$NOTES OFF}
{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, base_class;

type
  cNote = class(cBase)
  public
    constructor create();
    procedure update(field: string);
  end;

implementation

uses
  multitype, sqldb, db_manager, data_types;

constructor cNote.create();
var
  tags_arr, links_arr: array of integer;
begin
  inherited create;
  _set('id', MT(i, 0));
  _set('title', MT(s, ''));
  _set('content', MT(s, ''));
  _set('tags', MT(ari, tags_arr));
  _set('links', MT(ari, links_arr));
end;

procedure cNote.update(field: string);
var
  query: TSQLScript;
  q: string;
  db: rDb;
begin
  query := TSQLScript.create(nil);

  db := nnConfig.db_mng.getDb();
  query.DataBase := db.connection;
  query.Transaction := db.transaction;

  // FIX: Update does not work idk why
  q := 'UPDATE note SET ' + field + ' = ' + #39 + _get(field).s + #39 + ' WHERE id = ' + IntToStr(_get('id').i) + ';';
  query.Script.Text := q;
  query.Execute;
  nnConfig.db_mng.commit;
  query.free;
end;

end.
