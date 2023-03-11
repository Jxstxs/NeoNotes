
unit data_types;

{$hint off}
{$mode objfpc}{$H+}

interface

uses
  SysUtils, db_manager;

type
  // ENUMS
  eOsType = (win, unix);
  eMTypes = (s, dt, ars);
  eCState = (synced, unsynced, inserted);

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

  rCachedNote = Record
    state: eCState;
    note: cNote;
  end;

  arCachedNotes = array of rCachedNote;

  tNoteCache = record
    count: integer;
    notes: arCachedNotes;
  end;

  rNnConfig = record
    // Os related
    osType: eOsType;
    pathDelim: string;

    // Data related
    dataPath: string;

    // Startup related
    openRecent: boolean;
    recentNotes: arRecentNotes;

    currentCollection, currentNote: string;

    db_mng: cDatabaseManager;
    cache_mng: cCacheManager;
  end;

var
  nnConfig: rNnConfig;

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
  result := _mt;
end;

end.
