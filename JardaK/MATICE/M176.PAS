{ Created by GAS 1994 }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  V unitu Matice je nutno prepsat
  konstanty R a S na R<20 a S<20.
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
program M_176;
uses Crt,Matice;
type Cislo = Record
              X:Byte;
              Y:Byte;
              H:Integer;
             end;
var A:    Mat;
    I,J:  Byte;
    Min,
    Max:  Cislo;
    Pom:  Integer;
begin
 ClrScr;
 Randomize;
 DejMat(A);
 WriteLn('    A :');
 Vypis(A);

 with Min do
  begin
   X:=1;
   Y:=1;
   H:=A[1,1];
  end;
 with Max do
  begin
   X:=1;
   Y:=1;
   H:=A[1,1];
  end;

 for I:=1 to R do
  for J:=1 to S do
   begin
    if A[I,J]<Min.H then begin
                          Min.X:=J;
                          Min.Y:=I;
                          Min.H:=A[I,J];
                         end;
    if A[I,J]>Max.H then begin
                          Max.X:=J;
                          Max.Y:=I;
                          Max.H:=A[I,J];
                         end;
   end;
 WriteLn('Min: sloupec ',Min.X,' radka ',Min.Y,' hodnota ',Min.H);
 WriteLn('Max: sloupec ',Max.X,' radka ',Max.Y,' hodnota ',Max.H);
 Pom   :=Min.H;
 A[Min.Y,Min.X]:=Max.H;
 A[Max.Y,Max.X]:=Pom;
 WriteLn('   Nove A: ');
 Vypis(A);
 ReadLn;
end.
