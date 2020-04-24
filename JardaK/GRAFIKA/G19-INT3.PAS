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
    I:       Integer;

    { VÏpoüet }

    H:       Real;
    Suma:    Real;
    S:       String;
    Kde_X:   Real;


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
 KolikD:=DejRozsah_Sude('Kolik dilku na vypocet ?',2,200,X,Y);

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

 { H je dÇlka 1 d°lku }
 if (Max*Min)>0 then H:=Abs( (Abs(Max)-Abs(Min))/KolikD )
                else H:=Abs( (Abs(Max)+Abs(Min))/KolikD );

 {
  S jednoho d°lku = ( (x2 - x0) / 6 ) * (y0 + 4y1 + y2)
 }

 {
  Algoritmus:

  Vstup: f(x)-tady sin(x),a,b,n-sudÇ
  S = f(x0) + 4f(x1) + f(xn)
  X = a + 2H         - vÏpoüet zaü°n† od x2

  pro k = 2,4,6,....,n-2
    S = s + 2f(X) + 4f (x+H)
    X = X + 2H

  S = S * H/3
 }

 SetColor(Red);
 SetLineStyle(SolidLn,0,NormWidth);
 SetFillStyle(5,Blue);
 Suma:= Abs(Sin(Min)) + Abs(4*Sin(Min+H)) + Abs(Sin(Max));
 Kde_X:=Min + 2*H; { Zaü°n† se od X2 }
 Udelej_Krivku(Min,Sin(Min),Min+H,Sin(Min+H),Min+2*H,Sin(Min+2*H),X,Y,JednX,JednY);

{ pro k = 2,4,6,...,n-2 }
{ MÖßu to udÿlat, protoße na I tam nic nez†leß°, dÖleßitej je jenom poüet }
 for I:=1 to ((KolikD-2) div 2) do
  begin
   Suma := Suma + Abs(2*Sin(Kde_X) + 4*Sin(Kde_X+H)); { Celej d°lek v ABS }
   Udelej_Krivku(Kde_X,Sin(Kde_X),Kde_X+H,Sin(Kde_X+H),Kde_X+2*H,Sin(Kde_X+2*H),X,Y,JednX,JednY);
   Kde_X := Kde_X + 2*H;
  end;
 Suma := Suma * (H/3);

 SetColor(Red);
 Str(Suma,S);
 S:='Celkem:'+S;
 SetTextJustify(BottomText,LeftText);
 SetTextStyle(DefaultFont,HorizDir,1);
 OutTextXY(10,Y,S);

 { Te‘ se to p˝ekresl° }
 SetColor(Green);
 SetBkColor(White);
 OsaX(X,Y,Rychle); SipkaX(X,Y);
 OsaY(X,Y,Rychle); SipkaY(X,Y);
 JednotkyX(X,Y,KolikX,JednX,Rychle);
 JednotkyY(X,Y,KolikY,JednY,Rychle);
 Sinusoida(X,Y,JednX,JednY,KolikX,KolikY,Rychle);

 Sound(1000);
 Delay(100);
 NoSound;

 ReadLn;
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1996.');
end.
