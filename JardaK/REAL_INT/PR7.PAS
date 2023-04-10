{ Written by GAS }

program XXX;

uses
      Crt,Real_Int;

var
      Cislo:    Integer;

begin
 ClrScr;
 WriteLn('Program zjistí, zda je číslo prvočíslo.');
 Write('Číslo = ');
 ReadLn(Cislo);

 if Je_Prvoc(Cislo) then WriteLn('ANO')
                    else WriteLn('NE');
 ReadLn;
end.

