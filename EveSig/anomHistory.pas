unit anomHistory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmAnomHistory = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAnomHistory: TfrmAnomHistory;

implementation

{$R *.dfm}

uses data;

procedure TfrmAnomHistory.Button2Click(Sender: TObject);
begin
   if MessageDlg('Are you sure you want to delete this record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    Database.qAnomHistory.Delete;
    DBGrid1.Refresh;
  End;
end;

end.
