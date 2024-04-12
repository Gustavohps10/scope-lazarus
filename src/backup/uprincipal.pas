unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  BGRAImageList, BCLabel, uCadCategoria, uCadCliente, uCadProduto,
  uCadOrcamento, relClientes, uCadUsuario;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    BCLabel1: TBCLabel;
    Image1: TImage;
    imglIcons: TBGRAImageList;
    imgLogo: TImage;
    MainMenu1: TMainMenu;
    menuCadastro: TMenuItem;
    menuCadCategoria: TMenuItem;
    menuCadCliente: TMenuItem;
    menuCadProduto: TMenuItem;
    menuCadUsuario: TMenuItem;
    menuRelClientes: TMenuItem;
    menuRelatorios: TMenuItem;
    menuSobre: TMenuItem;
    menuOrcamento: TMenuItem;
    menuVendas: TMenuItem;
    pnlPrincipal: TPanel;
    pnlMenuLateral: TPanel;
    pnlCabecalho: TPanel;
    Separator1: TMenuItem;
    procedure menuCadCategoriaClick(Sender: TObject);
    procedure menuCadClienteClick(Sender: TObject);
    procedure menuCadProdutoClick(Sender: TObject);
    procedure menuCadUsuarioClick(Sender: TObject);
    procedure menuOrcamentoClick(Sender: TObject);
    procedure menuRelClientesClick(Sender: TObject);
  private

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.menuCadCategoriaClick(Sender: TObject);
begin
  CadCategoriaF := TCadCategoriaF.Create(Self);
  CadCategoriaF.Parent := pnlPrincipal;
  CadCategoriaF.Align := alClient;
  CadCategoriaF.BorderStyle:=bsNone;
  CadCategoriaF.Show;
end;

procedure TprincipalF.menuCadClienteClick(Sender: TObject);
begin
  CadClienteF := TCadClienteF.Create(Self);
  CadClienteF.Parent := pnlPrincipal;
  CadClienteF.Align := alClient;
  CadClienteF.BorderStyle:=bsNone;
  CadClienteF.Show;
end;

procedure TprincipalF.menuCadProdutoClick(Sender: TObject);
begin
  CadProdutoF := TCadProdutoF.Create(Self);
  CadProdutoF.Parent := pnlPrincipal;
  CadProdutoF.Align := alClient;
  CadProdutoF.BorderStyle:=bsNone;
  CadProdutoF.Show;
end;

procedure TprincipalF.menuCadUsuarioClick(Sender: TObject);
begin
  CadUsuarioF := TCadUsuarioF.Create(Self);
  CadUsuarioF.Parent := pnlPrincipal;
  CadUsuarioF.Align := alClient;
  CadUsuarioF.BorderStyle:=bsNone;
  CadUsuarioF.Show;
end;

procedure TprincipalF.menuOrcamentoClick(Sender: TObject);
begin
  CadOrcamentoF := TCadOrcamentoF.Create(Self);
  CadOrcamentoF.Parent := pnlPrincipal;
  CadOrcamentoF.Align := alClient;
  CadOrcamentoF.BorderStyle:=bsNone;
  CadOrcamentoF.Show;
end;

procedure TprincipalF.menuRelClientesClick(Sender: TObject);
begin
   relClientesF := TrelClientesF.Create(Self);
   relClientesF.Show();
end;

end.

