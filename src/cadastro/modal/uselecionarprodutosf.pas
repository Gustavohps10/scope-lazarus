unit uSelecionarProdutosF;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ZDataset, BCMaterialSpinEdit, BCButton, uOrcModalModelo, DB, dm;

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
    qrySelectds_produto: TStringField;
    qrySelectprodutoid: TLongintField;
    qrySelectvl_venda_produto: TFloatField;
    procedure btnAdicionarProdutoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
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

procedure TSelecionarProdutosF.btnAdicionarProdutoClick(Sender: TObject);
begin
  dmF.qryOrcItem.Post;
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

procedure TSelecionarProdutosF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  dmF.qryProdutos.Close;
  CloseAction:=caFree;
end;

procedure TSelecionarProdutosF.FormShow(Sender: TObject);
begin
  dmF.qryProdutos.Open;
end;

end.

