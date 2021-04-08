program INSS_Rapido;

uses
  System.StartUpCopy,
  FMX.Forms,
  uLogin in 'uLogin.pas' {FrmLogin},
  uCadastroUsuario in 'uCadastroUsuario.pas' {FrmCadUsuario},
  Biblioteca in 'Biblioteca.pas',
  uCliente in 'uCliente.pas' {FrmCliente},
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uProcesso in 'uProcesso.pas' {FrmProcesso},
  classe.Usuario in 'Classes\classe.Usuario.pas',
  uDM in 'uDM.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
