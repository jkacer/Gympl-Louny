program XXX;
{$R-}
{

===========================================================================
==========                                                       ==========
==========              Gama Software 1995                       ==========
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
    RX1,RY1: Real;
    RX2,RY2: Real;
    PX1,PY1: Integer;
    PX2,PY2: Integer;
    Dilek:   Real;
    A,B:     Real;
    KolikB,I:Byte;
    Body:    BodyInter;
    S1,S2:   String;
    Rozdil:  Real;
    PRozX,
    PRozY:   Integer;
    MX,MY:   Real;
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
 KolikY:=DejRozsah('Kolik jednotek na Y ?',5,10,X,Y);

 JednX:=(X div 2) div KolikX;
 JednY:=(Y div 2) div KolikY;

 KolikB:=DejRozsah('Kolik bodu ?',2,15,X,Y);

 for I:=0 to KolikB-1 do
  begin
   Str(I,S1);
   S1:='X'+S1+' ?';
   Body[I].X:=DejRozsah(S1,-KolikX,KolikX,X,Y);
   Str(I,S1);
   S1:='Y'+S1+' ?';
   Body[I].Y:=DejRozsah(S1,-KolikY,KolikY,X,Y);
  end;

 MX:=DejRozsah('Pro kter‚ X ?',-50,50,X,Y);
 DejKoefAB(KolikB,Body,A,B);

 SetColor(Green);
 SetBkColor(White);

 OsaX(X,Y,Pomalu);
 SipkaX(X,Y);

 OsaY(X,Y,Pomalu);
 SipkaY(X,Y);

 JednotkyX(X,Y,KolikX,JednX,Pomalu);
 JednotkyY(X,Y,KolikY,JednY,Pomalu);

 SetColor(Red);
 SetLineStyle(SolidLn,0,ThickWidth);

 for I:=0 to KolikB-1 do
  begin
   Prepocti(Body[I].X,Body[I].Y,PX1,PY1,X,Y,JednX,JednY);
   Str(I,S1);
   S1:='Bod '+S1;
   ZanesBod(S1,PX1,PY1,X,Y);
   Pip;
   Delay(100);
  end;

 SetColor(Red);
 Dilek:=(2*KolikX)/1000;
 RX1:=-KolikX;
 RY1:=(A*RX1)+B;
 Prepocti(RX1,RY1,PX1,PY1,X,Y,JednX,JednY);
 MoveTo(PX1,PY1);
 repeat
  RX2:=RX1+Dilek;
  RY2:=(A*RX2)+B;
  Prepocti(RX2,RY2,PX2,PY2,X,Y,JednX,JednY);
  Line(PX1,PY1,PX2,PY2);
  RX1:=RX2;
  RY1:=RY2;
  Prepocti(RX1,RY1,PX1,PY1,X,Y,JednX,JednY);
 until RX2>KolikX;

 SetWriteMode(ORPut);
 SetColor(Red);
 SetLineStyle(SolidLn,0,NormWidth);
 SetFillStyle(6,Blue);
 for I:=0 to KolikB-1 do
  begin
   Prepocti(Body[I].X,Body[I].Y,PX1,PY1,X,Y,JednX,JednY);
   Prepocti(Body[I].X,(A*Body[I].X)+B,PX2,PY2,X,Y,JednX,JednY);

   if (Body[I].Y) * (A* (Body[I].X) +B )  > 0
    then Rozdil:=Abs(Abs(Body[I].Y)-Abs(A*(Body[I].X)+B))
    else Rozdil:=Abs(Abs(Body[I].Y)+Abs(A*(Body[I].X)+B));
   Rozdil:=Rozdil+Body[I].X;
   Prepocti(Rozdil,Rozdil,PRozX,PRozY,X,Y,JednX,JednY);

   Ctyruhelnik[1].X:=PX1;
   Ctyruhelnik[1].Y:=PY1;

   Ctyruhelnik[2].X:=PX2;
   Ctyruhelnik[2].Y:=PY2;

   Ctyruhelnik[3].X:=PRozX;
   Ctyruhelnik[3].Y:=PY2;

   Ctyruhelnik[4].X:=PRozX;
   Ctyruhelnik[4].Y:=PY1;
   FillPoly( SizeOf(Ctyruhelnik) div SizeOf(PointType),Ctyruhelnik);
  end;

 for I:=0 to KolikB-1 do
  begin
   Prepocti(Body[I].X,Body[I].Y,PX1,PY1,X,Y,JednX,JednY);
   Str(I,S1);
   S1:='Bod '+S1;
   ZanesBod(S1,PX1,PY1,X,Y);
  end;

 MY:=(MX*A) + B;
 Prepocti(MX,MY,PX1,PY1,X,Y,JednX,JednY);
 S1:='PýedpovØÔ';
 ZanesBod(S1,PX1,PY1,X,Y);

 Str(MX:3:2,S1);
 Str(MY:3:2,S2);
 S1:=S1+' => '+S2;
 SetTextJustify(LeftText,BottomText);
 OutTextXY(0,Y,S1);

 Sound(1000);
 Delay(100);
 NoSound;

 ReadLn;
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1995.');
end.
