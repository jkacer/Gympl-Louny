{ Written by GAS }

program Ptakovina;

uses
      Crt;

const
      Name : string = 'The Big Boss K Ÿula';

var
      I:        Byte;
      F,B:      Byte;
      Poc:      Byte;

begin
 TextColor(White);
 TextBackGround(Black);
 ClrScr;

 Randomize;
 Poc := 40 - ( Length(Name) div 2 );
 GoToXY(Poc,12);

 for I:=1 to Length(Name) do
  begin
   TextBackGround(Random(15));
   TextColor(Random(15));
   Write(Name[I]);
   Sound(500); Delay(10); NoSound; Delay(500);
  end;

 Sound(050); Delay(50);
 Sound(100); Delay(50);
 Sound(200); Delay(50);
 Sound(300); Delay(50);
 Sound(350); Delay(50);
 Sound(450); Delay(50);
 Sound(700); Delay(150);
 NoSound;

 TextColor(White);
 TextBackGround(Red);
 ClrScr;

 for I:=12 downto 1 do
  begin
   GoToXY(Poc,I);
   Write(Name);
   Delay(100);
   GoToXY(Poc,I);
   Write('                   ');
  end;

 TextColor(White);
 TextBackGround(Black);
 ClrScr;
end.


