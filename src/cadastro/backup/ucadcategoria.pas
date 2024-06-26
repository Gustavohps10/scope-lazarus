unit ucadcategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ExtCtrls, BGRAThemeRadioButton, uCadModelo, DB, dm, SQLDB;

type

  { TCadCategoriaF }

  TCadCategoriaF = class(TCadModeloF)
    rbtnCategoriaId: TBGRAThemeRadioButton;
    rbtnCategoriaDesc: TBGRAThemeRadioButton;
    edtCatId: TDBEdit;
    edtCatDesc: TDBEdit;
    lblID: TLabel;
    lblDesc: TLabel;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryCadDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var DataAction: TDataAction);
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

procedure TCadCategoriaF.qryCadDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var DataAction: TDataAction);
begin
 MessageDlg('Erro ao excluir',
   'Você não pode excluir a categoria ' + qryCad.FieldByName('ds_categoria_produto').AsString + ', pois ela pertence a outros produtos',
   mtError,
   [mbOk],0);
end;

procedure TCadCategoriaF.btnPesquisarClick(Sender: TObject);
var search: string;
begin
  search := Trim(edtPesquisar.Text);
  if rbtnCategoriaId.Checked then
     dmF.qrySearch(qryCad, 'categoria_produto', 'cast(categoriaprodutoid as text)', search);

  if rbtnCategoriaDesc.Checked then
     dmf.qrySearch(qryCad, 'categoria_produto', 'ds_categoria_produto', search);
end;

end.

