program XXX;

{

===========================================================================
==========                                                       ==========
==========              Gama Software 1995                       ==========
==========                                                       ==========
===========================================================================

}

uses Crt,Graph,Grafika;

var GD,GM:   Integer;
    X,Y:     Integer;
    KolikX,
    KolikY:  ShortInt;
    JednX,
    JednY:   ShortInt;
    SX,SY,R,
    P,Q:     ShortInt;
    PX1,PY1,
    PX2,PY2: Integer;
    Vzdal:   Real;
    S:       String;
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

 KolikX:=DejRozsah('Kolik jednotek na X ?',5,15,X,Y);
 KolikY:=DejRozsah('Kolik jednotek na Y ?',2,5,X,Y);

 JednX:=(X div 2) div KolikX;
 JednY:=(Y div 2) div KolikY;

 SX:=DejRozsah('Stýed kruhu X ?',-KolikX,KolikX,X,Y);
 SY:=DejRozsah('Stýed kruhu Y ?',-KolikY,KolikY,X,Y);
 R :=DejRozsah('PolomØr kruhu ?',1,KolikY,X,Y);
 P :=DejRozsah('X bodu ?',1,KolikX,X,Y);
 Q :=DejRozsah('Y bodu ?',1,KolikY,X,Y);

 SetColor(Green);
 SetBkColor(White);

 OsaX(X,Y,Pomalu);
 SipkaX(X,Y);

 OsaY(X,Y,Pomalu);
 SipkaY(X,Y);

 JednotkyX(X,Y,KolikX,JednX,Pomalu);
 JednotkyY(X,Y,KolikY,JednY,Pomalu);

 Prepocti(SX,SY,PX1,PY1,X,Y,JednX,JednY);
 ZanesBod('S',PX1,PY1,X,Y);

 Ellipse(PX1,PY1,0,360,JednX*R,JednY*R);

 Prepocti(P,Q,PX2,PY2,X,Y,JednX,JednY);
 ZanesBod('X',PX2,PY2,X,Y);

 SetColor(Blue);
 Line(PX1,PY1,PX2,PY2);

 Vzdal:=Sqrt( Sqr( Abs(SX-P) ) + Sqr( Abs(SY-Q) ) );
{Vzdal:=Vzdal-R;}
 Str(Vzdal-R:3:2,S);
 S:='Vzdalenost '+S;

 OutTextXY(20,20,S);
 if Vzdal>R then Ellipse(PX2,PY2,0,360,Round((Vzdal-R)*JednX),Round((Vzdal-R)*JednY))
            else Ellipse(PX2,PY2,0,360,Round((R-Vzdal)*JednX),Round((R-Vzdal)*JednY));

 Sound(1000);
 Delay(100);
 NoSound;
 ReadLn;
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1995.');
end.
