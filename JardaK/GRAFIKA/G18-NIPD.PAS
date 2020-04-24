program XXX;

{

===========================================================================
==========                                                       ==========
==========              Gama Software 1996                       ==========
==========                                                       ==========
===========================================================================

}

uses Crt,Graph,Grafika;
label 1;

var GD,GM:   Integer;
    X,Y:     Integer;
    KolikX,
    KolikY:  ShortInt;
    KlZap:   ShortInt;
    JednX,
    JednY:   Integer;
    Body:    BodyInter;
    KolikB:  Byte;
    XX,YY:   ShortInt;
    RX1,RY1: Real;
    RX2,RY2: Real;
    PX1,PY1: Integer;
    PX2,PY2: Integer;
    S:       String;
    Dilek:   Real;
    Acka:    PoleAcek;
    I:       Byte;
    B:       Boolean;

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
 KolikB:=DejRozsah('Kolik bodu ?',2,15,X,Y);

 KolikX:=DejRozsah('Kolik jednotek na X ?',5,15,X,Y);
 KolikY:=DejRozsah('Kolik jednotek na Y ?',5,15,X,Y);

 for I:=0 to KolikB-1 do
  begin
   Str(I,S);
   S:='X'+S+' ?';
   Body[I].X:=DejRozsah(S,-KolikX,KolikX,X,Y);
   Str(I,S);
   S:='Y'+S+' ?';
   Body[I].Y:=DejRozsah(S,-KolikY,KolikY,X,Y);
  end;

 XX:=DejRozsah('X  ?',-KolikX,KolikX,X,Y);


 B:=JsouRuznyX(Body,KolikB);
 if not(B) then
   begin
    SetTextStyle(TriplexFont,HorizDir,3);
    SetTextJustify(CenterText,CenterText);
    SetColor(Green);
    OutTextXY(X div 2,Y div 2,'Spatne zadana cisla !');
    Sound(1000);
    Delay(50);
    NoSound;
    ReadLn;
    GoTo 1;
   end;


 { Podle Newtona }
 X:=GetMaxX;
 Y:=GetMaxY;
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

 for I:=0 to KolikB-1 do
  begin
   Prepocti(Body[I].X,Body[I].Y,PX1,PY1,X,Y,JednX,JednY);
   Str(I,S);
   S:='Bod '+S;
   ZanesBod(S,PX1,PY1,X,Y);
   Pip;
   Delay(100);
  end;

 PD_DejAcka(KolikB,Body,Acka);
 RY1:=PD_NewtonovaInt_Nn(XX,KolikB,Body,Acka);
 Str(RY1:6:3,S);
 S:='F(x)='+S;
 SetTextJustify(BottomText,LeftText);
 SetTextStyle(DefaultFont,HorizDir,1);
 SetColor(Blue);
 OutTextXY(10,10,S);

 Prepocti(XX,RY1,PX1,PY1,X,Y,JednX,JednY);
 ZanesBod('Newton',PX1,PY1,X,Y);
 Pip;
 Delay(100);

 SetColor(DarkGray);
 Dilek:=(2*KolikX)/1000;
 RX1:=-KolikX;
 RY1:=PD_NewtonovaInt_Nn(RX1,KolikB,Body,Acka);
 Prepocti(RX1,RY1,PX1,PY1,X,Y,JednX,JednY);
 MoveTo(PX1,PY1);
 repeat
  RX2:=RX1+Dilek;
  RY2:=PD_NewtonovaInt_Nn(RX2,KolikB,Body,Acka);
  Prepocti(RX2,RY2,PX2,PY2,X,Y,JednX,JednY);
  Line(PX1,PY1,PX2,PY2);
  RX1:=RX2;
  RY1:=RY2;
  Prepocti(RX1,RY1,PX1,PY1,X,Y,JednX,JednY);
 until RX2>KolikX;

 Sound(1000);
 Delay(100);
 NoSound;
 ReadLn;
 1:
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1996.');
end.
