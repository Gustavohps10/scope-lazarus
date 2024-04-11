unit uCadProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  EditBtn, ButtonPanel, DBDateTimePicker, BCComboBox, BCLabel, BCListBox,
  BCMDButton, BCMaterialEdit, BGRACustomDrawn, BCMaterialFloatSpinEdit,
  BCMaterialSpinEdit, BCCheckComboBox, BCPanel, BGRAThemeRadioButton, ZDataset,
  uCadModelo, DB, ZAbstractDataset, dm;

type

  { TCadProdutoF }

  TCadProdutoF = class(TCadModeloF)
    cbbCategoria: TBCComboBox;
    cbbStatus: TBCComboBox;
    dtpDataCadastro: TDBDateTimePicker;
    edtDesc: TDBEdit;
    edtObs: TDBEdit;
    edtProdutoId: TDBEdit;
    edtValorVenda: TDBEdit;
    lblCategoria: TLabel;
    lblDataCad: TLabel;
    lblDesc: TLabel;
    lblObs: TLabel;
    lblProdutoId: TLabel;
    lblStatus: TLabel;
    lblValorVenda: TLabel;
    qryCadcategoriaprodutoid: TLongintField;
    qryCadds_produto: TStringField;
    qryCaddt_cadastro_produto: TDateTimeField;
    qryCadobs_produto: TStringField;
    qryCadprodutoid: TLongintField;
    qryCadstatus_produto: TStringField;
    qryCadvl_venda_produto: TFloatField;
    qrySelectCategorias: TZQuery;
    rbtnProdutoDesc: TBGRAThemeRadioButton;
    rbtnValorVenda: TBGRAThemeRadioButton;
    rbtnProdutoId: TBGRAThemeRadioButton;
    rbtnStatus: TBGRAThemeRadioButton;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsCadModeloDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure qryCadBeforePost(DataSet: TDataSet);
    procedure qryCadNewRecord(DataSet: TDataSet);
  private

  public

  end;

var
  CadProdutoF: TCadProdutoF;

implementation

{$R *.lfm}

{ TCadProdutoF }

procedure TCadProdutoF.dsCadModeloDataChange(Sender: TObject; Field: TField);
var i: integer = 1;
begin
   if qryCad.FieldByName('status_produto').AsString = 'ATIVO'
   then cbbStatus.ItemIndex := 1
   else if qryCad.FieldByName('status_produto').AsString = 'INATIVO'
   then cbbStatus.ItemIndex := 2;

   {Muda o Combobox de Categoria de acordo com o produto selecionado}
     with qrySelectCategorias do
     begin
       if FieldCount > 0 then
       begin
         First;
         while not EOF do
         begin
           if (qryCad.FieldByName('categoriaprodutoid').AsInteger = FieldByName('categoriaprodutoid').AsInteger) then
           begin
              cbbCategoria.ItemIndex := i;
           end;
           i := i + 1;
           Next;
         end;
       end;
     end;
end;

procedure TCadProdutoF.FormShow(Sender: TObject);
begin
  qryCad.Open;
end;

procedure TCadProdutoF.qryCadBeforePost(DataSet: TDataSet);
var statusProduto: string;
begin
   if cbbStatus.ItemIndex = 1
   then statusProduto:='ATIVO'
   else statusProduto:='INATIVO';

   {Passa o CategoriaProdutoID do cbbCategoria para o Field do Dataset}
   qryCad.FieldByName('categoriaprodutoid').AsInteger := PtrUInt(cbbCategoria.Items.Objects[cbbCategoria.ItemIndex]);
   qryCad.FieldByName('status_produto').AsString := statusProduto;
end;

procedure TCadProdutoF.qryCadNewRecord(DataSet: TDataSet);
begin
  with dmF.qryGenerica do
   begin
    Close;
    SQL.Clear;
    SQL.Add('select nextval('+ QuotedStr('produto_produtoid ')+') AS CODIGO');
    Open;
    qryCad.FieldByName('produtoid').asInteger := FieldByName('CODIGO').AsInteger;
   end;
  qryCad.FieldByName('dt_cadastro_produto').AsDateTime := Date;
  cbbCategoria.ItemIndex := 0;
  cbbStatus.ItemIndex := 0;
  pgcPrincipal.ActivePage := tbCadastro;
end;

procedure TCadProdutoF.FormCreate(Sender: TObject);
begin
   {Lista todas categorias no combobox}
   with qrySelectCategorias do
       begin
        Open;
        cbbCategoria.Clear;
        cbbCategoria.Items.Add('Selecionar');
        while not EOF do
        begin
           cbbCategoria.Items.AddObject(FieldByName('ds_categoria_produto').asString, TObject(FieldByName('categoriaprodutoid').AsInteger));
           Next;
        end;
     end;

   qryCad.Active:=true;
end;

procedure TCadProdutoF.btnPesquisarClick(Sender: TObject);
var search: string;
begin
  search := Trim(edtPesquisar.Text);
  if rbtnProdutoId.Checked then
     dmF.qrySearch(qryCad, 'produto', 'cast(produtoid as text)', search);

  if rbtnProdutoDesc.Checked then
     dmf.qrySearch(qryCad, 'produto', 'ds_produto', search);

  if rbtnValorVenda.Checked then
     dmf.qrySearch(qryCad, 'produto', 'cast(vl_venda_produto as text)', search);

  if rbtnStatus.Checked then
     dmf.qrySearch(qryCad, 'produto', 'status_produto', search);
end;


end.

