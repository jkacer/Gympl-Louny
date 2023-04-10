{ Created by GAS 1995 }
program Soub212;
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
                if (Konec+1-Zacatek)>K then K:=Konec+1-Zacatek;
                Delete(S,1,Konec);
               end;
   until not(Je);
  end;
 WriteLn('Soubor má nejdelší slovo o ',K,' písmenech.');
 Close(F);
 ReadLn;
end.
