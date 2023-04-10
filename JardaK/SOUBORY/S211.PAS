{ Created by GAS 1995 }
program Soub211;
uses Crt,Dos,Soubory;
var F:      Text;
    S:      String;
    K:      Integer;
    Zacatek,
    Konec:  Word;
    Je:     Boolean;
    NaTom:  Integer;

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
   NaTom:=0;
   ReadLn(F,S);
   repeat
    DejSlovo(S,Zacatek,Konec,Je);
    if Je then begin
                Inc(NaTom);
                Delete(S,1,Konec);
               end;
   until not(Je);
   if NaTom>K then K:=NaTom;
  end;
 WriteLn('Soubor má na řádku nejvíce ',K,' slov.');
 Close(F);
 ReadLn;
end.
