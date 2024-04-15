unit relModelo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, BCButton,
  ZDataset, LR_Class, LR_DBSet;

type

  { TrelModeloF }

  TrelModeloF = class(TForm)
    btnImprimir: TBCButton;
    frDBDataSetModelo: TfrDBDataSet;
    frReportModelo: TfrReport;
    imgReport: TImage;
    pnlTopo: TPanel;
    qryRelModelo: TZQuery;
  private

  public

  end;

var
  relModeloF: TrelModeloF;

implementation

{$R *.lfm}

end.

