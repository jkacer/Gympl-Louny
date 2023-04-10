{ Created by GAS 1995 }
program Soustava3N;

uses Crt,Determ;


var
    S:         Soustava3;
    D,DX,DY,DZ:  Real;

begin
 ClrScr;
 WriteLn('Soustava 3 rovnic o 3 neznámých.');
 WriteLn('X1 + Y1 + Z1 = Q1');
 WriteLn('X2 + Y2 + Z2 = Q2');
 WriteLn('X3 + Y3 + Z3 = Q3');
 Write('   X1 = ');ReadLn(S[1,1]);
 Write('   Y1 = ');ReadLn(S[1,2]);
 Write('   Z1 = ');ReadLn(S[1,3]);
 Write('   Q1 = ');ReadLn(S[1,4]);

 Write('   X2 = ');ReadLn(S[2,1]);
 Write('   Y2 = ');ReadLn(S[2,2]);
 Write('   Z2 = ');ReadLn(S[2,3]);
 Write('   Q2 = ');ReadLn(S[2,4]);

 Write('   X3 = ');ReadLn(S[3,1]);
 Write('   Y3 = ');ReadLn(S[3,2]);
 Write('   Z3 = ');ReadLn(S[3,3]);
 Write('   Q3 = ');ReadLn(S[3,4]);

 Res_Sous3(S,DX,DY,DZ,D);

 if D<>0 then begin
               WriteLn('Soustava je regulární.');
               WriteLn('X = ',(DX/D):6:4,' ,  Y = ',(DY/D):6:4,
                       '  Z = ',(DZ/D):6:4);
              end
         else begin
               Write('Soustava je singulární ');
               if (DX=0) and (DY=0) and (DZ=0)
                      then WriteLn('a má nekonečně řešení.')
                      else WriteLn('a nemá žádné řešení.');
              end;
 ReadLn;
end.
