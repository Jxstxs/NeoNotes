
Unit base_class;

{$warning off}
{$mode objfpc}{$H+}

Interface

Uses 
SysUtils, Classes, fgl , data_types;

Type 
    tMultiDict = specialize TFPGMap<String, rMultiType>;

    cBase =   Class
        Private 
            class_data: tMultiDict;

        Public 
            constructor create();
            destructor destroy(); override;

            Procedure _set(_t: String; _v: rMultiType);
            Function _get(_t: String):   rMultiType;
    End;

Implementation

constructor cBase.create();
Begin
    class_data := tMultiDict.create();
End;

destructor cBase.destroy();
Begin
    class_data.free();
    inherited;
End;

Procedure cBase._set(_t: String; _v: rMultiType);
Begin
    class_data.AddOrSetData(_t, _v);
End;

Function cBase._get(_t: String):   rMultiType;

Var 
    value:   rMultiType;
Begin
    If class_data.TryGetData(_t, value) Then
        Result := value
End;

End.
