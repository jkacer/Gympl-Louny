{ Created by Gas 1995 }
{
 Napište program, kt. vynechá všechny prvky dělitelné číslem
 zadaným uživatelem.
}
program XXX;

uses Crt,GasCrt,Pointery;

var Seznam: PPrvekInt;
    Cislo:  Integer;
begin
 Desktop(Blue,LightGray,#176);
 Ramecek(3,3,78,23,'GAS Pointer Demo',Blue,White,Yellow,#32);
 Window(5,4,76,22);
 Pis('Bude vytvořen lineární spojový seznam celých čísel o 20 prvcích.',NeMez,JoPip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Seznam:=VytvorSez(20);
 TiskniSez(Seznam);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Pis('Budou zrušena čísla dělitelná Vámi zadaným číslem.',NeMez,JoPip);
 repeat
  Write('Dělitelné kolika ? ');
  ReadLn(Cislo);
  if Cislo<1 then WriteLn('Větší než 0 !');
 until Cislo>0;

 ZrusDelCimSez(Seznam,Cislo);
 Pis('Po zrušení:',NeMez,JoPip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 TiskniSez(Seznam);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 ZrusSez(Seznam);
 WriteLn('==== Enter ====');
 ReadLn;
 Window(1,1,80,25);
 TextColor(White);
 TextBackGround(Black);
 ClrScr;
end.




