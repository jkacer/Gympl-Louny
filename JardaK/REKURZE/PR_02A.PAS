{
 Written by Gama Software 1996
}

program XXX;

uses
      Rekurze,Crt;

var
     Co:        Byte;
     Vysl:      LongInt;
begin
 ClrScr;

 Write('Spočítat faktoriál pro co ? <0,255> ');
 ReadLn(Co);
 Vysl:=N_Faktorial(Co);
 WriteLn('Faktoriál čísla ',Co,' je ',Vysl,'.');
 ReadLn;
 WriteLn('(c) Gama Software 1996');
end.


