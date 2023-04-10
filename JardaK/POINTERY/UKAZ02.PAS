{ Created by Gas 1995 }
{
 Napište program, kt. vyhledá počet čísel dělitelných
 zadaným číslem.
}
program XXX;

uses Crt,GasCrt,Pointery;

var Seznam: PPrvekInt;
    N:      ShortInt;
    Kolik:  Integer;
begin
 Desktop(Blue,LightGray,#176);
 Ramecek(3,3,78,23,'GAS Pointer Demo',Blue,White,Yellow,#32);
 Window(5,4,76,22);
 Pis('Bude vytvořen lineární spojový seznam celých čísel o 20 prvcích.',NeMez,JoPip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Seznam:=VytvorSez(20);
 TiskniSez(Seznam);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 repeat
  Write('Dělitelné kolika ? ');
  ReadLn(N);
  if N<1 then WriteLn('Větší než 0 !');
 until N>0;
 Kolik:=DejKolikDelSez(Seznam,N);
 WriteLn('Bylo nalezeno ',Kolik,' čísel.');
 ZrusSez(Seznam);
 WriteLn('==== Enter ====');
 ReadLn;
 Window(1,1,80,25);
 TextColor(White);
 TextBackGround(Black);
 ClrScr;
end.




