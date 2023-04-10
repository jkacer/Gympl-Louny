program XX;
uses Crt,Dos,Soubory;
var F:       F_Cely;
    Cislo:   Integer;
    I:       Integer;
begin
 ClrScr;
 Randomize;
 Assign(F,'zdroj1.cis');
 {$I-}
 ReWrite(F);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k ZDROJ1.CIS !!!');
                      Exit;
                     end;
 {$I+}
 Cislo:=Random(200);
 for I:=1+Cislo to 20+Cislo do
  Write(F,I);
 Close(F);

 Assign(F,'zdroj2.cis');
 {$I-}
 ReWrite(F);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k ZDROJ2.CIS !!!');
                      Exit;
                     end;
 {$I+}
 Cislo:=Random(200);
 for I:=1+Cislo to 20+Cislo do
  Write(F,I);
 Close(F);

 Assign(F,'zdroj3.cis');
 {$I-}
 ReWrite(F);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k ZDROJ3.CIS !!!');
                      Exit;
                     end;
 {$I+}
 Cislo:=Random(200);
 for I:=1+Cislo to 20+Cislo do
  Write(F,I);
 Close(F);

 Assign(F,'zdroj4.cis');
 {$I-}
 ReWrite(F);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k ZDROJ4.CIS !!!');
                      Exit;
                     end;
 {$I+}
 Cislo:=Random(200);
 for I:=1+Cislo to 20+Cislo do
  Write(F,I);
 Close(F);

end.
