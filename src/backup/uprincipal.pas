unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  uCadCategoria, uCadCliente, uCadProduto, uCadOrcamento, uCadUsuario;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    imgLogo: TImage;
    MainMenu1: TMainMenu;
    menuCadastro: TMenuItem;
    menuCadCategoria: TMenuItem;
    menuCadCliente: TMenuItem;
    menuCadProduto: TMenuItem;
    menuCadUsuario: TMenuItem;
    menuSobre: TMenuItem;
    menuOrcamento: TMenuItem;
    menuVendas: TMenuItem;
    pnlCabecalho: TPanel;
    procedure menuCadCategoriaClick(Sender: TObject);
    procedure menuCadClienteClick(Sender: TObject);
    procedure menuCadProdutoClick(Sender: TObject);
    procedure menuCadUsuarioClick(Sender: TObject);
    procedure menuOrcamentoClick(Sender: TObject);
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

end.

