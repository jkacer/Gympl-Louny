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

 WriteLn('VÏpoüet faktori†lu z N ITERA¨N∑.');
 Write('N ? <0,255> '); ReadLn(N);
 Vysl:=N_Faktorial_Iter(N);

 WriteLn('Faktori†l z ',N,' je ',Vysl,'.');
 ReadLn;
 WriteLn('(c) Gama Software 1996');
end.


