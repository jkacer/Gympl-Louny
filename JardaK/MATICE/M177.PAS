{ Created by GAS 1994 }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  V unitu Matice je nutno prepsat
  konstanty R a S na R<20 a S<20.
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
program M_177;
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
   H:=Vaha(A,1,1);
  end;
 with Max do
  begin
   X:=1;
   Y:=1;
   H:=Vaha(A,1,1);
  end;

 for I:=1 to R do
  for J:=1 to S do
   begin
    Pom:=Vaha(A,I,J);
    if Pom<Min.H then begin
                       Min.X:=J;
                       Min.Y:=I;
                       Min.H:=Pom;
                      end;
    if Pom>Max.H then begin
                       Max.X:=J;
                       Max.Y:=I;
                       Max.H:=Pom;
                      end;
   end;
 WriteLn('Min: sloupec ',Min.X,' radka ',Min.Y,' vaha ',Min.H);
 WriteLn('Max: sloupec ',Max.X,' radka ',Max.Y,' vaha ',Max.H);
 Pom   :=A[Min.Y,Min.X];
 A[Min.Y,Min.X]:=A[Max.Y,Max.X];
 A[Max.Y,Max.X]:=Pom;
 WriteLn('   Nove A: ');
 Vypis(A);
 ReadLn;
end.
