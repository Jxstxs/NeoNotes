
Unit question_class;

{$mode objfpc}{$H+}

Interface

Uses 
SysUtils, Classes, base_class, data_types;

Type 
    cQuestion =   Class(cBase)
        Public 
            constructor create(_question, _answer: rMultiType);
    End;

Implementation

constructor cQuestion.create(_question, _answer: rMultiType);
Begin
    inherited create;
    _set('question', _question);
    _set('answer', _answer);
End;

End.
