{ Written by GAS }

program KvadratickaR;

uses
      Crt;

var
      A,B,C,
      D,E,
      X1,X2:  Real;

      Q:        Integer;

begin
 ClrScr;
 repeat
  WriteLn('Zn�n� rovnice je A*X^2 + B*X + C = 0');
  WriteLn('Zad�vej!');

  Write('A = ');  ReadLn(A);
  Write('B = ');  ReadLn(B);
  Write('C = ');  ReadLn(C);

  if A<>0 then begin
                WriteLn('Rovnice je kvadratick�.');
                D:=Sqr(B)-(4*A*C);
                if D<0 then WriteLn('Rovnice nem� �e�en� v R.')
                       else begin
                             E:=Sqrt(D);
                             X1:=(-B+E)/(2*A);
                             X2:=(-B-E)/(2*A);
                             if X1=X2 then WriteLn('Rovnice m� 1 �e�en�:',X1:6:3)
                                      else WriteLn('Rovnice m� 2 �e�en�:',X1:6:3,' a ',X2:6:3);
                            end
               end
          else begin
                WriteLn('Rovnice je line�rn�.');
                if B=0 then if C=0 then WriteLn('Rovnice m� nekone�n� �e�en�.')
                                   else WriteLn('Rovnice nem� �e�en�.')
                       else begin
                             X1:=(-C)/B;
                             WriteLn('�e�en� je ',X1:6:3);
                            end
               end;
  repeat
   WriteLn('Chce� je�t�? - 1/0');
   ReadLn(Q);
  until (Q=1) or (Q=0);

 until Q=0;
end.
