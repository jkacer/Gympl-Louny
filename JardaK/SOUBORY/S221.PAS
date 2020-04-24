{ Created by GAS 1995 }
program Soub221;
uses Crt,Dos,Soubory;
var F1:      F_Cely;
    F2:      F_Cely;
    Cislo1:  Integer;
    Cislo2:  Integer;
begin
 ClrScr;
 Assign(F1,'soub3.cis');
 Assign(F2,'soub5.cis');
 {$I-}
 Reset(F1);
 if IOResult<>0 then begin
                      WriteLn('Chyba v pý¡stupu k SOUB3.CIS !!!');
                      Exit;
                     end;
 ReWrite(F2);
 if IOResult<>0 then begin
                      WriteLn('Chyba v pý¡stupu k SOUB5.CIS !!!');
                      Exit;
                     end;
 {$I+}
 Read(F1,Cislo1);
 Write(F2,Cislo1);
 while not(Eof(F1)) do
  begin
   Read(F1,Cislo2);
   if Cislo2<>Cislo1 then Write(F2,Cislo2);
   Cislo1:=Cislo2;
  end;
 Close(F1);
 Close(F2);
 WriteLn('OK');
 ReadLn;
end.




