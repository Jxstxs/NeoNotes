
unit collection_new;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TF_collection_new }

  TF_collection_new = class(TForm)
    B_create: TButton;
    B_cancle: TButton;
    E_title: TEdit;
    E_author: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure B_createClick(Sender: TObject);
    procedure B_cancleClick(Sender: TObject);
  private

  public

  end;

var
  F_collection_new: TF_collection_new;

implementation

{$R *.lfm}

uses
file_funcs, note_open;

procedure TF_collection_new.B_createClick(Sender: TObject);
begin
  if (E_title.Text <> '') then
  begin
    createCollection(E_title.Text, E_author.Text);
    if (MessageDlg('Sammlung Erfolgreich erstellt. Wollen Sie sie öffnen?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes) then
    begin
      Application.CreateForm(TF_notiz_oeffnen, F_notiz_oeffnen);
      F_notiz_oeffnen.Show;
    end;
  end
  else
    ShowMessage('Es muss ein Titel für die Sammlung angegeben werden');
end;

procedure TF_collection_new.B_cancleClick(Sender: TObject);
begin
  E_title.Text := '';
  E_author.Text := '';
  Hide;
end;

end.
