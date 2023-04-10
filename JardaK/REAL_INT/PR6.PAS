{ Written by GAS }

program XXX;

uses
      Crt,Real_Int;

var
      Cislo:    LongInt;

begin
 ClrScr;
 WriteLn('Program zjistí součet sudých číslic v zadaném čísle.');
 Write('Číslo = ');
 ReadLn(Cislo);

 WriteLn('Součet je ',SoucetSudCis(Cislo));
 ReadLn;
end.

