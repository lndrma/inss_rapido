unit uProcesso;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Objects, FMX.StdCtrls, FMX.Edit, FMX.Layouts, FMX.ListView,
  FMX.TabControl, FMX.Controls.Presentation;

type
  TFrmProcesso = class(TForm)
    rect_bottom: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    rect_btn_tela_incial: TRectangle;
    lbl_inicio: TLabel;
    rect_btn_novo: TRectangle;
    lbl_novo: TLabel;
    rect_content: TRectangle;
    TabControl1: TTabControl;
    tabItem_lista_completa: TTabItem;
    ListView1: TListView;
    tabItem_item_detalhe: TTabItem;
    layout_buscar: TLayout;
    edt_buscar: TEdit;
    btn_buscar: TSpeedButton;
    rect_toolBar_top: TRectangle;
    img_Voltar: TImage;
    lbl_Titulo_Top: TLabel;
    procedure img_VoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProcesso: TFrmProcesso;

implementation

{$R *.fmx}

uses Biblioteca, uPrincipal;

procedure TFrmProcesso.img_VoltarClick(Sender: TObject);
begin
  AbriTela(TFrmPrincipal,FrmPrincipal);

end;

end.
