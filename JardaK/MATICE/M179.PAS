{ Created by GAS 1994 }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  V unitu Matice je nutno prepsat
  konstanty R a S na R<20 a S<20.
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
program M_179;
uses Crt,Matice;
type Cislo = Record
              X:Byte;
              Y:Byte;
              H:Integer;
             end;
var A:    Mat;
    I,J:  Byte;
    Sed:  Cislo;
begin
 ClrScr;
 Randomize;
 DejMat(A);           {Lze pouzit i DejMatR(A)- rucni zadavani }
 WriteLn('    A :');
 Vypis(A);

 with Sed do
  begin
   X:=0;
   Y:=0;
   H:=0;
  end;

 for I:=1 to R do
  for J:=1 to S do
   if ( NejV_Pol(A,I,J) and NejM_Ver(A,I,J) ) or
      ( NejM_Pol(A,I,J) and NejV_Ver(A,I,J) ) then
     begin
      Sed.X:=J;
      Sed.Y:=I;
      Sed.H:=A[I,J];
     end;
 WriteLn('Sedlovy bod:');
 WriteLn('Sloupec : ',Sed.X,' radka : ',Sed.Y,' hodnota : ',Sed.H);
 ReadLn;
end.
