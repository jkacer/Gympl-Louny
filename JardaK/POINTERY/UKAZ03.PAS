{ Created by Gas 1995 }
{
 Napi�te program, kt. vyhled� maximum/minimum ze seznamu.
}
program XXX;

uses Crt,GasCrt,Pointery;

var Seznam: PPrvekInt;
    Max,
    Min:    Integer;
begin
 Desktop(Blue,LightGray,#176);
 Ramecek(3,3,78,23,'GAS Pointer Demo',Blue,White,Yellow,#32);
 Window(5,4,76,22);
 Pis('Bude vytvo�en line�rn� spojov� seznam cel�ch ��sel o 20 prvc�ch.',NeMez,JoPip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Seznam:=VytvorSez(20);
 TiskniSez(Seznam);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 WriteLn('Maximum : ',DejMaxSez(Seznam));
 WriteLn('Minimum : ',DejMinSez(Seznam));
 ZrusSez(Seznam);
 WriteLn('==== Enter ====');
 ReadLn;
 Window(1,1,80,25);
 TextColor(White);
 TextBackGround(Black);
 ClrScr;
end.




