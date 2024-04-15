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
  Forms, datetimectrls, memdslaz, zcomponent, uPrincipal, uCadModelo, dm,
  uCadCliente, ucadcategoria, uCadProduto, uCadOrcamento, uCadUsuario,
  uOrcModalModelo, uSelecionarProdutosF, uSelecionarCliente, relModelo, 
relCategorias, relProdutos, relClientes, relUsuarios, relOrcamentos, uLogin;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TLoginF, LoginF);
  Application.CreateForm(TprincipalF, principalF);
  Application.CreateForm(TdmF, dmF);
  Application.CreateForm(TCadModeloF, CadModeloF);
  Application.CreateForm(TrelModeloF, relModeloF);
  Application.Run;
end.

