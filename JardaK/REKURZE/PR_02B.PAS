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

 WriteLn('V�po�et X na N.');
 Write('X ? <0,255> '); ReadLn(X);
 Write('N ? <0,255> '); ReadLn(N);
 WriteLn('Pro vysok� ��sla nemus� b�t v�po�et korektn�.');

 Vysl:=X_Na_N(X,N);

 WriteLn(X,' na ',N,' je ',Vysl,'.');
 ReadLn;
 WriteLn('(c) Gama Software 1996');
end.


