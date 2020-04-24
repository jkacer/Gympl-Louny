program XX;
uses Crt,Dos,Soubory;
var F:       F_Cely;
    Cislo:   Integer;
    I:       Byte;
begin
 ClrScr;
 Randomize;
 Assign(F,'soub3.cis');
 {$I-}
 ReWrite(F);
 if IOResult<>0 then begin
                      WriteLn('Chyba v pý¡stupu k SOUB3.CIS !!!');
                      Exit;
                     end;
 {$I+}
 for I:=1 to 20 do
  begin
   Cislo:=I;
   Write(F,Cislo);
   if (I div 3)=(I/3) then begin
                            Write(F,Cislo);
                            Write(F,Cislo);
                           end;

  end;
 Close(F);
end.
