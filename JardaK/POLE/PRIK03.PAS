{ Created by GAS 1995 }
{
 Spo��tejte a vytiskn�te v�echna 3-cifern� ��sla,
 v nich� se ��dn� cifra neopakuje-v�echny 3 cifry jsou r�zn�.
}

program XXX;

uses Crt,Matika;

var I:Word;

begin
 ClrScr;
 WriteLn('Budou vyps�na v�echna trojcifern� ��sla,');
 WriteLn('kter� maj� v�echny 3 cifry r�zn�.');
 for I:=100 to 999 do
  if CifryJenJednou(I) then Write(I,' , ');
 GoToXY(WhereX-2,WhereY);
 WriteLn('.');
 Write('==== Enter ====');
 ReadLn;
end.
