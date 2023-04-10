{ Written by GAS }

program Sort2;

uses
      Crt,Sort;

var
      Pole:     TPoleInt;

begin
 ClrScr;
 Napln(Pole);
 WriteLn('Náhodně vygenerované pole:');
 Vypis(Pole);

 HofmanSort(Pole);
 WriteLn('Setříděno HofmanSortem:');
 Vypis(Pole);
 ReadLn;
end.

