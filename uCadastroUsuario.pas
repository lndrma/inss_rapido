unit uCadastroUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit, FMX.TabControl,
  FMX.ListBox;

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
    tbControl_Dados_Usuario: TTabControl;
    tab_Principal: TTabItem;
    tab_Endereco: TTabItem;
    lb_Resumo: TListBox;
    lb_ResumoItem_Endereco: TListBoxItem;
    sb_tab_Endereco: TSpeedButton;
    Label4: TLabel;
    Layout5: TLayout;
    lblResumo_Endereco: TLabel;
    layout_Endereco: TLayout;
    Layout8: TLayout;
    Label6: TLabel;
    edt_Numero: TEdit;
    Layout9: TLayout;
    Label7: TLabel;
    edt_Bairro: TEdit;
    Rectangle1: TRectangle;
    img_Voltar_TabPrincipal: TImage;
    Label8: TLabel;
    Layout7: TLayout;
    Label5: TLabel;
    edt_Rua: TEdit;
    Layout11: TLayout;
    Label10: TLabel;
    edt_Cep: TEdit;
    Layout12: TLayout;
    Label11: TLabel;
    edt_Uf: TEdit;
    Layout13: TLayout;
    Label12: TLabel;
    edt_Cidade: TEdit;
    Layout14: TLayout;
    Label13: TLabel;
    edt_Complemento: TEdit;
    Line1: TLine;
    lb_ResumoItem_Documentos: TListBoxItem;
    sb_tab_Documento: TSpeedButton;
    Layout6: TLayout;
    Label9: TLabel;
    Label14: TLabel;
    Line2: TLine;
    lb_ResumoItem_Contato: TListBoxItem;
    sb_tab_Contato: TSpeedButton;
    Layout10: TLayout;
    Label15: TLabel;
    Label16: TLabel;
    Line3: TLine;
    tab_Documento: TTabItem;
    tab_Contato: TTabItem;
    Layout15: TLayout;
    Layout16: TLayout;
    Label17: TLabel;
    edt_Dtnascimento: TEdit;
    Layout17: TLayout;
    Label18: TLabel;
    edt_Cpf2: TEdit;
    Rectangle2: TRectangle;
    Label19: TLabel;
    Image1: TImage;
    Layout18: TLayout;
    Label20: TLabel;
    edt_Rg: TEdit;
    Layout19: TLayout;
    Layout20: TLayout;
    Label21: TLabel;
    edt_Cel1: TEdit;
    Layout21: TLayout;
    Label22: TLabel;
    edt_Tel2: TEdit;
    Rectangle3: TRectangle;
    Label23: TLabel;
    Image2: TImage;
    Layout22: TLayout;
    Label24: TLabel;
    edt_Tel1: TEdit;
    Layout25: TLayout;
    Label27: TLabel;
    edt_Email: TEdit;
    Layout26: TLayout;
    Label28: TLabel;
    Edit7: TEdit;
    procedure img_VoltarClick(Sender: TObject);
    procedure sb_tab_EnderecoClick(Sender: TObject);
    procedure img_Voltar_TabPrincipalClick(Sender: TObject);
    procedure sb_tab_ContatoClick(Sender: TObject);
    procedure sb_tab_DocumentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadUsuario: TFrmCadUsuario;

implementation

uses
  Biblioteca;

{$R *.fmx}

procedure TFrmCadUsuario.img_VoltarClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFrmCadUsuario.img_Voltar_TabPrincipalClick(Sender: TObject);
begin
   TrocaAba(tab_Principal);
end;

procedure TFrmCadUsuario.sb_tab_ContatoClick(Sender: TObject);
begin
   TrocaAba(tab_Contato);
end;

procedure TFrmCadUsuario.sb_tab_DocumentoClick(Sender: TObject);
begin
   TrocaAba(tab_Documento);
end;

procedure TFrmCadUsuario.sb_tab_EnderecoClick(Sender: TObject);
begin
   TrocaAba(tab_Endereco);
end;

end.
