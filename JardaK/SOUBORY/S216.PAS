{ Created by GAS 1995 }
program Soub216;
uses Crt,Dos,Soubory;
var F:       Text;
    Znak:    Char;
    A,B,C:   Word;
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
 A:=0;
 B:=0;
 C:=0;

 while not(Eof(F)) do
  begin
   Read(F,Znak);
   case Znak of
    'A':Inc(A);
    'B':Inc(B);
    'C':Inc(C);
    else;
   end;
  end;
 Close(F);
 WriteLn('Počet písmen :');
 WriteLn(' A: ',A);
 WriteLn(' B: ',B);
 WriteLn(' C: ',C);
 ReadLn;
end.




