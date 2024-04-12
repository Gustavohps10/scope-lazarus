unit uSelecionarCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  BCButton, uOrcModalModelo, dm;

type

  { TSelecionarClienteF }

  TSelecionarClienteF = class(TOrcModalModeloF)
    btnCancelar: TBCButton;
    btnSelecionar: TBCButton;
    edtTipo: TDBEdit;
    edtNome: TDBEdit;
    edtCpfCnpj: TDBEdit;
    lblNome: TLabel;
    lblCpfCnpj: TLabel;
    lblTipo: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
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

procedure TSelecionarClienteF.btnCancelarClick(Sender: TObject);
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

