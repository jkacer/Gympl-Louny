{

Nakreslete kruhovÇ hodiny s ruüiükami ukazuj°c°mi üas, kt. je zad†n.
Pozmÿnÿno na systÇmovÏ üas.

}



program XXX;
{

===========================================================================
==========                                                       ==========
==========              Gama Software 1995                       ==========
==========                                                       ==========
===========================================================================

}

uses Crt,Dos,Graph,Grafika,Hodiny;

var GD,GM:   Integer;
    X,Y:     Integer;
    KolikX,
    KolikY:  ShortInt;
    JednX,
    JednY:   Integer;

    ZmenaH,
    ZmenaM,
    ZmenaS:  Boolean;
    Konec:   Boolean;

    Hour,
    Minute,
    Second,
    S100:    Word;

    XHour,
    YHour,
    XMin,
    YMin,
    XSec,
    YSec:    Real;

    Znak:    Char;
    Soub:    SearchRec;

begin
 FindFirst('litt.chr',Archive,Soub);
 if DosError<>0 then begin
                      WriteLn('Nenalezen soubor LITT.CHR !');
                      Halt(1);
                     end;
 DetectGraph(GD,GM);
 InitGraph(GD,GM,'');
 if GraphResult<>0 then begin
                         WriteLn('Chyba v inicializaci grafiky !');
                         Halt(1);
                        end;
 X:=GetMaxX;
 Y:=GetMaxY;

 KolikX:=6;
 KolikY:=4;

 JednX:=(X div 2) div KolikX;
 JednY:=(Y div 2) div KolikY;

 SetBkColor(LightGray);
 ClearDevice;

 Cifernik(X,Y,JednX,JednY);

 GetTime(Hour,Minute,Second,S100);
 Dej_Poz_HaM(Hour,Minute,XHour,YHour,XMin,YMin);
 Dej_Poz_Sec(Second,XSec,YSec);
 NakresliH(XHour,YHour,X,Y,JednX,JednY);
 NakresliM(XMin,YMin,X,Y,JednX,JednY);
 NakresliS(XSec,YSec,X,Y,JednX,JednY);

 Konec:=False;
 repeat
  if KeyPressed then Konec:=True;
  Je_Zmena(Hour,Minute,Second,ZmenaH,ZmenaM,ZmenaS);
  if ZmenaS then begin
                  SmazS(XSec,YSec,X,Y,JednX,JednY);
                  Dej_Poz_Sec(Second,XSec,YSec);
                  NakresliS(XSec,YSec,X,Y,JednX,JednY);
                  if (Minute+1)=Second then begin
                                             NakresliM(XMin,YMin,X,Y,JednX,JednY);
                                             NakresliH(XHour,YHour,X,Y,JednX,JednY);
                                            end;
                  if (Abs((Round(Hour+(Minute/12))*5)-Second)<2) or
                     (Abs((Round((Hour-12)+(Minute/12))*5)-Second)<2) then NakresliH(XHour,YHour,X,Y,JednX,JednY);
                  if ((Hour=0)or(Hour=12)) and (Minute=0) and
                     (Second=1) then begin
                                      ClearDevice;
                                      Cifernik(X,Y,JednX,JednY);
                                      NakresliM(XMin,YMin,X,Y,JednX,JednY);
                                      NakresliH(XHour,YHour,X,Y,JednX,JednY);
                                     end;
                 end;
  if ZmenaH or ZmenaM then begin
                            SmazH(XHour,YHour,X,Y,JednX,JednY);
                            SmazM(XMin,YMin,X,Y,JednX,JednY);
                            Dej_Poz_HaM(Hour,Minute,XHour,YHour,XMin,YMin);
                            NakresliM(XMin,YMin,X,Y,JednX,JednY);
                            NakresliH(XHour,YHour,X,Y,JednX,JednY);
                           end;
 until Konec;
 Znak:=ReadKey;
 CloseGraph;
 WriteLn(' (c) Gama Software 1995.');
end.






