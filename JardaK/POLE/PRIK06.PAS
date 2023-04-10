{ Created by GAS 1995 }
{
 Nalezněte všechny PYTHAGOREJSKÉ trojúhelníky,
 jejichž všechny 3 strany jsou menší než dané N.
}

program XXX;

uses Crt,Matika;

var I,J,K:Integer;
    N:    Integer;

begin
 ClrScr;
 WriteLn('Budou vypsány všechny pythagorejské trojúhelníky,');
 WriteLn('jejichž všechny 3 strany jsou menší než N.');
 Write('N ? (max. 32767) ');
 ReadLn(N);

 for I:=1 to N-1 do
  for J:=1 to N-1 do
   for K:=1 to N-1 do
    if JePythagTrojuh(I,J,K) then WriteLn('A=',I,' B=',J,' C=',K);

 WriteLn('==== Enter ====');
 ReadLn;
end.


