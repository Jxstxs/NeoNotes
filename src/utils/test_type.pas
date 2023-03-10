
unit test_type;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, base_class;

type
  TTest = record
    linked_notes: array of cBase;
    questions: array of cBase;
  end;

implementation

end.
