{ Written by GAS }

program TabulkaASCII;

uses
      Crt;

var
      I:        Byte;

begin
 ClrScr;
 WriteLn('ASCII tabulka od #32 do #255.');
 for I:=32 to 255 do
  begin
   Write(I:7,'  ',Chr(I)); { celkem 10 znaků }
   Delay(100);
  end;

 WriteLn;
 ReadLn;
end.

