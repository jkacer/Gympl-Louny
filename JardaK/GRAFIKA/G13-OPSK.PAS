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
    SX,SY,R: Real;

    BX1,BY1,
    BX2,BY2,
    BX3,BY3: ShortInt; { Vrcholy troj. }

    PX1,PY1,
    PX2,PY2,
    PX3,PY3: Integer;

    SX1,SY1,
    SX2,SY2,
    SX3,SY3: Real;

    Det:     Determinant22;
    D,DX,DY: Real;

    A1,B1,C1,
    A2,B2,C2,
    A3,B3,C3:Real; { Pro ob. rovnice os £seüek troj. }

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

 BX1:=DejRozsah('X bodu A ?',-KolikX,KolikX,X,Y);
 BY1:=DejRozsah('Y bodu A ?',-KolikY,KolikY,X,Y);
 BX2:=DejRozsah('X bodu B ?',-KolikX,KolikX,X,Y);
 BY2:=DejRozsah('Y bodu B ?',-KolikY,KolikY,X,Y);
 BX3:=DejRozsah('X bodu C ?',-KolikX,KolikX,X,Y);
 BY3:=DejRozsah('Y bodu C ?',-KolikY,KolikY,X,Y);

 SetTextJustify(CenterText,CenterText);
 SetColor(Green);
 SetBkColor(White);
 SetTextStyle(TriplexFont,HorizDir,3);
 if ( (BX1=BX2) and (BY1=BY2) ) or
    ( (BX1=BX3) and (BY1=BY3) ) or
    ( (BX3=BX2) and (BY3=BY2) ) then
     begin
      OutTextXY(X div 2,Y div 2,'Êpatnÿ zadan† ü°sla !');
      ReadLn;
      GoTo 1;
     end;



 OsaX(X,Y,Pomalu);
 SipkaX(X,Y);

 OsaY(X,Y,Pomalu);
 SipkaY(X,Y);

 JednotkyX(X,Y,KolikX,JednX,Pomalu);
 JednotkyY(X,Y,KolikY,JednY,Pomalu);

 SetColor(Red);
 SetLineStyle(SolidLn,0,ThickWidth);
 Prepocti(BX1,BY1,PX1,PY1,X,Y,JednX,JednY);
 Prepocti(BX2,BY2,PX2,PY2,X,Y,JednX,JednY);
 Prepocti(BX3,BY3,PX3,PY3,X,Y,JednX,JednY);

 Trojuhelnik[1].X:=PX1;
 Trojuhelnik[1].Y:=PY1;
 Trojuhelnik[2].X:=PX2;
 Trojuhelnik[2].Y:=PY2;
 Trojuhelnik[3].X:=PX3;
 Trojuhelnik[3].Y:=PY3;
 FillPoly( SizeOf(Trojuhelnik) div SizeOf(PointType),Trojuhelnik);
 ZanesBod('A',PX1,PY1,X,Y);
 ZanesBod('B',PX2,PY2,X,Y);
 ZanesBod('C',PX3,PY3,X,Y);

 DejStred(BX1,BY1,BX2,BY2,SX1,SY1);
 DejStred(BX1,BY1,BX3,BY3,SX2,SY2);
 DejStred(BX3,BY3,BX2,BY2,SX3,SY3);

 Prepocti(SX1,SY1,PX1,PY1,X,Y,JednX,JednY);
 Prepocti(SX2,SY2,PX2,PY2,X,Y,JednX,JednY);
 Prepocti(SX3,SY3,PX3,PY3,X,Y,JednX,JednY);

 ZanesBod('S1',PX1,PY1,X,Y);
 ZanesBod('S2',PX2,PY2,X,Y);
 ZanesBod('S3',PX3,PY3,X,Y);

 OsaUsecky(BX1,BY1,BX2,BY2,Blue,KolikX,X,Y,JednX,JednY);
 OsaUsecky(BX1,BY1,BX3,BY3,Blue,KolikX,X,Y,JednX,JednY);
 OsaUsecky(BX3,BY3,BX2,BY2,Blue,KolikX,X,Y,JednX,JednY);

 A1:=BX2-BX1;
 A2:=BX3-BX1;
 A3:=BX3-BX2;

 B1:=BY2-BY1;
 B2:=BY3-BY1;
 B3:=BY3-BY3;

 C1:=-A1*SX1-B1*SY1;
 C2:=-A2*SX2-B2*SY2;
 C3:=-A3*SX3-B3*SY3;

 { V determinantu se poü°t† jenom se 2 stranama troj. }
 Det[1,1]:=A1;
 Det[1,2]:=B1;
 Det[2,1]:=A2;
 Det[2,2]:=B2;

 D:=Dej_Det22(Det);

 Det[1,1]:=-C1;
 Det[2,1]:=-C2;

 DX:=Dej_Det22(Det);

 Det[1,1]:=A1;
 Det[1,2]:=-C1;
 Det[2,1]:=A2;
 Det[2,2]:=-C2;

 DY:=Dej_Det22(Det);

 SX:=DX/D;
 SY:=DY/D;

 { Vypoü°t†v† se jenom z 1 bodu - A }

 R:=Sqrt( Sqr(BX1-SX) + Sqr(BY1-SY) );

 SetLineStyle(SolidLn,0,ThickWidth);
 SetColor(Red);

 Prepocti(SX,SY,PX1,PY1,X,Y,JednX,JednY);
 Ellipse(PX1,PY1,0,360,Round(R*JednX),Round(R*JednY));

 Sound(1000);
 Delay(100);
 NoSound;
 ReadLn;
 1:
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1995.');
end.
