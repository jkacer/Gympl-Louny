{ Created by GAS 1994 }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  V unitu Matice je nutno prepsat
  konstanty R a S na R=10 a S=10.
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
program M_168;
uses Crt,Matice;
var A:     Mat;
    B,BB:  Ver;
    I:     Byte;
begin
 ClrScr;
 Randomize;
 DejMat(A);
 WriteLn('    A :');
 Vypis(A);
 Dej_Ver(A,1,BB);
 Write('Stejne sloupce jako prvni(bez 1.): ');
 for I:=2 to S do
  begin
   Dej_Ver(A,I,B);
   if Stejne_Ver(B,BB) then Write(I,' ');
  end;
 WriteLn;
 ReadLn;
end.
