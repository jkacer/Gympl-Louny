{ Created by GAS 1995 }
program Soub228;
uses Crt,Dos,Soubory;
var F1,F2:  Text;
    S:      String;
    Zacatek,
    Konec:  Word;
    Je:     Boolean;
    Slovo:  String[5];

begin
 ClrScr;
 Assign(F1,'soub1.txt');
 Assign(F2,'soub5sl.txt');
 {$I-}
 Reset(F1);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB1.TXT !!!');
                      Exit;
                     end;
 ReWrite(F2);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB5SL.TXT !!!');
                      Exit;
                     end;
 {$I+}
 while not(Eof(F1)) do
  begin
   ReadLn(F1,S);
   repeat
    DejSlovo(S,Zacatek,Konec,Je);
    if Je then begin
                if Konec-Zacatek=4 then begin
                                         Slovo:=Copy(S,Zacatek,5);
                                         WriteLn(F2,Slovo);
                                        end;
                Delete(S,1,Konec);
               end;
   until not(Je);
  end;
 WriteLn('OK');
 Close(F1);
 Close(F2);
 ReadLn;
end.
