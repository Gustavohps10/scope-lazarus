unit relClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, relModelo, DB;

type

  { TrelClientesF }

  TrelClientesF = class(TrelModeloF)
    qryRelModeloclienteid: TLongintField;
    qryRelModelocpf_cnpj_cliente: TStringField;
    qryRelModelonome_cliente: TStringField;
    qryRelModelotipo_cliente: TStringField;
    procedure btnImprimirClick(Sender: TObject);
  private

  public

  end;

var
  relClientesF: TrelClientesF;

implementation

{$R *.lfm}

{ TrelClientesF }

procedure TrelClientesF.btnImprimirClick(Sender: TObject);
begin
  frReportModelo.LoadFromFile('../relatorio/relClientes.lrf');
  frReportModelo.PrepareReport;
  frReportModelo.ShowReport;
end;

end.

