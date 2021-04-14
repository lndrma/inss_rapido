unit classe.Usuario;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, FireDAC.DApt ;

 type

   TUsuario = class
  private
    FConn : TFDConnection;

    FdtCadastro: String;
    Frg: String;
    Femail: String;
    Fbairro: String;
    Ftel2: String;
    Fuf: String;
    Ftel1: String;
    Fcodigo: Integer;
    Fcpf: String;
    Fcep: String;
    Fnumero: String;
    Ffoto: String;
    FdtNascimento: String;
    Fcel2: String;
    Fsenha: String;
    Fcel1: String;
    Fcomplemento: String;
    Fusuario: Integer;
    Fnivel_acesso: Integer;
    Fnome: String;
    Fcidade: String;
    Fpagina: Integer;
    Frua: String;
    procedure Setbairro(const Value: String);
    procedure Setcel1(const Value: String);
    procedure Setcel2(const Value: String);
    procedure Setcep(const Value: String);
    procedure Setcidade(const Value: String);
    procedure Setcodigo(const Value: Integer);
    procedure Setcomplemento(const Value: String);
    procedure Setcpf(const Value: String);
    procedure SetdtCadastro(const Value: String);
    procedure SetdtNascimento(const Value: String);
    procedure Setemail(const Value: String);
    procedure Setfoto(const Value: String);
    procedure Setnivel_acesso(const Value: Integer);
    procedure Setnome(const Value: String);
    procedure Setnumero(const Value: String);
    procedure Setpagina(const Value: Integer);
    procedure Setrg(const Value: String);
    procedure Setrua(const Value: String);
    procedure Setsenha(const Value: String);
    procedure Settel1(const Value: String);
    procedure Settel2(const Value: String);
    procedure Setuf(const Value: String);
    procedure Setusuario(const Value: Integer);
  published


    property  codigo      : Integer  read Fcodigo write Setcodigo;
    property  nome	      : String   read Fnome write Setnome;
    property  nivel_acesso: Integer  read Fnivel_acesso write Setnivel_acesso;
    property  usuario	    : Integer  read Fusuario write Setusuario;
    property  senha	      : String   read Fsenha write Setsenha;
    property  rg	        : String   read Frg write Setrg;
    property  cpf	        : String   read Fcpf write Setcpf;
    property  dtNascimento: String   read FdtNascimento write SetdtNascimento;
    property  foto        : String   read Ffoto write Setfoto;
    property  rua	        : String   read Frua write Setrua;
    property  bairro	    : String   read Fbairro write Setbairro;
    property  numero	    : String   read Fnumero write Setnumero;
    property  complemento	: String   read Fcomplemento write Setcomplemento;
    property  cidade      : String   read Fcidade write Setcidade;
    property  uf          : String   read Fuf write Setuf;
    property  cep	        : String   read Fcep write Setcep;
    property  email	      : String   read Femail write Setemail;
    property  tel1        : String   read Ftel1 write Settel1;
    property  tel2        : String   read Ftel2 write Settel2;
    property  cel1	      : String   read Fcel1 write Setcel1;
    property  cel2	      : String   read Fcel2 write Setcel2;
    property  pagina	    : Integer  read Fpagina write Setpagina;
    property  dtCadastro	: String   read FdtCadastro write SetdtCadastro;

  public
    constructor Create(conn : TFDConnection);

    function ValidaLogin(pemail,psenha : String; out erro : String): Boolean;

 end;


implementation

{ TUsuario }

constructor TUsuario.Create(conn: TFDConnection);
begin
   FConn := conn;
end;

procedure TUsuario.Setbairro(const Value: String);
begin
  Fbairro := Value;
end;

procedure TUsuario.Setcel1(const Value: String);
begin
  Fcel1 := Value;
end;

procedure TUsuario.Setcel2(const Value: String);
begin
  Fcel2 := Value;
end;

procedure TUsuario.Setcep(const Value: String);
begin
  Fcep := Value;
end;

procedure TUsuario.Setcidade(const Value: String);
begin
  Fcidade := Value;
end;

procedure TUsuario.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TUsuario.Setcomplemento(const Value: String);
begin
  Fcomplemento := Value;
end;

procedure TUsuario.Setcpf(const Value: String);
begin
  Fcpf := Value;
end;

procedure TUsuario.SetdtCadastro(const Value: String);
begin
  FdtCadastro := Value;
end;

procedure TUsuario.SetdtNascimento(const Value: String);
begin
  FdtNascimento := Value;
end;

procedure TUsuario.Setemail(const Value: String);
begin
  Femail := Value;
end;

procedure TUsuario.Setfoto(const Value: String);
begin
  Ffoto := Value;
end;

procedure TUsuario.Setnivel_acesso(const Value: Integer);
begin
  Fnivel_acesso := Value;
end;

procedure TUsuario.Setnome(const Value: String);
begin
  Fnome := Value;
end;

procedure TUsuario.Setnumero(const Value: String);
begin
  Fnumero := Value;
end;

procedure TUsuario.Setpagina(const Value: Integer);
begin
  Fpagina := Value;
end;

procedure TUsuario.Setrg(const Value: String);
begin
  Frg := Value;
end;

procedure TUsuario.Setrua(const Value: String);
begin
  Frua := Value;
end;

procedure TUsuario.Setsenha(const Value: String);
begin
  Fsenha := Value;
end;

procedure TUsuario.Settel1(const Value: String);
begin
  Ftel1 := Value;
end;

procedure TUsuario.Settel2(const Value: String);
begin
  Ftel2 := Value;
end;

procedure TUsuario.Setuf(const Value: String);
begin
  Fuf := Value;
end;

procedure TUsuario.Setusuario(const Value: Integer);
begin
  Fusuario := Value;
end;

function TUsuario.ValidaLogin(pemail, psenha: String; out erro: String): Boolean;
var
   qry : TFDQuery;
begin
   try
      qry := TFDQuery.Create(nil);
      qry.Connection := FConn;

      with qry do
      begin
         Active := false;

         SQL.Clear;
         SQL.Add('Select * from usuario ');
         SQL.Add('where (email = :email) and (senha = :senha) ');
         ParamByName('email').Value := pemail;
         ParamByName('senha').Value := psenha;

         Active := true;


         if (RecordCount > 0) then
         begin

            codigo         := FieldByName('codigo').AsInteger;
            nome           := FieldByName('nome').AsString;
            nivel_acesso   := FieldByName('nivel_acesso').AsInteger;
            usuario        := FieldByName('usuario').AsInteger;
            senha          := FieldByName('senha').AsString;
            rg             := FieldByName('rg').AsString;
            cpf            := FieldByName('cpf').AsString;
            dtNascimento   := FieldByName('dtNascimento').AsString;
            foto           := FieldByName('foto').AsString;
            rua            := FieldByName('rua').AsString;
            bairro         := FieldByName('bairro').AsString;
            numero         := FieldByName('numero').AsString;
            complemento    := FieldByName('complemento').AsString;
            cidade         := FieldByName('cidade').AsString;
            uf             := FieldByName('uf').AsString;
            cep            := FieldByName('cep').AsString;
            email          := FieldByName('email').AsString;
            tel1           := FieldByName('tel1').AsString;
            tel2           := FieldByName('tel2').AsString;
            cel1           := FieldByName('cel1').AsString;
            cel2           := FieldByName('cel2').AsString;
            pagina         := FieldByName('pagina').AsInteger;
            dtCadastro     := FieldByName('dtCadastro').AsString;

            erro := '';
            Result := true;
         end else
         begin

             codigo         := 0;
             nome           := '';
             nivel_acesso   := 0;
             usuario        := 0;
             senha          := '';
             rg             := '';
             cpf            := '';
             dtNascimento   := '';
             foto           := '';
             rua            := '';
             bairro         := '';
             numero         := '';
             complemento    := '';
             cidade         := '';
             uf             := '';
             cep            := '';
             email          := '';
             tel1           := '';
             tel2           := '';
             cel1           := '';
             cel2           := '';
             pagina         := 0;
             dtCadastro     := '';

             erro := 'Usuário ou Senha inválido';
             Result := false;
         end;

         DisposeOf;

      end;



   except
     on E:Exception do
     begin
        Result := false;
        erro := 'Classe: ' + Self.ClassName + ' - Procedimento: ValidaLogin - erro: '+ E.Message;
     end;

   end;
end;

end.
