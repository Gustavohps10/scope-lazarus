unit uCadCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ZDataset, uCadModelo, DB, dm;

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
    procedure dsCadModeloDataChange(Sender: TObject; Field: TField);
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

