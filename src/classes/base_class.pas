
Unit base_class;

{$warning off}
{$mode objfpc}{$H+}

Interface

Uses 
SysUtils, Classes, data_types;

Type 
    TBase =   Class
        Private 
            class_data:   TDict;
        Public 
            constructor create();
            destructor destroy(); override;

            Procedure _set(_t: String; _v: TMultiType);
            Function _get(_t: String):   TMultiType;
    End;

Implementation

constructor TBase.create();
Begin
    class_data := TDict.create();
End;

destructor TBase.destroy();
Begin
    class_data.free();
    inherited;
End;

Procedure TBase._set(_t: String; _v: TMultiType);
Begin
    class_data.AddOrSetData(_t, _v);
End;

Function TBase._get(_t: String):   TMultiType;

Var 
    value:   TMultiType;
Begin
    If class_data.TryGetData(_t, value) Then
        Result := value
End;

End.
