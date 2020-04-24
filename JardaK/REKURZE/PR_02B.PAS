{
 Written by Gama Software 1996
}

program XXX;

uses
      Rekurze,Crt;

var
     X,N:       Byte;
     Vysl:      LongInt;
begin
 ClrScr;

 WriteLn('VìpoŸet X na N.');
 Write('X ? <0,255> '); ReadLn(X);
 Write('N ? <0,255> '); ReadLn(N);
 WriteLn('Pro vysok  Ÿ¡sla nemus¡ bìt vìpoŸet korektn¡.');

 Vysl:=X_Na_N(X,N);

 WriteLn(X,' na ',N,' je ',Vysl,'.');
 ReadLn;
 WriteLn('(c) Gama Software 1996');
end.


