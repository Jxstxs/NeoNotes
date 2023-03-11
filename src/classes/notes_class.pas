
unit notes_class;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, base_class, data_types;

type
  cNote = class(cBase)
  public
    constructor create();
  end;

implementation

constructor cNote.create();
begin
  inherited create;
  _set('title', MT(s, ''));
  _set('content', MT(s, ''));
  _set('created', MT(s, ''));
  _set('modified', MT(s, ''));
  _set('tags', MT(ari, []));
  _set('links', MT(ari, []));
end;

end.
