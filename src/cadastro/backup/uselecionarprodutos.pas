unit uSelecionarProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, BufDataset, DB, memds, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DBGrids, StdCtrls, DBCtrls, ZDataset, BCExpandPanels,
  BGRACustomDrawn, BCMaterialSpinEdit, BCButton, BCLabel;

type

  { TSelecionarProdutosF }

  TSelecionarProdutosF = class(TForm)
    edtValorTotal: TEdit;
    edtValorUnitario: TDBEdit;
    edtQuantidade: TBCMaterialSpinEdit;
    btnPesquisar: TBCButton;
    btnAdicionarProduto: TBCButton;
    edtProdutoId: TDBEdit;
    dsProdutos: TDataSource;
    dbgProdutos: TDBGrid;
    edtPesquisar: TEdit;
    edtProdutoDesc: TDBEdit;
    lblValorUnitario: TLabel;
    lblProdutoId: TLabel;
    lblProdutoDesc: TLabel;
    lblValorTotal: TLabel;
    mdsProdutosSelecionados: TMemDataset;
    pnlBordaPesquisa: TPanel;
    pnlRodape: TPanel;
    pnlPesquisa: TPanel;
    pnlTopo: TPanel;
    qrySelectProdutos: TZQuery;
    procedure edtQuantidadeChange(Sender: TObject);
  private

  public

  end;

var
  SelecionarProdutosF: TSelecionarProdutosF;

implementation

{$R *.lfm}

{ TSelecionarProdutosF }

procedure TSelecionarProdutosF.edtQuantidadeChange(Sender: TObject);
begin

end;

end.

