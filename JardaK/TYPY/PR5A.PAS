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
  WriteLn('Znění rovnice je A*X^2 + B*X + C = 0');
  WriteLn('Zadávej!');

  Write('A = ');  ReadLn(A);
  Write('B = ');  ReadLn(B);
  Write('C = ');  ReadLn(C);

  if A<>0 then begin
                WriteLn('Rovnice je kvadratická.');
                D:=Sqr(B)-(4*A*C);
                if D<0 then WriteLn('Rovnice nemá řešení v R.')
                       else begin
                             E:=Sqrt(D);
                             X1:=(-B+E)/(2*A);
                             X2:=(-B-E)/(2*A);
                             if X1=X2 then WriteLn('Rovnice má 1 řešení:',X1:6:3)
                                      else WriteLn('Rovnice má 2 řešení:',X1:6:3,' a ',X2:6:3);
                            end
               end
          else begin
                WriteLn('Rovnice je lineární.');
                if B=0 then if C=0 then WriteLn('Rovnice má nekonečně řešení.')
                                   else WriteLn('Rovnice nemá řešení.')
                       else begin
                             X1:=(-C)/B;
                             WriteLn('Řešení je ',X1:6:3);
                            end
               end;
  repeat
   WriteLn('Chceš ještě? - 1/0');
   ReadLn(Q);
  until (Q=1) or (Q=0);

 until Q=0;
end.
