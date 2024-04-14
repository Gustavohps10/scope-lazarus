unit uCadUsuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ExtCtrls, BGRAThemeRadioButton, ZDataset, uCadModelo, DB, dm;

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
    rbtnUsuarioNome: TBGRAThemeRadioButton;
    rbtnUsuarioId: TBGRAThemeRadioButton;
    rbtnUsuario: TBGRAThemeRadioButton;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TCadUsuarioF.FormShow(Sender: TObject);
begin
  qryCad.Open;
end;

procedure TCadUsuarioF.btnPesquisarClick(Sender: TObject);
var search: string;
begin
  search := Trim(edtPesquisar.Text);
  if rbtnUsuarioId.Checked then
     dmF.qrySearch(qryCad, 'usuarios', 'cast(id as text)', search);

  if rbtnUsuario.Checked then
     dmf.qrySearch(qryCad, 'usuarios', 'usuario', search);

  if rbtnUsuarioNome.Checked then
     dmf.qrySearch(qryCad, 'usuarios', 'nome_completo', search);
end;

end.

