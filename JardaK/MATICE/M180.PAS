{ Created by GAS 1996 }
{ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  V unitu Matice je nutno prepsat
  konstanty R a S na R=5 a S=5.
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
program M_180;
uses Crt,Matice;
var A:          Mat;
    I:          Byte;
    Max:        ShortInt;
    Pom:        Integer;
    Kde:        Byte;


begin
 ClrScr;
 Randomize;
 DejMat(A);
 WriteLn('    A :');
 Vypis(A);

 for I:=1 to R do
  begin
   Kde:=Min_Rad_Pos(A,I);
   Pom:=A[I,Kde];
   A[I,Kde]:=A[I,I];
   A[I,I]:=Pom;
  end;

 WriteLn('Po akci :');
 Vypis(A);
 ReadLn;
end.


