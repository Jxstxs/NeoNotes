
Unit data_types;

{$hint off}
{$mode objfpc}{$H+}

Interface

Uses 
SysUtils, fgl, sqldb, sqlite3conn;

Type 
    // ENUMS
    eOsType =   (win, unix);
    eMTypes =   (s, dt, ars);

    // RECORDS
    rMultiType =   Record
        s:   String;
        dt:   TDateTime;
        ars:   array Of String;
    End;

    rRecentNote = Record
        collection, title: String;
    end;
    
    arRecentNotes = array of rRecentNote;

    rNnConfig = Record
        // Os related
        osType: eOsType;
        pathDelim: String;

        // Data related
        dataPath: String;

        // Startup related
        openRecent: Boolean;
        recentNotes: arRecentNotes;
    end;

Var
    nnConfig: rNnConfig;

// Function MT(_t: mtypes; _v: variant):   rMultiType;
//  _t: defines the datatype (see eMTypes)
//  _v: the value to store
//  => Returns rMultiType with _v stored inside of mt._t
Function MT(_t: mtypes; _v: variant):   rMultiType;

Implementation

Function MT(_t: mtypes; _v: variant):   rMultiType;

Var 
    _mt:   rMultiType;
Begin
    // Checks which datatype was given
    Case _t Of 
        s:   _mt.s := _v;
    End;
    Result := _mt;
End;

End.
