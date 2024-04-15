unit uSobre;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  BCLabel, lclintf;

type

  { TSobreF }

  TSobreF = class(TForm)
    lblLinkRepo: TBCLabel;
    Image1: TImage;
    lblVersao: TLabel;
    lblVersao2: TLabel;
    lblTextoPrincipal: TLabel;
    lblAutor: TLabel;
    lblAutorNome: TLabel;
    pnlTopo: TPanel;
    txtRepoInfo: TStaticText;
    txtCopyright: TStaticText;
    txtPrincipal: TStaticText;
    procedure lblLinkRepoClick(Sender: TObject);
  private

  public

  end;

var
  SobreF: TSobreF;

implementation

{$R *.lfm}

{ TSobreF }


procedure TSobreF.lblLinkRepoClick(Sender: TObject);
begin
  OpenURL('https://github.com/Gustavohps10/scope-lazarus');
end;


end.

