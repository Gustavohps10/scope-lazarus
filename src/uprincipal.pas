unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, BGRAImageList, BCLabel, BCExpandPanels, BCButton, BCToolBar,
  BGRAThemeButton, dm, BCSVGButton, uCadCategoria, uCadCliente, uCadProduto,
  uCadOrcamento, uCadUsuario, uCadModelo, uSobre,
  relCategorias, relProdutos, relClientes, relUsuarios, relOrcamentos;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnMenuCategoria: TBCButton;
    btnMenuRelCategorias: TBCButton;
    btnMenuRelProdutos: TBCButton;
    btnMenuRelClientes: TBCButton;
    btnMenuRelUsuarios: TBCButton;
    btnMenuRelOrcamentos: TBCButton;
    btnMenuUsuarios: TBCButton;
    btnMenuProdutos: TBCButton;
    btnMenuClientes: TBCButton;
    btnMenuOrcamento: TBCButton;
    bnMenuSair: TBCButton;
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
    menuRelOrcamentos: TMenuItem;
    menuRelUsuarios: TMenuItem;
    menuRelProdutos: TMenuItem;
    menuRelCategorias: TMenuItem;
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
    Separator2: TMenuItem;
    Separator3: TMenuItem;
    procedure bnMenuSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure menuCadCategoriaClick(Sender: TObject);
    procedure menuCadClienteClick(Sender: TObject);
    procedure menuCadProdutoClick(Sender: TObject);
    procedure menuCadUsuarioClick(Sender: TObject);
    procedure menuOrcamentoClick(Sender: TObject);
    procedure menuRelCategoriasClick(Sender: TObject);
    procedure menuRelClientesClick(Sender: TObject);
    procedure menuRelOrcamentosClick(Sender: TObject);
    procedure menuRelProdutosClick(Sender: TObject);
    procedure menuRelUsuariosClick(Sender: TObject);
    procedure menuSobreClick(Sender: TObject);
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

procedure TprincipalF.bnMenuSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TprincipalF.FormCreate(Sender: TObject);
begin
   lblUsuarioNome.Caption:= dmF.qryLogin.FieldByName('nome_completo').asString;
   dmF.qryLogin.Close;
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

procedure TprincipalF.menuRelCategoriasClick(Sender: TObject);
begin
   relCategoriasF := TrelCategoriasF.Create(Self);
   relCategoriasF.ShowModal();
end;

procedure TprincipalF.menuRelClientesClick(Sender: TObject);
begin
   relClientesF := TrelClientesF.Create(Self);
   relClientesF.ShowModal();
end;

procedure TprincipalF.menuRelOrcamentosClick(Sender: TObject);
begin
   relOrcamentosF := TrelOrcamentosF.Create(Self);
   relOrcamentosF.ShowModal();
end;

procedure TprincipalF.menuRelProdutosClick(Sender: TObject);
begin
   relProdutosF := TrelProdutosF.Create(Self);
   relProdutosF.ShowModal();
end;

procedure TprincipalF.menuRelUsuariosClick(Sender: TObject);
begin
   relUsuariosF := TrelUsuariosF.Create(Self);
   relUsuariosF.ShowModal();
end;

procedure TprincipalF.menuSobreClick(Sender: TObject);
begin
   SobreF := TSobreF.Create(Self);
   SobreF.ShowModal;
end;

procedure TprincipalF.openCadForm(form: TForm);
begin
   form.Parent := pnlPrincipal;
   form.Align := alClient;
   form.BorderStyle:=bsNone;
   form.Show;
end;

end.

