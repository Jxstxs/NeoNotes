
unit data_types;

{$hint off}
{$mode objfpc}{$H+}

interface

uses
  SysUtils, db_manager, notes_class;

type
  // ENUMS
  eOsType = (win, unix);
  // eCState = (synced, unsynced, inserted);

  // RECORDS
  rRecentNote = record
    collection, title: string;
  end;

  arRecentNotes = array of rRecentNote;

  // rCachedNote = Record
  //   state: eCState;
  //   note: cNote;
  // end;

  // arCachedNotes = array of rCachedNote;

  // tNoteCache = record
  //   count: integer;
  //   cache: arCachedNotes;
  // end;

  rNnConfig = record
    // Os related
    osType: eOsType;
    pathDelim: string;

    // Data related
    dataPath: string;

    // Startup related
    openRecent: boolean;
    recentNotes: arRecentNotes;

    currentCollection: string;
    currentNote: cNote;

    db_mng: cDatabaseManager;
    // cache_mng: cCacheManager;
  end;

var
  nnConfig: rNnConfig;

implementation

end.
