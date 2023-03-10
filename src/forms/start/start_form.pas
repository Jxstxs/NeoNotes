
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
  collection_new;

procedure TF_start.B_beendenClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TF_start.B_new_collectionClick(Sender: TObject);
begin
  Application.CreateForm(TF_collection_new, F_collection_new);
  F_collection_new.Show();
end;

end.
