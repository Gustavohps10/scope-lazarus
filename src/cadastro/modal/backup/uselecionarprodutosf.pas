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
    btnCancelar: TBCButton;
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
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
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
  CadOrcamentoF.qryOrcItem.Post;
  Close;
end;

procedure TSelecionarProdutosF.btnCancelarClick(Sender: TObject);
begin
  CadOrcamentoF.qryOrcItem.Cancel;
  Close;
end;

procedure TSelecionarProdutosF.btnCancelarMouseEnter(Sender: TObject);
begin
  btnCancelar.ImageIndex := 5;
end;

procedure TSelecionarProdutosF.btnCancelarMouseLeave(Sender: TObject);
begin
  btnCancelar.ImageIndex := 6;
end;

procedure TSelecionarProdutosF.edtQuantidadeChange(Sender: TObject);
begin
  CadOrcamentoF.qryOrcItem.FieldByName('qt_produto').AsInteger := edtQuantidade.Edit.Value;
  CadOrcamentoF.qryOrcItem.FieldByName('vl_total').AsFloat := edtQuantidade.Edit.Value * CadOrcamentoF.qryOrcItem.FieldByName('vl_unitario').AsFloat;
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

