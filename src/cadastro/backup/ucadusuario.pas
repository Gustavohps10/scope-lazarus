unit uCadUsuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ZDataset, uCadModelo, DB, dm;

type

  { TCadUsuarioF }

  TCadUsuarioF = class(TCadModeloF)
    edtUsuarioId: TDBEdit;
    edtUsuarioId1: TDBEdit;
    edtUsuarioId2: TDBEdit;
    edtUsuarioId3: TDBEdit;
    lblUsuarioId: TLabel;
    lblNomeCompleto: TLabel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    procedure qryCadNewRecord(DataSet: TDataSet);
  private

  public

  end;

var
  CadUsuarioF: TCadUsuarioF;

implementation

{$R *.lfm}

{ TCadUsuarioF }

procedure TCadUsuarioF.qryCadNewRecord(DataSet: TDataSet);
begin
  with dmF.qryGenerica do
   begin
    Close;
    SQL.Clear;
    SQL.Add('select nextval('+ QuotedStr('usuario_id')+') AS CODIGO');
    Open;
    qryCad.FieldByName('id').asInteger := FieldByName('CODIGO').AsInteger;
   end;
  pgcPrincipal.ActivePage := tbCadastro;
end;

end.

