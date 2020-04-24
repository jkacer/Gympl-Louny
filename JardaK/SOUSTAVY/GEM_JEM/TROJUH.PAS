{ Created by GAS 1996 }
program XXX;

uses Crt;

const
      N = 5;
type
      SpecMat = array[1..N,1..N] of Integer;

procedure Vypis(X:SpecMat);
var
      I,J:      Byte;
begin
 for I:=1 to N do
  begin
   for J:=1 to N do
    Write(X[I,J]:5);
   WriteLn;
  end;
end;

procedure Generuj_Nad(var X:SpecMat);
var
      I,J:      Byte;
begin
 for I:=1 to N do
  for J:=1 to N do
   X[I,J]:=0;

 for I:=1 to N do
  for J:=I+1 to N do
   X[I,J]:=Random(50);
end;

procedure Generuj_Pod(var X:SpecMat);
var
      I,J:      Byte;
begin
 for I:=1 to N do
  for J:=1 to N do
   X[I,J]:=0;

 for I:=2 to N do
  for J:=1 to I-1 do
   X[I,J]:=Random(50);
end;


var
      M1,M2:    SpecMat;

begin
 Randomize;
 ClrScr;
 WriteLn('N hodnØ vygenerovan‚ matice:');
 Generuj_Nad(M1);
 Generuj_Pod(M2);

 Vypis(M1);
 WriteLn;
 Vypis(M2);

 ReadLn;
end.

