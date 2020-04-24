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
    SX1,SY1,
    SX2,SY2,
    SX3,SY3,
    KonSX,
    KonSY,
    R:       Real;

    BX1,BY1,
    BX2,BY2,
    BX3,BY3: ShortInt; { Vrcholy troj. }
    NejMX,
    NejVX,
    NejMY,
    NejVY:   ShortInt;

    PX1,PY1,
    PX2,PY2,
    PX3,PY3: Integer;

    A1,B1,C1,
    A2,B2,C2,
    A3,B3,C3:Real; { Pro ob. rovnice os £seüek troj. }

    K1,K2,K3,
    Q1,Q2,Q3:Real;

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

 DejObecRci(BX1,BY1,BX2,BY2,A1,B1,C1); { AB = 1 }
 DejObecRci(BX1,BY1,BX3,BY3,A2,B2,C2); { AC = 2 }
 DejObecRci(BX2,BY2,BX3,BY3,A3,B3,C3); { BC = 3 }

 K1:=DejSmernici(A1,B1,C1,A2,B2,C2); {AB,AC}
 K2:=DejSmernici(A1,B1,C1,A3,B3,C3); {AB,BC}
 K3:=DejSmernici(A2,B2,C2,A3,B3,C3); {AC,BC}
 Q1:=BY1-(K1*BX1); { Bod A }
 Q2:=BY2-(K2*BX2); { Bod B }
 Q3:=BY3-(K3*BX3); { Bod C }

 Dej_Det_XY(-K1,1,Q1,-K2,1,Q2,SX1,SY1);
 Dej_Det_XY(-K1,1,Q1,-K3,1,Q3,SX2,SY2);
 Dej_Det_XY(-K2,1,Q2,-K3,1,Q3,SX3,SY3);

 NejMX:=BX1;
 if BX2<NejMX then NejMX:=BX2;
 if BX3<NejMX then NejMX:=BX3;
 NejVX:=BX1;
 if BX2>NejVX then NejVX:=BX2;
 if BX3>NejVX then NejVX:=BX3;

 NejMY:=BY1;
 if BY2<NejMY then NejMY:=BY2;
 if BY3<NejMY then NejMY:=BY3;
 NejVY:=BY1;
 if BY2>NejVY then NejVY:=BY2;
 if BY3>NejVY then NejVY:=BY3;

 { Te‘ se najde, kterej ze st˝edÖ leß° mezi nejkrajnÿjÁ°ma
   bodama troj£heln°ku. DalÁ° dva leßej dycky venku. }

 if (SX1>NejMX) and (SX1<NejVX) and
    (SY1>NejMY) and (SY1<NejVY)
   then begin
         KonSX:=SX1;
         KonSY:=SY1;
        end
   else if (SX2>NejMX) and (SX2<NejVX) and
           (SY2>NejMY) and (SY2<NejVY) then begin
                                             KonSX:=SX2;
                                             KonSY:=SY2;
                                            end
                                       else begin
                                             KonSX:=SX3;
                                             KonSY:=SY3;
                                            end;


 Prepocti(KonSX,KonSY,PX2,PY2,X,Y,JednX,JednY);
 ZanesBod('S',PX2,PY2,X,Y);

 SetLineStyle(SolidLn,0,ThickWidth);
 SetColor(Red);

 { Klasickej vÏpoüet vzd†lenosti bodu od p˝°mky
   pomoc° obecnÏ rovnice p˝°mky }
 R:=Abs((KonSX*A1+KonSY*B1+C1)/Sqrt(Sqr(A1)+Sqr(B1)));
 Ellipse(PX2,PY2,0,360,Round(R*JednX),Round(R*JednY));

 Sound(1000);
 Delay(100);
 NoSound;
 ReadLn;
 1:
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1995.');
end.
