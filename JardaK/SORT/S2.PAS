{ Written by GAS }

program Sort2;

uses
      Crt,Sort;

var
      Pole:     TPoleInt;

begin
 ClrScr;
 Napln(Pole);
 WriteLn('N hodnØ vygenerovan‚ pole:');
 Vypis(Pole);

 HofmanSort(Pole);
 WriteLn('Setý¡dØno HofmanSortem:');
 Vypis(Pole);
 ReadLn;
end.

