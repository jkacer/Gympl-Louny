{ Written by GAS }

program Sit;

uses
      Crt;

function Faktorial(X:Byte):LongInt;
var
      I:        Byte;
      Pom:      LongInt;
begin
 Pom:=1;
 for I:=2 to X do
  Pom:=Pom*I;
 Faktorial:=Pom;
end;


function N_Nad_K(N,K:Byte):LongInt;
begin
 N_Nad_K := Faktorial(N) div ( Faktorial(K) * Faktorial(N-K) );
end;


var
      X,Y:      Byte;
      V1,V2:    LongInt;

begin
 ClrScr;
 WriteLn('!!! Pouze Ÿ¡sla <7 !!!');
 repeat
  Write('X = '); ReadLn(X);
 until (X<7);
 repeat
  Write('Y = '); ReadLn(Y);
 until (Y<7);

 V1 := N_Nad_K(X+Y,X);
 V2 := N_Nad_K(X+Y,Y);

 if V1=V2 then WriteLn('Existuje ',V1,' mo§nìch cest.')
          else WriteLn('Chyba pýi vìpoŸtu => ',V1,' <> ',V2);
 ReadLn;
end.



