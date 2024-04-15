unit relUsuarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, relModelo, DB;

type

  { TrelUsuariosF }

  TrelUsuariosF = class(TrelModeloF)
    qryRelModeloid: TLongintField;
    qryRelModelonome_completo: TStringField;
    qryRelModelosenha: TStringField;
    qryRelModelousuario: TStringField;
    procedure btnImprimirClick(Sender: TObject);
  private

  public

  end;

var
  relUsuariosF: TrelUsuariosF;

implementation

{$R *.lfm}

{ TrelUsuariosF }

procedure TrelUsuariosF.btnImprimirClick(Sender: TObject);
begin
  frReportModelo.LoadFromFile('../relatorio/relClientes.lrf');
  frReportModelo.PrepareReport;
  frReportModelo.ShowReport;
end;

end.

