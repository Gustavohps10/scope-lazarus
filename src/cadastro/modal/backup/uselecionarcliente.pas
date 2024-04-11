unit uSelecionarCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  BCButton, uOrcModalModelo, dm;

type

  { TSelecionarClienteF }

  TSelecionarClienteF = class(TOrcModalModeloF)
    btnSelecionar: TBCButton;
    btnExcluir: TBCButton;
    edtTipo: TDBEdit;
    edtNome: TDBEdit;
    edtCpfCnpj: TDBEdit;
    lblNome: TLabel;
    lblCpfCnpj: TLabel;
    lblTipo: TLabel;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
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

procedure TSelecionarClienteF.btnExcluirClick(Sender: TObject);
begin
  Close;
end;

procedure TSelecionarClienteF.btnSelecionarClick(Sender: TObject);
begin
   CadOrcamentoF.qryCad.FieldByName('clienteid').AsInteger := dmF.qryClientes.FieldByName('clienteid').AsInteger;
   //CadOrcamentoF.edtClienteNome.Text := dmF.qryClientes.FieldByName('nome_cliente').asString;
   Close;
end;

end.

