unit uDM;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TForm1 = class(TForm)
    conn: TFDConnection;
    qryvalidaLogin: TFDQuery;
    qryvalidaLogincodigo: TFDAutoIncField;
    qryvalidaLoginnome: TStringField;
    qryvalidaLoginnivel_acesso: TIntegerField;
    qryvalidaLoginusuario: TIntegerField;
    qryvalidaLoginsenha: TIntegerField;
    qryvalidaLoginrg: TStringField;
    qryvalidaLogincpf: TStringField;
    qryvalidaLogindtNascimento: TDateField;
    qryvalidaLoginfoto: TBlobField;
    qryvalidaLoginrua: TStringField;
    qryvalidaLoginbairro: TStringField;
    qryvalidaLoginnumero: TStringField;
    qryvalidaLogincomplemento: TStringField;
    qryvalidaLogincidade: TStringField;
    qryvalidaLoginuf: TStringField;
    qryvalidaLogincep: TStringField;
    qryvalidaLoginemail: TStringField;
    qryvalidaLogintel1: TStringField;
    qryvalidaLogintel2: TStringField;
    qryvalidaLogincel1: TStringField;
    qryvalidaLogincel2: TStringField;
    qryvalidaLoginpagina: TIntegerField;
    qryvalidaLogindtCadastro: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
