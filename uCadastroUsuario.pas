unit uCadastroUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit, FMX.TabControl;

type
  TFrmCadUsuario = class(TForm)
    rect_ToolBar_Top: TRectangle;
    img_Voltar: TImage;
    img_Salvar: TImage;
    lbl_Titulo_Top: TLabel;
    rect_Foto_e_Resumo: TRectangle;
    circl_Foto_Usuario: TCircle;
    lbl_Editar_Foto: TLabel;
    Layout1: TLayout;
    edt_Nome: TEdit;
    Layout2: TLayout;
    Label1: TLabel;
    Layout3: TLayout;
    Label2: TLabel;
    edt_Senha: TEdit;
    Layout4: TLayout;
    Label3: TLabel;
    edt_CPF: TEdit;
    tab_Dados_Usuario: TTabControl;
    tab_Resumo: TTabItem;
    tab_Endereco: TTabItem;
    procedure img_VoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadUsuario: TFrmCadUsuario;

implementation

{$R *.fmx}

procedure TFrmCadUsuario.img_VoltarClick(Sender: TObject);
begin
   Self.Close;
end;

end.
