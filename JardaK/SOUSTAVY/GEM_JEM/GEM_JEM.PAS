{ Created by GAS 1995 }
program XXX;

uses Crt,GJ_Elim;

label 1;

var M:  ElM;
    I:  Byte;

begin
 ClrScr;
 WriteLn('Soustava o ',Nez,' nezn�m�ch.');
 WriteLn('Bude pou�ita metoda "GEM" a pak metoda "JEM".');

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

 if JEM(M) then begin
                 WriteLn(' Po JEM :');
                 Vypis(M);
                 ReadLn;
                end
           else begin
                 Vypis(M);
                 goto 1;
                end;

 { �prava, aby byly u nezn�m�ch 1 => v posl. sloupci jsou u� ko�eny }
 for I:=1 to R do
  begin
   M[I,S]:=M[I,S]/M[I,I];
   M[I,I]:=1;
  end;

 WriteLn('Ko�eny:');
 for I:=1 to R do
  WriteLn(M[I,S]:7:2);

1:
 ReadLn;
end.

