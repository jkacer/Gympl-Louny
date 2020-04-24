{ Created by GAS 1994 }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  V unitu Matice je nutno prepsat
  konstanty R a S na R<20 a S<20.
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
program M_178;
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
   X:=0;
   Y:=0;
   H:=0;
  end;
 with Max do
  begin
   X:=0;
   Y:=0;
   H:=0;
  end;

 for I:=2 to S do
  for J:=1 to I-1 do
   if A[J,I]>Max.H then begin
                         Max.X:=I;
                         Max.Y:=J;
                         Max.H:=A[J,I];
                        end;
 for I:=1 to S-1 do
  for J:=1+I to R do
   if A[J,I]<Min.H then begin
                         Min.X:=I;
                         Min.Y:=J;
                         Min.H:=A[J,I];
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
