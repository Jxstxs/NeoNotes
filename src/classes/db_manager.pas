
Unit db_manager;

{$mode objfpc}{$H+}

Interface

Uses 
SysUtils, Classes, sqldb, sqlite3conn;

Type 
    cDatabaseManager = Class
    private
        already_setup: Boolean;
        connection:   TSQLite3Connection;
        transaction:   TSQLTransaction;
    public
        procedure initialize();
        procedure linkToFile(db_path: String);
    end;

Implementation

Uses
    Forms;

procedure cDatabaseManager.initialize();
begin
    connection := TSQLite3Connection.Create(Nil);
    transaction := TSQLTransaction.Create(connection);
    connection.Transaction := transaction;
    already_setup := True;
end

procedure cDatabaseManager.linkToFile(db_path: String);
Var 
    err_str:   string;
Begin
    connection.DatabaseName := db_path;

    Try
        connection.Open;
    Except
        Application.CreateForm(TF_error, F_error);
        err_str := 'Die zuöffnende Datenbank (' + nnConfig.current_collection +
                   ') konnte nicht gefunden werden!';
        F_error.set_error('Fehler beim Öffnen der Datenbank', err_str);

        Application.CreateForm(TF_start, F_start);
    End;
End;

End.
