{ Written by GAS }

program LinearniR;

uses
      Crt;

var
      A,B,X:    Real;
      Q:        Byte;
begin
 ClrScr;
 repeat
  WriteLn('Zn�n� rovnice je A*X = B');
  WriteLn('Zad�vej!');

  Write('A = ');  ReadLn(A);
  Write('B = ');  ReadLn(B);

  if A=0 then if B=0 then WriteLn('Rovnice m� nekone�n� mnoho �e�en�.')
                     else WriteLn('Rovnice nem� ��dn� �e�en�.')
         else begin
               X:=B/A;
               WriteLn('Rovnice m� 1 �e�en�: ',X:6:3);
              end;
  repeat
   WriteLn('Chce� je�t�? - 1/0');
   ReadLn(Q);
  until (Q=1) or (Q=0);

 until Q=0;
end.
