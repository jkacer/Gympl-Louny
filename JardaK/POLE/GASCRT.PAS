{ Created by GAS 1995 }

unit GasCrt;

interface

uses Crt,Dos;

const
      NePip = False;
      JoPip = True;

      NeMez = False;
      JoMez = True;

procedure Ramecek(X1,Y1,X2,Y2:Byte;S:String;BCelek,BRam,BVnit:Byte;Vypln:Char);
procedure Desktop(Popredi,Pozadi:Byte;Znak:Char);
procedure KusDesktopu(X1,Y1,X2,Y2,Popredi,Pozadi:Byte;Znak:Char);

procedure Pis(S:String;Mezery,Pipat:Boolean);

implementation

procedure Ramecek(X1,Y1,X2,Y2:Byte;S:String;BCelek,BRam,BVnit:Byte;Vypln:Char);
var I,J:Byte;
begin
 if ( (X2-X1)<3 ) then Exit;
 TextBackGround(BCelek);
 Window(X1+1,Y1+1,X2-1,Y2-1);
 ClrScr;
 Window(1,1,80,25);
 TextColor(BRam);
 GoToXY(X1,Y1); Write('╔');
 GoToXY(X2,Y1); Write('╗');
 GoToXY(X1,Y2); Write('╚');
 GoToXY(X2,Y2); Write('╝');
 for I:=X1+1 to X2-1 do
  begin
   GoToXY(I,Y1);
   Write('═');
   GoToXY(I,Y2);
   Write('═');
  end;
 for I:=Y1+1 to Y2-1 do
  begin
   GoToXY(X1,I);
   Write('║');
   GoToXY(X2,I);
   Write('║');
  end;
 if Length(S)>(X2-X1-3) then Delete(S,X2-X1-2,Length(S)-(X2-X1-1)+2);
 S:=' '+S+' ';
 if Odd(X2-X1) then GoToXY( (X1+((X2-X1) div 2))-(Length(S) div 2)+1,Y1)
               else GoToXY( (X1+((X2-X1) div 2))-(Length(S) div 2),Y1);
 Write(S);
 TextColor(BVnit);
 for I:=X1+1 to X2-1 do
  for J:=Y1+1 to Y2-1 do
   begin
    GoToXY(I,J);
    Write(Vypln);
   end;
end; { procedure Ramecek }

procedure Desktop(Popredi,Pozadi:Byte;Znak:Char);
var S:String;
    I:Byte;
begin
 TextBackGround(Pozadi);
 TextColor(Popredi);
 ClrScr;
 S:=' ';
 for I:=1 to 78 do
  S:=S+Znak;
 for I:=2 to 24 do
  begin
   GoToXY(1,I);
   Write(S);
  end;
 GoToXY(17,25);
 Write('A Product of Gama Software, Ltd. (c) 1995');
end; { procedure Desktop }

procedure KusDesktopu(X1,Y1,X2,Y2,Popredi,Pozadi:Byte;Znak:Char);
var S:String;
    I:Byte;
begin
 TextBackGround(Pozadi);
 TextColor(Popredi);
 S:='';
 for I:=X1 to X2 do
  S:=S+Znak;
 for I:=Y1 to Y2 do
  begin
   GoToXY(X1,I);
   Write(S);
  end;
end; { procedure KusDesktopu }

procedure Pis(S:String;Mezery,Pipat:Boolean);
var I:  Byte;
begin
 for I:=1 to Length(S) do
  begin
   Write(S[I]);
   if Mezery then Write(' ');
   if Pipat and (S[I]<>' ') then begin
                                  Sound(250); Delay(20);
                                  NoSound;
                                  Delay(70);
                                 end;
  end;
 WriteLn;
end; { Pis }



end. { unit GasCrt }

