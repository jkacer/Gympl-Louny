{ Written by GAS }

program XXX;

uses
      Crt,Real_Int;

var
      Cislo:    Integer;

begin
 ClrScr;
 WriteLn('Program zjist°, zda je ü°slo prvoü°slo.');
 Write('¨°slo = ');
 ReadLn(Cislo);

 if Je_Prvoc(Cislo) then WriteLn('ANO')
                    else WriteLn('NE');
 ReadLn;
end.

