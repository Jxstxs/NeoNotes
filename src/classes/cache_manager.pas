unit cache_manager;

{$mode objfpc}{$H+}

Interface

uses
    Classes, fgl , base_class, data_types, notes_class;

Type
    rCachedNote = Record
        state: boolean;
        note: cNote;
    end;

    tNotesCache = specialize TFPGMap<String, rCachedNote>

    cCacheManager = Class
    private
         notes: tNotesCache;
    public
        constructor create();
        destructor destroy(); override;

        // function get_
    end;

Implementation

constructor cCacheManager.create();
begin
    notes := tNotesCache.create();
end;

destructor cCacheManager.destroy();
begin
    note.free();
    inherited;
end;

End.
