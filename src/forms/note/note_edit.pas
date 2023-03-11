
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
  public

  end;

var
  F_note_edit: TF_note_edit;

implementation

{$R *.lfm}

end.
