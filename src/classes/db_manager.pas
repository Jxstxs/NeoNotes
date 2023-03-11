
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
    destructor Destroy();

    // Initializes a new Database at db_path
    procedure setupDb(db_path, author: string);
    // Connects to an existing Database at db_path
    procedure linkToFile(db_path: string);
    // NOTE: maybe change this to function
    // Commits changes made to the current Database
    procedure commit();

    // Returns the current connection and transaction
    function getDb(): rDb;
  end;

implementation

uses
  Forms, data_types, query_class, start_form, error_form;

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
  err_str: string;
  query: TSQLScript;
begin
  connection.DatabaseName := db_path;
  connection.Open;

  // Creates the needed Tables
  query := TSQLScript.Create(nil);
  query.DataBase := connection;
  query.Transaction := transaction;

  // User Data Table
  query.Script.Text :=
    'CREATE TABLE IF NOT EXISTS user_data(author text, created vchar(10), last_edit vchar(10));';
  query.Execute;

  // Note Table
  query.Script.Text :=
    'CREATE TABLE IF NOT EXISTS note(id int primarykey,remark text, last_edit vchar(10),title text, content text);';
  query.Execute;

  // Note Tags Table
  query.Script.Text :=
    'CREATE TABLE IF NOT EXISTS note_tags(note int, tag int);';
  query.Execute;

  // Tag Table
  query.Script.Text :=
    'CREATE TABLE IF NOT EXISTS tag(id int primarykey,remark text, title text,desc text);';
  query.Execute;

  // FIX: Add rest of the Tables

  commit();
  query.Free;
end;

procedure cDatabaseManager.linkToFile(db_path: string);
var
  err_str: string;
begin
  connection.DatabaseName := db_path;

  try
    connection.Open;
  except
    Application.CreateForm(TF_error, F_error);
    err_str := 'Die zuöffnende Datenbank (' +
      nnConfig.currentCollection +
      ') konnte nicht gefunden werden!';
    F_error.set_error('Fehler beim Öffnen der Datenbank', err_str);

    Application.CreateForm(TF_start, F_start);
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
