{ Written by GAS }

program PrikladB;

uses
      Crt;

const
      Dny : array[1..7] of string[2] = ( 'PO','ÈT','ST','¨T','Pµ','SO','NE' );

function KolikPatku(KolikDni:Byte;PrvniDen:Byte):Byte;
var
      I:        Byte;
      Den:      Byte;
      Patku:    Byte;
begin
 Patku:=0;
 Den:=PrvniDen;

 for I:=1 to KolikDni do
  begin
   if Den=5 then begin
                  Inc(Patku);
                  TextBackGround(Red);
                 end
            else TextBackGround(Black);
   Write(Dny[Den],' ');
   Inc(Den);
   if Den>7 then Den:=1;
  end;

 KolikPatku:=Patku;
end;


var
    PrvniDenJe: Byte;
    Kolik:      Byte;
    Vysl:       Byte;

begin
 ClrScr;
 repeat
  Write('Kolik je dn° v mÿs°ci ? <28,31> ');
  ReadLn(Kolik);
 until (Kolik>27) and (Kolik<32);
 repeat
  Write('Prvn° den je ? <1,7> ');
  ReadLn(PrvniDenJe);
 until (PrvniDenJe>0) and (PrvniDenJe<8);

 Vysl:=KolikPatku(Kolik,PrvniDenJe);
 TextBackGround(Black);
 WriteLn;
 WriteLn('V mÿs°ci je ',Vysl,' p†tkÖ.');
 ReadLn;
end.




