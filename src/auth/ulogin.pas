unit uLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  BCLabel, BCMaterialEdit, BCButton;

type

  { TLoginF }

  TLoginF = class(TForm)
    btnLogin: TBCButton;
    edtUsuario: TBCMaterialEdit;
    edtSenha: TBCMaterialEdit;
    Image1: TImage;
    imgLogoTopo: TImage;
    lblDigiteUsuarioSenha: TBCLabel;
    lblLogin: TBCLabel;
    lblBemVindo: TBCLabel;
    pnlLoginContainer: TPanel;
    pnlInfoContainer: TPanel;
    pnlLoginLateral: TPanel;
    pnlInfo: TPanel;
    pnlLoginLateralTopo: TPanel;
    txtCopyright: TStaticText;
    txtDesc: TStaticText;
  private

  public

  end;

var
  LoginF: TLoginF;

implementation

{$R *.lfm}

end.

