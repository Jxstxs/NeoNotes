
unit data_types;

{$hint off}
{$mode objfpc}{$H+}

interface

uses
  SysUtils, db_manager, notes_class;

type
  eOsType = (win, unix);

  rNnConfig = record
    osType: eOsType;
    pathDelim: string;
    dataPath: string;
    currentNote: cNote;
    db_mng: cDatabaseManager;
  end;

var
  nnConfig: rNnConfig;

implementation

end.
