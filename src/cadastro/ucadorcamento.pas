unit uCadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  BCButton, DBDateTimePicker, ZDataset, uCadModelo, uSelecionarProdutos;

type

  { TCadOrcamentoF }

  TCadOrcamentoF = class(TCadModeloF)
    btnVerProdutos: TBCButton;
    btnSelecionarProdutos: TBCButton;
    cbbClientes: TDBLookupComboBox;
    dsOrcItem: TDataSource;
    dtpDataOrc: TDBDateTimePicker;
    dtpDataValidade: TDBDateTimePicker;
    edtValorTotal: TDBEdit;
    dsClientes: TDataSource;
    edtOrcId: TDBEdit;
    lblValorTotal: TLabel;
    lblDataOrc: TLabel;
    lblCliente: TLabel;
    lblDataValidade: TLabel;
    lblOrcId: TLabel;
    qrySelectClientes: TZQuery;
    qryOrcItem: TZQuery;
    procedure btnSelecionarProdutosClick(Sender: TObject);
  private

  public

  end;

var
  CadOrcamentoF: TCadOrcamentoF;

implementation

{$R *.lfm}

{ TCadOrcamentoF }

procedure TCadOrcamentoF.btnSelecionarProdutosClick(Sender: TObject);
begin
  SelecionarProdutosF := TSelecionarProdutosF.Create(Self);
  SelecionarProdutosF.Show();
end;

end.

