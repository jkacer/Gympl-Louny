{ Written by GAS }

program AbsHodnR;

uses
      Crt;

var
      A,B,
      X1,X2:    Real;
      Q:        Byte;
begin
 ClrScr;
 repeat
  WriteLn('ZnØn¡ rovnice je ³ X-A ³  = B');
  WriteLn('Zad vej!');

  Write('A = ');  ReadLn(A);
  Write('B = ');  ReadLn(B);

  X1:=A+B;
  X2:=A-B;
  WriteLn('Rovnice m  2 ýeçen¡: ',X1:6:3,' a ',X2:6:3);

  repeat
   WriteLn('Chceç jeçtØ? - 1/0');
   ReadLn(Q);
  until (Q=1) or (Q=0);

 until Q=0;
end.