unit uCadCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  BGRAThemeRadioButton, ZDataset, uCadModelo, DB, dm;

type

  { TCadClienteF }

  TCadClienteF = class(TCadModeloF)
    cbbTipo: TComboBox;
    edtClienteId: TDBEdit;
    edtNome: TDBEdit;
    edtCpfCnpj: TDBEdit;
    lblClienteId: TLabel;
    lblNome: TLabel;
    lblCpfCnpj: TLabel;
    lblTipo: TLabel;
    rbtnClienteTipo: TBGRAThemeRadioButton;
    rbtnClienteId: TBGRAThemeRadioButton;
    rbtnClienteNome: TBGRAThemeRadioButton;
    rbtnClienteCpfCnpj: TBGRAThemeRadioButton;
    procedure btnPesquisarClick(Sender: TObject);
    procedure dsCadModeloDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure qryCadBeforePost(DataSet: TDataSet);
    procedure qryCadNewRecord(DataSet: TDataSet);
  private

  public

  end;

var
  CadClienteF: TCadClienteF;

implementation

{$R *.lfm}

{ TCadClienteF }

procedure TCadClienteF.qryCadBeforePost(DataSet: TDataSet);
begin
  qryCad.FieldByName('tipo_cliente').asString := cbbTipo.Items[cbbTipo.ItemIndex];
end;

procedure TCadClienteF.dsCadModeloDataChange(Sender: TObject; Field: TField);
begin
  if qryCad.FieldByName('tipo_cliente').AsString = 'F'
   then cbbTipo.ItemIndex := 1
   else if qryCad.FieldByName('tipo_cliente').AsString = 'J'
   then cbbTipo.ItemIndex := 2;
end;

procedure TCadClienteF.btnPesquisarClick(Sender: TObject);
var search: string;
begin
  search := Trim(edtPesquisar.Text);
  if rbtnClienteId.Checked then
     dmF.qrySearch(qryCad, 'cliente', 'cast(clienteid as text)', search);

  if rbtnClienteNome.Checked then
     dmf.qrySearch(qryCad, 'cliente', 'nome_cliente', search);

  if rbtnClienteCpfCnpj.Checked then
     dmf.qrySearch(qryCad, 'cliente', 'cpf_cnpj_cliente', search);

  if rbtnClienteTipo.Checked then
     dmf.qrySearch(qryCad, 'cliente', 'tipo_cliente', search);
end;

procedure TCadClienteF.FormShow(Sender: TObject);
begin
  qryCad.Open;
end;

procedure TCadClienteF.qryCadNewRecord(DataSet: TDataSet);
begin
  with dmF.qryGenerica do
   begin
    Close;
    SQL.Clear;
    SQL.Add('select nextval('+ QuotedStr('cliente_clienteid')+') AS CODIGO');
    Open;
    qryCad.FieldByName('clienteid').AsInteger := FieldByName('CODIGO').AsInteger;
   end;
  cbbTipo.ItemIndex := 0;
  pgcPrincipal.ActivePage := tbCadastro;
end;

end.

