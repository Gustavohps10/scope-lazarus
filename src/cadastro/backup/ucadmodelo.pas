unit uCadModelo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  DBGrids, StdCtrls, ZDataset, BCMaterialDesignButton, BCButton, BGRAImageList;

type

  { TCadModeloF }

  TCadModeloF = class(TForm)
    imglIcons: TBGRAImageList;
    btnExcluir: TBCButton;
    btnCancelar: TBCButton;
    btnGravar: TBCButton;
    btnEditar: TBCButton;
    btnFechar: TBCButton;
    btnNovo: TBCButton;
    btnPesquisar: TBCButton;
    dsCadModelo: TDataSource;
    DBGrid1: TDBGrid;
    edtPesquisar: TEdit;
    pnlBordaPesquisa: TPanel;
    pnlRodape: TPanel;
    pnlCabecalhoConteudo: TPanel;
    pgcPrincipal: TPageControl;
    pnlCabecalho: TPanel;
    tbPesquisa: TTabSheet;
    tbCadastro: TTabSheet;
    qryCad: TZQuery;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qryCadAfterCancel(DataSet: TDataSet);
    procedure qryCadAfterDelete(DataSet: TDataSet);
    procedure qryCadAfterInsert(DataSet: TDataSet);
    procedure qryCadAfterPost(DataSet: TDataSet);
    procedure qryCadBeforeEdit(DataSet: TDataSet);
  private

  public

  end;

var
  CadModeloF: TCadModeloF;

implementation

{$R *.lfm}

{ TCadModeloF }

procedure TCadModeloF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:=caFree;
end;

procedure TCadModeloF.FormShow(Sender: TObject);
begin
  pgcPrincipal.ActivePage := tbPesquisa;
  qryCad.Active := true;
end;

procedure TCadModeloF.qryCadAfterCancel(DataSet: TDataSet);
begin
  btnEditar.Enabled:=true;
  btnGravar.Enabled:=false;
end;

procedure TCadModeloF.qryCadAfterDelete(DataSet: TDataSet);
begin
  pgcPrincipal.ActivePage := tbPesquisa;
end;

procedure TCadModeloF.qryCadAfterInsert(DataSet: TDataSet);
begin
  btnEditar.Enabled:=false;
  btnGravar.Enabled:=true;
end;

procedure TCadModeloF.qryCadAfterPost(DataSet: TDataSet);
begin
  pgcPrincipal.ActivePage := tbPesquisa;
  btnEditar.Enabled:=true;
  btnGravar.Enabled:=false;
end;

procedure TCadModeloF.qryCadBeforeEdit(DataSet: TDataSet);
begin
  btnGravar.Enabled:=true;
  btnEditar.Enabled:=false;
end;

procedure TCadModeloF.btnCancelarClick(Sender: TObject);
begin
  qryCad.Cancel;
  pgcPrincipal.ActivePage := tbPesquisa;
end;

procedure TCadModeloF.btnCancelarMouseEnter(Sender: TObject);
begin
  btnCancelar.ImageIndex := 5;
end;

procedure TCadModeloF.btnCancelarMouseLeave(Sender: TObject);
begin
  btnCancelar.ImageIndex := 6;
end;

procedure TCadModeloF.btnEditarClick(Sender: TObject);
begin
  qryCad.Edit;
end;

procedure TCadModeloF.btnExcluirClick(Sender: TObject);
begin
  qryCad.Delete;
end;

procedure TCadModeloF.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TCadModeloF.btnGravarClick(Sender: TObject);
begin
  qryCad.Post;
end;

procedure TCadModeloF.btnNovoClick(Sender: TObject);
begin
  qryCad.Insert;
end;

end.

