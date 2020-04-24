{ Written by GAS }

program Sort1;

uses
      Crt,Sort;

var
      Pole:     TPoleInt;

begin
 ClrScr;
 Napln(Pole);
 WriteLn('N hodnØ vygenerovan‚ pole:');
 Vypis(Pole);

 BubbleSort(Pole);
 WriteLn('Setý¡dØno BubbleSortem:');
 Vypis(Pole);
 ReadLn;
end.

