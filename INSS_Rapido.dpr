program INSS_Rapido;

uses
  System.StartUpCopy,
  FMX.Forms,
  uLogin in 'uLogin.pas' {FrmLogin},
  uCadastroUsuario in 'uCadastroUsuario.pas' {FrmCadUsuario},
  Biblioteca in 'Biblioteca.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin, FrmLogin);
  application.Run;
end.
