unit uDM;

interface

uses
  System.SysUtils, System.Classes, uDWDataModule, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef, uDWAbout,
  uRESTDWServerEvents, FireDAC.VCLUI.Wait, uDWJSONObject;

type
  TDM = class(TServerMethodDataModule)
    Conn: TFDConnection;
    DriverDLL: TFDPhysMySQLDriverLink;
    DWEvents: TDWServerEvents;
    procedure DWEventsEventsValidaLoginReplyEvent(var Params: TDWParams;
      var Result: string);
    procedure ServerMethodDataModuleCreate(Sender: TObject);
  private
    function CarregaConfig: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  classe.Usuario, System.Json, System.IniFiles, FMX.Dialogs;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


function TDM.CarregaConfig(): String;
var
   arq_ini, base,usuario,senha : String;
   ini : TIniFile;
begin

   try
      arq_ini :=  System.SysUtils.GetCurrentDir +  '\servidor.ini';

      if not FileExists(arq_ini) then
      begin
         Result := 'Arquivo não encontrado!';
         exit;
      end;

      ini := TIniFile.Create(arq_ini);

      base     := ini.ReadString('','database','');
      usuario  := ini.ReadString('','user_name','');
      senha    := ini.ReadString('','password','');

      Conn.Params.Values['Database']  := base;
      Conn.Params.Values['User_Name'] := usuario;
      Conn.Params.Values['Password']  := senha;

      try

         Conn.Connected := true;
         Result         := 'OK';
      except on E:exception do
         Result := 'Classe: ' + Self.ClassName + ' - Procedimento: CarregaConfig - erro: '+ E.Message;
      end;

   finally
      ini.DisposeOf;
   end;
end;

procedure TDM.DWEventsEventsValidaLoginReplyEvent(var Params: TDWParams;
  var Result: string);
var
   usuario : TUsuario;
   erro : String;
   json : TJsonObject;
begin
   try
      usuario := TUsuario.Create(DM.Conn);
      json    := TJsonObject.Create;

      if not usuario.ValidaLogin
      (
         Params.ItemsString['senha'].AsString,
         Params.ItemsString['email'].asString,
         erro
       ) then
       begin

          json.AddPair('retorno','Error: '+erro);
          json.AddPair('codigo','0');
          json.AddPair('nome','');

       end else
       begin
          json.AddPair('retorno','OK');
          json.AddPair('codigo',usuario.codigo.ToString);
          json.AddPair('nome',usuario.nome);
       end;

       Result := json.ToString;

   finally
      usuario.DisposeOf;
      json.DisposeOf;
   end;
end;

procedure TDM.ServerMethodDataModuleCreate(Sender: TObject);
var
   msg : String;
begin
   msg := CarregaConfig;

   if (msg <> 'OK') then
      ShowMessage(msg);

end;

end.
