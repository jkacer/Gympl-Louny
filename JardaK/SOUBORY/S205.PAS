{ Created by GAS 1995 }
program Soub205;
uses Crt,Dos;
var F1,F2,F3:Text;
    S:       String;
begin
 ClrScr;
 DosError:=0;
 Assign(F1,'soub1.txt');
 Assign(F2,'soub2.txt');
 Assign(F3,'soub3.txt');
 {$I-}
 Reset(F1);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB1.TXT !!!');
                      Exit;
                     end;
 Reset(F2);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB2.TXT !!!');
                      Exit;
                     end;
 ReWrite(F3);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB3.TXT !!!');
                      Exit;
                     end;
 {$I+}
 while not(Eof(F1)) do
  begin
   ReadLn(F1,S);
   WriteLn(F3,S);
  end;

 while not(Eof(F2)) do
  begin
   ReadLn(F2,S);
   WriteLn(F3,S);
  end;
 WriteLn('OK');
 Close(F1);
 Close(F2);
 Close(F3);
 ReadLn;
end.
