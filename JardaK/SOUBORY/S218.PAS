{ Created by GAS 1995 }
program Soub218;
uses Crt,Dos,Soubory;
var F:       F_Real;
    Cislo:   Real;
    Nej:     Real;
begin
 ClrScr;
 Assign(F,'soub1.cis');
 {$I-}
 Reset(F);
 if IOResult<>0 then begin
                      WriteLn('Chyba v p��stupu k SOUB1.CIS !!!');
                      Exit;
                     end;
 {$I+}

 Read(F,Nej);
 while not(Eof(F)) do
  begin
   Read(F,Cislo);
   if Cislo>Nej then Nej:=Cislo;
  end;

 Close(F);
 WriteLn('Nejv�t� re�ln� ��slo: ',Nej);
 ReadLn;
end.




