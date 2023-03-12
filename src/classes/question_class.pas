
unit question_class;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, base_class;

type
  cQuestion = class(cBase)
  public
    constructor create();
  end;

implementation

uses
  multitype;

constructor cQuestion.create();
begin
  inherited create;
  _set('question', MT(s, ''));
  _set('answer', MT(ars, ''));
end;

end.
