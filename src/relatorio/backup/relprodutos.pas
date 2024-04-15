unit relProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, relModelo, DB;

type

  { TrelProdutosF }

  TrelProdutosF = class(TrelModeloF)
    qryRelModelocategoriaprodutoid: TLongintField;
    qryRelModelods_produto: TStringField;
    qryRelModelodt_cadastro_produto: TDateTimeField;
    qryRelModeloobs_produto: TStringField;
    qryRelModeloprodutoid: TLongintField;
    qryRelModelostatus_produto: TStringField;
    qryRelModelovl_venda_produto: TFloatField;
    procedure btnImprimirClick(Sender: TObject);
  private

  public

  end;

var
  relProdutosF: TrelProdutosF;

implementation

{$R *.lfm}

{ TrelProdutosF }

procedure TrelProdutosF.btnImprimirClick(Sender: TObject);
begin
  frReportModelo.LoadFromFile('../relatorio/relCategorias.lrf');
  frReportModelo.PrepareReport;
  frReportModelo.ShowReport;
end;

end.

