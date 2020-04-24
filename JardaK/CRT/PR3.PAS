{ Written by GAS }

program Ptakovina;

uses
      Crt;

procedure Centruj(Co:string;Rad:Byte;F,B:Byte);
begin
 if Rad>25 then Rad:=25;
 TextColor(F);
 TextBackGround(B);
 GoToXY(40-(Length(Co) div 2),Rad);
 Write(Co);
end;

begin
 ClrScr;
 Centruj('21.5.1996',15,3,7);
 Centruj('xxxxx'    ,03,9,2);
 Centruj('Maturita' ,21,11,5);
 Centruj('slovo'    ,18,14,4);
 ReadLn;
end.


