
unit os_funcs;

{$mode ObjFPC}{$H+}

interface

uses
  SysUtils, data_types;

procedure getOsType();

implementation

procedure getOsType();
begin
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
end;

end.
