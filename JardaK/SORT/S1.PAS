{ Written by GAS }

program Sort1;

uses
      Crt,Sort;

var
      Pole:     TPoleInt;

begin
 ClrScr;
 Napln(Pole);
 WriteLn('N�hodn� vygenerovan� pole:');
 Vypis(Pole);

 BubbleSort(Pole);
 WriteLn('Set��d�no BubbleSortem:');
 Vypis(Pole);
 ReadLn;
end.

