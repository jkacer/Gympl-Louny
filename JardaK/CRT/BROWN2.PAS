{ Written by GAS }

program Molekula2;

uses
      Crt;

const
      Mol = '*';

var
      X,Y:      Byte;
      Cis:      Word;

begin
 X := Lo(WindMax) div 2;
 Y := Hi(WindMax) div 2;

 TextColor(Yellow);
 TextBackGround(Blue);
 ClrScr;

 Randomize;
 repeat
  Cis:=Random(8);
  case Cis of
   0: begin
       Dec(X);
       Dec(Y);
      end;
   1: Dec(Y);
   2: begin
       Inc(X);
       Dec(Y);
      end;
   3: Inc(X);
   4: begin
       Inc(X);
       Inc(Y);
      end;
   5: Inc(Y);
   6: begin
       Dec(X);
       Inc(Y);
      end;
   7: Dec(X);
  end;
  if X<2 then X:=2;
  if Y<2 then Y:=2;
  if X> (Lo(WindMax)-1) then X:=Lo(WindMax)-1;
  if Y> (Hi(WindMax)-1) then Y:=Hi(WindMax)-1;
  GoToXY(X,Y-1);  Write(Mol);
  GoToXY(X-1,Y);  Write(Mol,Mol,Mol);
  GoToXY(X,Y+1);  Write(Mol);

  Delay(50);
  GoToXY(X,Y-1);  Write(' ');
  GoToXY(X-1,Y);  Write('   ');
  GoToXY(X,Y+1);  Write(' ');
 until KeyPressed;
 ReadKey;
end.


