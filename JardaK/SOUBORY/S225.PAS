{ Created by GAS 1995 }
program Soub225;
uses Crt,Dos;
var F:    Text;
    S:    String;
    K:    Integer;
    Kde:  Byte;
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
   repeat
    Kde:=Pos('PES',S);
    if Kde>0 then begin
                   Inc(K);
                   Delete(S,Kde,3);
                  end;
   until Kde<1;
  end;
 Close(F);
 WriteLn('V souboru se řetězec ''PES'' vyskytuje ',K,'-krát.');
 ReadLn;
end.
