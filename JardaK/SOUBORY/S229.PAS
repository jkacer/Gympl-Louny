{ Created by GAS 1995 }
program Soub229;
uses Crt,Dos,Soubory;
var F:      Text;
    S:      String;
    Zacatek,
    Konec:  Word;
    Je:     Boolean;
    Slovo:  String;
    XSlovo: RozklSlovo;
    PSlovo: RozklSlovo;
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
 repeat
  ReadLn(F,S);
  DejSlovo(S,Zacatek,Konec,Je);
 until Je;

 Slovo:=Copy(S,Zacatek,Konec+1-Zacatek);
 InitRS(PSlovo);
 DejZnaky(Slovo,PSlovo);

 Close(F);
 Reset(F);

 while not(Eof(F)) do
  begin
   ReadLn(F,S);
   repeat
    DejSlovo(S,Zacatek,Konec,Je);
    if Je then begin
                Slovo:=Copy(S,Zacatek,Konec+1-Zacatek);
                InitRS(XSlovo);
                DejZnaky(Slovo,XSlovo);
                if RovnostRS(XSlovo,PSlovo) then WriteLn(Slovo);
                Delete(S,1,Konec);
               end;
   until not(Je);
  end;
 WriteLn('OK');
 Close(F);
 ReadLn;
end.
