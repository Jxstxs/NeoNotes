
unit note_edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TF_note_edit }

  TF_note_edit = class(TForm)
    B_info: TButton;
    B_close: TButton;
    B_save: TButton;
    B_reset: TButton;
    M_note: TMemo;
    procedure B_closeClick(Sender: TObject);
    procedure B_infoClick(Sender: TObject);
    procedure B_resetClick(Sender: TObject);
    procedure B_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  public

  end;

var
  F_note_edit: TF_note_edit;

implementation

uses
  data_types, multitype, query_class, SysUtils, sqldb;

{$R *.lfm}

{ TF_note_edit }

procedure TF_note_edit.FormShow(Sender: TObject);
var
  content: rMultiType;
begin
  content := nnConfig.currentNote._get('content');
  M_note.Lines.Add(content.s);
end;

procedure TF_note_edit.B_closeClick(Sender: TObject);
begin
  Hide;
end;

procedure TF_note_edit.B_infoClick(Sender: TObject);
begin
  writeLn('NOT IMPLEMEMTED');
  // FIX: show info form? tags,...
end;

procedure TF_note_edit.B_resetClick(Sender: TObject);
var
  query: cDbQuery;
  data: TSQLQuery;
begin
  query := cDbQuery.Create('SELECT content FROM note WHERE id = ' + IntToStr(nnConfig.currentNote._get('id').i) + ';');
  data := query.getQuery;
  M_note.Lines.Clear;
  M_note.Lines.Add(data.FieldByName('content').AsString);
end;

procedure TF_note_edit.B_saveClick(Sender: TObject);
begin
  nnConfig.currentNote._set('content', MT(s, M_note.Lines.Text));
  nnConfig.currentNote.update('content');
end;

end.
