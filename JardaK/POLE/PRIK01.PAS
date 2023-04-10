{ Created by GAS 1995 }
{
  Nalezněte všechna přir. čísla menší než dané N,
  která jsou dělitelná každou svou cifrou.
}
program XXX;

uses Crt,Matika;

var N:Integer;
    I:Integer;

begin
 ClrScr;
 WriteLn('Budou vypsána všechna čísla menší než N,');
 WriteLn('která jsou dělitelná každou svou cifrou.');
 Write('N ? ');
 ReadLn(N);
 Write('1');
 for I:=2 to N-1 do
  if JeDelKazSvCif(I) then Write(' , ',I);
 WriteLn(' .');
 Write('==== Enter ====');
 ReadLn;
end.

