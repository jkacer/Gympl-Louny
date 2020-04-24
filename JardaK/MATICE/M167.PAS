{ Created by GAS 1994 }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  V unitu Matice je nutno prepsat
  konstanty R a S na R=10 a S=10.
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
program M_167;
uses Crt,Matice;
var A:  Mat;
    B:  Pol;
    I:  Byte;
    Max:ShortInt;
begin
 ClrScr;
 Randomize;
 DejMat(A);
 WriteLn('    A :');
 Vypis(A);
 Jak(A,B);
 Max:=0;
 for I:=1 to S do
  if Max<B[I] then Max:=B[I];
 WriteLn('Max. soucet sloupce : ',Max);
 Write('Ve sloupcich : ');
 for I:=1 to S do
  if B[I]=Max then Write(I);
 WriteLn;
 ReadLn;
end.
