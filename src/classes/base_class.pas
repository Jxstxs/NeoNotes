
unit base_class;

{$warning off}
{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, FGL, multitype;

type
  tMultiDict = specialize TFPGMap<string, rMultiType>;

  cBase = class
  private
    class_data: tMultiDict;

  public
    constructor Create();
    destructor Destroy(); override;

    procedure _set(_t: string; _v: rMultiType);
    function _get(_t: string): rMultiType;
  end;

implementation

constructor cBase.Create();
begin
  class_data := tMultiDict.Create();
end;

destructor cBase.Destroy();
begin
  class_data.Free();
  inherited;
end;

procedure cBase._set(_t: string; _v: rMultiType);
begin
  class_data.AddOrSetData(_t, _v);
end;

function cBase._get(_t: string): rMultiType;

var
  Value: rMultiType;
begin
  if class_data.TryGetData(_t, Value) then result := Value;
end;

end.
