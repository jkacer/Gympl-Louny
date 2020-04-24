{ Created by GAS 1995 }

program Priklad1;

uses Prvocis,Crt;

var Kolikaty:Integer;

begin
 ClrScr;
 Write('Kolik t‚ prvoŸ¡slo ? ');
 ReadLn(Kolikaty);
 WriteLn(Kolikaty,'-t‚ prvoŸ¡slo je ',Nte_Prvoc(Kolikaty),'.');
 ReadLn;
end.

