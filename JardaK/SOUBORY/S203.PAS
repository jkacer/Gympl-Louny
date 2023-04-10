{ Created by GAS 1995 }
program Soub203;
uses Crt,Dos;
var F:Text;
    S:String;
    K:Integer;
begin
 ClrScr;
 Assign(F,'soub1.txt');
 {$I-}
 Reset(F);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB1.TXT !!!');
                      Exit;
                     end;
 {$I+}
 K:=0;
 while not(Eof(F)) do
  begin
   ReadLn(F,S);
   Inc(K);
  end;
 WriteLn('V souboru je ',K,' řádků.');
 Close(F);
 ReadLn;
end.
