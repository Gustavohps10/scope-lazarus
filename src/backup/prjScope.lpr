program prjScope;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Controls, datetimectrls, memdslaz, zcomponent, uPrincipal, uCadModelo, dm,
  uCadCliente, ucadcategoria, uCadProduto, uCadOrcamento, uCadUsuario,
  uOrcModalModelo, uSelecionarProdutosF, uSelecionarCliente, relModelo,
  relCategorias, relProdutos, relClientes, relUsuarios, relOrcamentos, uLogin,
  uSobre, SysUtils;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TLoginF, LoginF);
  Application.CreateForm(TdmF, dmF);

  if LoginF.ShowModal = mrOK then
  begin
    FreeAndNil(LoginF);
    Application.CreateForm(TprincipalF, principalF);
    Application.Run;
    Exit;
  end;
      Application.Terminate;
end.

