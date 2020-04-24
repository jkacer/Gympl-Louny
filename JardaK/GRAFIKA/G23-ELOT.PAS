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
    { Zobrazen¡ }

    GD,GM:   Integer;
    X,Y:     Integer;
    KolikX,
    KolikY:  ShortInt;
    JednX,
    JednY:   Integer;
    Alfa:    Word;

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

 Alfa:=DejRozsah('Zadej £hel - po smØru h.r.',0,360,X,Y);
 SX:=DejRozsah('SX = ?',-KolikX,+KolikX,X,Y);
 SY:=DejRozsah('SY = ?',-KolikY,+KolikY,X,Y);
 A :=DejRozsah('A = ?', 0,KolikX,X,Y);
 B :=DejRozsah('B = ?', 0,KolikY,X,Y);


 JednX:=(X div 2) div KolikX;
 JednY:=(Y div 2) div KolikY;

 SetColor(Green);
 SetBkColor(White);

 OsaX(X,Y,Pomalu);
 SipkaX(X,Y);

 OsaY(X,Y,Pomalu);
 SipkaY(X,Y);

 JednotkyX(X,Y,KolikX,JednX,Pomalu);
 JednotkyY(X,Y,KolikY,JednY,Pomalu);

 Osy_Otoc(X,Y,KolikX,KolikY,JednX,JednY,Alfa);
 Bod_Otoc_Draw('Stýed',SX,SY,Alfa,X,Y,JednX,JednY);
 Elipsa_Otoc(SX,SY,A,B,Alfa,X,Y,JednX,JednY);

 Sound(1000);
 Delay(100);
 NoSound;

 ReadLn;
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1996.');
end.
