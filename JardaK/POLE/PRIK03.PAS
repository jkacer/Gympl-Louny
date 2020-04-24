{ Created by GAS 1995 }
{
 SpoŸ¡tejte a vytisknØte vçechna 3-cifern  Ÿ¡sla,
 v nich§ se § dn  cifra neopakuje-vçechny 3 cifry jsou r…zn‚.
}

program XXX;

uses Crt,Matika;

var I:Word;

begin
 ClrScr;
 WriteLn('Budou vyps na vçechna trojcifern  Ÿ¡sla,');
 WriteLn('kter  maj¡ vçechny 3 cifry r…zn‚.');
 for I:=100 to 999 do
  if CifryJenJednou(I) then Write(I,' , ');
 GoToXY(WhereX-2,WhereY);
 WriteLn('.');
 Write('==== Enter ====');
 ReadLn;
end.
