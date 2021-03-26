unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, uDWAbout, uRESTDWBase;

type
  TfrmPrincipal = class(TForm)
    Switch: TSwitch;
    lblStatus: TLabel;
    ServicePooler: TRESTServicePooler;
    procedure SwitchSwitch(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses uDM;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   ServicePooler.ServerMethodClass := TDm;
   ServicePooler.Active := Switch.IsChecked;
end;

procedure TfrmPrincipal.SwitchSwitch(Sender: TObject);
begin
   ServicePooler.Active := Switch.IsChecked;
end;

end.
