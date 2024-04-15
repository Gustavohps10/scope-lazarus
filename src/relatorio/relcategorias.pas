unit relCategorias;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, relModelo, DB;

type

  { TrelCategoriasF }

  TrelCategoriasF = class(TrelModeloF)
    qryRelModelocategoriaprodutoid: TLongintField;
    qryRelModelods_categoria_produto: TStringField;
    procedure btnImprimirClick(Sender: TObject);
  private

  public

  end;

var
  relCategoriasF: TrelCategoriasF;

implementation

{$R *.lfm}

{ TrelCategoriasF }

procedure TrelCategoriasF.btnImprimirClick(Sender: TObject);
begin
  frReportModelo.LoadFromFile('../relatorio/relCategorias.lrf');
  frReportModelo.PrepareReport;
  frReportModelo.ShowReport;
end;

end.

