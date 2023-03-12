
unit db_manager;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, SQLDB, sqlite3conn;

type
  // Record to return the current connection and transaction
  rDb = record
    connection: TSQLite3Connection;
    transaction: TSQLTransaction;
  end;

  cDatabaseManager = class
  private
    connection: TSQLite3Connection;
    transaction: TSQLTransaction;
  public
    constructor Create();
    destructor Destroy(); override;

    // Initializes a new Database at db_path
    procedure setupDb(db_path, author: string);
    // Commits changes made to the current Database
    procedure commit();

    // Returns the current connection and transaction
    function getDb(): rDb;
    // Connects to an existing Database at db_path
    function linkToFile(db_path: string): boolean;
  end;

implementation

uses
  Forms, data_types, query_class, start_form;

constructor cDatabaseManager.Create();
begin
  inherited Create;
  connection := TSQLite3Connection.Create(nil);
  transaction := TSQLTransaction.Create(connection);
  connection.Transaction := transaction;
end;

destructor cDatabaseManager.Destroy();
begin
  inherited Destroy;
  connection.Free;
  transaction.Free;
end;

procedure cDatabaseManager.setupDb(db_path, author: string);
var
  query: TSQLScript;
begin
  connection.DatabaseName := db_path;
  connection.Open;

  // Creates the needed Tables
  query := TSQLScript.Create(nil);
  query.DataBase := connection;
  query.Transaction := transaction;

  // Note Table
  query.Script.Text :=
    'CREATE TABLE IF NOT EXISTS note(id int primarykey, title text, content text);';
  query.Execute;

  // Note Tags Table
  query.Script.Text :=
    'CREATE TABLE IF NOT EXISTS note_tags(note int, tag int);';
  query.Execute;

  // Tag Table
  query.Script.Text :=
    'CREATE TABLE IF NOT EXISTS tag(id int primarykey, title text);';
  query.Execute;

  // FIX: Add rest of the Tables

  commit();
  query.Free;
end;

function cDatabaseManager.linkToFile(db_path: string): boolean;
begin
  connection.DatabaseName := db_path;

  try
    connection.Open;
    result := true;
  except
    result := false;
  end;
end;

procedure cDatabaseManager.commit();
begin
  transaction.Commit;
end;

function cDatabaseManager.getDb(): rDb;
var
  db: rDb;
begin
  DB.connection := connection;
  DB.transaction := transaction;
  result := db;
end;

end.
