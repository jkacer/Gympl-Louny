{
 BOOLEAN - pý¡klad 06
}

{
 Zjist¡, zda je Ÿ¡slo prvoŸ¡slo
}

program XXX;

uses Crt;


function Je_Prvocislo(Cis:Integer):Boolean;
var Odm:Integer;
    B:  Boolean;
    I:  Integer;
begin
 Odm:=Trunc(Sqrt(Cis));
 B:=True;
 for I:=2 to Odm do
  if (Cis mod I)=0 then B:=False;

 if Cis=1 then B:=False;

 Je_Prvocislo:=B;
end;


var
    I: Byte;

begin
 ClrScr;
 for I:=1 to 24 do
  if Je_Prvocislo(I) then WriteLn(I:4,'  JE')
                     else WriteLn(I:4,'  NENÖ');
 ReadLn;
end.


