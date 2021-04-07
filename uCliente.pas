unit uCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.TabControl, FMX.Edit, System.NetEncoding;

type
  TFrmCliente = class(TForm)
    rect_toolBar_top: TRectangle;
    img_Voltar: TImage;
    lbl_Titulo_Top: TLabel;
    rect_bottom: TRectangle;
    rect_content: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    rect_btn_tela_incial: TRectangle;
    lbl_inicio: TLabel;
    rect_btn_novo: TRectangle;
    lbl_novo: TLabel;
    TabControl1: TTabControl;
    tabItem_lista_completa: TTabItem;
    tabItem_item_detalhe: TTabItem;
    ListView1: TListView;
    Edit1: TEdit;
    layout_buscar: TLayout;
    btn_buscar: TSpeedButton;
    procedure img_VoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AddItem(nome, txt3, txt4, txt5: String);
    procedure ListarItem;



    { Private declarations }
  public
    { Public declarations }
    function Base64FromBitmap(Bitmap: TBitmap): String;
    function BitmapFromBase64(const base64: String): TBitmap;
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.fmx}

uses Biblioteca, uPrincipal;

procedure TFrmCliente.img_VoltarClick(Sender: TObject);
begin
   AbriTela(TFrmPrincipal,FrmPrincipal);

end;


procedure TFrmCliente.AddItem (nome,  txt3, txt4, txt5 : String);

begin
   with ListView1.Items.Add  do
   begin
     Height := 100;

     //Foto base 64
     //if foto64 <> '' then
     // TListItemImage(Objects.FindDrawable('image2')).Bitmap := BitmapFromBase64(foto64);

     TListItemText(Objects.FindDrawable('Text1')).Text := nome;
     TListItemText(Objects.FindDrawable('Text3')).Text := txt3;
     TListItemText(Objects.FindDrawable('Text4')).Text := txt4;
     TListItemText(Objects.FindDrawable('Text5')).Text := txt5;
     //Verificar no banco antes de escolher essa imagem
     //TListItemImage(Objects.FindDrawable('imgFav')).Bitmap := imgFav.Bitmap;
   end;
end;

procedure TFrmCliente.ListarItem;
var x : integer;
begin
    for x := 1 to 10 do

        AddItem ('Nome ' + x.ToString ,
                 'Area text 2',
                 'Area text 3' ,
                 'Ativo'
                 );


end;

function TFrmCliente.Base64FromBitmap(Bitmap: TBitmap): String;
var
  Input: TBytesStream;
  Output: TStringStream;
  Encoding: TBase64Encoding;
begin
        Input := TBytesStream.Create;
        try
          Bitmap.SaveToStream(Input);
          Input.Position := 0;
          Output := TStringStream.Create('',TEncoding.ASCII);
          try
            Encoding := TBase64Encoding.Create(0);
            Encoding.Encode(Input, Output);
            Result := Output.DataString;
          finally
            Encoding.Free;
            Output.Free;
          end;

        finally
          Input.Free;
        end;

end;

function TFrmCliente.BitmapFromBase64(const base64 : String): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
  Encoding: TBase64Encoding;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Encoding := TBase64Encoding.Create(0);
      Encoding.Decode(Input, Output);

      Output.Position := 0;
      Result := TBitmap.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Encoding.DisposeOf;
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure TFrmCliente.FormShow(Sender: TObject);
begin
ListarItem;
end;

end.
