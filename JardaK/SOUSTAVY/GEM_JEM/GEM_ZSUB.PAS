{ Created by GAS 1995 }
program XXX;

uses Crt,GJ_Elim;

label 1;

var M:  ElM;
    I:  Byte;
    Y:  Vysledky;

begin
 ClrScr;
 WriteLn('Soustava o ',Nez,' nezn�m�ch.');
 WriteLn('Bude pou�ita metoda "GEM" a pak metoda "Zp�tn�Substituce".');

 Udelej(M);

 if GEM(M) then begin
                 WriteLn(' Po GEM :');
                 Vypis(M);
                 ReadLn;
                end
           else begin
                 Vypis(M);
                 goto 1;
                end;

 if ZpetnaSub(M,Y) then begin
                         WriteLn(' Po zp�tn� substituci :');
                         Vypis(M);
                         ReadLn;
                        end
                   else begin
                         Vypis(M);
                         goto 1;
                        end;

 WriteLn('Ko�eny:');
 for I:=1 to R do
  WriteLn(Y[I]:7:2);

1:
 ReadLn;
end.

