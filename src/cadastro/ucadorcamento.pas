unit uCadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  DBGrids, BCButton, BGRAThemeRadioButton, DBDateTimePicker, ZDataset,
  uCadModelo, dm, DateUtils, uSelecionarProdutosF, uSelecionarCliente;

type

  { TCadOrcamentoF }

  TCadOrcamentoF = class(TCadModeloF)
    btnRemoverItem: TBCButton;
    btnSelecionarProdutos: TBCButton;
    btnSelecionarCliente: TBCButton;
    dbgProdutos: TDBGrid;
    cbbClienteNome: TDBLookupComboBox;
    dtpDataOrc: TDBDateTimePicker;
    dtpDataValidade: TDBDateTimePicker;
    edtClienteId: TDBEdit;
    edtValorTotal: TDBEdit;
    edtOrcId: TDBEdit;
    lblClienteNome: TLabel;
    lblListaProdutos: TLabel;
    lblClienteId: TLabel;
    lblValorTotal: TLabel;
    lblDataOrc: TLabel;
    lblDataValidade: TLabel;
    lblOrcId: TLabel;
    qryCadclienteid: TLongintField;
    qryCaddt_orcamento: TDateTimeField;
    qryCaddt_validade_orcamento: TDateTimeField;
    qryCadorcamentoid: TLongintField;
    qryCadvl_total_orcamento: TFloatField;
    rbtnOrcClienteId: TBGRAThemeRadioButton;
    rbtnOrcId: TBGRAThemeRadioButton;
    rbtnOrcValorTotal: TBGRAThemeRadioButton;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnRemoverItemClick(Sender: TObject);
    procedure btnSelecionarClienteClick(Sender: TObject);
    procedure btnSelecionarProdutosClick(Sender: TObject);
    procedure dsCadModeloDataChange(Sender: TObject; Field: TField);
    procedure edtClienteNomeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qryCadAfterCancel(DataSet: TDataSet);
    procedure qryCadAfterDelete(DataSet: TDataSet);
    procedure qryCadAfterEdit(DataSet: TDataSet);
    procedure qryCadAfterPost(DataSet: TDataSet);
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

procedure TCadOrcamentoF.btnRemoverItemClick(Sender: TObject);
begin
  dmF.qryOrcItem.Delete;
end;

procedure TCadOrcamentoF.btnPesquisarClick(Sender: TObject);
var search: string;
begin
  search := Trim(edtPesquisar.Text);
  if rbtnOrcId.Checked then
     dmF.qrySearch(qryCad, 'orcamento', 'cast(orcamentoid as text)', search);

  if rbtnOrcClienteId.Checked then
     dmf.qrySearch(qryCad, 'orcamento', 'cast(clienteid as text)', search);

  //if rbtnOrcDataSolic.Checked then
  //   dmf.qrySearch(qryCad, 'orcamento', 'cast(dt_orcamento as text)', search);
  //
  //if rbtnOrcDataValidade.Checked then
  //   dmf.qrySearch(qryCad, 'orcamento', 'cast(dt_validade_orcamento as text)', search);

  if rbtnOrcValorTotal.Checked then
     dmf.qrySearch(qryCad, 'orcamento', 'cast(vl_total_orcamento as text)', search);
end;

procedure TCadOrcamentoF.btnSelecionarClienteClick(Sender: TObject);
begin
  SelecionarClienteF := TSelecionarClienteF.Create(Self);
  SelecionarClienteF.ShowModal();
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

procedure TCadOrcamentoF.edtClienteNomeChange(Sender: TObject);
begin

end;

procedure TCadOrcamentoF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  inherited;
  dmF.qryClientes.Close;
end;

procedure TCadOrcamentoF.FormShow(Sender: TObject);
begin
  qryCad.Open;
  dmF.qryClientes.Open;
  dmF.qryOrcItem.Open;
end;

procedure TCadOrcamentoF.qryCadAfterCancel(DataSet: TDataSet);
begin
  inherited;
  btnSelecionarProdutos.Enabled:=false;
  btnRemoverItem.Enabled:=false;
end;

procedure TCadOrcamentoF.qryCadAfterDelete(DataSet: TDataSet);
begin
  inherited;
  btnSelecionarProdutos.Enabled:=false;
  btnRemoverItem.Enabled:=false;
end;

procedure TCadOrcamentoF.qryCadAfterEdit(DataSet: TDataSet);
begin
  btnSelecionarProdutos.Enabled:=true;
  btnRemoverItem.Enabled:=true;
end;

procedure TCadOrcamentoF.qryCadAfterPost(DataSet: TDataSet);
begin
  inherited;
  btnSelecionarProdutos.Enabled:=false;
  btnRemoverItem.Enabled:=false;
end;

procedure TCadOrcamentoF.qryCadNewRecord(DataSet: TDataSet);
begin
  btnSelecionarProdutos.Enabled:=true;
  btnRemoverItem.Enabled:=true;
  qryCad.FieldByName('orcamentoid').AsInteger := dmF.getSequence('orcamento_orcamentoid_seq');
  qryCad.FieldByName('dt_orcamento').AsDateTime := Date;
  qryCad.FieldByName('dt_validade_orcamento').AsDateTime := IncDay(Date, 15);
  pgcPrincipal.ActivePage := tbCadastro;
end;

end.

