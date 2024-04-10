unit uSelecionarProdutosF;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  BCMaterialSpinEdit, BCButton, uOrcModalModelo;

type

  { TSelecionarProdutosF }

  TSelecionarProdutosF = class(TOrcModalModeloF)
    btnAdicionarProduto: TBCButton;
    edtProdutoDesc: TDBEdit;
    edtProdutoId: TDBEdit;
    edtQuantidade: TBCMaterialSpinEdit;
    edtValorTotal: TEdit;
    edtValorUnitario: TDBEdit;
    lblProdutoDesc: TLabel;
    lblProdutoId: TLabel;
    lblValorTotal: TLabel;
    lblValorUnitario: TLabel;
  private

  public

  end;

var
  SelecionarProdutosF: TSelecionarProdutosF;

implementation

{$R *.lfm}

end.

