unit uCadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  DBGrids, BCButton, DBDateTimePicker, ZDataset, uCadModelo, dm, DateUtils,
  uSelecionarProdutosF;

type

  { TCadOrcamentoF }

  TCadOrcamentoF = class(TCadModeloF)
    btnExcluir1: TBCButton;
    btnSelecionarProdutos: TBCButton;
    cbbClientes: TDBLookupComboBox;
    dbgProdutos: TDBGrid;
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
    procedure btnExcluir1Click(Sender: TObject);
    procedure btnSelecionarProdutosClick(Sender: TObject);
    procedure dsCadModeloDataChange(Sender: TObject; Field: TField);
    procedure qryCadNewRecord(DataSet: TDataSet);
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
  dmF.qryOrcItem.Insert;
  dmF.qryOrcItem.FieldByName('orcamentoitemid').AsInteger := dmF.getSequence('orcamento_item_orcamentoitemid');
  dmf.qryOrcItem.FieldByName('orcamentoid').AsInteger := qryCad.FieldByName('orcamentoid').AsInteger;
  SelecionarProdutosF := TSelecionarProdutosF.Create(Self);
  SelecionarProdutosF.ShowModal();
end;

procedure TCadOrcamentoF.btnExcluir1Click(Sender: TObject);
begin
  dmF.qryOrcItem.Delete;
end;

procedure TCadOrcamentoF.dsCadModeloDataChange(Sender: TObject; Field: TField);
begin
  with dmF.qryOrcItem do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from orcamento_item where orcamentoid = ' + qryCad.FieldByName('orcamentoid').AsString);
    Open;
  end;
end;

procedure TCadOrcamentoF.qryCadNewRecord(DataSet: TDataSet);
begin
  qryCad.FieldByName('orcamentoid').AsInteger := dmF.getSequence('orcamento_orcamentoid_seq');
  qryCad.FieldByName('dt_orcamento').AsDateTime := Date;
  qryCad.FieldByName('dt_validade_orcamento').AsDateTime := IncDay(Date, 15);
  pgcPrincipal.ActivePage := tbCadastro;
end;

end.

