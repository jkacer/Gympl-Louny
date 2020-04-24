{ Written by GAS }

program PrikladD;

uses
      Crt;

var
      N:        Byte;
      Souc:     Real;
      I:        Byte;

begin
 ClrScr;
 Souc:=0;
 Write('Zadej N ! ');
 ReadLn(N);

 for I:=1 to N do
  Souc:=Souc+(1/I);

 WriteLn('SouŸet pýevr cenìch hodnot Ÿ¡sel od 1 do ',N,' je ',Souc:8:6);
 ReadLn;
end.

