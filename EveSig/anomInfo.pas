unit anomInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB;

type
  TfrmAnomInfo = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    btnRefresh: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    anomCode: String;
  public
    { Public declarations }
  end;

var
  frmAnomInfo: TfrmAnomInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmAnomInfo.Button1Click(Sender: TObject);
begin
  Database.qAnomaly.Active := false;
  close;
end;

procedure TfrmAnomInfo.Button2Click(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    Database.qAnomaly.Delete;
    DBGrid1.Refresh;
  End;
end;

procedure TfrmAnomInfo.btnRefreshClick(Sender: TObject);
begin
  Database.qAnomaly.Active := false;
  Database.qAnomaly.Parameters.ParamByName('value').Value := anomCode;
  Database.qAnomaly.Active := true;

  DBGrid1.Refresh;
end;

procedure TfrmAnomInfo.FormCreate(Sender: TObject);
begin
  anomCode := Database.qAnomalyID.Value;
end;

end.
