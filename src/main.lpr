
Program main;

{$mode objfpc}{$H+}

Uses 
  {$IFDEF UNIX}
cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
athreads,
  {$ENDIF}
Interfaces, // this includes the LCL widgetset
Forms, main_window_unit, notes_class
  { you can add units after this };

{$R *.res}

Begin
    RequireDerivedFormResource := True;
    Application.Scaled := True;
    Application.Initialize;
    Application.CreateForm(TForm1, Form1);

    Application.Run;
End.
