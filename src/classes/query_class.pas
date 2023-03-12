
unit query_class;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, SQLDB;

type
  cDbQuery = class
  private
    query: TSQLQuery;
  public
    constructor Create(stmt: string);
    destructor Destroy(); override;

    procedure run(); // Executes the Sql Statement
    procedure setStmt(stmt: string); // Sets a Sql Statement

    function getQuery(): TSQLQuery; // Returns the Query for Data Access
  end;

implementation

uses
  Forms, data_types, db_manager, start_form;

constructor cDbQuery.Create(stmt: string);
var
  db: rDb;
begin
  inherited Create;
  query := TSQLQuery.Create(nil);

  // set the database and transaction for the query                                    H
  db := nnConfig.db_mng.getDb();
  query.DataBase := DB.connection;
  query.Transaction := DB.transaction;

  // set the statement and open the query
  query.SQL.Add(stmt);
  query.active := true;
  query.Open;
end;

destructor cDbQuery.Destroy();
begin
  inherited Destroy;
  query.Free;
end;

procedure cDbQuery.run();
begin
  query.active := false;
  query.ExecSql;
  nnConfig.db_mng.commit();
  query.active := true;
  query.First;
end;

procedure cDbQuery.setStmt(stmt: string);
begin
  query.active := false;
  query.SQL.Clear();
  query.SQL.Add(stmt);
  query.active := true;
end;

function cDbQuery.getQuery(): TSQLQuery;
begin
  result := query;
end;

end.
