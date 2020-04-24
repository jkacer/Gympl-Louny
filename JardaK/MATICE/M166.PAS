{ Created by GAS 1994 }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  V unitu Matice je nutno prepsat
  konstanty R a S na R=10 a S=10.
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
program M_166;
uses Crt,Matice;
var A:    Mat;
    Kolik:Integer;
    B,BB: Pol;
    XXX:  Integer;
    CCC:  Integer;


procedure Prvni(X:Mat;var XXX:Integer);
var I:Integer;
begin
 XXX:=0;
 for I:=1 to R do
  XXX:=XXX+X[I,1];
end;

begin
 Kolik:=0;
 ClrScr;
 Randomize;
 DejMat(A);
 WriteLn('    A :');
 Vypis(A);
 Jak(A,B);
 Prvni(A,CCC);
 for XXX:=1 to S do
  BB[XXX]:=0;
 for XXX:=1 to S do
  if B[XXX]=CCC then begin
                      BB[XXX]:=1;
                      Kolik:=Kolik+1;
                     end;
 WriteLn('Podminku splnuje ',Kolik,' sloupcu.');
 WriteLn('Sloupce :');
 for XXX:=1 to S do
  if BB[XXX]=1 then Write(XXX,' ');
 ReadLn;
end.