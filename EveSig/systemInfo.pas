unit systemInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB;

type
  TfrmSystemInfo = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    systemCode: String;
  public
    { Public declarations }
  end;

var
  frmSystemInfo: TfrmSystemInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmSystemInfo.Button1Click(Sender: TObject);
begin
  Database.qSystem.Active := false;
  close;
end;

procedure TfrmSystemInfo.Button2Click(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    Database.qSystem.Delete;
    DBGrid1.Refresh;
  End;
end;

procedure TfrmSystemInfo.Button3Click(Sender: TObject);
begin
  Database.qSystem.Active := false;
  Database.qSystem.Parameters.ParamByName('value').Value := systemCode;
  Database.qSystem.Active := true;
  DBGrid1.Refresh;
end;

procedure TfrmSystemInfo.FormCreate(Sender: TObject);
begin
  systemCode := Database.qSystemSystem.Value;
end;

end.
