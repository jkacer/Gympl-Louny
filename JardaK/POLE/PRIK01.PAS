{ Created by GAS 1995 }
{
  Nalezn�te v�echna p�ir. ��sla men� ne� dan� N,
  kter� jsou d�liteln� ka�dou svou cifrou.
}
program XXX;

uses Crt,Matika;

var N:Integer;
    I:Integer;

begin
 ClrScr;
 WriteLn('Budou vyps�na v�echna ��sla men� ne� N,');
 WriteLn('kter� jsou d�liteln� ka�dou svou cifrou.');
 Write('N ? ');
 ReadLn(N);
 Write('1');
 for I:=2 to N-1 do
  if JeDelKazSvCif(I) then Write(' , ',I);
 WriteLn(' .');
 Write('==== Enter ====');
 ReadLn;
end.

