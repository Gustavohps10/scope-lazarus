unit ucadcategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls, uCadModelo, DB, dm;

type

  { TCadCategoriaF }

  TCadCategoriaF = class(TCadModeloF)
    edtCatId: TDBEdit;
    edtCatDesc: TDBEdit;
    lblID: TLabel;
    lblDesc: TLabel;
    procedure FormShow(Sender: TObject);
    procedure qryCadNewRecord(DataSet: TDataSet);
  private

  public

  end;

var
  CadCategoriaF: TCadCategoriaF;

implementation

{$R *.lfm}

{ TCadCategoriaF }

procedure TCadCategoriaF.qryCadNewRecord(DataSet: TDataSet);
begin
  with dmF.qryGenerica do
   begin
    Close;
    SQL.Clear;
    SQL.Add('select nextval('+ QuotedStr('categoria_produto_categoriaprodutoid_seq')+') AS CODIGO');
    Open;
    qryCad.FieldByName('categoriaprodutoid').asInteger := FieldByName('CODIGO').AsInteger;
   end;
  pgcPrincipal.ActivePage := tbCadastro;
end;

procedure TCadCategoriaF.FormShow(Sender: TObject);
begin
  qryCad.Open;
end;

end.

