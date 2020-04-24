{ Created by GAS 1995 }
program Soub210;
uses Crt,Dos,Soubory;
var F:      Text;
    S:      String;
    K:      Integer;
    Zacatek,
    Konec:  Word;
    Je:     Boolean;

begin
 ClrScr;
 Assign(F,'soub1.txt');
 {$I-}
 Reset(F);
 if IOResult<>0 then begin
                      WriteLn('Chyba v p˝°stupu k SOUB1.TXT !!!');
                      Exit;
                     end;
 {$I+}
 K:=0;
 while not(Eof(F)) do
  begin
   ReadLn(F,S);
   repeat
    DejSlovo(S,Zacatek,Konec,Je);
    if Je then begin
                if S[Konec]=S[Zacatek] then Inc(K);
                Delete(S,1,Konec);
               end;
   until not(Je);
  end;
 WriteLn('Soubor m† ',K,' slov, co zaü°naj° a konü° stejnÿ.');
 Close(F);
 ReadLn;
end.
