program DuckingMediaPlayer;

uses
{$IFDEF MadExcept}
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
{$ENDIF}
  Vcl.Forms,
  frmDuckingMediaPlayer in 'frmDuckingMediaPlayer.pas' {Form1},
  MediaPlayer in 'MediaPlayer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
