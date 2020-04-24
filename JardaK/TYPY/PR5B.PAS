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
  WriteLn('ZnØn¡ rovnice je A*X = B');
  WriteLn('Zad vej!');

  Write('A = ');  ReadLn(A);
  Write('B = ');  ReadLn(B);

  if A=0 then if B=0 then WriteLn('Rovnice m  nekoneŸnØ mnoho ýeçen¡.')
                     else WriteLn('Rovnice nem  § dn‚ ýeçen¡.')
         else begin
               X:=B/A;
               WriteLn('Rovnice m  1 ýeçen¡: ',X:6:3);
              end;
  repeat
   WriteLn('Chceç jeçtØ? - 1/0');
   ReadLn(Q);
  until (Q=1) or (Q=0);

 until Q=0;
end.
