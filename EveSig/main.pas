unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    btnEnter: TButton;
    btnSearch: TButton;
    btnExit: TButton;
    procedure btnExitClick(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses enterInfo, search;

procedure TfrmMain.btnEnterClick(Sender: TObject);
begin
  frmEnterInfo := TfrmEnterInfo.Create(self);
  frmEnterInfo.Show;
  //frmEnterInfo.Destroy;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.btnSearchClick(Sender: TObject);
begin
  frmSearch := TfrmSearch.Create(self);
  frmSearch.Show;
  //frmSearch.Destroy;
end;



end.
