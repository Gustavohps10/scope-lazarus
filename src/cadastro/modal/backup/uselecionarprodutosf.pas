unit uSelecionarProdutosF;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  BCMaterialSpinEdit, BCButton, uOrcModalModelo, DB, dm;

type

  { TSelecionarProdutosF }

  TSelecionarProdutosF = class(TOrcModalModeloF)
    btnAdicionarProduto: TBCButton;
    btnExcluir: TBCButton;
    edtProdutoDesc: TDBEdit;
    edtValorTotal: TDBEdit;
    edtProdutoId: TDBEdit;
    edtQuantidade: TBCMaterialSpinEdit;
    edtValorUnitario: TDBEdit;
    lblProdutoDesc: TLabel;
    lblProdutoId: TLabel;
    lblValorTotal: TLabel;
    lblValorUnitario: TLabel;
    procedure btnAdicionarProdutoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dsSelectDataChange(Sender: TObject; Field: TField);
    procedure edtQuantidadeChange(Sender: TObject);
  private

  public

  end;

var
  SelecionarProdutosF: TSelecionarProdutosF;

implementation
uses
  uCadOrcamento;

{$R *.lfm}

{ TSelecionarProdutosF }

procedure TSelecionarProdutosF.dsSelectDataChange(Sender: TObject; Field: TField);
begin
  if dmF.qryOrcItem.FieldCount <> 0 then
  begin
     dmF.qryOrcItem.FieldByName('produtoid').AsString := qrySelect.FieldByName('produtoid').AsString;
     dmF.qryOrcItem.FieldByName('vl_unitario').AsString := qrySelect.FieldByName('vl_venda_produto').AsString;
     dmF.qryOrcItem.FieldByName('vl_total').AsString := qrySelect.FieldByName('vl_venda_produto').AsString;
     dmF.qryOrcItem.FieldByName('produtodesc').AsString := qrySelect.FieldByName('ds_produto').AsString;
     edtQuantidade.Edit.Value := 1;
  end;
end;

procedure TSelecionarProdutosF.btnAdicionarProdutoClick(Sender: TObject);
var valorTotalOrcamento: double = 0;
begin
  dmF.qryOrcItem.Post;
  with dmF.qryOrcItem do
  begin
   First;
   while not EOF do
   begin
    valorTotalOrcamento := valorTotalOrcamento + FieldByName('vl_total_orcamento').AsFloat;
    Next;
   end;
   CadOrcamentoF.qryCad.FieldByName('vl_total_orcamento').AsFloat:= valorTotalOrcamento;
  end;
  Close;
end;

procedure TSelecionarProdutosF.btnExcluirClick(Sender: TObject);
begin
  dmF.qryOrcItem.Cancel;
  Close;
end;

procedure TSelecionarProdutosF.edtQuantidadeChange(Sender: TObject);
begin
  dmF.qryOrcItem.FieldByName('qt_produto').AsInteger := edtQuantidade.Edit.Value;
  dmF.qryOrcItem.FieldByName('vl_total').AsFloat := edtQuantidade.Edit.Value * dmF.qryOrcItem.FieldByName('vl_unitario').AsFloat;
end;

end.

