
unit question_class;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, base_class, data_types;

type
  cQuestion = class(cBase)
  public
    constructor create(_question, _answer: rMultiType);
  end;

implementation

constructor cQuestion.create(_question, _answer: rMultiType);
begin
  inherited create;
  _set('question', _question);
  _set('answer', _answer);
end;

end.
