{ Created by GAS 1995 }
program Soub217;
uses Crt,Dos,Soubory;
var F:       Text;
    Znak:    Char;
    K:       Word;
    I:       Byte;
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

 for I:=65 to 90 do
  begin
   K:=0;
   while not(Eof(F)) do
    begin
     Read(F,Znak);
     if Ord(Znak)=I then Inc(K);
    end;
   Write(Char(I),':',K,' , ');
   Close(F);
   Reset(F);
  end;

 for I:=97 to 122 do
  begin
   K:=0;
   while not(Eof(F)) do
    begin
     Read(F,Znak);
     if Ord(Znak)=I then Inc(K);
    end;
   Write(Char(I),':',K);
   if I<>122 then Write(' , ')
             else Write(' . ');
   Close(F);
   Reset(F);
  end;
 Close(F);
 ReadLn;
end.




