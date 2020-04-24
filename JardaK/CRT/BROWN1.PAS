{ Written by GAS }

program Molekula1;

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
  if X<1 then X:=1;
  if Y<1 then Y:=1;
  if X>Lo(WindMax) then X:=Lo(WindMax);
  if Y>Hi(WindMax) then Y:=Hi(WindMax);
  GoToXY(X,Y);
  Write(Mol);
  Delay(50);
  GoToXY(X,Y);
  Write(' ');
 until KeyPressed;
 ReadKey;
end.


