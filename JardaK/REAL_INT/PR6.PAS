{ Written by GAS }

program XXX;

uses
      Crt,Real_Int;

var
      Cislo:    LongInt;

begin
 ClrScr;
 WriteLn('Program zjist¡ souŸet sudìch Ÿ¡slic v zadan‚m Ÿ¡sle.');
 Write('¬¡slo = ');
 ReadLn(Cislo);

 WriteLn('SouŸet je ',SoucetSudCis(Cislo));
 ReadLn;
end.

