{ Created by GAS 1994 }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  V unitu Matice je nutno prepsat
  konstanty R a S na R=10 a S=10.
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
program M_173;
uses Crt,Matice;
var A,B:  Mat;
    I:    Byte;
    X,Y:  Ver;
    O:    Pol;
    Pom:  Integer;
begin
 ClrScr;
 Randomize;
 DejMat(A);
 WriteLn('    A :');
 Vypis(A);
 B:=A;
 for I:=1 to R do
  begin
   X[I]:=Radek(A,I);
   Y[I]:=I;
  end;
 Setrid_Ver_Plus(X,Y);
 for I:=1 to R do
  begin
   Pom:=Y[I];
   Dej_Pol(A,Pom,O);
   Vepis_Pol(O,I,B);
  end;
 WriteLn('    B :');
 Vypis(B);
 WriteLn;
 ReadLn;
end.
