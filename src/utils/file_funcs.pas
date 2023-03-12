
unit file_funcs;

{$mode ObjFPC}{$H+}

interface

procedure checkDataDir();

function createCollection(title, author: string): boolean;

implementation

uses
  SysUtils, data_types, db_manager;

procedure checkDataDir();

var
  usr_home: string;
begin
  // Getting the Home Directory of the User
  usr_home := GetUserDir;
  if (usr_home = '') then
  begin
    writeLn('ERROR: Cant get User Home');
    exit;
  end;

  nnConfig.dataPath := usr_home + '.NeoNotes';
  // Check if a Data Directory already exists
  if (not DirectoryExists(nnConfig.dataPath)) then
    CreateDir(nnConfig.dataPath);
end;

function createCollection(title, author: string): boolean;
var
  collection_path: string;
begin
  collection_path := nnConfig.dataPath + nnConfig.pathDelim + title + '.nnc';
  if not FileExists(collection_path) then
  begin
    nnConfig.db_mng.setupDb(collection_path, author);
    result := true;
  end
  else result := false;
end;

end.
