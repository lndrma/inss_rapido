unit Biblioteca;

interface

uses
  System.Classes, FMX.TabControl,FMX.Forms, System.SysUtils;

procedure AbriTela(const InstanceClass: TComponentClass; var Reference);
procedure TrocaAba(tab_itemDestino : TTabItem);


implementation



procedure AbriTela(const InstanceClass: TComponentClass; var Reference);
begin
   try
      If not Assigned(TForm(Reference)) then
         Application.CreateForm(InstanceClass,Reference);

      TForm(Reference).showModal;
   finally
      FreeAndNil(TForm(Reference));
   end;
end;

procedure TrocaAba(tab_itemDestino : TTabItem);
var
   tab_Control : TTabControl;
begin
   try
      tab_Control := nil;
      tab_Control := tab_itemDestino.TabControl;

      tab_Control.GotoVisibleTab(tab_itemDestino.Index, TTabTransition.Slide);
   finally
      tab_itemDestino := nil;
      tab_Control := nil;

   end;
end;

end.
