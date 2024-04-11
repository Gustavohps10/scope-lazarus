unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  BGRAImageList, uCadCategoria, uCadCliente, uCadProduto, uCadOrcamento, relClientes,
  uCadUsuario;

type

  { TprincipalF }

  TprincipalF = class(TForm)
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
  CadCategoriaF.Show();
end;

procedure TprincipalF.menuCadClienteClick(Sender: TObject);
begin
  CadClienteF := TCadClienteF.Create(Self);;
  CadClienteF.Show();
end;

procedure TprincipalF.menuCadProdutoClick(Sender: TObject);
begin
  CadProdutoF := TCadProdutoF.Create(Self);
  CadProdutoF.Show();
end;

procedure TprincipalF.menuCadUsuarioClick(Sender: TObject);
begin
  CadUsuarioF := TCadUsuarioF.Create(Self);
  CadUsuarioF.Show();
end;

procedure TprincipalF.menuOrcamentoClick(Sender: TObject);
begin
  CadOrcamentoF := TCadOrcamentoF.Create(Self);
  CadOrcamentoF.Show();
end;

procedure TprincipalF.menuRelClientesClick(Sender: TObject);
begin
   relClientesF := TrelClientesF.Create(Self);
   relClientesF.Show()s;
end;

end.

