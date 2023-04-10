program XX;
uses Crt,Dos,Soubory;
var F:       F_Cely;
    Cislo:   Integer;
    I:       Byte;
begin
 ClrScr;
 Randomize;
 Assign(F,'soub2.cis');
 {$I-}
 ReWrite(F);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB2.CIS !!!');
                      Exit;
                     end;
 {$I+}
 for I:=1 to 100 do
  begin
   Cislo:=Random(100);
   Write(F,Cislo);
  end;
 Close(F);
end.
