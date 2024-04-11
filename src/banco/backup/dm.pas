unit dm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TdmF }

  TdmF = class(TDataModule)
    dsProdutos: TDataSource;
    dsClientes: TDataSource;
    dsOrcItem: TDataSource;
    qryOrcItem: TZQuery;
    qryOrcItemorcamentoid: TLongintField;
    qryOrcItemorcamentoitemid: TLongintField;
    qryOrcItemprodutodesc: TStringField;
    qryOrcItemprodutoid: TLongintField;
    qryOrcItemqt_produto: TFloatField;
    qryOrcItemvl_total: TFloatField;
    qryOrcItemvl_unitario: TFloatField;
    qryProdutoscategoriaprodutoid: TLongintField;
    qryProdutosds_produto: TStringField;
    qryProdutosdt_cadastro_produto: TDateTimeField;
    qryProdutosobs_produto: TStringField;
    qryProdutosprodutoid: TLongintField;
    qryProdutosstatus_produto: TStringField;
    qryProdutosvl_venda_produto: TFloatField;
    ZConnection1: TZConnection;
    qryGenerica: TZQuery;
    qryProdutos: TZQuery;
    qryClientes: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure dsProdutosDataChange(Sender: TObject; Field: TField);
  private

  public
    function getSequence(sequenceName: string): integer;
  end;

var
  dmF: TdmF;

implementation
uses
  uSelecionarProdutosF;

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

procedure TdmF.dsProdutosDataChange(Sender: TObject; Field: TField);
begin
  if qryOrcItem.FieldCount <> 0 then
  begin
     qryOrcItem.FieldByName('produtoid').AsString := qryProdutos.FieldByName('produtoid').AsString;
     qryOrcItem.FieldByName('vl_unitario').AsString := qryProdutos.FieldByName('vl_venda_produto').AsString;
     qryOrcItem.FieldByName('vl_total').AsString := qryProdutos.FieldByName('vl_venda_produto').AsString;
     qryOrcItem.FieldByName('produtodesc').AsString := qryProdutos.FieldByName('ds_produto').AsString;
     CadOrcamentoF.;
  end;
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

