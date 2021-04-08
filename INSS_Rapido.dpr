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
  classe.Usuario in 'Classes\classe.Usuario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
