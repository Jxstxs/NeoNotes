
unit multitype;

{$NOTES OFF}
{$mode ObjFPC}{$H+}

interface

// NOTE: better array handling? => class/record

type
  eMTypes = (s, ari, ars);

  rMultiType = record
    s: string;
    ari: array of integer;
    ars: array of string;
  end;

function MT(_t: eMTypes; _v: variant): rMultiType; inline;

implementation

function MT(_t: eMTypes; _v: variant): rMultiType; inline;

var
  _mt: rMultiType;
begin
  case _t of
    s: _mt.s := _v;
    ari: _mt.ari := _v;
    ars: _mt.ars := _v;
  end;
  result := _mt;
end;

end.
