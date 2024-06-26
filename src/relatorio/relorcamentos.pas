unit relOrcamentos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, LR_DBSet, ZDataset,
  relModelo, DB;

type

  { TrelOrcamentosF }

  TrelOrcamentosF = class(TrelModeloF)
    dsOrcamentos: TDataSource;
    frDBDataSetOrcItem: TfrDBDataSet;
    qryRelModeloclienteid: TLongintField;
    qryRelModelodt_orcamento: TDateTimeField;
    qryRelModelodt_validade_orcamento: TDateTimeField;
    qryRelModeloorcamentoid: TLongintField;
    qryRelModelovl_total_orcamento: TFloatField;
    qryOrcItem: TZQuery;
    procedure btnImprimirClick(Sender: TObject);
  private

  public

  end;

var
  relOrcamentosF: TrelOrcamentosF;

implementation

{$R *.lfm}

{ TrelOrcamentosF }

procedure TrelOrcamentosF.btnImprimirClick(Sender: TObject);
begin
  frReportModelo.LoadFromFile('../relatorio/relOrcamentos.lrf');
  frReportModelo.PrepareReport;
  frReportModelo.ShowReport;
end;

end.

