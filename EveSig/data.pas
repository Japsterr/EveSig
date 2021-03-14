unit data;

interface

uses
  System.SysUtils, System.Classes, Data.Win.ADODB, Data.DB;

type
  TDatabase = class(TDataModule)
    ADOConnection1: TADOConnection;
    tbAnomaly: TADOTable;
    qAnomaly: TADOQuery;
    qSystem: TADOQuery;
    tbAnomalyID: TWideStringField;
    tbAnomalySystem: TWideStringField;
    tbAnomalyType: TWideStringField;
    tbAnomalyDescription: TWideStringField;
    tbAnomalyDates: TDateTimeField;
    qAnomalyID: TWideStringField;
    qAnomalySystem: TWideStringField;
    qAnomalyType: TWideStringField;
    qAnomalyDescription: TWideStringField;
    qAnomalyDates: TDateTimeField;
    qSystemID: TWideStringField;
    qSystemSystem: TWideStringField;
    qSystemType: TWideStringField;
    qSystemDescription: TWideStringField;
    qSystemDates: TDateTimeField;
    qAnomToday: TADOQuery;
    qAnomHistory: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Database: TDatabase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
