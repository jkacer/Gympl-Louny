{ Created by Gas 1995 }
{
 Napi�te program, kt. vynech� v�echny prvky d�liteln� ��slem
 zadan�m u�ivatelem.
}
program XXX;

uses Crt,GasCrt,Pointery;

var Seznam: PPrvekInt;
    Cislo:  Integer;
begin
 Desktop(Blue,LightGray,#176);
 Ramecek(3,3,78,23,'GAS Pointer Demo',Blue,White,Yellow,#32);
 Window(5,4,76,22);
 Pis('Bude vytvo�en line�rn� spojov� seznam cel�ch ��sel o 20 prvc�ch.',NeMez,JoPip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Seznam:=VytvorSez(20);
 TiskniSez(Seznam);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Pis('Budou zru�ena ��sla d�liteln� V�mi zadan�m ��slem.',NeMez,JoPip);
 repeat
  Write('D�liteln� kolika ? ');
  ReadLn(Cislo);
  if Cislo<1 then WriteLn('V�t� ne� 0 !');
 until Cislo>0;

 ZrusDelCimSez(Seznam,Cislo);
 Pis('Po zru�en�:',NeMez,JoPip);
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




