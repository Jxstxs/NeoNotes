
Unit data_types;

{$mode objfpc}{$H+}

Interface

Uses 
SysUtils, fgl;

Type 
    TMultiType =   Record
        s:   String;
        dt:   TDateTime;
        ars:   array Of String;
    End;
    TDict =   specialize TFPGMap<String, TMultiType>;

Implementation

End.
