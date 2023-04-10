unit Hodiny;
{

===========================================================================
==========                                                       ==========
==========              Gama Software 1995                       ==========
==========                                                       ==========
===========================================================================

}

Interface

uses Crt,Graph,Graph3,Dos,Grafika;

procedure Je_Zmena(var Hour,Minute,Second:Word;var BH,BM,BS:Boolean);

procedure Dej_Poz_HaM(KolikH,KolikM:Word;var PozXH,PozYH,PozXM,PozYM:Real);
procedure Dej_Poz_Sec(KolikS:Word;var PozXS,PozYS:Real);

procedure SmazH(PozX,PozY:Real;X,Y:Integer;JednX,JednY:ShortInt);
procedure SmazM(PozX,PozY:Real;X,Y:Integer;JednX,JednY:ShortInt);
procedure SmazS(PozX,PozY:Real;X,Y:Integer;JednX,JednY:ShortInt);
procedure NakresliH(PozX,PozY:Real;X,Y:Integer;JednX,JednY:ShortInt);
procedure NakresliM(PozX,PozY:Real;X,Y:Integer;JednX,JednY:ShortInt);
procedure NakresliS(PozX,PozY:Real;X,Y:Integer;JednX,JednY:ShortInt);

procedure Cifernik(X,Y:Integer;JednX,JednY:ShortInt);

Implementation

procedure Je_Zmena(var Hour,Minute,Second:Word;var BH,BM,BS:Boolean);
var PHour,
    PMinute,
    PSecond,
    PS100:   Word;
begin
 GetTime(PHour,PMinute,PSecond,PS100);
 BH:=False;
 BM:=False;
 BS:=False;
 if PHour<>Hour then begin
                      Hour:=PHour;
                      BH:=True;
                     end;
 if PMinute<>Minute then begin
                          Minute:=PMinute;
                          BM:=True;
                         end;
 if PSecond<>Second then begin
                          Second:=PSecond;
                          BS:=True;
                         end;
end;

procedure Dej_Poz_HaM(KolikH,KolikM:Word;var PozXH,PozYH,PozXM,PozYM:Real);
var R,Uhel:Real;
begin
 R:=3;

 if KolikH>=12 then KolikH:=KolikH-12;

 Uhel:=(PI*KolikH*30)/180;
 Uhel:=Uhel+(PI*KolikM/2)/180; { 30 min. = 15 stupňů na velký }
 PozXH:=(R-1)*Sin(Uhel);
 PozYH:=(R-1)*Cos(Uhel);

 Uhel:=(PI*KolikM*6)/180;
 PozXM:=R*Sin(Uhel);
 PozYM:=R*Cos(Uhel);

end; { procedure Dej_Poz_HaM }

procedure Dej_Poz_Sec(KolikS:Word;var PozXS,PozYS:Real);
var R,Uhel:Real;
begin
 R:=3;

 Uhel:=(PI*KolikS*6)/180;
 PozXS:=R*Sin(Uhel);
 PozYS:=R*Cos(Uhel);
end; { procedure Dej_Poz_Sec }

procedure SmazH(PozX,PozY:Real;X,Y:Integer;JednX,JednY:ShortInt);
var PX,PY,BX,BY:Integer;
begin
 Prepocti(0,0,PX,PY,X,Y,JednX,JednY);
 Prepocti(PozX,PozY,BX,BY,X,Y,JednX,JednY);
 SetColor(GetBkColor);
 SetLineStyle(SolidLn,0,ThickWidth);
 Line(PX,PY,BX,BY);
end;

procedure SmazM(PozX,PozY:Real;X,Y:Integer;JednX,JednY:ShortInt);
var PX,PY,BX,BY:Integer;
begin
 Prepocti(0,0,PX,PY,X,Y,JednX,JednY);
 Prepocti(PozX,PozY,BX,BY,X,Y,JednX,JednY);
 SetColor(GetBkColor);
 SetLineStyle(SolidLn,0,ThickWidth);
 Line(PX,PY,BX,BY);
end;

procedure SmazS(PozX,PozY:Real;X,Y:Integer;JednX,JednY:ShortInt);
var PX,PY,BX,BY:Integer;
begin
 Prepocti(0,0,PX,PY,X,Y,JednX,JednY);
 Prepocti(PozX,PozY,BX,BY,X,Y,JednX,JednY);
 SetColor(GetBkColor);
 SetLineStyle(SolidLn,0,NormWidth);
 Line(PX,PY,BX,BY);
end;

procedure NakresliH(PozX,PozY:Real;X,Y:Integer;JednX,JednY:ShortInt);
var PX,PY,BX,BY:Integer;
begin
 Prepocti(0,0,PX,PY,X,Y,JednX,JednY);
 Prepocti(PozX,PozY,BX,BY,X,Y,JednX,JednY);
 SetLineStyle(SolidLn,0,ThickWidth);
 SetColor(Red);
 Line(PX,PY,BX,BY);
end;

procedure NakresliM(PozX,PozY:Real;X,Y:Integer;JednX,JednY:ShortInt);
var PX,PY,BX,BY:Integer;
begin
 Prepocti(0,0,PX,PY,X,Y,JednX,JednY);
 Prepocti(PozX,PozY,BX,BY,X,Y,JednX,JednY);
 SetLineStyle(SolidLn,0,ThickWidth);
 SetColor(Green);
 Line(PX,PY,BX,BY);
end;

procedure NakresliS(PozX,PozY:Real;X,Y:Integer;JednX,JednY:ShortInt);
var PX,PY,BX,BY:Integer;
begin
 Prepocti(0,0,PX,PY,X,Y,JednX,JednY);
 Prepocti(PozX,PozY,BX,BY,X,Y,JednX,JednY);
 SetLineStyle(SolidLn,0,NormWidth);
 SetColor(DarkGray);
 Line(PX,PY,BX,BY);
end;

procedure Cifernik(X,Y:Integer;JednX,JednY:ShortInt);
var R,PozX,PozY,
    Uhel:       Real;
    I,BX,BY:    Integer;
    S1,S2:      String[10];
    Yr,M,D,DoW: Word;
begin
 R:=3.5;
 SetColor(White);
 SetLineStyle(SolidLn,0,NormWidth);
 SetFillStyle(1,LightGreen);
 for I:=0 to 11 do
  begin
   Uhel:=(PI*I*30)/180;
   PozX:=R*Sin(Uhel);
   PozY:=R*Cos(Uhel);
   Prepocti(PozX,PozY,BX,BY,X,Y,JednX,JednY);
   Line(BX-5,BY,BX,BY-5);
   Line(BX,BY-5,BX+5,BY);
   Line(BX+5,BY,BX,BY+5);
   Line(BX,BY+5,BX-5,BY);
   FloodFill(BX,BY,White);
  end;
 SetFillStyle(1,White);
 for I:=0 to 59 do
  if (I mod 5)<>0 then begin
                        Uhel:=(PI*I*6)/180;
                        PozX:=R*Sin(Uhel);
                        PozY:=R*Cos(Uhel);
                        Prepocti(PozX,PozY,BX,BY,X,Y,JednX,JednY);
                        Line(BX-2,BY,BX,BY-2);
                        Line(BX,BY-2,BX+2,BY);
                        Line(BX+2,BY,BX,BY+2);
                        Line(BX,BY+2,BX-2,BY);
                        FloodFill(BX,BY,White);
                       end;
 SetTextJustify(CenterText,TopText);
 SetTextStyle(SmallFont,HorizDir,7);
 OutTextXY(X div 2,0,'Gama Software - Gympl Louny');
 SetTextJustify(CenterText,BottomText);
 GetDate(Yr,M,D,DoW);
 Str(D,S1);
 S1:=S1+'.';
 Str(M,S2);
 S1:=S1+S2+'.';
 Str(Yr,S2);
 S1:=S1+S2;
 OutTextXY(X div 2,Y-5,S1);
end;

end. { unit Hodiny }


