{ Created by Gas 1995 }
{
 Napi�te program, kt. vytvo�� lin. spojov� seznam cel�ch ��sel -
 - 10 prvk� s hodnotou 1..10 .
}
program XXX;

uses Crt,GasCrt,Pointery;

var Seznam: PPrvekInt;
    S1,S2:  String;
    Novej1,
    Novej2: PPrvekInt;
begin
 Desktop(Blue,LightGray,#176);
 Ramecek(3,3,78,23,'GAS Pointer Demo',Blue,White,Yellow,#32);
 Window(5,4,76,22);
 Pis('Bude vytvo�en line�rn� spojov� seznam cel�ch ��sel o 10 prvc�ch',NeMez,JoPip);
 Pis('s hodnotami 1 a� 10.',NeMez,JoPip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Seznam:=VytvorSez(10);
 TiskniSez(Seznam);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Pis('Jak na to ?    Takto :',NeMez,JoPip);
 Pis('type PPrvekInt = ^TPrvekInt;',NeMez,JoPip);
 Pis('     TPrvekInt =  record',NeMez,JoPip);
 Pis('                   Cislo: Integer;',NeMez,JoPip);
 Pis('                   Dalsi: PPrvekInt;',NeMez,JoPip);
 Pis('                  end;',NeMez,JoPip);
 WriteLn;
 Pis('SizeOf(TPrvekInt) = SizeOf(PPrvekInt) + SizeOf(Integer)',NeMez,JoPip);
 Str(SizeOf(TPrvekInt),S2);
 S1:='         '+S2;
 Str(SizeOf(PPrvekInt),S2);
 S1:=S1+'        '+'='+'         '+S2;
 Str(SizeOf(Integer),S2);
 S1:=S1+'         '+'+'+'         '+S2;
 Pis(S1,NeMez,JoPip);
 WriteLn('==== Enter ====');
 ReadLn;
 ClrScr;
 Pis('Bude vytvo�en nov� seznam o 3 ��slech vycucnut�m',NeMez,JoPip);
 Pis('ze star�ho seznamu po��naje 5. ��slem.',NeMez,JoPip);
 Novej1:=VytahniSez(Seznam,5,3);
 Pis('P�vodn� seznam:',NeMez,JoPip);
 TiskniSez(Seznam);
 Pis('Nov� seznam:',NeMez,JoPip);
 TiskniSez(Novej1);

 WriteLn('==== Enter ====');
 ReadLn;
 ClrScr;

 Pis('Bude vytvo�en 3.seznam o 4 ��slech vycucnut�m',NeMez,JoPip);
 Pis('ze star�ho seznamu po��naje 4. ��slem.',NeMez,JoPip);
 Pis('To je a� do konce !',NeMez,JoPip);

 Novej2:=VytahniSez(Seznam,4,4);
 Pis('P�vodn� seznam:',NeMez,JoPip);
 TiskniSez(Seznam);
 Pis('Nov� seznam:',NeMez,JoPip);
 TiskniSez(Novej1);
 Pis('Nejnov�j� seznam:',NeMez,JoPip);
 TiskniSez(Novej2);

 ZrusSez(Seznam);
 ZrusSez(Novej1);
 ZrusSez(Novej2);
 WriteLn('==== Enter ====');
 ReadLn;
 Window(1,1,80,25);
 TextColor(White);
 TextBackGround(Black);
 ClrScr;
 WriteLn('To je maglajs, co ?');
 WriteLn('U�it se, u�it se, u�it se. (Pascal) - V.I.Lenin');
end.




