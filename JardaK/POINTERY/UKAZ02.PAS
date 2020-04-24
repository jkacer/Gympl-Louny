{ Created by Gas 1995 }
{
 Napiçte program, kt. vyhled  poŸet Ÿ¡sel dØlitelnìch
 zadanìm Ÿ¡slem.
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
 Pis('Bude vytvoýen line rn¡ spojovì seznam celìch Ÿ¡sel o 20 prvc¡ch.',NeMez,JoPip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Seznam:=VytvorSez(20);
 TiskniSez(Seznam);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 repeat
  Write('DØliteln‚ kolika ? ');
  ReadLn(N);
  if N<1 then WriteLn('VØtç¡ ne§ 0 !');
 until N>0;
 Kolik:=DejKolikDelSez(Seznam,N);
 WriteLn('Bylo nalezeno ',Kolik,' Ÿ¡sel.');
 ZrusSez(Seznam);
 WriteLn('==== Enter ====');
 ReadLn;
 Window(1,1,80,25);
 TextColor(White);
 TextBackGround(Black);
 ClrScr;
end.




