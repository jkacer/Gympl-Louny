program XXX;
{

===========================================================================
==========                                                       ==========
==========              Gama Software 1996                       ==========
==========                                                       ==========
===========================================================================

}

uses Crt,Graph,Grafika;


var
    { Zobrazení }

    GD,GM:   Integer;
    X,Y:     Integer;
    KolikX,
    KolikY:  ShortInt;
    JednX,
    JednY:   Integer;

    Teleso:  T6Sten;
    I:       Byte;
    H,D:     Byte;

begin
 ClrScr;
 Randomize;
 DetectGraph(GD,GM);
 InitGraph(GD,GM,'');
 if GraphResult<>0 then begin
                         WriteLn('Chyba v inicializaci grafiky !');
                         Halt(1);
                        end;
 X:=GetMaxX;
 Y:=GetMaxY;

 { Jako 640x480 }
 KolikX:=12;
 KolikY:=9;

 JednX:=(X div 2) div KolikX;
 JednY:=(Y div 2) div KolikY;

 for I:=1 to 8 do
  begin
   Teleso[I].X:=DejRozsah('X ?',-30,+30,X,Y);
   Teleso[I].Y:=DejRozsah('Y ?',-30,+30,X,Y);
   Teleso[I].Z:=DejRozsah('Z ?',-30,+30,X,Y);
  end;

 H:=DejRozsah('Výška horizontu ?',-5,+5,X,Y);
 D:=DejRozsah('Distance ?',-5,+10,X,Y);

 SetColor(Green);
 SetBkColor(White);

 OsaX(X,Y,Pomalu);
 SipkaX(X,Y);

 OsaY(X,Y,Pomalu);
 SipkaY(X,Y);

 JednotkyX(X,Y,KolikX,JednX,Pomalu);
 JednotkyY(X,Y,KolikY,JednY,Pomalu);

 Kresli6Sten3D(Teleso,H,D,X,Y,JednX,JednY);

 Sound(1000);
 Delay(100);
 NoSound;

 ReadLn;
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1996.');
end.
