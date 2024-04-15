unit uCadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  DBGrids, ExtCtrls, BCButton, BGRAThemeRadioButton, DBDateTimePicker, ZDataset,
  uCadModelo, dm, DateUtils, uSelecionarProdutosF, uSelecionarCliente;

type

  { TCadOrcamentoF }

  TCadOrcamentoF = class(TCadModeloF)
    btnRemoverItem: TBCButton;
    btnSelecionarProdutos: TBCButton;
    btnSelecionarCliente: TBCButton;
    dsOrcItem: TDataSource;
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
    qryOrcItemorcamentoid: TLongintField;
    qryOrcItemorcamentoitemid: TLongintField;
    qryOrcItemprodutodesc: TStringField;
    qryOrcItemprodutoid: TLongintField;
    qryOrcItemqt_produto: TFloatField;
    qryOrcItemvl_total: TFloatField;
    qryOrcItemvl_unitario: TFloatField;
    rbtnOrcClienteId: TBGRAThemeRadioButton;
    rbtnOrcId: TBGRAThemeRadioButton;
    rbtnOrcValorTotal: TBGRAThemeRadioButton;
    qryOrcItem: TZQuery;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnRemoverItemClick(Sender: TObject);
    procedure btnSelecionarClienteClick(Sender: TObject);
    procedure btnSelecionarProdutosClick(Sender: TObject);
    procedure dsCadModeloDataChange(Sender: TObject; Field: TField);

    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qryCadAfterCancel(DataSet: TDataSet);
    procedure qryCadAfterDelete(DataSet: TDataSet);
    procedure qryCadAfterEdit(DataSet: TDataSet);
    procedure qryCadAfterPost(DataSet: TDataSet);
    procedure qryCadBeforeCancel(DataSet: TDataSet);
    procedure qryCadBeforeDelete(DataSet: TDataSet);
    procedure qryCadNewRecord(DataSet: TDataSet);
    procedure qryOrcItemAfterDelete(DataSet: TDataSet);
    procedure qryOrcItemAfterPost(DataSet: TDataSet);
    procedure tbCadastroShow(Sender: TObject);
  private
    procedure calculaTotalOrc();
    procedure deletaOrcItens();
  public

  end;

var
  CadOrcamentoF: TCadOrcamentoF;
  lastRecordId: integer;

implementation

{$R *.lfm}

{ TCadOrcamentoF }

procedure TCadOrcamentoF.btnSelecionarProdutosClick(Sender: TObject);
begin
  dsOrcItem.DataSet.Append;
  qryOrcItem.FieldByName('orcamentoitemid').AsInteger := dmF.getSequence('orcamento_item_orcamentoitemid');
  qryOrcItem.FieldByName('orcamentoid').AsInteger := qryCad.FieldByName('orcamentoid').AsInteger;
  SelecionarProdutosF := TSelecionarProdutosF.Create(Self);
  SelecionarProdutosF.ShowModal();
end;

procedure TCadOrcamentoF.btnRemoverItemClick(Sender: TObject);
begin
  if (not qryOrcItem.Active) or (qryOrcItem.RecordCount = 0) then
  begin
     MessageDlg('Não foi possivel remover', 'Você não pode realizar esta ação, adicione algum produto primeiro', mtInformation,
   [mbOK],0);
     Exit;
  end;

  if MessageDlg('Confirmar exclusão', 'Você tem certeza que deseja excluir o item '+ qryOrcItem.FieldByName('orcamentoitemid').AsString +'?', mtWarning,
   [mbYes, mbNo],0) = mrYes
   then qryOrcItem.Delete;
end;

procedure TCadOrcamentoF.btnPesquisarClick(Sender: TObject);
var search: string;
begin
  qryOrcItem.Close;
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

  qryOrcItem.Open;
end;

procedure TCadOrcamentoF.btnSelecionarClienteClick(Sender: TObject);
begin
  SelecionarClienteF := TSelecionarClienteF.Create(Self);
  SelecionarClienteF.ShowModal();
end;

procedure TCadOrcamentoF.dsCadModeloDataChange(Sender: TObject; Field: TField);
begin
  //if (qryCad.RecordCount > 0) and (lastRecordId <> qryCad.FieldByName('orcamentoid').AsInteger) then
  //begin
  //  with dmF.qryOrcItem do
  //  begin
  //    Close;
  //    SQL.Clear;
  //    SQL.Add('select * from orcamento_item where orcamentoid = ' + qryCad.FieldByName('orcamentoid').AsString);
  //    Open;
  //  end;
  //end;
  //
  //lastRecordId:=qryCad.FieldByName('orcamentoid').Asinteger;
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

  if qryCad.RecordCount > 0 then
     qryOrcItem.Open;
end;

procedure TCadOrcamentoF.qryCadAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qryOrcItem.Cancel;
  btnSelecionarProdutos.Enabled:=false;
  btnRemoverItem.Enabled:=false;

  if qryCad.RecordCount = 0 then
    qryOrcItem.Close;

  if qryCad.RecordCount > 0 then
  begin
    qryCad.Edit;
    calculaTotalOrc();
    qryCad.Post;
  end;
end;

procedure TCadOrcamentoF.qryCadAfterDelete(DataSet: TDataSet);
begin
  inherited;
  btnSelecionarProdutos.Enabled:=false;
  btnRemoverItem.Enabled:=false;

  if qryCad.RecordCount = 0 then
    qryOrcItem.Close;
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

procedure TCadOrcamentoF.qryCadBeforeCancel(DataSet: TDataSet);
begin
  if qryCad.State = dsInsert then
     deletaOrcItens();
end;

procedure TCadOrcamentoF.qryCadBeforeDelete(DataSet: TDataSet);
begin
    deletaOrcItens();
end;

procedure TCadOrcamentoF.qryCadNewRecord(DataSet: TDataSet);
begin
  btnSelecionarProdutos.Enabled:=true;
  btnRemoverItem.Enabled:=true;
  qryOrcItem.Close;
  qryCad.FieldByName('orcamentoid').AsInteger := dmF.getSequence('orcamento_orcamentoid_seq');
  qryCad.FieldByName('dt_orcamento').AsDateTime := Date;
  dtpDataValidade.MinDate:=Date;
  qryCad.FieldByName('dt_validade_orcamento').AsDateTime := IncDay(Date, 15);
  pgcPrincipal.ActivePage := tbCadastro;
end;

procedure TCadOrcamentoF.qryOrcItemAfterDelete(DataSet: TDataSet);
begin
  if qryOrcItem.RecordCount = 0 then
     btnRemoverItem.Enabled:=false;

  calculaTotalOrc();
end;

procedure TCadOrcamentoF.qryOrcItemAfterPost(DataSet: TDataSet);
begin
  calculaTotalOrc();
end;

procedure TCadOrcamentoF.tbCadastroShow(Sender: TObject);
begin
  if not qryOrcItem.Active then
    qryOrcItem.Open;
end;

procedure TCadOrcamentoF.calculaTotalOrc();
var valorTotalOrcamento: double = 0;
begin
  if qryOrcItem.Active then
  begin
    with qryOrcItem do
    begin
     First;
     while not EOF do
     begin
      valorTotalOrcamento := valorTotalOrcamento + FieldByName('vl_total').AsFloat;
      Next;
     end;
     CadOrcamentoF.qryCad.FieldByName('vl_total_orcamento').AsFloat:= valorTotalOrcamento;
    end;
  end;
end;

procedure TCadOrcamentoF.deletaOrcItens();
begin
  with dmF.qryGenerica do
  begin
   Close;
   SQL.Clear;
   SQL.Add('delete from orcamento_item where orcamentoid = ' + qryCad.FieldByName('orcamentoid').AsString);
   ExecSQL;
   Close;
  end;
end;

end.

