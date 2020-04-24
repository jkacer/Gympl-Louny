{ Created by GAS 1995 }
program Soustava2N;

uses Crt,Determ;

var
    S:       Soustava2;
    D,DX,DY: Real;

begin
 ClrScr;
 WriteLn('Soustava 2 rovnic o 2 nezn mìch.');
 WriteLn('X1 + Y1 = Z1');
 WriteLn('X2 + Y2 = Z2');

 Write('   X1 = ');ReadLn(S[1,1]);
 Write('   Y1 = ');ReadLn(S[1,2]);
 Write('   Z1 = ');ReadLn(S[1,3]);

 Write('   X2 = ');ReadLn(S[2,1]);
 Write('   Y2 = ');ReadLn(S[2,2]);
 Write('   Z2 = ');ReadLn(S[2,3]);

 Res_Sous2(S,DX,DY,D);
 if D<>0 then begin
               WriteLn('Soustava je regul rn¡.');
               WriteLn('X = ',(DX/D):6:4,' ,  Y = ',(DY/D):6:4);
              end
         else begin
               Write('Soustava je singul rn¡ ');
               if (DX=0)and(DY=0) then WriteLn('a m  nekoneŸnØ ýeçen¡.')
                                  else WriteLn('a nem  § dn‚ ýeçen¡.');
              end;
 ReadLn;
end.
