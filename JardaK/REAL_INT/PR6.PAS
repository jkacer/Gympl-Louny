{ Written by GAS }

program XXX;

uses
      Crt,Real_Int;

var
      Cislo:    LongInt;

begin
 ClrScr;
 WriteLn('Program zjist� sou�et sud�ch ��slic v zadan�m ��sle.');
 Write('��slo = ');
 ReadLn(Cislo);

 WriteLn('Sou�et je ',SoucetSudCis(Cislo));
 ReadLn;
end.

