{ Created by GAS 1995 }
{
 Nalezn�te v�echny PYTHAGOREJSK� troj�heln�ky,
 jejich� v�echny 3 strany jsou men� ne� dan� N.
}

program XXX;

uses Crt,Matika;

var I,J,K:Integer;
    N:    Integer;

begin
 ClrScr;
 WriteLn('Budou vyps�ny v�echny pythagorejsk� troj�heln�ky,');
 WriteLn('jejich� v�echny 3 strany jsou men� ne� N.');
 Write('N ? (max. 32767) ');
 ReadLn(N);

 for I:=1 to N-1 do
  for J:=1 to N-1 do
   for K:=1 to N-1 do
    if JePythagTrojuh(I,J,K) then WriteLn('A=',I,' B=',J,' C=',K);

 WriteLn('==== Enter ====');
 ReadLn;
end.


