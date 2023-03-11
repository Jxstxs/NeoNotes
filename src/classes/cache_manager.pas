unit cache_manager;

{$mode objfpc}{$H+}

interface

// FIX: implement collection switch

uses
  Classes, FGL, base_class, data_types, notes_class;

type
  cCacheManager = class
  private
    notes: tNoteCache;
  public
    constructor create();
    destructor destroy(); override;

    procedure addNote(note: cNote);
    function getNote(): cNote;
  end;

implementation

constructor cCacheManager.create();
begin
  notes.count := 0;
end;

destructor cCacheManager.destroy();
begin
  notes.count := 0;
  Dispose(notes.notes);
  inherited;
end;

procedure cCacheManager.addNote(note: cNote);
var
  cached_note: rCachedNote;
begin
  cached_note.state := inserted;
  cached_note.note := note;
  notes.count := notes.count + 1;
  SetLength(notes.cache, notes.count);
  notes.cache[notes.count] := note;
end;

end.
