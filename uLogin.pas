unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, FMX.Edit, FMX.Layouts,
  FMX.Objects, classe.Usuario;

type
  TFrmLogin = class(TForm)
    rect_bg_login: TRectangle;
    top_login: TLayout;
    bottom_login: TLayout;
    content_login: TLayout;
    lbl_nome_empresa_login: TLabel;
    grid_content_login: TGridPanelLayout;
    area_2_content_login: TLayout;
    edt_email_login: TEdit;
    edt_senha_login: TEdit;
    rect_btn_entrar: TRectangle;
    lbl_btn_entrar: TLabel;
    RectAnimation1: TRectAnimation;
    rect_btn_cadastrar: TRectangle;
    area_1_content_login: TLayout;
    rect_area_video: TRectangle;
    lbl_area_video: TLabel;
    lbl_quem_somos_login: TLabel;
    rect_btn_fale_conosco: TRectangle;
    lbl_btn_fale_conosco: TLabel;
    rect_bg_top_login: TRectangle;
    rect_bg_bottom_login: TRectangle;
    lblCadastre_se: TLabel;
    procedure rect_btn_cadastrarClick(Sender: TObject);
    procedure rect_btn_entrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CarregaUsuarioPrincipal(serv : String);
    procedure ValidaLogin(usuario, senha: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

uses Biblioteca, uCadastroUsuario, uPrincipal, uDM;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
   if not Assigned(usuarioPrincipal) then
      usuarioPrincipal  := TUsuario.Create;
end;

procedure TFrmLogin.rect_btn_cadastrarClick(Sender: TObject);
begin
   AbriTela(TFrmCadUsuario,FrmCadUsuario);
end;

procedure TFrmLogin.rect_btn_entrarClick(Sender: TObject);
begin
   ValidaLogin(edt_email_login.Text, edt_senha_login.Text);
   //CarregaUsuarioPrincipal;
   //AbriTela(TFrmPrincipal,FrmPrincipal);

end;

procedure TFrmLogin.CarregaUsuarioPrincipal(serv : String);
begin
NullStrictConvert := false;

   if (serv = 'local') then
   begin
      usuarioPrincipal.codigo        := StrToInt(uDM.Form1.qryvalidaLogin.FieldByName('codigo').Value);
      usuarioPrincipal.nome          := uDM.Form1.qryvalidaLogin.FieldByName('nome').Value;
      usuarioPrincipal.nivel_acesso  := uDM.Form1.qryvalidaLogin.FieldByName('nivel_acesso').Value;
      usuarioPrincipal.usuario       := uDM.Form1.qryvalidaLogin.FieldByName('usuario').Value;
      usuarioPrincipal.senha         := uDM.Form1.qryvalidaLogin.FieldByName('senha').Value;
      usuarioPrincipal.rg            := uDM.Form1.qryvalidaLogin.FieldByName('rg').Value;
      usuarioPrincipal.cpf           := uDM.Form1.qryvalidaLogin.FieldByName('cpf').Value;
      usuarioPrincipal.dtNascimento  := uDM.Form1.qryvalidaLogin.FieldByName('dtNascimento').Value;
      usuarioPrincipal.foto          := uDM.Form1.qryvalidaLogin.FieldByName('foto').Value;
      usuarioPrincipal.rua           := uDM.Form1.qryvalidaLogin.FieldByName('rua').Value;
      usuarioPrincipal.bairro        := uDM.Form1.qryvalidaLogin.FieldByName('bairro').Value;
      usuarioPrincipal.numero        := uDM.Form1.qryvalidaLogin.FieldByName('numero').Value;
      usuarioPrincipal.complemento   := uDM.Form1.qryvalidaLogin.FieldByName('complemento').Value;
      usuarioPrincipal.cidade        := uDM.Form1.qryvalidaLogin.FieldByName('cidade').Value;
      usuarioPrincipal.uf            := uDM.Form1.qryvalidaLogin.FieldByName('uf').Value;
      usuarioPrincipal.cep           := uDM.Form1.qryvalidaLogin.FieldByName('cep').Value;
      usuarioPrincipal.email         := uDM.Form1.qryvalidaLogin.FieldByName('email').Value;
      usuarioPrincipal.tel1          := uDM.Form1.qryvalidaLogin.FieldByName('tel1').Value;
      usuarioPrincipal.tel2          := uDM.Form1.qryvalidaLogin.FieldByName('tel2').Value;
      usuarioPrincipal.cel1          := uDM.Form1.qryvalidaLogin.FieldByName('cel1').Value;
      usuarioPrincipal.cel2          := uDM.Form1.qryvalidaLogin.FieldByName('cel2').Value;
      usuarioPrincipal.pagina        := uDM.Form1.qryvalidaLogin.FieldByName('pagina').Value;
      usuarioPrincipal.dtCadastro    := uDM.Form1.qryvalidaLogin.FieldByName('dtCadastro').Value;
   end
   else
   begin
     ShowMessage('Buscar no RDW.');
   end;

end;

procedure TFrmLogin.ValidaLogin(usuario, senha : string);
begin
   if not Assigned(usuarioPrincipal) then
      usuarioPrincipal  := TUsuario.Create;

   //Não deixa clicar sem preencher os campos
   if (usuario = EmptyStr) or (senha = EmptyStr) then
   begin
     if usuario = EmptyStr then
     begin
        edt_email_login.SetFocus;
     end else
     if senha = EmptyStr then
     begin
       edt_senha_login.SetFocus;
     end;
   end
   else
   begin
     //Tenta login SQLite
     uDM.Form1.qryvalidaLogin.SQL.Clear;
     uDM.Form1.qryvalidaLogin.SQL.Add('SELECT * FROM usuario WHERE email = :email AND senha = :senha');
     uDM.Form1.qryvalidaLogin.ParamByName('email').AsString := usuario;
     uDM.Form1.qryvalidaLogin.ParamByName('senha').AsString := senha;
     uDM.Form1.qryvalidaLogin.Open;

     if uDM.Form1.qryvalidaLogin.RecNo = 1 then
     begin
        CarregaUsuarioPrincipal('local');
        AbriTela(TfrmPrincipal, frmPrincipal);
        uDM.Form1.qryvalidaLogin.Close;
     end
     else
     begin
        //Tenta login remoto
        //Consultar no servidor (RDW). Comparar usuario/senha e retornar boolean

        if (0 = 1) then   //Trocar pelo retorno (true). Só coloquei pra falhar
        begin
           CarregaUsuarioPrincipal('remoto');
           AbriTela(TfrmPrincipal, frmPrincipal);
        end
        else
        begin
           ShowMessage('Verifique o usuário ou a senha. '+#13+'Obs.: Ainda não tenta logar no remoto.');
        end;
     end;
   end;

end;

end.
