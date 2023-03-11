
unit start_form;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  data_types;

type

  { TF_start }

  TF_start = class(TForm)
    B_neu_mits: TButton;
    B_mits_oeffnen: TButton;
    B_einstellungen: TButton;
    B_beenden: TButton;
    Image1: TImage;
    L_Footer: TLabel;
    LB_letzte_mits_db: TListBox;
    procedure B_beendenClick(Sender: TObject);
    procedure B_mits_oeffnenClick(Sender: TObject);
    procedure B_new_collectionClick(Sender: TObject);
  private

  public

  end;

var
  F_start: TF_start;

implementation

{$R *.lfm}

{ TF_start }

uses
  collection_new, note_open;

procedure TF_start.B_beendenClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TF_start.B_mits_oeffnenClick(Sender: TObject);
var
    open_dialog: TOpenDialog;
begin
    open_dialog := TOpenDialog.Create(nil);
    open_dialog.InitialDir := nnConfig.dataPath;
    open_dialog.Filter := 'NeoNote Collection|*.nnc';
    if open_dialog.Execute then
    begin
        nnConfig.db_mng.linkToFile(open_dialog.Filename);
        Application.CreateForm(TF_note_open, F_note_open);
        F_note_open.show;
        Hide;
    end;

    open_dialog.free;
end;

procedure TF_start.B_new_collectionClick(Sender: TObject);
begin
  Application.CreateForm(TF_collection_new, F_collection_new);
  F_collection_new.Show;
end;

end.
