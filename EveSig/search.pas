unit search;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmSearch = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtAnomaly: TEdit;
    edtSystem: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    anomCode: String;
    systemCode: String;
  public
    { Public declarations }
    function findAnom(): Boolean;
    function findSystem(): Boolean;
  end;

var
  frmSearch: TfrmSearch;

implementation

{$R *.dfm}

uses anomInfo, data, systemInfo;

procedure TfrmSearch.Button1Click(Sender: TObject);
begin
  anomCode := edtAnomaly.Text;

  if length(anomCode) < 7 then
    showMessage('Please enter the correct Anomaly code.')
  else if findAnom then
  begin
    frmAnomInfo := TfrmAnomInfo.Create(self);
    frmAnomInfo.Show;
    close;
  end
  else
    showMessage('The Anomaly Code you have entered has not been saved in the database.');

end;

procedure TfrmSearch.Button2Click(Sender: TObject);
begin
  SystemCode := edtSystem.Text;

  if length(systemCode) < 3 then
    showMessage('Please enter the correct System code.')
  else if findSystem then
  begin
    frmSystemInfo := TfrmSystemInfo.Create(self);
    frmSystemInfo.Show;
    close;
  end
  else
    showMessage('The System Code you have entered has not been saved in the database.');
end;

procedure TfrmSearch.Button3Click(Sender: TObject);
begin
  close;
end;

function TfrmSearch.findAnom: Boolean;
begin
  Database.qAnomaly.Active := false;
  Database.qAnomaly.Parameters.ParamByName('value').Value := anomCode;
  Database.qAnomaly.Active := true;

  if Database.qAnomaly.IsEmpty then
    result := false
  else
    result := true;
end;

function TfrmSearch.findSystem: Boolean;
begin
  Database.qSystem.Active := false;
  Database.qSystem.Parameters.ParamByName('value').Value := systemCode;
  Database.qSystem.Active := true;

  if Database.qSystem.IsEmpty then
    result := false
  else
    result := true;
end;

end.
