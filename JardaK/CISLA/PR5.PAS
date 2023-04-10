{ Created by GAS 1996 }

program Priklad5;

uses Prvocis,Crt;

var
      I,Kolik:  Integer;
      N:        Integer;

begin
 ClrScr;
 WriteLn('Program vypíše prvních N prvočísel.');
 repeat
  Write('N ? <1,1000> ');
  ReadLn(N);
 until (N>0) and (N<1001);

 I:=1;
 Kolik:=0;
 repeat
  if Je_Prvoc(I) then begin
                       Write(I,' ');
                       Inc(Kolik);
                      end;
  Inc(I);
 until Kolik>=N;
 ReadLn;
end.

