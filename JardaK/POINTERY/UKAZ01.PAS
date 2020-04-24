{ Created by Gas 1995 }
{
 Napiçte program, kt. vytvoý¡ lin. spojovì seznam celìch Ÿ¡sel -
 - 10 prvk… s hodnotou 1..10 .
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
 Pis('Bude vytvoýen line rn¡ spojovì seznam celìch Ÿ¡sel o 10 prvc¡ch',NeMez,JoPip);
 Pis('s hodnotami 1 a§ 10.',NeMez,JoPip);
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
 Pis('Bude vytvoýen novì seznam o 3 Ÿ¡slech vycucnut¡m',NeMez,JoPip);
 Pis('ze star‚ho seznamu poŸ¡naje 5. Ÿ¡slem.',NeMez,JoPip);
 Novej1:=VytahniSez(Seznam,5,3);
 Pis('P…vodn¡ seznam:',NeMez,JoPip);
 TiskniSez(Seznam);
 Pis('Novì seznam:',NeMez,JoPip);
 TiskniSez(Novej1);

 WriteLn('==== Enter ====');
 ReadLn;
 ClrScr;

 Pis('Bude vytvoýen 3.seznam o 4 Ÿ¡slech vycucnut¡m',NeMez,JoPip);
 Pis('ze star‚ho seznamu poŸ¡naje 4. Ÿ¡slem.',NeMez,JoPip);
 Pis('To je a§ do konce !',NeMez,JoPip);

 Novej2:=VytahniSez(Seznam,4,4);
 Pis('P…vodn¡ seznam:',NeMez,JoPip);
 TiskniSez(Seznam);
 Pis('Novì seznam:',NeMez,JoPip);
 TiskniSez(Novej1);
 Pis('NejnovØjç¡ seznam:',NeMez,JoPip);
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
 WriteLn('UŸit se, uŸit se, uŸit se. (Pascal) - V.I.Lenin');
end.




