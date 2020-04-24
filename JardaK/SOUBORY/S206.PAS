{ Created by GAS 1995 }
program Soub206;
uses Crt,Dos;
var F:Text;
    S:String;
    Poc:Byte;
begin
 ClrScr;
 Assign(F,'soub1.txt');
 {$I-}
 Reset(F);
 if IOResult<>0 then begin
                      WriteLn('Chyba v pý¡stupu k SOUB1.TXT !!!');
                      Exit;
                     end;
 {$I+}
 for Poc:=1 to 10 do
  if not(Eof(F)) then begin
                       ReadLn(F,S);
                       WriteLn(S);
                      end;
 WriteLn('OK');
 Close(F);
 ReadLn;
end.
