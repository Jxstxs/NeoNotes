
unit note_edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls;

type

  { TF_note_edit }

  TF_note_edit = class(TForm)
    B_close: TButton;
    B_save: TButton;
    B_reset: TButton;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  public

  end;

var
  F_note_edit: TF_note_edit;

implementation

uses
  data_types, query_class, file_funcs;

{$R *.lfm}

{ TF_note_edit }

procedure TF_note_edit.FormShow(Sender: TObject);
var
  content: rMultiType;
begin
  writeln(1);
  content := nnConfig.currentNote._get('content');
  Memo1.Lines.Add(content.s);
end;

end.
