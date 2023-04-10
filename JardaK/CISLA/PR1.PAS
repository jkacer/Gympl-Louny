{ Created by GAS 1995 }

program Priklad1;

uses Prvocis,Crt;

var Kolikaty:Integer;

begin
 ClrScr;
 Write('Kolikáté prvočíslo ? ');
 ReadLn(Kolikaty);
 WriteLn(Kolikaty,'-té prvočíslo je ',Nte_Prvoc(Kolikaty),'.');
 ReadLn;
end.

