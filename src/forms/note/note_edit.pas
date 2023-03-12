
unit note_edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TF_note_edit }

  TF_note_edit = class(TForm)
    B_close: TButton;
    B_save: TButton; // FIX: save lines seperated by some delim
    B_reset: TButton;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);


  public

  end;

var
  F_note_edit: TF_note_edit;

implementation

uses
  data_types, multitype, query_class;

{$R *.lfm}

{ TF_note_edit }

procedure TF_note_edit.FormShow(Sender: TObject);
var
  content: rMultiType;
begin
  content := nnConfig.currentNote._get('content');
  // FIX: parse lines by "\\\\"? so multiline
  Memo1.Lines.Add(content.s);
end;

end.
