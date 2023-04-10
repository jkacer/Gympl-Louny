unit Com_Grph;
{

===========================================================================
==========                                                       ==========
==========              Gama Software 1996                       ==========
==========            vytaženo z GRAFIKA.PAS                     ==========
===========================================================================

}

interface

uses
      Crt,Graph;

const
      g_OK      = 0;
      g_Chyba   = 1;

var
      MaxX,MaxY:        Integer;
      KolikX,
      KolikY:           Byte;
      JednX,
      JednY:            Integer;


function  Com_Grph_Init(Kolik:Real):Byte;
procedure Com_Grph_Done;

procedure Pip;
procedure Prepocti(NX,NY:Real;var PNX,PNY:Integer);
procedure ZanesBod(S:string;PX,PY:Real);

implementation

procedure Pip;
begin
 Sound(50); Delay(100); NoSound;
end;

function Com_Grph_Init(Kolik:Real):Byte;
var
      GD,GM:    Integer;
      I:        Integer;
      S:        string[3];
      AspX,
      AspY:     Word;
begin
 DetectGraph(GD,GM);
 InitGraph(GD,GM,'');
 if GraphResult <> grOK then begin
                              WriteLn('Chyba v inicializaci grafiky !');
                              WriteLn('Patrně nenalezen soubor *.BGI');
                              Com_Grph_Init := g_Chyba;
                              Exit;
                             end;

 MaxX     := GetMaxX;
 MaxY     := GetMaxY;

 GetAspectRatio(AspX,AspY);
 KolikX   := Trunc(Kolik*(AspX/AspY)) +1;
 KolikY   := Trunc(Kolik)             +1;

 JednX    := Trunc( (MaxX div 2) / KolikX );
 JednY    := Trunc( (MaxY div 2) / KolikY );

 SetBkColor(White);
 SetColor(Green);
 ClearDevice;

 Line(0,MaxY div 2,MaxX,MaxY div 2);
 Line(MaxX div 2,0,MaxX div 2,MaxY);

 SetTextStyle(DefaultFont,HorizDir,1);
 SetTextJustify(CenterText,CenterText);

 for I:=1 to KolikX do
  begin
   Line( (MaxX div 2)+(I*JednX),(MaxY div 2)-5,
         (MaxX div 2)+(I*JednX),(MaxY div 2)+5 );
   Line( (MaxX div 2)-(I*JednX),(MaxY div 2)-5,
         (MaxX div 2)-(I*JednX),(MaxY div 2)+5 );
   Str(I,S);
   OutTextXY( (MaxX div 2)+(I*JednX),(MaxY div 2)+15,S);
   S:='-'+S;
   OutTextXY( (MaxX div 2)-(I*JednX),(MaxY div 2)+15,S);
  end;

 for I:=1 to KolikY do
  begin
   Line( (MaxX div 2)-5,(MaxY div 2)-(I*JednY),
         (MaxX div 2)+5,(MaxY div 2)-(I*JednY) );
   Line( (MaxX div 2)-5,(MaxY div 2)+(I*JednY),
         (MaxX div 2)+5,(MaxY div 2)+(I*JednY) );
   Str(I,S);
   OutTextXY( (MaxX div 2)+15,(MaxY div 2)-(I*JednY),S);
   S:='-'+S;
   OutTextXY( (MaxX div 2)+15,(MaxY div 2)+(I*JednY),S);
  end;
 Com_Grph_Init := g_OK;
end;

procedure Prepocti(NX,NY:Real;var PNX,PNY:Integer);
begin
 PNX:=(MaxX div 2)+Round(NX*JednX);
 PNY:=(MaxY div 2)-Round(NY*JednY);
end;

procedure ZanesBod(S:string;PX,PY:Real);
var
      KamX,KamY:        Integer;
begin
 Prepocti(PX,PY,KamX,KamY);
 SetTextStyle(DefaultFont,HorizDir,1);
 SetTextJustify(LeftText,BottomText);
 SetColor(Blue);
 {
 SetLineStyle(DottedLn,0,NormWidth);
 Line(PX,PY,X div 2,PY);
 Line(PX,PY,PX,Y div 2);
 }
 SetColor(Red);
 SetLineStyle(SolidLn,0,ThickWidth);
 Line(KamX-5,KamY-5,KamX+5,KamY+5);
 Line(KamX+5,KamY-5,KamX-5,KamY+5);
 OutTextXY(KamX+10,KamY-5,S);
end;

procedure Com_Grph_Done;
begin
 CloseGraph;
 TextColor(White);
 TextBackGround(Black);
 ClrScr;
 WriteLn('(c) Gama Software 1996.');
 WriteLn('Kačer & Hofmann = The best software for everybody.');
 NoSound;
 Delay(500);
end;

begin { unit Com_Grph }
end.  { unit Com_Grph }

