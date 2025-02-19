program SinkWriterSample;

uses
  {$IFDEF FASTMM}
  FastMM4,
  {$ENDIF }
  {$IFDEF MadExcept}
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  {$ENDIF }
  
  Vcl.Forms,
  frmMain in 'frmMain.pas' {MainForm},
  SinkWriterClass in 'SinkWriterClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
