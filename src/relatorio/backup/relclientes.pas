unit relClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ZDataset, LR_DBSet,
  LR_Class, BCButton, RLReport, dm;

type

  { TrelClientesF }

  TrelClientesF = class(TForm)
    btnImprimirRelCliente: TBCButton;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    qryRelClientes: TZQuery;
    qryRelClientesclienteid: TLongintField;
    qryRelClientescpf_cnpj_cliente: TStringField;
    qryRelClientesnome_cliente: TStringField;
    qryRelClientestipo_cliente: TStringField;
    procedure btnImprimirRelClienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    function qrySearch(table: string; field: string; value: string): string;
  end;

var
  relClientesF: TrelClientesF;

implementation

{$R *.lfm}

{ TrelClientesF }

procedure TrelClientesF.FormShow(Sender: TObject);
begin
  qryRelClientes.Open;
end;

procedure TrelClientesF.btnImprimirRelClienteClick(Sender: TObject);
begin
  frReport1.LoadFromFile('../relatorio/relClientes.lrf');
  frReport1.PrepareReport;
  frReport1.ShowReport;
end;

end.

