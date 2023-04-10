{ Written by GAS }

program PrikladA;

uses
      Crt;

function Jsou3VetsiNez4(A,B,C,X:Integer):Boolean;
begin
 Jsou3VetsiNez4:=(A+B+C)>X;
end;

var
      A,B,C,D:  Integer;

begin
 ClrScr;
 WriteLn('Zadej najednou 4 celá čísla.');
 ReadLn(A,B,C,D);

 if Jsou3VetsiNez4(A,B,C,D) and
    Jsou3VetsiNez4(A,B,D,C) and
    Jsou3VetsiNez4(A,C,B,D) and
    Jsou3VetsiNez4(A,C,D,B) and
    Jsou3VetsiNez4(A,D,B,C) and
    Jsou3VetsiNez4(A,D,C,B) and

    Jsou3VetsiNez4(B,A,C,D) and
    Jsou3VetsiNez4(B,A,D,C) and
    Jsou3VetsiNez4(B,C,A,D) and
    Jsou3VetsiNez4(B,C,D,A) and
    Jsou3VetsiNez4(B,D,A,C) and
    Jsou3VetsiNez4(B,D,C,A) and

    Jsou3VetsiNez4(C,A,B,D) and
    Jsou3VetsiNez4(C,A,D,B) and
    Jsou3VetsiNez4(C,B,A,D) and
    Jsou3VetsiNez4(C,B,D,A) and
    Jsou3VetsiNez4(C,D,A,B) and
    Jsou3VetsiNez4(C,D,B,A) and

    Jsou3VetsiNez4(D,A,B,C) and
    Jsou3VetsiNez4(D,A,C,B) and
    Jsou3VetsiNez4(D,B,A,C) and
    Jsou3VetsiNez4(D,B,C,A) and
    Jsou3VetsiNez4(D,C,A,B) and
    Jsou3VetsiNez4(D,C,B,A)

     then WriteLn('Součet libovolných 3 čísel z nich je větší než 4.číslo.')
     else WriteLn('Součet libovolných 3 čísel z nich není větší než 4.číslo.');

 ReadLn;
end.

