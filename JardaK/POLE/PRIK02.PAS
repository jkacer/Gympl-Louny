{ Created by GAS 1995 }
{
 Přirozené číslo se nazývá Palindrom, je-li jeho dekadický
 zápis symetrický(313,111,78787).
 Nalezněte všechny palindromy z intervalu <A,B>.
}

program XXX;

uses Crt,Matika;

var A,B:Integer;
    I,P:Integer;

begin
 ClrScr;
 WriteLn('Budou vyhledána všechna symetrická čísla z intervalu <A,B>.');
 Write('A ? ');
 ReadLn(A);
 Write('B ? ');
 ReadLn(B);
 if B<A then begin
              P:=A;
              A:=B;
              B:=P;
             end;
 for I:=A to B do
  if JePalindrom(I) then Write(I,' , ');
 GoToXY(WhereX-2,WhereY);
 WriteLn('.');
 Write('==== Enter ====');
 ReadLn;
end.

