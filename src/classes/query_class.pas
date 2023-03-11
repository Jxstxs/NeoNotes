
Unit query_class;

{$mode objfpc}{$H+}

Interface

Uses 
SysUtils, Classes, sqldb;

Type 
    cDbQuery = Class
    private
        query: TSQLQuery;
    public
        constructor Create(stmt: String); // Creates and Sets up the Query for Use
        destructor Destroy();

        procedure run(); // Executes the Sql Statement
        procedure setStmt(stmt: String); // Sets a Sql Statement

        function getQuery(): TSQLQuery; // Returns the Query for Data Access
    end;

Implementation

Uses
    Forms, data_types, db_manager, start_form, error_form;

constructor cDbQuery.Create(stmt: String);
var
    db: rDb;
begin
    inherited Create;
    query := TSQLQuery.Create(nil);

    // set the database and transaction for the query
    db := nnConfig.db_mng.getDb();
    query.DataBase := db.connection;
    query.Transaction := db.transaction;

    // set the statement and open the query
    query.SQL.Add(stmt);
    query.active := True;
    query.Open;
end;

destructor cDbQuery.Destroy();
begin
    inherited Destroy;
    query.Free;
    datasource.Free;
end;

procedure cDbQuery.run();
begin
    query.active := False;
    query.ExecSql;
    nnConfig.db_mng.commit();
    query.active := True;
    query.First;
end;

procedure cDbQuery.setStmt(stmt: String);
begin
    query.active := False;
    query.SQL.clear();
    query.SQL.Add(stmt);
    query.active := True;
end;

function cDbQuery.getQuery(): TSQLQuery;
begin
    Result := query;
end;

End.
