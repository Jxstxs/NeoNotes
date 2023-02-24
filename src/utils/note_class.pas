
Unit notes_class;

{$mode objfpc}{$H+}

Interface

Uses 
SysUtils, Classes, base_class, data_types;

Type 
    TNote =   Class(TBase)
        Public 
            constructor create( _title, _content, _created, _modified, _tags, _links: TMultiType);
    End;

Implementation

constructor TNote.create( _title, _content, _created, _modified, _tags, _links: TMultiType);
Begin
    inherited create;
    _set('title', _title);
    _set('content', _content);
    _set('created', _created);
    _set('modified', _modified);
    _set('tags', _tags);
    _set('links', _links);
End;

End.
