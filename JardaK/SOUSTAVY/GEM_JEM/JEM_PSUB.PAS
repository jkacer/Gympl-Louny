{ Created by GAS 1996 }
program XXX;

uses Crt,GJ_Elim;

label 1;

var M:  ElM;
    I:  Byte;
    Y:  Vysledky;

begin
 ClrScr;
 WriteLn('Soustava o ',Nez,' nezn mìch.');
 WriteLn('Bude pou§ita metoda "JEM" a pak metoda "Pý¡m Substituce".');

 Udelej(M);

 if JEM(M) then begin
                 WriteLn(' Po JEM :');
                 Vypis(M);
                 ReadLn;
                end
           else begin
                 Vypis(M);
                 goto 1;
                end;

 if PrimaSub(M,Y) then begin
                         WriteLn(' Po pý¡m‚ substituci :');
                         Vypis(M);
                         ReadLn;
                        end
                   else begin
                         Vypis(M);
                         goto 1;
                        end;

 WriteLn('Koýeny:');
 for I:=1 to R do
  WriteLn(Y[I]:7:2);

1:
 ReadLn;
end.

