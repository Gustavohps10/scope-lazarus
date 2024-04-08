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
  Forms, zcomponent, uPrincipal, uCadModelo, dm, uCadCliente, ucadcategoria,
  uCadProduto, uCadOrcamento, uCadUsuario
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TdmF, dmF);
  Application.CreateForm(TprincipalF, principalF);
  Application.CreateForm(TCadModeloF, CadModeloF);
  Application.Run;
end.

