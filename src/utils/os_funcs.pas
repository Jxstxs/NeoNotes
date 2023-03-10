
Unit os_funcs;

{$mode ObjFPC}{$H+}

Interface

Uses 
Classes, SysUtils, data_types;

Procedure getOsType();

Implementation

Procedure getOsType();
Begin
    {$IFDEF LCLcarbon}
    nnConfig.osType := unix;
    nnConfig.pathDelim := '/';
    {$ELSE}
    {$IFDEF Linux}
    nnConfig.osType := unix;
    nnConfig.pathDelim := '/';
    {$ELSE}
    {$IFDEF UNIX}
    nnConfig.osType := unix;
    nnConfig.pathDelim := '/';
    {$ELSE}
    {$IFDEF WINDOWS}
    nnConfig.osType := win;
    nnConfig.pathDelim := '\\';
    {$ENDIF}
    {$ENDIF}
    {$ENDIF}
    {$ENDIF}
End;

End.
