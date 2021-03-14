program EVESig;

uses
  Vcl.Forms,
  main in 'main.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  enterInfo in 'enterInfo.pas' {frmEnterInfo},
  search in 'search.pas' {frmSearch},
  data in 'data.pas' {Database: TDataModule},
  anomInfo in 'anomInfo.pas' {frmAnomInfo},
  systemInfo in 'systemInfo.pas' {frmSystemInfo},
  anomHistory in 'anomHistory.pas' {frmAnomHistory};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDatabase, Database);
  Application.Run;
end.
