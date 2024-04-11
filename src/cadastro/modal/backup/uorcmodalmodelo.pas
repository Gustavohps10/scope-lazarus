unit uOrcModalModelo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, BufDataset, DB, memds, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DBGrids, StdCtrls, DBCtrls, ZDataset, BCExpandPanels,
  BGRACustomDrawn, BCMaterialSpinEdit, BCButton, BCLabel;

type

  { TOrcModalModeloF }

  TOrcModalModeloF = class(TForm)
    btnPesquisar: TBCButton;
    dsSelect: TDataSource;
    DBGrid: TDBGrid;
    edtPesquisar: TEdit;
    pnlBordaPesquisa: TPanel;
    pnlRodape: TPanel;
    pnlPesquisa: TPanel;
    pnlTopo: TPanel;
    qrySelect: TZQuery;
  private

  public

  end;

var
  OrcModalModeloF: TOrcModalModeloF;

implementation

{$R *.lfm}

{ TOrcModalModeloF }

end.

