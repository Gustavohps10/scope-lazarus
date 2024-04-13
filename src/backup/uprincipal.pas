unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, BGRAImageList, BCLabel, BCExpandPanels, BCButton, BCToolBar,
  BGRAThemeButton, BCSVGButton, uCadCategoria, uCadCliente, uCadProduto,
  uCadOrcamento, relClientes, uCadUsuario, uCadModelo;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnMenuCategoria: TBCButton;
    btnMenuUsuarios: TBCButton;
    btnMenuProdutos: TBCButton;
    btnMenuClientes: TBCButton;
    btnMenuOrcamento: TBCButton;
    bnMenuSair: TBCButton;
    epnlRelatorios1: TBCExpandPanel;
    epnlRelatorios2: TBCExpandPanel;
    epnlVendas: TBCExpandPanel;
    epnlRelatorios: TBCExpandPanel;
    epnlCadastro: TBCExpandPanel;
    lblUsuarioNome: TBCLabel;
    imgUsuarioAvatar: TImage;
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
    pnlMenuRodape: TPanel;
    pnlMenuLateralContainer: TPanel;
    pnlPrincipal: TPanel;
    pnlMenuLateral: TPanel;
    pnlCabecalho: TPanel;
    ScrollBox1: TScrollBox;
    Separator1: TMenuItem;
    procedure bnMenuSairClick(Sender: TObject);
    procedure btnMenuCategoriaClick(Sender: TObject);
    procedure btnMenuClientesClick(Sender: TObject);
    procedure btnMenuOrcamentoClick(Sender: TObject);
    procedure btnMenuProdutosClick(Sender: TObject);
    procedure btnMenuUsuariosClick(Sender: TObject);
    procedure menuCadCategoriaClick(Sender: TObject);
    procedure menuCadClienteClick(Sender: TObject);
    procedure menuCadProdutoClick(Sender: TObject);
    procedure menuCadUsuarioClick(Sender: TObject);
    procedure menuOrcamentoClick(Sender: TObject);
    procedure menuRelClientesClick(Sender: TObject);
  private
    procedure openCadForm(form: TForm);
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
  openCadForm(CadCategoriaF);
end;

procedure TprincipalF.btnMenuCategoriaClick(Sender: TObject);
begin
  CadCategoriaF := TCadCategoriaF.Create(Self);
  openCadForm(CadCategoriaF);
end;

procedure TprincipalF.bnMenuSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TprincipalF.btnMenuClientesClick(Sender: TObject);
begin
  CadClienteF := TCadClienteF.Create(Self);
  openCadForm(CadClienteF);
end;

procedure TprincipalF.btnMenuOrcamentoClick(Sender: TObject);
begin
   CadOrcamentoF := TCadOrcamentoF.Create(Self);
  openCadForm(CadOrcamentoF);
end;

procedure TprincipalF.btnMenuProdutosClick(Sender: TObject);
begin
   CadProdutoF := TCadProdutoF.Create(Self);
   openCadForm(CadProdutoF);
end;

procedure TprincipalF.btnMenuUsuariosClick(Sender: TObject);
begin
   CadUsuarioF := TCadUsuarioF.Create(Self);
   openCadForm(CadUsuarioF);
end;

procedure TprincipalF.menuCadClienteClick(Sender: TObject);
begin
  CadClienteF := TCadClienteF.Create(Self);
  openCadForm(CadClienteF);
end;

procedure TprincipalF.menuCadProdutoClick(Sender: TObject);
begin
  CadProdutoF := TCadProdutoF.Create(Self);
  openCadForm(CadProdutoF);
end;

procedure TprincipalF.menuCadUsuarioClick(Sender: TObject);
begin
  CadUsuarioF := TCadUsuarioF.Create(Self);
  openCadForm(CadUsuarioF);
end;

procedure TprincipalF.menuOrcamentoClick(Sender: TObject);
begin
  CadOrcamentoF := TCadOrcamentoF.Create(Self);
  openCadForm(CadOrcamentoF);
end;

procedure TprincipalF.menuRelClientesClick(Sender: TObject);
begin
   relClientesF := TrelClientesF.Create(Self);
   relClientesF.Show();
end;

procedure TprincipalF.openCadForm(form: TForm);
begin
   form.Parent := pnlPrincipal;
   form.Align := alClient;
   form.BorderStyle:=bsNone;
   form.Show;
end;

end.

