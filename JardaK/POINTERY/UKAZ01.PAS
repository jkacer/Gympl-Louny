{ Created by Gas 1995 }
{
 Napište program, kt. vytvoří lin. spojový seznam celých čísel -
 - 10 prvků s hodnotou 1..10 .
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
 Pis('Bude vytvořen lineární spojový seznam celých čísel o 10 prvcích',NeMez,JoPip);
 Pis('s hodnotami 1 až 10.',NeMez,JoPip);
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
 Pis('Bude vytvořen nový seznam o 3 číslech vycucnutím',NeMez,JoPip);
 Pis('ze starého seznamu počínaje 5. číslem.',NeMez,JoPip);
 Novej1:=VytahniSez(Seznam,5,3);
 Pis('Původní seznam:',NeMez,JoPip);
 TiskniSez(Seznam);
 Pis('Nový seznam:',NeMez,JoPip);
 TiskniSez(Novej1);

 WriteLn('==== Enter ====');
 ReadLn;
 ClrScr;

 Pis('Bude vytvořen 3.seznam o 4 číslech vycucnutím',NeMez,JoPip);
 Pis('ze starého seznamu počínaje 4. číslem.',NeMez,JoPip);
 Pis('To je až do konce !',NeMez,JoPip);

 Novej2:=VytahniSez(Seznam,4,4);
 Pis('Původní seznam:',NeMez,JoPip);
 TiskniSez(Seznam);
 Pis('Nový seznam:',NeMez,JoPip);
 TiskniSez(Novej1);
 Pis('Nejnovější seznam:',NeMez,JoPip);
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
 WriteLn('Učit se, učit se, učit se. (Pascal) - V.I.Lenin');
end.




