unit uDM;

interface

uses
  System.SysUtils, System.Classes, uDWDataModule;

type
  TDM = class(TServerMethodDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
