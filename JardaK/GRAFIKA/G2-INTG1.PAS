program XXX;
{

===========================================================================
==========                                                       ==========
==========              Gama Software 1995                       ==========
==========                                                       ==========
===========================================================================

}

uses Crt,Graph,Grafika;


var
    { Zobrazen° }

    GD,GM:   Integer;
    X,Y:     Integer;
    KolikX,
    KolikY:  ShortInt;
    JednX,
    JednY:   Integer;
    Min,Max: ShortInt;
    RX1,RY1: Real;
    RX2,RY2: Real;
    PX1,PY1: Integer;
    PX2,PY2: Integer;
    Dilek:   Real;
    KolikD:  Integer;
    TX1,TX2,
    TYS:     Integer;

    { VÏpoüet }

    H:       Real;
    Suma:    Real;
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
 Min:=DejRozsah('Od kolika ?',-KolikX,KolikX-2,X,Y);
 Max:=DejRozsah('Do kolika ?',Min+1,KolikX,X,Y);
 KolikD:=DejRozsah('Kolik dilku na vypocet ?',1,20000,X,Y);

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

 Sinusoida(X,Y,JednX,JednY,KolikX,KolikY,Pomalu);

 if (Max*Min)>0 then H:=Abs( (Abs(Max)-Abs(Min))/KolikD )
                else H:=Abs( (Abs(Max)+Abs(Min))/KolikD );

 SetColor(Red);
 SetLineStyle(SolidLn,0,NormWidth);
 SetFillStyle(5,Blue);
 Suma:=0;
 RX1:=Min;
 repeat
  RX2:=RX1+H;
  if RX2<=Max then Suma:=Suma+Abs( (H*Sin( (RX1+RX2)/2) ) );

  Prepocti(RX1,0,TX1,PY1,X,Y,JednX,JednY);
  Prepocti(RX2,0,TX2,PY1,X,Y,JednX,JednY);
  Prepocti(0,Sin( RX1+((RX2-RX1)/2) ),PX1,TYS,X,Y,JednX,JednY);

  Ctyruhelnik[1].X:=TX1;
  Ctyruhelnik[1].Y:=Y div 2;
  Ctyruhelnik[2].X:=TX1;
  Ctyruhelnik[2].Y:=TYS;
  Ctyruhelnik[3].X:=TX2;
  Ctyruhelnik[3].Y:=TYS;
  Ctyruhelnik[4].X:=TX2;
  Ctyruhelnik[4].Y:=Y div 2;
  FillPoly( SizeOf(Ctyruhelnik) div SizeOf(PointType),Ctyruhelnik);

  RX1:=RX2;
 until RX2>=Max;
 SetColor(Red);
 Str(Suma,S);
 S:='Celkem:'+S;
 SetTextJustify(BottomText,LeftText);
 SetTextStyle(DefaultFont,HorizDir,1);
 OutTextXY(10,Y,S);

 Sound(1000);
 Delay(100);
 NoSound;

 ReadLn;
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1995.');
end.
