
unit notes_class;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, base_class;

type
  cNote = class(cBase)
  public
    constructor create();
  end;

implementation

uses
  multitype;

constructor cNote.create();
var
  tags_arr, links_arr: array of integer;
begin
  inherited create;
  _set('title', MT(s, ''));
  _set('content', MT(s, ''));
  _set('tags', MT(ari, tags_arr));
  _set('links', MT(ari, links_arr));
end;

end.
