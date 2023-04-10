{ Written by GAS }

program Sort1;

uses
      Crt,Sort;

var
      Pole:     TPoleInt;

begin
 ClrScr;
 Napln(Pole);
 WriteLn('Náhodně vygenerované pole:');
 Vypis(Pole);

 BubbleSort(Pole);
 WriteLn('Setříděno BubbleSortem:');
 Vypis(Pole);
 ReadLn;
end.

