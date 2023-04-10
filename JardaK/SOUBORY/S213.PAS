{ Created by GAS 1995 }
program Soub213;
uses Crt,Dos,Soubory;
var F:      Text;
    S:      String;
    Zacatek,
    Konec:  Word;
    Je:     Boolean;
    Slovo:  String;

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
 Slovo:='';
 while not(Eof(F)) do
  begin
   ReadLn(F,S);
   repeat
    DejSlovo(S,Zacatek,Konec,Je);
    if Je then begin
                if (Konec+1-Zacatek)>Length(Slovo) then Slovo:=Copy(S,Zacatek,Konec+1-Zacatek);
                Delete(S,1,Konec);
               end;
   until not(Je);
  end;
 WriteLn('Nejdelší slovo souboru : ',Slovo,' .');
 Close(F);
 ReadLn;
end.
