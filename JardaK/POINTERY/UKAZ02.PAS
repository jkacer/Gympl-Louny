{ Created by Gas 1995 }
{
 Napi�te program, kt. vyhled� po�et ��sel d�liteln�ch
 zadan�m ��slem.
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
 Pis('Bude vytvo�en line�rn� spojov� seznam cel�ch ��sel o 20 prvc�ch.',NeMez,JoPip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Seznam:=VytvorSez(20);
 TiskniSez(Seznam);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 repeat
  Write('D�liteln� kolika ? ');
  ReadLn(N);
  if N<1 then WriteLn('V�t� ne� 0 !');
 until N>0;
 Kolik:=DejKolikDelSez(Seznam,N);
 WriteLn('Bylo nalezeno ',Kolik,' ��sel.');
 ZrusSez(Seznam);
 WriteLn('==== Enter ====');
 ReadLn;
 Window(1,1,80,25);
 TextColor(White);
 TextBackGround(Black);
 ClrScr;
end.




