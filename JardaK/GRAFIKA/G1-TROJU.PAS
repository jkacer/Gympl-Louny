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
    XA,XB,XC,
    YA,YB,YC:Integer;
    KolikX,
    KolikY:  ShortInt;
    KlZap:   ShortInt;
    PAX,PAY,
    PBX,PBY,
    PCX,PCY: Integer;
    JednX,
    JednY:   Integer;


procedure Pip;
begin
 Sound(50);
 Delay(100);
 NoSound;
end;

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
 KolikY:=DejRozsah('Kolik jednotek na Y ?',5,15,X,Y);

 JednX:=(X div 2) div KolikX;
 JednY:=(Y div 2) div KolikY;

 XA:=Random(KolikX);
 KlZap:=Random(5);
 if KlZap>2 then XA:=0-XA;

 XB:=Random(KolikX);
 KlZap:=Random(5);
 if KlZap>2 then XB:=0-XB;
 if XB=XA then if XA<>0 then XB:=XA div 2
                        else XB:=KolikX div 2;

 XC:=Random(KolikX);
 KlZap:=Random(5);
 if KlZap>2 then XC:=0-XC;
 if XC=XA then if XA<>0 then XC:=XA div 2
                        else XC:=KolikX div 3;
 if XC=XB then if XB<>0 then XC:=XB div 2
                        else XC:=KolikX div 3;

 YA:=Random(KolikY);
 KlZap:=Random(5);
 if KlZap>2 then YA:=0-YA;

 YB:=Random(KolikY);
 KlZap:=Random(5);
 if KlZap>2 then YB:=0-YB;
 if YB=YA then if YA<>0 then YB:=YA div 2
                        else YB:=KolikY div 2;

 YC:=Random(KolikY);
 KlZap:=Random(5);
 if KlZap>2 then YC:=0-YC;
 if YC=YA then if YA<>0 then YC:=YA div 2
                        else YC:=KolikY div 3;
 if YC=YB then if YB<>0 then YC:=YB div 2
                        else YC:=KolikY div 3;

 SetColor(Green);
 SetBkColor(White);

 OsaX(X,Y,Pomalu);
 SipkaX(X,Y);

 OsaY(X,Y,Pomalu);
 SipkaY(X,Y);

 JednotkyX(X,Y,KolikX,JednX,Pomalu);
 JednotkyY(X,Y,KolikY,JednY,Pomalu);

 Prepocti(XA,YA,PAX,PAY,X,Y,JednX,JednY);
 ZanesBod('A',PAX,PAY,X,Y);
 Pip;
 Delay(100);
 Prepocti(XB,YB,PBX,PBY,X,Y,JednX,JednY);
 ZanesBod('B',PBX,PBY,X,Y);
 Pip;
 Delay(100);
 Prepocti(XC,YC,PCX,PCY,X,Y,JednX,JednY);
 ZanesBod('C',PCX,PCY,X,Y);
 Pip;
 Delay(100);

 SetColor(Red);
 Line(PAX,PAY,PBX,PBY);
 Line(PBX,PBY,PCX,PCY);
 Line(PAX,PAY,PCX,PCY);

 { Tento prikaz fungoval spatne -> nahrazeno FillPoly

 FloodFill( (PAX+PBX+PCX) div 3,(PAY+PBY+PCY) div 3,Red);
 }

 Trojuhelnik[1].X:=PAX;
 Trojuhelnik[1].Y:=PAY;
 Trojuhelnik[2].X:=PBX;
 Trojuhelnik[2].Y:=PBY;
 Trojuhelnik[3].X:=PCX;
 Trojuhelnik[3].Y:=PCY;
 FillPoly( SizeOf(Trojuhelnik) div SizeOf(PointType),Trojuhelnik);
 ZanesBod('A',PAX,PAY,X,Y);
 ZanesBod('B',PBX,PBY,X,Y);
 ZanesBod('C',PCX,PCY,X,Y);
 Sound(1000);
 Delay(100);
 NoSound;
 ReadLn;
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1995.');
end.
