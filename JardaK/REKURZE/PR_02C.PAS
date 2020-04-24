{
 Written by Gama Software 1996
}

program XXX;

uses
      Rekurze,Crt;

var
     N,K:       Byte;
     Vysl:      LongInt;
begin
 ClrScr;

 WriteLn('VÏpoüet N nad K.');
 Write('N ? <0,255> '); ReadLn(N);
 Write('K ? <0,255> '); ReadLn(K);
 Vysl:=N_Nad_K(N,K);

 WriteLn(N,' nad ',K,' je ',Vysl,'.');
 ReadLn;
 WriteLn('(c) Gama Software 1996');
end.


