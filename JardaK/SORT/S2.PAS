{ Written by GAS }

program Sort2;

uses
      Crt,Sort;

var
      Pole:     TPoleInt;

begin
 ClrScr;
 Napln(Pole);
 WriteLn('N�hodn� vygenerovan� pole:');
 Vypis(Pole);

 HofmanSort(Pole);
 WriteLn('Set��d�no HofmanSortem:');
 Vypis(Pole);
 ReadLn;
end.

