{ Created by GAS 1995 }
program Soub219;
uses Crt,Dos,Soubory;
var F:       F_Cely;
    Prvni:   Integer;
    Posl:    Integer;
begin
 ClrScr;
 Assign(F,'soub2.cis');
 {$I-}
 Reset(F);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB2.CIS !!!');
                      Exit;
                     end;
 {$I+}

 Read(F,Prvni);
 Seek(F,FileSize(F)-SizeOf(Integer));
 Read(F,Posl);
 Close(F);
 WriteLn('První číslo:    ',Prvni);
 WriteLn('Poslední číslo: ',Posl);
 if Prvni=Posl then WriteLn('Jsou stejná.')
               else if Prvni>Posl then WriteLn('Prvni je větší.')
                                  else WriteLn('Poslední je větší.');

 ReadLn;
end.




