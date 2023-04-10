{
 Written by Gama Software 1996
}

program XXX;

uses
      Rekurze,Crt;

var
     N:         Byte;
     Vysl:      LongInt;
     I:         Byte;
begin
 ClrScr;

 WriteLn('Výpočet Fibonacciho posloupnosti z N.');
 Write('N ? <0,255> '); ReadLn(N);
 Vysl:=FibonaccihoPosl(N);

 WriteLn('Fibonaccoho posloupnost z ',N,' je ',Vysl,'.');

 WriteLn('Výpis 1-25 :');
 for I:=0 to 25 do
  Write(FibonaccihoPosl(I),' ');

 Pip2;
 WriteLn('(c) Gama Software 1996');
end.


