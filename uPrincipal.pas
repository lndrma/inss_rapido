unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, System.NetEncoding;

type
  TFrmPrincipal = class(TForm)
    rect_content: TRectangle;
    rect_toolBar_top: TRectangle;
    img_Voltar: TImage;
    lbl_Titulo_Top: TLabel;
    Layout1: TLayout;
    Label1: TLabel;
    Rectangle1: TRectangle;
    Image1: TImage;
    rect_btn_clientes: TRectangle;
    lbl_btn_clientes: TLabel;
    Rectangle3: TRectangle;
    Label3: TLabel;
    Rectangle4: TRectangle;
    Label4: TLabel;
    Rectangle5: TRectangle;
    Label5: TLabel;
    Rectangle6: TRectangle;
    Label6: TLabel;
    Layout2: TLayout;
    procedure rect_btn_clientesClick(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

uses Biblioteca, uCliente, uLogin;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
   Label1.Text := 'Olá, '+ usuarioPrincipal.nome;
end;

procedure TFrmPrincipal.Rectangle1Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmPrincipal.rect_btn_clientesClick(Sender: TObject);
begin
   AbriTela(TFrmCliente,FrmCliente);
end;



end.
