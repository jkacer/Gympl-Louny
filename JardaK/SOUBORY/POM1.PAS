program XX;
uses Crt,Dos,Soubory;
var F:       F_Real;
    Cislo:   Real;
    I:       Byte;
begin
 ClrScr;
 Randomize;
 Assign(F,'soub1.cis');
 {$I-}
 ReWrite(F);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB1.CIS !!!');
                      Exit;
                     end;
 {$I+}
 for I:=1 to 100 do
  begin
   Cislo:=Random;
   Write(F,Cislo);
  end;
 Close(F);
end.