
{$HINTS OFF}

program main;

{$mode objfpc}{$H+}

uses
 {$IFDEF UNIX} cthreads,
 {$ENDIF} {$IFDEF HASAMIGA} athreads, {$ENDIF}
  Interfaces,
  Forms,
  start_form,
  os_funcs,
  file_funcs,
  data_types,
  db_manager;

{$R *.res}

begin
  RequireDerivedFormResource := true;
  Application.Scaled := true;
  Application.Initialize;

  getOsType();
  checkDataDir();

  nnConfig.db_mng := cDatabaseManager.Create();

  Application.CreateForm(TF_start, F_start);

  Application.Run;
end.
