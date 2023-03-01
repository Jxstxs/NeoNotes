
Unit start_form;

{$mode ObjFPC}{$H+}

Interface

Uses 
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
data_types ;

Type 

  { TF_start }

    TF_start =   Class(TForm)
        B_neu_mits:   TButton;
        B_mits_oeffnen:   TButton;
        B_einstellungen:   TButton;
        B_beenden:   TButton;
        Image1:   TImage;
        L_Footer:   TLabel;
        LB_letzte_mits_db:   TListBox;
        Procedure B_beendenClick(Sender: TObject);
        Procedure B_new_collectionClick(Sender: TObject);
        Private 


        Public 

    End;

Var 
    F_start:   TF_start;

Implementation

{$R *.lfm}

{ TF_start }

Procedure TF_start.B_beendenClick(Sender: TObject);
Begin
    Application.Terminate;
End;

Procedure TF_start.B_new_collectionClick(Sender: TObject);
Begin
    // Application.CreateForm(TF_collection_new, F_collection_new);
    // F_collection_new.show();
End;

End.
