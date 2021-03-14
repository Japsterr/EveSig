unit enterInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmEnterInfo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtAnomCode: TEdit;
    edtSystemCode: TEdit;
    cbType: TComboBox;
    edtDescription: TEdit;
    btnSave: TButton;
    btnExit: TButton;
    procedure btnExitClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    anomCode: String;
    systemCode: String;
    anomType: String;
    anomDescription: String;
    scanDate: TDate;
  public
    { Public declarations }
    procedure saveData();
    function findAnomaly(): boolean;
    function findAnomHistory():boolean;
  end;

var
  frmEnterInfo: TfrmEnterInfo;

implementation

{$R *.dfm}

uses data, anomInfo, anomHistory;

{ TfrmEnterInfo }

procedure TfrmEnterInfo.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEnterInfo.btnSaveClick(Sender: TObject);
begin
  anomCode := edtAnomCode.Text;
  systemCode := edtSystemCode.Text;
  anomType := cbType.Text;
  anomDescription := edtDescription.Text;
  scanDate := date;

  if length(anomCode) < 7 then
    showMessage('The Anomaly Code is not correct and is required.')
  else if length(systemCode) < 3 then
    showMessage('The System code is not correct and is required.')
  else if length(anomType) < 3 then
    showMessage('The Anomaly Type is not correct and is required.')
  else if findAnomaly then
    showMessage('The anomaly is already registered in the system')
  else
  begin
    saveData;

    if findAnomHistory then
      begin
        ShowMessage('The Anomaly information has been successfully saved, but a previous instance of this Anomaly has been saved before.');

        frmAnomInfo := TfrmAnomInfo.Create(self);
        frmAnomInfo.ShowModal;
        frmAnomInfo.Destroy;
      end
      else
      begin
        ShowMessage('The Anomaly information has been successfully saved.');
      end;
  end;

end;

function TfrmEnterInfo.findAnomaly: boolean;
begin
  Database.qAnomToday.Active := false;
  Database.qAnomToday.Parameters.ParamByName('valueOne').Value := anomCode;
  Database.qAnomToday.Parameters.ParamByName('valueTwo').Value := systemCode;
  Database.qAnomToday.Active := true;

  if (Database.qAnomToday.IsEmpty) then
    result := false
  else
    result := true;
end;

function TfrmEnterInfo.findAnomHistory: boolean;
var count: Integer;
begin
  Database.qAnomaly.Active := false;
  Database.qAnomaly.Parameters.ParamByName('value').Value := anomCode;
  Database.qAnomaly.Active := true;

  count := Database.qAnomaly.RecordCount;

  if count < 2 then
    result := false
  else
    result := true;

end;

procedure TfrmEnterInfo.saveData;
begin
  Database.tbAnomaly.Insert;
  Database.tbAnomalyID.Value := anomCode;
  Database.tbAnomalySystem.Value := systemCode;
  Database.tbAnomalyType.Value := anomType;
  Database.tbAnomalyDescription.Value := anomDescription;
  Database.tbAnomalyDates.Value := scanDate;
  Database.tbAnomaly.Post;
end;

end.
