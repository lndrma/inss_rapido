unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, FMX.Edit, FMX.Layouts,
  FMX.Objects;

type
  TForm1 = class(TForm)
    rect_bg_login: TRectangle;
    top_login: TLayout;
    bottom_login: TLayout;
    content_login: TLayout;
    lbl_nome_empresa_login: TLabel;
    grid_content_login: TGridPanelLayout;
    area_2_content_login: TLayout;
    edt_cpf_login: TEdit;
    edt_senha_login: TEdit;
    rect_btn_entrar: TRectangle;
    lbl_btn_entrar: TLabel;
    RectAnimation1: TRectAnimation;
    rect_btn_cadastrar: TRectangle;
    Label4: TLabel;
    area_1_content_login: TLayout;
    rect_area_video: TRectangle;
    lbl_area_video: TLabel;
    lbl_quem_somos_login: TLabel;
    rect_btn_fale_conosco: TRectangle;
    lbl_btn_fale_conosco: TLabel;
    rect_bg_top_login: TRectangle;
    rect_bg_bottom_login: TRectangle;
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
