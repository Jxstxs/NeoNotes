
unit data_types;

{$hint off}
{$mode objfpc}{$H+}

interface

uses
  SysUtils, fgl, sqldb, sqlite3conn;

type
  // ENUMS
  eOsType = (win, unix);
  eMTypes = (s, dt, ars);

  // RECORDS
  rMultiType = record
    s: string;
    dt: TDateTime;
    ars: array of string;
  end;

  rRecentNote = record
    collection, id, title: string;
  end;

  arRecentNotes = array of rRecentNote;

  rNnConfig = record
    // Os related
    osType: eOsType;
    pathDelim: string;

    // Data related
    dataPath: string;

    // Startup related
    openRecent: boolean;
    recentNotes: arRecentNotes;
  end;

var
  nnConfig: rNnConfig;

// Function MT(_t: eMTypes; _v: variant):   rMultiType;
//  _t: defines the datatype (see eMTypes)
//  _v: the value to store
//  => Returns rMultiType with _v stored inside of mt._t
function MT(_t: eMTypes; _v: variant): rMultiType;

implementation

function MT(_t: eMTypes; _v: variant): rMultiType;

var
  _mt: rMultiType;
begin
  // Checks which datatype was given
  case _t of
    s: _mt.s := _v;
  end;
  Result := _mt;
end;

end.
