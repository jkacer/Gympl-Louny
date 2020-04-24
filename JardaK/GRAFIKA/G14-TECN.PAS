program XXX;

{

===========================================================================
==========                                                       ==========
==========              Gama Software 1995                       ==========
==========                                                       ==========
===========================================================================

}

uses Crt,Graph,Grafika;

label 1;

var GD,GM:   Integer;
    X,Y:     Integer;
    KolikX,
    KolikY:  ShortInt;
    JednX,
    JednY:   ShortInt;
    SX,SY,R,           { P…vodn¡ kru§nice }
    P,Q:     ShortInt; { Bod X }
    PomX,
    PomY,
    PomR:    Real;     { Data Thaletovy kru§nice }
    PX1,PY1,
    PX2,PY2: Integer;
    Vzdal:   Real;
    S:       String;

    AA,BB,CC:Real;     { Pro kvadr. rovnici }
    T,U:     Real;     { Pomocn‚ promn. pro kvad. rci }
    X1,X2,             { Body dotyku }
    Y1,Y2:   Real;

    A1,B1,C1,
    A2,B2,C2:Real;
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
 P :=DejRozsah('X bodu ?',-KolikX,KolikX,X,Y);
 Q :=DejRozsah('Y bodu ?',-KolikY,KolikY,X,Y);

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
 Vzdal:=Vzdal-R;
 if Vzdal<=0 then S:='Bod nelezi vne.'
             else begin
                   Str(Vzdal:3:2,S);
                   S:='Vzdalenost '+S;
                  end;
 OutTextXY(20,20,S);
 if Vzdal<=0 then GoTo 1;
 Primka(P,Q,SX,SY,Blue,KolikX,X,Y,JednX,JednY);
 Vzdal:=Vzdal+R;
 DejStred(SX,SY,P,Q,PomX,PomY);
 PomR:=Sqrt( Sqr(SX-PomX) + Sqr(SY-PomY) );

 { NaplnØn¡ hodnot do obecnìch rovnic kru§nic }
 A1:=-2*SX;
 B1:=-2*SY;
 C1:=Sqr(SX)+Sqr(SY)-Sqr(R);

 A2:=-2*PomX;
 B2:=-2*PomY;
 C2:=Sqr(PomX)+Sqr(PomY)-Sqr(PomR);

 { NaplnØn¡ T,U,AA,BB,CC - kvadr. rce }
 T:=(B2-B1)/(A1-A2);
 U:=(C2-C1)/(A1-A2);

 AA:=Sqr(T)+1;
 BB:=(2*T*U)+(A1*T)+B1;
 CC:=(A1*U)+C1+Sqr(U);

 { VìpoŸet X a Y }
 Y1:=(-BB+Sqrt(Sqr(BB)-4*AA*CC))/(2*AA);
 Y2:=(-BB-Sqrt(Sqr(BB)-4*AA*CC))/(2*AA);
 X1:=(T*Y1)+U;
 X2:=(T*Y2)+U;

 SetLineStyle(SolidLn,0,ThickWidth);
 SetColor(Blue);

 Primka(P,Q,X1,Y1,Blue,KolikX,X,Y,JednX,JednY);
 Primka(P,Q,X2,Y2,Blue,KolikX,X,Y,JednX,JednY);
 Prepocti(X1,Y1,PX1,PY1,X,Y,JednX,JednY);
 Prepocti(P,Q,PX2,PY2,X,Y,JednX,JednY);
 ZanesBod('P1',PX1,PY1,X,Y);
 Line(PX1,PY1,PX2,PY2);

 Prepocti(X2,Y2,PX1,PY1,X,Y,JednX,JednY);
 ZanesBod('P2',PX1,PY1,X,Y);
 Line(PX1,PY1,PX2,PY2);

 1:
 Sound(1000);
 Delay(100);
 NoSound;
 ReadLn;
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1995.');
end.
