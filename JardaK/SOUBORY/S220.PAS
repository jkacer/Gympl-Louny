{ Created by GAS 1995 }
program Soub220;
uses Crt,Dos,Soubory;
var F1:      F_Cely;
    F2:      F_Cely;
    Cislo:   Integer;
    Poz:     Word;
begin
 ClrScr;
 Assign(F1,'soub2.cis');
 Assign(F2,'soub4.cis');
 {$I-}
 Reset(F1);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB2.CIS !!!');
                      Exit;
                     end;
 ReWrite(F2);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB4.CIS !!!');
                      Exit;
                     end;
 {$I+}
 Poz:=0;
 while not(Eof(F1)) do
  begin
   Inc(Poz);
   Read(F1,Cislo);
   if Poz=3 then begin
                  Write(F2,Cislo);
                  Poz:=0;
                 end;
  end;
 Close(F1);
 Close(F2);
 WriteLn('OK');
 ReadLn;
end.




