
Unit question_class;

{$mode objfpc}{$H+}

Interface

Uses 
SysUtils, Classes, base_class, data_types;

Type 
    TQuestion =   Class(TBase)
        Public 
            constructor create(_question, _answer: TMultiType);
    End;

Implementation

constructor TQuestion.create(_question, _answer: TMultiType);
Begin
    inherited create;
    _set('question', _question);
    _set('answer', _answer);
End;

End.
