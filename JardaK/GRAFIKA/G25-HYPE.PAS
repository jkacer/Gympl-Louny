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

    SX,SY,
    A,B:     ShortInt;
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

 SX:=DejRozsah('SX = ?',-KolikX,+KolikX,X,Y);
 SY:=DejRozsah('SY = ?',-KolikY,+KolikY,X,Y);
 A :=DejRozsah('A = ?', 0,KolikX,X,Y);
 B :=DejRozsah('B = ?', 0,KolikY,X,Y);

 SetColor(Green);
 SetBkColor(White);

 OsaX(X,Y,Pomalu);
 SipkaX(X,Y);

 OsaY(X,Y,Pomalu);
 SipkaY(X,Y);

 JednotkyX(X,Y,KolikX,JednX,Pomalu);
 JednotkyY(X,Y,KolikY,JednY,Pomalu);


 Hyperbola(SX,SY,A,B,X,Y,JednX,JednY);

 Sound(1000);
 Delay(100);
 NoSound;

 ReadLn;
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1996.');
end.
