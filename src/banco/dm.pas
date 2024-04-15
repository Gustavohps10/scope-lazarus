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
    qryLoginid: TLongintField;
    qryLoginnome_completo: TStringField;
    qryLoginsenha: TStringField;
    qryLoginusuario: TStringField;
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
    qryLogin: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure dsProdutosDataChange(Sender: TObject; Field: TField);
  private

  public
    function getSequence(sequenceName: string): integer;
    procedure qrySearch(ZQuery: TZQuery; table: string; field: string; value: string; additionalWhere: string = '');
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
  if CadOrcamentoF.qryOrcItem.FieldCount <> 0 then
  begin
     CadOrcamentoF.qryOrcItem.FieldByName('produtoid').AsString := qryProdutos.FieldByName('produtoid').AsString;
     CadOrcamentoF.qryOrcItem.FieldByName('vl_unitario').AsString := qryProdutos.FieldByName('vl_venda_produto').AsString;
     CadOrcamentoF.qryOrcItem.FieldByName('vl_total').AsString := qryProdutos.FieldByName('vl_venda_produto').AsString;
     CadOrcamentoF.qryOrcItem.FieldByName('produtodesc').AsString := qryProdutos.FieldByName('ds_produto').AsString;
     SelecionarProdutosF.edtQuantidade.Edit.Value:=1;
     SelecionarProdutosF.edtQuantidade.Edit.MinValue:=1;
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

procedure TdmF.qrySearch(ZQuery: TZQuery; table: string; field: string; value: string; additionalWhere: string = '');
var qrySql: string;
begin
  qrySql := 'select * from ' + table + ' where ' + field + ' ilike ' + QuotedStr('%' + value + '%')+ ' ' + additionalWhere;
  with ZQuery do
   begin
    Close;
    SQL.Clear;
    SQL.Add(qrySql);
    Open;
   end;
end;

end.
