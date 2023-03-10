
Unit notes_class;

{$mode objfpc}{$H+}

Interface

Uses 
SysUtils, Classes, base_class, data_types;

Type 
    cNote =   Class(cBase)
        Public 
            constructor create( _title, _content, _created, _modified, _tags, _links: rMultiType);
    End;

Implementation

constructor cNote.create( _title, _content, _created, _modified, _tags, _links: rMultiType);
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
