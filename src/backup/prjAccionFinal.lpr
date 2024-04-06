program prjAccionFinal;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, uPrincipal, uCadModelo, uCadCategoria
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TprincipalF, principalF);
  Application.CreateForm(TCadModeloF, CadModeloF);
  Application.CreateForm(TCadCategoriaF, CadCategoriaF);
  Application.Run;
end.

