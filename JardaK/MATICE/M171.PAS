{ Created by GAS 1994 }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  V unitu Matice je nutno prepsat
  konstanty R a S na R=10 a S=10.
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
program M_171;
uses Crt,Matice;
var A,B:Mat;
    I:  Byte;
    X:  Ver;
begin
 ClrScr;
 Randomize;
 DejMat(A);
 WriteLn('    A :');
 Vypis(A);
 B:=A;
 for I:=1 to S do
  begin
   Dej_Ver(A,I,X);
   Setrid_Ver(X);
   Vepis_Ver(X,I,B);
  end;
 WriteLn;
 WriteLn('    B :');
 Vypis(B);
 WriteLn;
 ReadLn;
end.
