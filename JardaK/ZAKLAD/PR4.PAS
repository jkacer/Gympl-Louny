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

 WriteLn('Součet převrácených hodnot čísel od 1 do ',N,' je ',Souc:8:6);
 ReadLn;
end.

