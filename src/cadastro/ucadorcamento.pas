unit uCadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  DBGrids, BCButton, DBDateTimePicker, ZDataset, uCadModelo,
  uSelecionarProdutosF;

type

  { TCadOrcamentoF }

  TCadOrcamentoF = class(TCadModeloF)
    btnSelecionarProdutos: TBCButton;
    cbbClientes: TDBLookupComboBox;
    dbgProdutos: TDBGrid;
    dsOrcItem: TDataSource;
    dtpDataOrc: TDBDateTimePicker;
    dtpDataValidade: TDBDateTimePicker;
    edtValorTotal: TDBEdit;
    dsClientes: TDataSource;
    edtOrcId: TDBEdit;
    lblListaProdutos: TLabel;
    lblValorTotal: TLabel;
    lblDataOrc: TLabel;
    lblCliente: TLabel;
    lblDataValidade: TLabel;
    lblOrcId: TLabel;
    qrySelectClientes: TZQuery;
    qryOrcItem: TZQuery;
    procedure btnSelecionarProdutosClick(Sender: TObject);
    procedure dsCadModeloDataChange(Sender: TObject; Field: TField);
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

procedure TCadOrcamentoF.dsCadModeloDataChange(Sender: TObject; Field: TField);
begin
  with qryOrcItem do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select produtoid, produtodesc, qt_produto, vl_unitario,  vl_total from orcamento_item where orcamentoid = ' + qryCad.FieldByName('orcamentoid').AsString);
    Open;
  end;
end;

end.

