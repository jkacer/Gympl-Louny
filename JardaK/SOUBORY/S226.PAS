{ Created by GAS 1995 }
program Soub226;
uses Crt,Dos,Soubory;
var F:      Text;
    S:      String;
    K:      Integer;
    Zacatek,
    Konec:  Word;
    Je:     Boolean;
    Pes:    String[3];

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
    DejSlovo(S,Zacatek,Konec,Je);
    if Je then begin
                Pes:=Copy(S,Zacatek,3);
                if Pes='PES' then Inc(K);
                Delete(S,1,Konec);
               end;
   until not(Je);
  end;
 WriteLn('Soubor má ',K,' slov ''PES'' .');
 Close(F);
 ReadLn;
end.
