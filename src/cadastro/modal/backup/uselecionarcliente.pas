unit uSelecionarCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  BCButton, BGRAThemeRadioButton, uOrcModalModelo, dm;

type

  { TSelecionarClienteF }

  TSelecionarClienteF = class(TOrcModalModeloF)
    btnCancelar: TBCButton;
    btnSelecionar: TBCButton;
    edtTipo: TDBEdit;
    edtNome: TDBEdit;
    edtCpfCnpj: TDBEdit;
    lblFiltrarPor: TLabel;
    lblNome: TLabel;
    lblCpfCnpj: TLabel;
    lblTipo: TLabel;
    rbtnTipo: TBGRAThemeRadioButton;
    rbtnClienteId: TBGRAThemeRadioButton;
    rbtnCpfCnpj: TBGRAThemeRadioButton;
    rbtnNome: TBGRAThemeRadioButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  SelecionarClienteF: TSelecionarClienteF;

implementation
uses uCadOrcamento;

{$R *.lfm}

{ TSelecionarClienteF }

procedure TSelecionarClienteF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  //dmF.qryClientes.Close;
  CloseAction:=caFree;
end;

procedure TSelecionarClienteF.btnCancelarMouseEnter(Sender: TObject);
begin
  btnCancelar.ImageIndex := 5;
end;

procedure TSelecionarClienteF.btnCancelarMouseLeave(Sender: TObject);
begin
  btnCancelar.ImageIndex := 6;
end;

procedure TSelecionarClienteF.btnPesquisarClick(Sender: TObject);
var search: string;
begin
  dmF.qryClientes.Close;
  search := Trim(edtPesquisar.Text);

  if rbtnClienteId.Checked then
     dmF.qrySearch(dmF.qryClientes, 'cliente', 'cast(clienteid as text)', search);

  if rbtnTipo.Checked then
     dmf.qrySearch(dmF.qryClientes, 'cliente', 'tipo_cliente', search);

  if rbtnCpfCnpj.Checked then
     dmf.qrySearch(dmF.qryClientes, 'cliente', 'cpf_cnpj_cliente', search);

  if rbtnNome.Checked then
     dmf.qrySearch(dmF.qryClientes, 'cliente', 'nome_cliente', search);
end;

procedure TSelecionarClienteF.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TSelecionarClienteF.btnSelecionarClick(Sender: TObject);
begin
   CadOrcamentoF.qryCad.FieldByName('clienteid').AsInteger := dmF.qryClientes.FieldByName('clienteid').AsInteger;
   Close;
end;

procedure TSelecionarClienteF.DBGridDblClick(Sender: TObject);
begin

end;

end.

