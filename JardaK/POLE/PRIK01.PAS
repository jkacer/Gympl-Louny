{ Created by GAS 1995 }
{
  NaleznØte vçechna pýir. Ÿ¡sla menç¡ ne§ dan‚ N,
  kter  jsou dØliteln  ka§dou svou cifrou.
}
program XXX;

uses Crt,Matika;

var N:Integer;
    I:Integer;

begin
 ClrScr;
 WriteLn('Budou vyps na vçechna Ÿ¡sla menç¡ ne§ N,');
 WriteLn('kter  jsou dØliteln  ka§dou svou cifrou.');
 Write('N ? ');
 ReadLn(N);
 Write('1');
 for I:=2 to N-1 do
  if JeDelKazSvCif(I) then Write(' , ',I);
 WriteLn(' .');
 Write('==== Enter ====');
 ReadLn;
end.

