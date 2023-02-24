
Unit data_types;

{$mode objfpc}{$H+}

Interface

Uses 
SysUtils, fgl;

Type 
    mtypes =   (s, dt, ars);

    TMultiType =   Record
        s:   String;
        dt:   TDateTime;
        ars:   array Of String;
    End;

    TDict =   specialize TFPGMap<String, TMultiType>;

Function MT(_t: mtypes; _v: variant):   TMultiType;

Implementation

Function MT(_t: mtypes; _v: variant):   TMultiType;

Var 
    _mt:   TMultiType;
Begin
    Case _t Of 
        s:   _mt.s := _v;
    End;
    Result := _mt;
End;

End.
