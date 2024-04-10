unit dm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TdmF }

  TdmF = class(TDataModule)
    dsOrcItem: TDataSource;
    qryOrcItem: TZQuery;
    ZConnection1: TZConnection;
    qryGenerica: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
  private

  public
    function getSequence(sequenceName: string): integer;
  end;

var
  dmF: TdmF;

implementation

{$R *.lfm}

{ TdmF }

procedure TdmF.DataModuleCreate(Sender: TObject);
begin
  ZConnection1.HostName := 'localhost';
  ZConnection1.DataBase := 'prjaccion';
  ZConnection1.User     := 'postgres';
  ZConnection1.Password := '1234';
  ZConnection1.Port     := 5432;
  ZConnection1.Protocol := 'postgresql';
  ZConnection1.Connected := True;

end;

function TdmF.getSequence(sequenceName: string): integer;
begin
  with qryGenerica do
   begin
    Close;
    SQL.Clear;
    SQL.Add('select nextval('+ QuotedStr(sequenceName)+') AS CODIGO');
    Open;
    Result := FieldByName('CODIGO').AsInteger;
   end;
end;

end.

