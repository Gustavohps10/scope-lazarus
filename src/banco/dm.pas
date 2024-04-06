unit dm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset;

type

  { TdmF }

  TdmF = class(TDataModule)
    ZConnection1: TZConnection;
    qryGenerica: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
  private

  public

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
  ZConnection1.Password := 'guga2004';
  ZConnection1.Port     := 5432;
  ZConnection1.Protocol := 'postgresql';
  ZConnection1.Connected := True;

end;

end.

