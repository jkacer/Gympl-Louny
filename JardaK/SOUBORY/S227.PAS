{ Created by GAS 1995 }
program Soub227;
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
                      WriteLn('Chyba v pý¡stupu k SOUB1.TXT !!!');
                      Exit;
                     end;
 {$I+}
 K:=0;
 while not(Eof(F)) do
  begin
   ReadLn(F,S);
   repeat
    Kde:=Pos('PEPES',S);
    if Kde>0 then begin
                   Inc(K);
                   Delete(S,1,Kde+1);
                  end;
   until Kde<1;
  end;
 Close(F);
 WriteLn('V souboru se ýetØzec ''PEPES'' vyskytuje ',K,'-kr t.');
 ReadLn;
end.
