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
    procedure qryOrcItemAfterDelete(DataSet: TDataSet);
    procedure qryOrcItemAfterPost(DataSet: TDataSet);
  private

  public
    function getSequence(sequenceName: string): integer;
    procedure calculaTotalOrc();
    procedure qrySearch(ZQuery: TZQuery; table: string; field: string; value: string);
  end;

var
  dmF: TdmF;

implementation
uses
  uSelecionarProdutosF, uCadOrcamento;

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
     SelecionarProdutosF.edtQuantidade.Edit.Value:=1;
  end;
end;

procedure TdmF.qryOrcItemAfterDelete(DataSet: TDataSet);
begin
  calculaTotalOrc();
end;

procedure TdmF.qryOrcItemAfterPost(DataSet: TDataSet);
begin
  calculaTotalOrc();
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

procedure TdmF.calculaTotalOrc();
var valorTotalOrcamento: double = 0;
begin
  with qryOrcItem do
  begin
   First;
   while not EOF do
   begin
    valorTotalOrcamento := valorTotalOrcamento + FieldByName('vl_total').AsFloat;
    Next;
   end;
   CadOrcamentoF.qryCad.FieldByName('vl_total_orcamento').AsFloat:= valorTotalOrcamento;
  end;
end;

procedure TdmF.qrySearch(ZQuery: TZQuery; table: string; field: string; value: string);
var qrySql: string;
begin
  qrySql := 'select * from ' + table + ' where ' + field + ' ilike ' + QuotedStr('%' + value + '%');
  with ZQuery do
   begin
    Close;
    SQL.Clear;
    SQL.Add(qrySql);
    Open;
   end;
end;

end.

