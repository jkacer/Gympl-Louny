{ Created by Gas 1995 }
{
 Napiçte program, kt. vynech  vçechny prvky dØliteln‚ Ÿ¡slem
 zadanìm u§ivatelem.
}
program XXX;

uses Crt,GasCrt,Pointery;

var Seznam: PPrvekInt;
    Cislo:  Integer;
begin
 Desktop(Blue,LightGray,#176);
 Ramecek(3,3,78,23,'GAS Pointer Demo',Blue,White,Yellow,#32);
 Window(5,4,76,22);
 Pis('Bude vytvoýen line rn¡ spojovì seznam celìch Ÿ¡sel o 20 prvc¡ch.',NeMez,JoPip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Seznam:=VytvorSez(20);
 TiskniSez(Seznam);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Pis('Budou zruçena Ÿ¡sla dØliteln  V mi zadanìm Ÿ¡slem.',NeMez,JoPip);
 repeat
  Write('DØliteln‚ kolika ? ');
  ReadLn(Cislo);
  if Cislo<1 then WriteLn('VØtç¡ ne§ 0 !');
 until Cislo>0;

 ZrusDelCimSez(Seznam,Cislo);
 Pis('Po zruçen¡:',NeMez,JoPip);
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




