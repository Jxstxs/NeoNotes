
Unit db_manager;

{$mode objfpc}{$H+}

Interface

Uses 
SysUtils, Classes, sqldb, sqlite3conn;

Type 
    // Record to return the current connection and transaction
    rDb = Record
        connection: TSQLite3Connection;
        transaction: TSQLTransaction;
    end;

    cDatabaseManager = Class
    private
        connection:   TSQLite3Connection;
        transaction:   TSQLTransaction;
    public
        constructor Create();
        destructor Destroy();

        // Initializes a new Database at db_path
        procedure setupDb(db_path, author: String);
        // Connects to an existing Database at db_path
        procedure linkToFile(db_path: String); // NOTE: maybe change this to function
        // Commits changes made to the current Database
        procedure commit();

        // Returns the current connection and transaction
        function getDb(): rDb;
    end;

Implementation

Uses
    Forms, data_types, query_class, start_form, error_form;

constructor cDatabaseManager.Create();
begin
    inherited Create;
    connection := TSQLite3Connection.Create(Nil);
    transaction := TSQLTransaction.Create(connection);
    connection.Transaction := transaction;
end;

destructor cDatabaseManager.Destroy();
begin
    inherited Destroy;
    connection.Free;
    transaction.Free;
end;

procedure cDatabaseManager.setupDb(db_path, author: String);
Var
    err_str: String;
    query: TSQLScript;
begin
    connection.DatabaseName := db_path;
    connection.Open;

    // Creates the needed Tables
    query := TSQLScript.Create(nil);
    query.DataBase := connection;
    query.Transaction := transaction;
    // FIX: create base tables and meta stuff
    query.Script.Text := 'CREATE TABLE IF NOT EXISTS dave(id int, stalb text);';
    query.Execute;

    commit();
    query.Free;
end;

procedure cDatabaseManager.linkToFile(db_path: String);
Var 
    err_str:   string;
Begin
    connection.DatabaseName := db_path;

    Try
        connection.Open;
    Except
        Application.CreateForm(TF_error, F_error);
        err_str := 'Die zuöffnende Datenbank (' + nnConfig.currentCollection +
                   ') konnte nicht gefunden werden!';
        F_error.set_error('Fehler beim Öffnen der Datenbank', err_str);

        Application.CreateForm(TF_start, F_start);
    End;
End;

procedure cDatabaseManager.commit();
begin
    transaction.Commit;
end;

function cDatabaseManager.getDb(): rDb;
Var
    db: rDb;
begin
    db.connection := connection;
    db.transaction := transaction;
    Result := db;
end;

End.
