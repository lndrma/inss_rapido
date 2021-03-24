unit Biblioteca;

interface

uses
  System.Classes;

procedure AbriTela(const InstanceClass: TComponentClass; var Reference);


implementation

uses
  FMX.Forms, System.SysUtils;



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

end.
