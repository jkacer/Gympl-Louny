{ Created by GAS 1995 }
program Soub207;
uses Crt,Dos;
var F1,F2:Text;
    S:    String;
begin
 ClrScr;
 Assign(F1,'soub1.txt');
 Assign(F2,'soub2.txt');
 {$I-}
 Reset(F1);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB1.TXT !!!');
                      Exit;
                     end;
 ReWrite(F2);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB2.TXT !!!');
                      Exit;
                     end;
 {$I+}
 while not(Eof(F1)) do
  begin
   ReadLn(F1,S);
   S:='     '+S;
   WriteLn(F2,S);
  end;
 WriteLn('OK');
 Close(F1);
 Close(F2);
 ReadLn;
end.
