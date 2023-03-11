
unit notes_class;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, base_class, data_types;

type
  cNote = class(cBase)
  public
    constructor create(_title, _content, _created,
      _modified, _tags, _links: rMultiType);
  end;

implementation

constructor cNote.create(_title, _content, _created, _modified,
  _tags, _links: rMultiType);
begin
  inherited create;
  _set('title', _title);
  _set('content', _content);
  _set('created', _created);
  _set('modified', _modified);
  _set('tags', _tags);
  _set('links', _links);
end;

end.
