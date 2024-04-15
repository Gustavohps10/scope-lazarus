unit uLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  BCLabel, BCMaterialEdit, BCButton, uPrincipal, lclintf, dm;

type

  { TLoginF }

  TLoginF = class(TForm)
    btnLogin: TBCButton;
    edtUsuario: TBCMaterialEdit;
    edtSenha: TBCMaterialEdit;
    Image1: TImage;
    imgGithub: TImage;
    imgFechar: TImage;
    imgLogoTopo: TImage;
    lblGithub: TLabel;
    lblDigiteUsuarioSenha: TBCLabel;
    lblLogin: TBCLabel;
    lblBemVindo: TBCLabel;
    Panel1: TPanel;
    pnlLoginContainer: TPanel;
    pnlInfoContainer: TPanel;
    pnlLoginLateral: TPanel;
    pnlInfo: TPanel;
    pnlLoginLateralTopo: TPanel;
    txtCopyright: TStaticText;
    txtDesc: TStaticText;
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgFecharClick(Sender: TObject);
    procedure lblGithubClick(Sender: TObject);
    procedure lblGithubMouseEnter(Sender: TObject);
    procedure lblGithubMouseLeave(Sender: TObject);
  private

  public

  end;

var
  LoginF: TLoginF;

implementation

{$R *.lfm}

{ TLoginF }

procedure TLoginF.imgFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TLoginF.lblGithubClick(Sender: TObject);
begin
  OpenURL('https://github.com/Gustavohps10');
end;

procedure TLoginF.lblGithubMouseEnter(Sender: TObject);
begin
  lblGithub.Font.Underline := true;
end;

procedure TLoginF.lblGithubMouseLeave(Sender: TObject);
begin
   lblGithub.Font.Underline := false;
end;

procedure TLoginF.FormCreate(Sender: TObject);
begin
  edtUsuario.Title.Caption:='Usuario';
  edtSenha.Title.Caption:='Senha';
  edtSenha.Edit.PasswordChar:='*';
end;

procedure TLoginF.btnLoginClick(Sender: TObject);
begin
  with dmF.qryLogin do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from usuarios where usuario = '+ QuotedStr(edtUsuario.Edit.Text) +' and senha =' + QuotedStr(edtSenha.Edit.Text));
    Open;

    ShowMessage(SQL.Text);
    if RecordCount > 0 then
    begin
       principalF := TprincipalF.Create(Self);
       principalF.lblUsuarioNome.Caption := FieldByName('usuario').asString;
       principalF.Show;
       Hide;
    end
    else MessageDlg('Falha no login', 'Usuario ou Senha incorretos, tente novamente', mtInformation,[mbOK],0);
  end;
end;

end.

