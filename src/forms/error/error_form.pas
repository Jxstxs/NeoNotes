
unit error_form;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TF_error }

  TF_error = class(TForm)
    B_start: TButton;
    B_beenden: TButton;
    M_error_field: TMemo;
    procedure B_startClick(Sender: TObject);
    procedure B_beendenClick(Sender: TObject);
    procedure set_error(title, desc: string);
  private
  public
  end;

var
  F_error: TF_error;

implementation

{$R *.lfm}

uses
  data_types, start_form;

{ TF_error }

procedure TF_error.set_error(title, desc: string);
begin
  M_error_field.Lines.Clear();
  M_error_field.Lines.add(title);
  M_error_field.Lines.add('');
  M_error_field.Lines.add(desc);
end;

procedure TF_error.B_startClick(Sender: TObject);
begin
  Hide;
  F_start.Show;
end;

procedure TF_error.B_beendenClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
