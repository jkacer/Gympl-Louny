{ Created by GAS 1995 }
{
 P�irozen� ��slo se naz�v� Palindrom, je-li jeho dekadick�
 z�pis symetrick�(313,111,78787).
 Nalezn�te v�echny palindromy z intervalu <A,B>.
}

program XXX;

uses Crt,Matika;

var A,B:Integer;
    I,P:Integer;

begin
 ClrScr;
 WriteLn('Budou vyhled�na v�echna symetrick� ��sla z intervalu <A,B>.');
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

