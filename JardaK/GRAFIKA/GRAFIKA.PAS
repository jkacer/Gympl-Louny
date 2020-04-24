unit Grafika;
{

===========================================================================
==========                                                       ==========
==========              Gama Software 1995-6                     ==========
==========                                                       ==========
===========================================================================

}

interface

uses Crt,Graph,Graph3;

type
      BodInter = record
                  X:Real;
                  Y:Real;
                 end;

      BodyInter = array[0..14] of BodInter;

      PoleAcek = array[0..14] of Real;

      PoleProPD = array[0..14,0..14] of Real;

      Determinant22 = array[1..2,1..2] of Real;
      Determinant33 = array[1..3,1..3] of Real;

      TBod3D = record
                X:   Real;
                Y:   Real;
                Z:   Real;
               end;

      T6Sten = array[1..8] of TBod3D;


const
      PI = 3.1415927;

      Trojuhelnik : array[1..3] of PointType = (
                                                (X:0;Y:0),
                                                (X:0;Y:0),
                                                (X:0;Y:0)
                                               );

      Ctyruhelnik : array[1..4] of PointType = (
                                                (X:0;Y:0),
                                                (X:0;Y:0),
                                                (X:0;Y:0),
                                                (X:0;Y:0)
                                               );

      Pomalu = True;
      Rychle = False;

{ Pro osy co jsou v p…li }

procedure Pip;
function  DejRozsah(Ceho:String;Min,Max:Integer;X,Y:Integer):Integer;
function  DejRozsah_Sude(Ceho:String;Min,Max:Integer;X,Y:Integer):Integer;
procedure OsaX(X,Y:Integer;Jak:Boolean);
procedure OsaY(X,Y:Integer;Jak:Boolean);
procedure SipkaX(X,Y:Integer);
procedure SipkaY(X,Y:Integer);
procedure JednotkyX(X,Y:Integer;KolikX,JednX:ShortInt;Jak:Boolean);
procedure JednotkyY(X,Y:Integer;KolikY,JednY:ShortInt;Jak:Boolean);

{ Vr t¡ real. Ÿ¡slo - vìsledek. SpoŸte se ký¡§em-22 nebo Sarrusem-33 }
function  Dej_Det22(X:Determinant22):Real;
function  Dej_Det33(X:Determinant33):Real;

{ SpoŸ¡taj¡ se koeficienty X,Y(,Z) u soustavy o 2(3) rovnic¡ch }
procedure Dej_Det_XY(A1,B1,C1,A2,B2,C2:Real;var XX,YY:Real);
procedure Dej_Det_XYZ(A1,B1,C1,D1, A2,B2,C2,D2, A3,B3,C3,D3:Real;
                       var XX,YY,ZZ:Real);

procedure Prepocti(NX,NY:Real;var PNX,PNY:Integer;X,Y:Integer;JednX,JednY:ShortInt);
procedure ZanesBod(S:String;PX,PY:Integer;X,Y:Integer);
procedure DejStred(X1,Y1,X2,Y2:ShortInt;var SX,SY:Real);
procedure DejObecRci(X1,Y1,X2,Y2:Real;var A,B,C:Real);
procedure OsaUsecky(X1,Y1,X2,Y2:ShortInt;Barva:Word;KolikX:ShortInt;X,Y:Integer;JednX,JednY:ShortInt);
procedure Primka(X1,Y1,X2,Y2:Real;Barva:Word;KolikX:ShortInt;X,Y:Integer;JednX,JednY:ShortInt);
function  DejSmernici(A1,B1,C1,A2,B2,C2:Real):Real;

{ Pro vìpoŸet interpolac¡ }
 { Test pro vçechny }
function  JsouRuznyX(Pole:BodyInter;KolikB:Byte):Boolean;

 { Lagrangeova }
function  LagrangeovaInter(X:Real;Kolik:Byte;Pole:BodyInter):Real;

 { Newtonova klasick  }
procedure DejAcka(KolikB:Byte;Body:BodyInter;var Acka:PoleAcek);
function  NewtonovaInt_Nn(X:Real;KolikB:Byte;Body:BodyInter;Acka:PoleAcek):Real;

 { Newtonova metodou pomØrn‚ diference }
procedure PD_DejAcka(KolikB:Byte;Body:BodyInter;var Acka:PoleAcek);
function  PD_NewtonovaInt_Nn(X:Real;KolikB:Byte;Body:BodyInter;Acka:PoleAcek):Real;

{ Metoda nejmenç¡ch Ÿtverc…-line rn¡ }
procedure DejKoefAB(KolikB:Byte;Pole:BodyInter;var AA,BB:Real);
{ Metoda nejmenç¡ch Ÿtverc…-kvadratick  }
procedure DejKoefABC(KolikB:Byte;Pole:BodyInter;var AA,BB,CC:Real);

{ Integr ly }
procedure Sinusoida(X,Y:Integer;JednX,JednY,KolikX,KolikY:ShortInt;Jak:Boolean);
{ Simpsonova metoda integr l…}
procedure Udelej_Krivku(X1,Y1,X2,Y2,X3,Y3:Real;X,Y:Integer;JednX,JednY:ShortInt);

{ Pro frakt ln¡ grafiku }

procedure FrTrojuhelnik(N:Byte;AX,AY,BX,BY,CX,CY:Integer);
procedure FrObdelnik(N:Byte;AX,AY,BX,BY,CX,CY,DX,DY:Integer);

procedure FrObdelnikJednoduch_Rekurze(N:Byte;AX,AY:Integer);
procedure FrObdelnikJednoduch_Iterace(N:Byte;AX,AY:Integer);

procedure FrTrojuhelnik_Mitsubishi(N:Byte;AX,AY,BX,BY,CX,CY:Integer);

{ Pro vlastn¡ grafiku }
procedure Bod_Otoc(X1,Y1:Real;Alfa:Word;var X2,Y2:Real);
procedure Bod_Otoc_Draw(S:string;X1,Y1:Real;Alfa:Word;X,Y:Integer;JednX,JednY:ShortInt);
procedure Osy_Otoc(X,Y:Integer;KolikX,KolikY,JednX,JednY:ShortInt;Alfa:Word);

procedure Kruznice1(SX,SY,R:Real;X,Y:Integer;JednX,JednY:ShortInt);
procedure Kruznice2(SX,SY,R:Real;X,Y:Integer;JednX,JednY:ShortInt);
procedure Elipsa(SX,SY,A,B:Real; X,Y:Integer;JednX,JednY:ShortInt);
procedure Elipsa_Otoc(SX,SY,A,B:Real;Alfa:Word; X,Y:Integer;JednX,JednY:ShortInt);

{ Kru§nice parametrizovan  racion ln¡mi funkcemi }
procedure Kruznice3(SX,SY,R:Real;X,Y:Integer;JednX,JednY:ShortInt);

{ Hyberbola parametrizovan  racion ln¡mi funkcemi }
procedure Hyperbola(SX,SY,A,B:Real;X,Y:Integer;JednX,JednY:ShortInt);

{ Pýevod bodu z 3D do 2D stýedovìm prom¡t n¡m }
procedure Make2D(X,Y,Z:Real;H,D:Real;var XX,YY:Real);
{ Nakresli libovolnì çestistØn ve 3D }
procedure Kresli6Sten3D(Co:T6Sten;H,D:Real;X,Y:Integer;JednX,JednY:ShortInt);


implementation

procedure Pip;
begin
 Sound(50);
 Delay(100);
 NoSound;
end;

procedure Stuj;
begin
 Sound(50);
 Delay(100);
 NoSound;
 ReadLn;
end;

function DejRozsah(Ceho:String;Min,Max:Integer;X,Y:Integer):Integer;
var Znak: Char;
    Vypal:Boolean;
    Pom:  Integer;
    S:    String;
    Delka,
    Vyska:ShortInt;
begin
 SetBkColor(White);
 ClearDevice;
 Vypal:=False;
 Pom:=Min;
 SetTextStyle(TriplexFont,HorizDir,3);
 SetTextJustify(CenterText,CenterText);
 SetFillStyle(0,White);
 SetColor(Green);
 OutTextXY(X div 2,Y div 3,Ceho);
 Str(Pom,S);
 OutTextXY(X div 2,2*(Y div 3),S);
 repeat
  Znak:=ReadKey;
  if Ord(Znak)=13 then Vypal:=True
                  else begin
                        case Znak of
                         #72:begin    { çipka nahoru }
                              Inc(Pom);
                              if Pom>Max then Pom:=Min;
                             end;
                         #80:begin    { çipka dolu }
                              Dec(Pom);
                              if Pom<Min then Pom:=Max;
                             end;
                         #71:Pom:=Min; { *** Home      *** }
                         #79:Pom:=Max; { *** End       *** }
                         #73:begin     { *** Page-Up   *** }
                              Pom:=Pom+( (Max-Min) div 10);
                              if Pom>Max then Pom:=Max;
                             end;
                         #81:begin     { *** Page-Down *** }
                              Pom:=Pom-( (Max-Min) div 10);
                              if Pom<Min then Pom:=Min;
                             end;
                         else;
                        end;
                        Str(Pom,S);
                        Delka:=TextWidth(S);
                        Vyska:=TextHeight(S);
                        Bar( (X div 2)-(Delka div 2)-50,2*(Y div 3)-(Vyska div 2)-20,
                             (X div 2)+(Delka div 2)+50,2*(Y div 3)+(Vyska div 2)+20  );
                        OutTextXY(X div 2,2*(Y div 3),S);
                       end;
 until Vypal;
 DejRozsah:=Pom;
 ClearDevice;
 SetTextStyle(DefaultFont,HorizDir,1);
end;

function  DejRozsah_Sude(Ceho:String;Min,Max:Integer;X,Y:Integer):Integer;
var Znak: Char;
    Vypal:Boolean;
    Pom:  Integer;
    S:    String;
    Delka,
    Vyska:ShortInt;
begin
 {Sude}
 if Odd(Min) then Inc(Min);
 if Odd(Max) then Dec(Max);

 SetBkColor(White);
 ClearDevice;
 Vypal:=False;
 Pom:=Min;
 SetTextStyle(TriplexFont,HorizDir,3);
 SetTextJustify(CenterText,CenterText);
 SetFillStyle(0,White);
 SetColor(Green);
 OutTextXY(X div 2,Y div 3,Ceho);
 Str(Pom,S);
 OutTextXY(X div 2,2*(Y div 3),S);
 repeat
  Znak:=ReadKey;
  if Ord(Znak)=13 then Vypal:=True
                  else begin
                        case Znak of
                         #72:begin    { çipka nahoru }
                              Inc(Pom,2);
                              if Pom>Max then Pom:=Min;
                             end;
                         #80:begin    { çipka dolu }
                              Dec(Pom,2);
                              if Pom<Min then Pom:=Max;
                             end;
                         #71:Pom:=Min; { *** Home      *** }
                         #79:Pom:=Max; { *** End       *** }
                         #73:begin     { *** Page-Up   *** }
                              Pom:=Pom+( (Max-Min) div 10);
                              if Pom>Max then Pom:=Max;
                             end;
                         #81:begin     { *** Page-Down *** }
                              Pom:=Pom-( (Max-Min) div 10);
                              if Pom<Min then Pom:=Min;
                             end;
                         else;
                        end;
                        if Odd(Pom) then Inc(Pom);
                        Str(Pom,S);
                        Delka:=TextWidth(S);
                        Vyska:=TextHeight(S);
                        Bar( (X div 2)-(Delka div 2)-50,2*(Y div 3)-(Vyska div 2)-20,
                             (X div 2)+(Delka div 2)+50,2*(Y div 3)+(Vyska div 2)+20  );
                        OutTextXY(X div 2,2*(Y div 3),S);
                       end;
 until Vypal;
 DejRozsah_Sude:=Pom;
 ClearDevice;
 SetTextStyle(DefaultFont,HorizDir,1);
end;


procedure OsaX(X,Y:Integer;Jak:Boolean);
var I:Integer;
begin
 for I:=1 to X do
  begin
   PutPixel(I,(Y div 2)+0,Green);
   PutPixel(I,(Y div 2)+1,Green);
{  Sound(10*I);      }
   if Jak then Delay(2);
   NoSound;
  end;
end;

procedure OsaY(X,Y:Integer;Jak:Boolean);
var I:Integer;
begin
 for I:=Y downto 1 do
  begin
   PutPixel((X div 2)+0,I,Green);
   PutPixel((X div 2)+1,I,Green);
{  Sound(10*(Y-I));   }
   if Jak then Delay(2);
   NoSound;
  end;
end;

procedure SipkaX(X,Y:Integer);
begin
 Line(X-10,(Y div 2)-5,X-10,(Y div 2)+5);
 Line(X-10,(Y div 2)-5,X,Y div 2);
 Line(X-10,(Y div 2)+5,X,Y div 2);
 SetFillStyle(1,Green);
 FloodFill(X-8,(Y div 2)+2,Green);
 FloodFill(X-8,(Y div 2)-2,Green);
 SetTextStyle(DefaultFont,HorizDir,1);
 SetTextJustify(CenterText,CenterText);
 SetTextJustify(0,0);
 OutTextXY(X-10,(Y div 2)-20,'x');
end;

procedure SipkaY(X,Y:Integer);
begin
 Line( (X div 2)-5,10,X div 2,0);
 Line( (X div 2)+5,10,X div 2,0);
 Line( (X div 2)-5,10,(X div 2)+5,10);
 SetFillStyle(1,Green);
 FloodFill( (X div 2)-2,8,Green);
 FloodFill( (X div 2)+2,8,Green);
 SetTextStyle(DefaultFont,HorizDir,1);
 SetTextJustify(CenterText,CenterText);
 SetTextJustify(0,0);
 OutTextXY((X div 2)-15,10,'y');
end;

procedure JednotkyX(X,Y:Integer;KolikX,JednX:ShortInt;Jak:Boolean);
var I:ShortInt;
    S:String[3];
begin
 SetLineStyle(SolidLn,0,NormWidth);
 SetTextStyle(DefaultFont,HorizDir,1);
 SetTextJustify(CenterText,CenterText);
 for I:=1 to KolikX do
  begin
   Line( (X div 2)+(I*JednX),(Y div 2)-5,
         (X div 2)+(I*JednX),(Y div 2)+5 );
   Line( (X div 2)-(I*JednX),(Y div 2)-5,
         (X div 2)-(I*JednX),(Y div 2)+5 );
   Str(I,S);
   OutTextXY( (X div 2)+(I*JednX),(Y div 2)+15,S);
   S:='-'+S;
   OutTextXY( (X div 2)-(I*JednX),(Y div 2)+15,S);
{  Sound(500);
   Delay(10);
   NoSound;    }
   if Jak then Delay(100);
  end;
end;

procedure JednotkyY(X,Y:Integer;KolikY,JednY:ShortInt;Jak:Boolean);
var I:ShortInt;
    S:String[3];
begin
 SetLineStyle(SolidLn,0,NormWidth);
 SetTextStyle(DefaultFont,HorizDir,1);
 SetTextJustify(CenterText,CenterText);
 for I:=1 to KolikY do
  begin
   Line( (X div 2)-5,(Y div 2)-(I*JednY),
         (X div 2)+5,(Y div 2)-(I*JednY) );
   Line( (X div 2)-5,(Y div 2)+(I*JednY),
         (X div 2)+5,(Y div 2)+(I*JednY) );
   Str(I,S);
   OutTextXY( (X div 2)+15,(Y div 2)-(I*JednY),S);
   S:='-'+S;
   OutTextXY( (X div 2)+15,(Y div 2)+(I*JednY),S);
{  Sound(500);
   Delay(10);
   NoSound;    }
   if Jak then Delay(100);
  end;
end;

function Dej_Det22(X:Determinant22):Real;
{ Jenom ký¡§em z LH do PD = +  a pak z PH do LD = - }
begin
 Dej_Det22:=( X[1,1] * X[2,2] )-( X[1,2] * X[2,1] );
end;

function  Dej_Det33(X:Determinant33):Real;
{ Pomoc¡ Sarrusova pravidla }
begin
 Dej_Det33 := +( X[1,1] * X[2,2] * X[3,3] )
              +( X[2,1] * X[3,2] * X[1,3] )
              +( X[3,1] * X[1,2] * X[2,3] )
              -( X[1,3] * X[2,2] * X[3,1] )
              -( X[2,3] * X[3,2] * X[1,1] )
              -( X[3,3] * X[1,2] * X[2,1] );
end;

procedure Dej_Det_XY(A1,B1,C1,A2,B2,C2:Real;var XX,YY:Real);
var Det:    Determinant22;
    D,DX,DY:Real;
begin
 Det[1,1]:=A1;
 Det[1,2]:=B1;
 Det[2,1]:=A2;
 Det[2,2]:=B2;

 D:=Dej_Det22(Det);
 if D=0 then begin
              XX:=2.9E-39;
              YY:=2.9E-39;
              Exit;
             end;

 Det[1,1]:=C1;
 Det[2,1]:=C2;

 DX:=Dej_Det22(Det);

 Det[1,1]:=A1;
 Det[1,2]:=C1;
 Det[2,1]:=A2;
 Det[2,2]:=C2;

 DY:=Dej_Det22(Det);

 XX:=DX/D;
 YY:=DY/D;
end;

procedure Dej_Det_XYZ(A1,B1,C1,D1, A2,B2,C2,D2, A3,B3,C3,D3:Real;
                       var XX,YY,ZZ:Real);
var Det:           Determinant33;
    D,DX,DY,DZ:    Real;
begin
 { Norm ln¡ naplnØn¡ }
 Det[1,1]:=A1;
 Det[1,2]:=B1;
 Det[1,3]:=C1;
 Det[2,1]:=A2;
 Det[2,2]:=B2;
 Det[2,3]:=C2;
 Det[3,1]:=A3;
 Det[3,2]:=B3;
 Det[3,3]:=C3;
 D:=Dej_Det33(Det);
 if D=0 then begin
              XX:=2.9E-39;
              YY:=2.9E-39;
              ZZ:=2.9E-39;
              Exit;
             end;

 { Do 1. sloupce Ÿ¡sla z pravì strany }
 Det[1,1]:=D1;
 Det[2,1]:=D2;
 Det[3,1]:=D3;
 DX:=Dej_Det33(Det);

 { Do 1. sloupce p…vodn¡ hodnoty }
 Det[1,1]:=A1;
 Det[2,1]:=A2;
 Det[3,1]:=A3;
 { Do 2. sloupce Ÿ¡sla z pravì strany }
 Det[1,2]:=D1;
 Det[2,2]:=D2;
 Det[3,2]:=D3;
 DY:=Dej_Det33(Det);

 { Do 2. sloupce p…vodn¡ hodnoty }
 Det[1,2]:=B1;
 Det[2,2]:=B2;
 Det[3,2]:=B3;
 { Do 3. sloupce Ÿ¡sla z pravì strany }
 Det[1,3]:=D1;
 Det[2,3]:=D2;
 Det[3,3]:=D3;
 DZ:=Dej_Det33(Det);

 XX:=DX/D;
 YY:=DY/D;
 ZZ:=DZ/D;
end;

procedure Prepocti(NX,NY:Real;var PNX,PNY:Integer;X,Y:Integer;JednX,JednY:ShortInt);
begin
 PNX:=(X div 2)+Round((NX*JednX));
 PNY:=(Y div 2)-Round((NY*JednY));
end;

procedure ZanesBod(S:String;PX,PY:Integer;X,Y:Integer);
begin
 SetTextStyle(DefaultFont,HorizDir,1);
 SetTextJustify(LeftText,BottomText);
 SetColor(Blue);
 SetLineStyle(DottedLn,0,NormWidth);
 Line(PX,PY,X div 2,PY);
 Line(PX,PY,PX,Y div 2);
 SetColor(Red);
 SetLineStyle(SolidLn,0,ThickWidth);
 Line(PX-5,PY-5,PX+5,PY+5);
 Line(PX+5,PY-5,PX-5,PY+5);
 OutTextXY(PX+10,PY-5,S);
end;

procedure DejStred(X1,Y1,X2,Y2:ShortInt;var SX,SY:Real);
begin
 if (X1*X2)>=0 then SX:=(X1+X2)/2
               else SX:=X1+( (X2-X1)/2 );
 if (Y1*Y2)>=0 then SY:=(Y1+Y2)/2
               else SY:=Y1+( (Y2-Y1)/2 );
end;

procedure DejObecRci(X1,Y1,X2,Y2:Real;var A,B,C:Real);
begin
 { SmØrovej vektor £seŸky do obecnìho ýeçen¡ }
 A:=-(Y2-Y1);
 B:=X2-X1;
 { C se dopoŸ¡t  z A,B a jednoho krajn¡ho bodu }
 C:=-A*X1-B*Y1;
end;

procedure OsaUsecky(X1,Y1,X2,Y2:ShortInt;Barva:Word;KolikX:ShortInt;X,Y:Integer;JednX,JednY:ShortInt);
var SX,SY:   Real;
    A,B,C:   Real;
    I:       Integer;
    PX1,PY1,
    PX2,PY2: Integer;
    YY:      Real;
begin
 DejStred(X1,Y1,X2,Y2,SX,SY);

 { SmØrovej vektor £seŸky = norm lovej osy }
 A:=X2-X1;
 B:=Y2-Y1;

 C:=-A*SX-B*SY;

 SetLineStyle(SolidLn,0,NormWidth);
 SetColor(Barva);

 if B=0 then begin
              Prepocti(SX,SY,PX1,PY1,X,Y,JednX,JednY);
              Line(PX1,0,PX1,Y);
              Exit;
             end;

 YY:=(A*KolikX-C)/B;
 Prepocti(-KolikX,YY,PX1,PY1,X,Y,JednX,JednY);

 for I:=-KolikX to KolikX do
  begin
   YY:=(-A*I-C)/B;
   Prepocti(I,YY,PX2,PY2,X,Y,JednX,JednY);
   Line(PX1,PY1,PX2,PY2);
   PX1:=PX2;
   PY1:=PY2;
  end;
end;

procedure Primka(X1,Y1,X2,Y2:Real;Barva:Word;KolikX:ShortInt;X,Y:Integer;JednX,JednY:ShortInt);
var A,B,C:   Real;
    I:       Integer;
    PX1,PY1,
    PX2,PY2: Integer;
    YY:      Real;
begin
 DejObecRci(X1,Y1,X2,Y2,A,B,C);
 SetLineStyle(SolidLn,0,NormWidth);
 SetColor(Barva);

 if B=0 then begin
              Prepocti(X1,Y1,PX1,PY1,X,Y,JednX,JednY);
              Line(PX1,0,PX1,Y);
              Exit;
             end;

 YY:=(A*KolikX-C)/B;
 Prepocti(-KolikX,YY,PX1,PY1,X,Y,JednX,JednY);

 for I:=-KolikX to KolikX do
  begin
   YY:=(-A*I-C)/B;
   Prepocti(I,YY,PX2,PY2,X,Y,JednX,JednY);
   Line(PX1,PY1,PX2,PY2);
   PX1:=PX2;
   PY1:=PY2;
  end;
end;

function  DejSmernici(A1,B1,C1,A2,B2,C2:Real):Real;
var K1,K2:     Real;
    Fi1,Fi2,Fi:Real;
begin
 if B1<>0 then begin
                K1:=-A1/B1;
                Fi1:=ArcTan(K1);
               end
          else Fi1:=PI/2;
 if B2<>0 then begin
                K2:=-A2/B2;
                Fi2:=ArcTan(K2);
               end
          else Fi2:=PI/2;

 Fi:=Fi1+((Fi2-Fi1)/2);

 DejSmernici:=(Sin(Fi))/(Cos(Fi));
end;



{
 Lagrange…v interpolaŸn¡ polynom :

        n
 Ln(x)=S  f(xi)*li(x)
       i=1

        (x-x0)(x-x1)*.....*(x-xi-1)(x-xi+1)*.....*(x-xn)
 li(x)=--------------------------------------------------------
         (xi-x0)(xi-x1)*.....*(xi-xi-1)(xi-xi+1)*.....*(xi-xn)

}

function  LagrangeovaInter(X:Real;Kolik:Byte;Pole:BodyInter):Real;

       {***************************************************}
       function Citatel(X:Real;Kolik:Byte;Poradi:Byte;Pole:BodyInter):Real;
       var Pom:Real;
           I:  Byte;
       begin
        Pom:=1;
        for I:=0 to Kolik-1 do
         if I<>Poradi then Pom:=Pom*(X-Pole[I].X);
        Citatel:=Pom;
       end;
       {***************************************************}
       function Jmenovatel(Kolik:Byte;Poradi:Byte;Pole:BodyInter):Real;
       var Pom:Real;
           I:  Byte;
       begin
        Pom:=1;
        for I:=0 to Kolik-1 do
         if I<>Poradi then Pom:=Pom*(Pole[Poradi].X-Pole[I].X);
        Jmenovatel:=Pom;
       end;
       {***************************************************}

var Pom:  Real;
    I:    Byte;
begin
 Pom:=0;

 for I:=0 to Kolik-1 do
  Pom:=Pom+Pole[I].Y*(Citatel(X,Kolik,I,Pole)/Jmenovatel(Kolik,I,Pole));

 LaGrangeovaInter:=Pom;
end;

{
 Newton…v interpolaŸn¡ polynom :

 Nn(x) = a0 + a1(x-x0) + a2(x-x0)(x-x1) + a3(x-x0)(x-x1)(x-x2) +
         + an(x-x0)(x-x1)*...*(x-xn-1)


 Nutno vypoŸ¡tat  Ÿka.

 a0 = f(x0)
 a1 = ( f(x1)-a0 )/(x1-x0)
 a2 = ( f(x2)-a0-a1(x2-x0) )/(x2-x0)(x2-x1)

 Vych z¡ to NIP => algoritmus pý¡m‚ substituce.
}

procedure DejAcka(KolikB:Byte;Body:BodyInter;var Acka:PoleAcek);
var I,J:Byte;
    Pom:Real;
begin
 for I:=0 to 14 do  { nulov n¡ }
  Acka[I]:=0;

 Acka[0]:=Body[0].Y;   { pro y0 }

 for I:= 1 to KolikB-1 do
  begin
   Acka[I]:=Body[I].Y-Acka[0]; { yi - a0 } { Todle je jenom pro a1 }
   Pom:=Body[I].X-Body[0].X;   { xi - x0 }

   for J:=1 to I-1 do    { pracuje a§ od a2 }
    begin
     Acka[I]:=Acka[I]-Acka[J]*Pom;  { pýevede na druhou stranu a*z vorka }
     Pom:=Pom*(Body[I].X-Body[J].X);{ pýid  dalç¡ z vorku }
    end; { for J }

   Acka[I]:=Acka[I]/Pom; { vydØl¡ vçema dolejç¡ma z vorkama }
  end; { for I }

end;

function NewtonovaInt_Nn(X:Real;KolikB:Byte;Body:BodyInter;Acka:PoleAcek):Real;
var P1,P2:Real;
    I:    Byte;
begin
 P1:=Acka[0];
 P2:=X-Body[0].X;
 for I:=1 to KolikB-1 do
  begin
   P1:=P1+Acka[I]*P2;
   P2:=P2*(X-Body[I].X);
  end;
 NewtonovaInt_Nn:=P1;
end;

{

 f[x0] = f(x0) = y0            - pom. dif. 0. ý du


              f[x1] - f[x0]
 f[x0,x1] = ----------------   - pom. dif. 1. ý du
                x1  -   x0


                 f(x2) - f(x1)       f(x1) - f(x0)
                ---------------  -  ---------------
                   x2  -   x1          x1  -   x0
 f[x0,x1,x2] = -------------------------------------  - pom. dif. 2. ý du
                       x2        -         x0

}
function Pom_Dif(X1,X2,Y1,Y2:Real):Real;
begin
 Pom_Dif:=(Y2-Y1)/(X2-X1);
end;

procedure NulujPolePD(var X:PoleProPD);
var
    I,J: Byte;
begin
 for I:=0 to 14 do
  for J:=0 to 14 do
   X[I,J]:=0;
end;

{

   J   0
 I
 0     y0 -----------------------------------------------------> a0


            A[1,0]-A[0,0]
 1     y1   -------------  ------------------------------------> a1
              x1  -  x0

            A[2,0]-A[1,0]   A[2,1]-A[1,1]
 2     y2   -------------   -------------  --------------------> a2
              x2  -  x1       x2  -  x0

            A[3,0]-A[2,0]   A[3,1]-A[2,1]  A[3,2]-A[2,2]
 3     y3   -------------   -------------  ------------- ------> a3
              x3  -  x2       x3  -  x1      x3  -  x0

       .
       .
       .

 n     yn


}
procedure PD_DejAcka(KolikB:Byte;Body:BodyInter;var Acka:PoleAcek);
var
    I,J:     Byte;
    PD:      PoleProPD;
begin
 NulujPolePD(PD);
 { Nult‚ sloupce PD = 0. pomØrn‚ dif. = y0...y14 }
 for I:=0 to 14 do
  PD[I,0]:=Body[I].Y;
 { VìpoŸet pomØrnìma difer. do troj£heln¡ku, hoýejçek - to je jedno }
 { Troj…h se rozçiýuje }
 for I:=0 to KolikB-1 do
  for J:=1 to I do
   PD[I,J]:=(PD[I,J-1]-PD[I-1,J-1])/(Body[I].X-Body[I-J].X);
 { NaplnØn¡  Ÿek £klopý¡Ÿkou z LevaHore do PravaDole }
 for I:=0 to KolikB-1 do
  Acka[I]:=PD[I,I];
end;

{
 Nn = a0 + a1(x-x0) + a2(x-x0)(x-x1) + a3(x-x0)(x-x1)(x-x2) + .....
      ..... + an(x-x0)(x-x1)...(x-xn-1)
 PostupnØ se vytìk  pýed z vorku, co je mo§n‚ =
 = postupnØ pro n    prvk… (x-x0),
   pak      pro n-1  prvk… (x-x1),
   pak      pro n-2  prvk… (x-x2)....

 Z toho se odvod¡ algoritmus:
 H = an
 pro I = n-1,n-2,n-3,...,1,0
  H = H(x-xI) + aI
}
function  PD_NewtonovaInt_Nn(X:Real;KolikB:Byte;Body:BodyInter;Acka:PoleAcek):Real;
var
    I:     Byte;
    H:     Real;
begin
 H:=Acka[KolikB-1];
 for I:=KolikB-2 downto 0 do
  H:= H*(X-Body[I].X) + Acka[I];
 PD_NewtonovaInt_Nn:=H;
end;

function  JsouRuznyX(Pole:BodyInter;KolikB:Byte):Boolean;
var I,J:Byte;
    B:  Boolean;
begin
 B:=True;
 for I:=0 to KolikB-1 do
  for J:=0 to KolikB-1 do
   if (Pole[I].X=Pole[J].X) and (I<>J) then B:=False;
 JsouRuznyX:=B;
end;

procedure Sinusoida(X,Y:Integer;JednX,JednY,KolikX,KolikY:ShortInt;Jak:Boolean);
var
      RX1,RY1,
      RX2,RY2:  Real;
      PX1,PY1,
      PX2,PY2:  Integer;
      Dilek:    Real;
begin
 SetColor(Red);
 SetLineStyle(SolidLn,0,ThickWidth);
 Dilek:=(2*KolikX)/1000;
 RX1:=-KolikX;
 RY1:=Sin(RX1);
 Prepocti(RX1,RY1,PX1,PY1,X,Y,JednX,JednY);
 MoveTo(PX1,PY1);
 repeat
  RX2:=RX1+Dilek;
  RY2:=Sin(RX2);
  Prepocti(RX2,RY2,PX2,PY2,X,Y,JednX,JednY);
  Line(PX1,PY1,PX2,PY2);
  RX1:=RX2;
  RY1:=RY2;
  Prepocti(RX1,RY1,PX1,PY1,X,Y,JednX,JednY);
  if Jak then Delay(3);
 until RX2>KolikX;
end;

{ Pro Simpsonovo pravidlo - vykresl¡ kv. kýivku na jednom d¡lku }
procedure Udelej_Krivku(X1,Y1,X2,Y2,X3,Y3:Real;X,Y:Integer;JednX,JednY:ShortInt);

          {*****************************************************************}
          function LaGrangeovaInter3(X:Real;X0,X1,X2,Y0,Y1,Y2:Real):Real;
          var Pom:Real;
          begin
           Pom:= ( Y0 * ( ((X-X1)*(X-X2)) / ((X0-X1)*(X0-X2)) ) ) +
                 ( Y1 * ( ((X-X0)*(X-X2)) / ((X1-X0)*(X1-X2)) ) ) +
                 ( Y2 * ( ((X-X0)*(X-X1)) / ((X2-X0)*(X2-X1)) ) ) ;
           LaGrangeovaInter3:=Pom;
          end;
          {*****************************************************************}
const
      Dilku = 100;

var
      RX1,RY1,
      RX2,RY2:  Real;
      PX1,PY1,
      PX2,PY2:  Integer;
      Delta:    Real;
      StredY:   Integer;
begin
 SetLineStyle(SolidLn,0,NormWidth);
 SetColor(Blue);
 SetFillStyle(5,Blue);

 if (X1*X3)>0 then Delta:=Abs(Abs(X3)-Abs(X1))/Dilku
              else Delta:=Abs(Abs(X3)+Abs(X1))/Dilku;


 Prepocti(X1,0,PX1,StredY,X,Y,JednX,JednY);
 { X1 a PX1 to nevad¡ }
 RX1:=X1;
 RY1:=Y1;

 repeat
  RX2:=RX1+Delta;
  RY2:=LaGrangeovaInter3(RX2,X1,X2,X3,Y1,Y2,Y3);
  Prepocti(RX1,RY1,PX1,PY1,X,Y,JednX,JednY);
  Prepocti(RX2,RY2,PX2,PY2,X,Y,JednX,JednY);

  Ctyruhelnik[1].X := PX1;
  Ctyruhelnik[1].Y := PY1;
  Ctyruhelnik[2].X := PX2;
  Ctyruhelnik[2].Y := PY2;
  Ctyruhelnik[3].X := PX2;
  Ctyruhelnik[3].Y := StredY;
  Ctyruhelnik[4].X := PX1;
  Ctyruhelnik[4].Y := StredY;
  FillPoly(SizeOf(Ctyruhelnik) div SizeOf(PointType),Ctyruhelnik);

  RX1:=RX2;
  RY1:=RY2;
 until (RX1+Delta)>X3;

 Prepocti(X1,Y1,PX1,PY1,X,Y,JednX,JednY);
 ZanesBod('',PX1,PY1,X,Y);
 Prepocti(X2,Y2,PX1,PY1,X,Y,JednX,JednY);
 ZanesBod('',PX1,PY1,X,Y);
 Prepocti(X3,Y3,PX1,PY1,X,Y,JednX,JednY);
 ZanesBod('',PX1,PY1,X,Y);


end;


procedure DejKoefAB(KolikB:Byte;Pole:BodyInter;var AA,BB:Real);
var A,B,C,D,E,F: Real;
    I:           Byte;
{

S= a^2(x1^2+..+xn^2)+nb^2+(y1^2+..+yn^2)+2ab(x1+..+xn)-2a(x1y1+..xnyn)-2b(y1+..yn)
S= a^2  *   A       +B*b^2+      C      +2ab  *  D    -2a  *   E      -2b *  F

}

begin

 { A = x1^2+...+xn^2 }
 A:=0;
 for I:=0 to KolikB-1 do
  A:=A+Sqr(Pole[I].X);

 { B = n }
 B:=KolikB;

 { C = y1^2+...+yn^2 }
 C:=0;
 for I:=0 to KolikB-1 do
  C:=C+Sqr(Pole[I].Y);

 { D = x1+...+xn }
 D:=0;
 for I:=0 to KolikB-1 do
  D:=D+Pole[I].X;

 { E = x1y1+...+xnyn }
 E:=0;
 for I:=0 to KolikB-1 do
  E:=E+(Pole[I].X*Pole[I].Y);

 { F = y1+...+yn }
 F:=0;
 for I:=0 to KolikB-1 do
  F:=F+Pole[I].Y;

{
  aA+bD=E
  aD+bB=F
}

 { Vr t¡ ýeçen¡ soustavy 2 rovnic v AA a BB }
 Dej_Det_XY(A,D,E,D,B,F,AA,BB);
end;

procedure DejKoefABC(KolikB:Byte;Pole:BodyInter;var AA,BB,CC:Real);
var
    A,B,C,D,E,F,G,H,I,J: Real;
    X:                   Byte;
{

S = a^2(x1^4+...+xn^4) + b^2(x1^2+...+xn^2) + n*c^2 + (y1^2+...+yn^2) +

  + 2ab(x1^3+...+xn^3) + 2ac(x1^2+...+xn^2) - 2a(x1^2*y1+...+xn^2*yn) +

  + 2bc(x1+...+xn) - 2b(x1*y1+...+xn*yn) - 2c(y1+...+yn).

S = a^2*A + b^2*B + c^2*C + D  +  2ab*E + 2ac*F - 2a*G + 2bc*H - 2b*I - 2cJ

}

begin

 { A = x1^4+...+xn^4 }
 A:=0;
 for X:=0 to KolikB-1 do
  A:=A+( Sqr(Pole[X].X) * Sqr(Pole[X].X) );

 { B = x1^2+...+xn^2 }
 B:=0;
 for X:=0 to KolikB-1 do
  B:=B+Sqr(Pole[X].X);

 { C = n }
 C:=KolikB;

 { D = y1^2+...+yn^2 }
 D:=0;
 for X:=0 to KolikB-1 do
  D:=D+Sqr(Pole[X].Y);

 { E = x1^3+...+xn^3 }
 E:=0;
 for X:=0 to KolikB-1 do
  E:=E+( Sqr(Pole[X].X) * Pole[X].X );

 { F = x1^2+...+xn^2 } { F=B }
 F:=0;
 for X:=0 to KolikB-1 do
  F:=F+Sqr(Pole[X].X);

 { G = x1^2*y1+...+xn^2*yn }
 G:=0;
 for X:=0 to KolikB-1 do
  G:=G+( Sqr(Pole[X].X) * Pole[X].Y );

 { H = x1+...+xn }
 H:=0;
 for X:=0 to KolikB-1 do
  H:=H+Pole[X].X;

 { I = x1*y1+...+xn*yn }
 I:=0;
 for X:=0 to KolikB-1 do
  I:=I+( Pole[X].X * Pole[X].Y );

 { J = y1+...+yn }
 J:=0;
 for X:=0 to KolikB-1 do
  J:=J+Pole[X].Y;

{
  aA + bE + cF = G
  aE + bB + cH = I
  aF + bH + cC = J
}

 { Vr t¡ ýeçen¡ soustavy 3 rovnic v AA,BB a CC }
 Dej_Det_XYZ(A,E,F,G,E,B,H,I,F,H,C,J,AA,BB,CC);
end;

procedure FrTrojuhelnik(N:Byte;AX,AY,BX,BY,CX,CY:Integer);
var SABX,SABY,
    SBCX,SBCY,
    SACX,SACY: Integer;
begin
if N>0 then begin
             SABX:=Round( (AX+BX)/2 );
             SABY:=Round( (AY+BY)/2 );

             SBCX:=Round( (BX+CX)/2 );
             SBCY:=Round( (BY+CY)/2 );

             SACX:=Round( (AX+CX)/2 );
             SACY:=Round( (AY+CY)/2 );

             SetColor(14-N);
             MoveTo(SABX,SABY);
             LineTo(SBCX,SBCY);
             LineTo(SACX,SACY);
             LineTo(SABX,SABY);
             SetFillStyle(1,14-N);
             FloodFill( Round((AX+BX+CX)/3),
                        Round((AY+BY+CY)/3),
                        14-N );
             FrTrojuhelnik(N-1,AX,AY,SABX,SABY,SACX,SACY);
             FrTrojuhelnik(N-1,SBCX,SBCY,SABX,SABY,BX,BY);
             FrTrojuhelnik(N-1,SACX,SACY,SBCX,SBCY,CX,CY);
            end;
end;

procedure FrObdelnik(N:Byte;AX,AY,BX,BY,CX,CY,DX,DY:Integer);
var Hor1,
    Hor2,
    Ver1,
    Ver2: Integer;
begin
if N>0 then begin
             Hor1:=AX+Round( (BX-AX)/3 );
             Hor2:=AX+2*Round( (BX-AX)/3 );

             Ver1:=AY+Round( (DY-AY)/3 );
             Ver2:=AY+2*Round( (DY-AY)/3 );

             SetColor(14-N);
             SetFillStyle(1,14-N);
             RectAngle(Hor1,Ver1,Hor2,Ver2);
             FrObdelnik(N-1,AX,AY,Hor1,AY,Hor1,Ver1,AX,Ver1);
             FrObdelnik(N-1,Hor1,AY,Hor2,AY,Hor2,Ver1,Hor1,Ver1);
             FrObdelnik(N-1,Hor2,AY,BX,AY,BX,Ver1,Hor2,Ver1);
             FrObdelnik(N-1,AX,Ver1,Hor1,Ver1,Hor1,Ver2,AX,Ver2);
             FrObdelnik(N-1,Hor2,Ver1,BX,Ver1,BX,Ver2,Hor2,Ver2);
             FrObdelnik(N-1,AX,Ver2,Hor1,Ver2,Hor1,DY,AX,DY);
             FrObdelnik(N-1,Hor1,Ver2,Hor2,Ver2,Hor2,DY,Hor1,DY);
             FrObdelnik(N-1,Hor2,Ver2,CX,Ver2,CX,CY,Hor2,CY);
            end;
end;

procedure FrObdelnikJednoduch_Rekurze(N:Byte;AX,AY:Integer);
begin
 if N>0 then begin
              RectAngle(AX,AY,GetMaxX-AX,GetMaxY-AY);
              ReadLn;
              FrObdelnikJednoduch_Rekurze(N-1,AX+10,AY+10);
             end;
end;

procedure FrObdelnikJednoduch_Iterace(N:Byte;AX,AY:Integer);
var I:Byte;
begin
 for I:=1 to N do
  begin
   RectAngle(AX,AY,GetMaxX-AX,GetMaxY-AY);
   Inc(AX,10);
   Inc(AY,10);
   ReadLn;
  end;
end;

procedure FrTrojuhelnik_Mitsubishi(N:Byte;AX,AY,BX,BY,CX,CY:Integer);
var SABX1,SABY1,
    SABX2,SABY2,
    SBCX1,SBCY1,
    SBCX2,SBCY2,
    SACX1,SACY1,
    SACX2,SACY2,
    StredX,StredY: Integer;
begin
if N>0 then begin
             StredX:=AX+Round( (BX-AX)/2 );
             StredY:=AY-Round( (AY-CY)/3 );

             SABX1:=AX+Round( 1*(BX-AX)/3 );
             SABY1:=AY;
             SABX2:=AX+Round( 2*(BX-AX)/3 );
             SABY2:=AY;

             SBCX1:=BX-Round( 1*(BX-CX)/3 );
             SBCY1:=StredY;
             SBCX2:=BX-Round( 2*(BX-CX)/3 );
             SBCY2:=CY+Round( 1*(BY-CY)/3 );

             SACX1:=AX+Round( 1*(CX-AX)/3 );
             SACY1:=StredY;
             SACX2:=AX+Round( 2*(CX-AX)/3 );
             SACY2:=CY+Round( 1*(AY-CY)/3 );

             SetColor(14-N);
             SetFillStyle(1,14-N);

             Trojuhelnik[1].X:=StredX;
             Trojuhelnik[1].Y:=StredY;
             Trojuhelnik[2].X:=SACX1;
             Trojuhelnik[2].Y:=SACY1;
             Trojuhelnik[3].X:=SABX1;
             Trojuhelnik[3].Y:=SABY1;
             FillPoly(3,Trojuhelnik);

             Trojuhelnik[1].X:=SBCX1;
             Trojuhelnik[1].Y:=SBCY1;
             Trojuhelnik[2].X:=StredX;
             Trojuhelnik[2].Y:=StredY;
             Trojuhelnik[3].X:=SABX2;
             Trojuhelnik[3].Y:=SABY2;
             FillPoly(3,Trojuhelnik);

             Trojuhelnik[1].X:=SBCX2;
             Trojuhelnik[1].Y:=SBCY2;
             Trojuhelnik[2].X:=SACX2;
             Trojuhelnik[2].Y:=SACY2;
             Trojuhelnik[3].X:=StredX;
             Trojuhelnik[3].Y:=StredY;
             FillPoly(3,Trojuhelnik);

             FrTrojuhelnik_Mitsubishi(N-1,AX,AY,SABX1,SABY1,SACX1,SACY1);
             FrTrojuhelnik_Mitsubishi(N-1,SABX1,SABY1,SABX2,SABY2,StredX,StredY);
             FrTrojuhelnik_Mitsubishi(N-1,SABX2,SABY2,BX,BY,SBCX1,SBCY1);
             FrTrojuhelnik_Mitsubishi(N-1,SACX1,SACY1,StredX,StredY,SACX2,SACY2);
             FrTrojuhelnik_Mitsubishi(N-1,StredX,StredY,SBCX1,SBCY1,SBCX2,SBCY2);
             FrTrojuhelnik_Mitsubishi(N-1,SACX2,SACY2,SBCX2,SBCY2,CX,CY);
            end;
end; { procedure FrTrojuhelnik_Mitsubishi }

procedure Bod_Otoc(X1,Y1:Real;Alfa:Word;var X2,Y2:Real);
var
     Uhel:      Real;    { V radi nech }
begin
 Uhel := (PI*Alfa) / 180;

 X2 := X1*Cos(Uhel) + Y1*Sin(Uhel);
 Y2 := Y1*Cos(Uhel) - X1*Sin(Uhel);
end; { procedure Bod_Otoc }

procedure Bod_Otoc_Draw(S:string;X1,Y1:Real;Alfa:Word;X,Y:Integer;JednX,JednY:ShortInt);
var
     PX,PY:     Integer; { KoneŸnì body na obrazovce }
     X2,Y2:     Real;    { PýepoŸ¡tanì body na starì souýadnice }
     Uhel:      Real;    { V radi nech }

     OX,OY:     Real;    { To samì pro Ÿ ry k ose - kolmice }
     POX,POY:   Integer;
begin
 Bod_Otoc(X1,Y1,Alfa,X2,Y2);
 Prepocti(X2,Y2,PX,PY,X,Y,JednX,JednY);
 SetColor(Red);
 SetLineStyle(SolidLn,0,ThickWidth);
 Line(PX-5,PY-5,PX+5,PY+5);
 Line(PX+5,PY-5,PX-5,PY+5);
 SetTextStyle(DefaultFont,HorizDir,1);
 SetTextJustify(LeftText,BottomText);
 OutTextXY(PX+10,PY-5,S);


 SetColor(Magenta);
 SetLineStyle(DottedLn,0,NormWidth);

 Bod_Otoc(X1,0,Alfa,OX,OY);
 Prepocti(OX,OY,POX,POY,X,Y,JednX,JednY);
 Line(PX,PY,POX,POY);

 Bod_Otoc(0,Y1,Alfa,OX,OY);
 Prepocti(OX,OY,POX,POY,X,Y,JednX,JednY);
 Line(PX,PY,POX,POY);
end; { procedure Bod_Otoc_Draw }

procedure Osy_Otoc(X,Y:Integer;KolikX,KolikY,JednX,JednY:ShortInt;Alfa:Word);
var
     PX,PY:     Integer; { KoneŸnì body na obrazovce }
     X2,Y2:     Real;    { PýepoŸ¡tanì body na starì souýadnice }
     Uhel:      Real;    { V radi nech }

     JX1,JX2,
     JY1,JY2:   Real;    { Pro jednotky }
     PX1,PX2,
     PY1,PY2:   Integer;

     I:         Byte;    { Pro cyklus }
     S:         string;
begin
 Uhel := (PI*Alfa) / 180;


 SetColor(Red);
 SetLineStyle(SolidLn,0,NormWidth);

 { Osa X }
 X2 := -KolikX*JednX*Cos(Uhel) { +  0*Sin(Uhel)  } ;
 Y2 := {-0*Cos(Uhel) } - ( -KolikX*JednX*Sin(Uhel) ) ;

 Prepocti(X2,Y2,PX,PY,X,Y,JednX,JednY);
 Line(PX,PY,GetMaxX div 2,GetMaxY div 2);

 X2 := KolikX*JednX*Cos(Uhel) { +  0*Sin(Uhel)  } ;
 Y2 := {0*Cos(Uhel)}  -  KolikX*JednX*Sin(Uhel) ;

 Prepocti(X2,Y2,PX,PY,X,Y,JednX,JednY);
 Line(PX,PY,GetMaxX div 2,GetMaxY div 2);
 { Osa X *** }

 { Osa Y }
 X2 := {-0*Cos(Uhel) } + ( -KolikY*JednY*Sin(Uhel) ) ;
 Y2 := -KolikY*JednY*Cos(Uhel) { -  0*Sin(Uhel)  } ;

 Prepocti(X2,Y2,PX,PY,X,Y,JednX,JednY);
 Line(PX,PY,GetMaxX div 2,GetMaxY div 2);

 X2 := {-0*Cos(Uhel) } +  KolikY*JednY*Sin(Uhel)  ;
 Y2 := KolikY*JednY*Cos(Uhel) { -  0*Sin(Uhel)  } ;

 Prepocti(X2,Y2,PX,PY,X,Y,JednX,JednY);
 Line(PX,PY,GetMaxX div 2,GetMaxY div 2);
 { Osa Y *** }

 SetLineStyle(SolidLn,0,NormWidth);
 SetTextStyle(DefaultFont,HorizDir,1);
 SetTextJustify(CenterText,CenterText);

 for I:=1 to KolikX do
  begin
   { + }
   Bod_Otoc(I,+0.1,Alfa,JX1,JY1);
   Bod_Otoc(I,-0.1,Alfa,JX2,JY2);
   Prepocti(JX1,JY1,PX1,PY1,X,Y,JednX,JednY);
   Prepocti(JX2,JY2,PX2,PY2,X,Y,JednX,JednY);
   Line(PX1,PY1,PX2,PY2);
   Str(I,S);
   OutTextXY(PX1+10,PY1-10,S);
   { - }
   Bod_Otoc(-I,+0.1,Alfa,JX1,JY1);
   Bod_Otoc(-I,-0.1,Alfa,JX2,JY2);
   Prepocti(JX1,JY1,PX1,PY1,X,Y,JednX,JednY);
   Prepocti(JX2,JY2,PX2,PY2,X,Y,JednX,JednY);
   Line(PX1,PY1,PX2,PY2);
   S:='-'+S;
   OutTextXY(PX1-10,PY1-10,S);
  end;

 for I:=1 to KolikY do
  begin
   { + }
   Bod_Otoc(+0.1,I,Alfa,JX1,JY1);
   Bod_Otoc(-0.1,I,Alfa,JX2,JY2);
   Prepocti(JX1,JY1,PX1,PY1,X,Y,JednX,JednY);
   Prepocti(JX2,JY2,PX2,PY2,X,Y,JednX,JednY);
   Line(PX1,PY1,PX2,PY2);
   Str(I,S);
   OutTextXY(PX1+10,PY1+10,S);
   { - }
   Bod_Otoc(+0.1,-I,Alfa,JX1,JY1);
   Bod_Otoc(-0.1,-I,Alfa,JX2,JY2);
   Prepocti(JX1,JY1,PX1,PY1,X,Y,JednX,JednY);
   Prepocti(JX2,JY2,PX2,PY2,X,Y,JednX,JednY);
   Line(PX1,PY1,PX2,PY2);
   S:='-'+S;
   OutTextXY(PX1+10,PY1+10,S);
  end;

end; { procedure Osy_Otoc }


procedure Kruznice1(SX,SY,R:Real;X,Y:Integer;JednX,JednY:ShortInt);
var
      Uhel:     Real;
      XX,YY:    Real;
      PX,PY:    Integer;
      I:        Integer;
begin
 for I:=1 to 3600 do
  begin
   Uhel := ((PI*I)/180)/10;   { trik - na 1 stupeå 10 teŸek }
   XX := SX + R*Cos(Uhel);
   YY := SY + R*Sin(Uhel);
   Prepocti(XX,YY,PX,PY,X,Y,JednX,JednY);
   PutPixel(PX,PY,Red);
  end;
end; { procedure Kruznice1 }

procedure Kruznice2(SX,SY,R:Real;X,Y:Integer;JednX,JednY:ShortInt);
var
      Beta:        Real;
      Uhel:        Real;

      OldX,OldY,            { Starì a novì hodnoty }
      NewX,NewY:   Real;

      POX,POY,
      PNX,PNY:     Integer; { PýepoŸty na pixely }

      BX1,BX2,              { Stýed nen¡ v 0,0 }
      BY1,BY2:     Real;
      I:           Integer;
begin
 SetLineStyle(SolidLn,0,NormWidth);
 SetColor(Red);
 Beta:=3;
 Uhel := ((PI*Beta)/180);

 { NepýiŸ¡tat stýed !!!! }
 OldX:=R;
 OldY:=0;


 for I:=1 to Round(360/Beta) do
  begin
   NewX := OldX*Cos(Uhel) - OldY*Sin(Uhel);
   NewY := OldY*Cos(Uhel) + OldX*Sin(Uhel);

   { Stýed se pýiŸte a§ tady - jenom na kreslen¡, }
   { v dalç¡m cyklu se s n¡m zase nepoŸ¡t  }
   BX1:=OldX+SX;
   BX2:=NewX+SX;
   BY1:=OldY+SY;
   BY2:=NewY+SY;

   Prepocti(BX1,BY1,POX,POY,X,Y,JednX,JednY);
   Prepocti(BX2,BY2,PNX,PNY,X,Y,JednX,JednY);
   Line(POX,POY,PNX,PNY);

   OldX := NewX;
   OldY := NewY;
  end;
end; { procedure Kruznice2 }

{ Ke Kruznice2
==============================================================================

   B     = [ r * cos(alfa)      , r * sin(alfa)      ]
    n

   B     = [ r * cos(alfa+beta) , r * sin(alfa+beta) ]
    n+1

==============================================================================

   X     = r  * cos(alfa+beta)
    n+1

         = r  * ( cos(alfa)*cos(beta) - sin(alfa)*sin(beta) )

         = Xn * cos(beta)             - Yn * sin(beta)

==============================================================================

   Y     = r  * sin(alfa+beta)
    n+1

         = r  * ( sin(alfa)*cos(beta) + sin(beta)*cos(alfa) )

         = Yn * cos(beta)             + Xn * sin(alfa)

==============================================================================
}

procedure Elipsa(SX,SY,A,B:Real;X,Y:Integer;JednX,JednY:ShortInt);
var
      Uhel:     Real;
      XX,YY:    Real;
      PX,PY:    Integer;
      I:        Integer;
begin
 for I:=1 to 3600 do
  begin
   Uhel := ((PI*I)/180)/10;   { trik - na 1 stupeå 10 teŸek }
   XX := SX + A*Cos(Uhel);
   YY := SY + B*Sin(Uhel);
   Prepocti(XX,YY,PX,PY,X,Y,JednX,JednY);
   PutPixel(PX,PY,Red);
  end;
end; { procedure Elipsa }


procedure Elipsa_Otoc(SX,SY,A,B:Real;Alfa:Word; X,Y:Integer;JednX,JednY:ShortInt);
var
      Uhel:     Real;
      XX,YY:    Real;
      OX,OY:    Real; { PýetoŸenì }
      PX,PY:    Integer;
      I:        Integer;
begin
 for I:=1 to 3600 do
  begin
   Uhel := ((PI*I)/180)/10;   { trik - na 1 stupeå 10 teŸek }
   XX := SX + A*Cos(Uhel);
   YY := SY + B*Sin(Uhel);
   Bod_Otoc(XX,YY,Alfa,OX,OY);
   Prepocti(OX,OY,PX,PY,X,Y,JednX,JednY);
   PutPixel(PX,PY,Red);
  end;
end; { procedure Elipsa_Otoc }

procedure Kruznice3(SX,SY,R:Real;X,Y:Integer;JednX,JednY:ShortInt);
var
      XX,YY:    Real;
      PX,PY:    Integer;
      I:        Integer;

      SPX,SPY:  Integer;
begin
 Prepocti(SX,SY,SPX,SPY,X,Y,JednX,JednY);
 SetLineStyle(SolidLn,0,NormWidth);
 SetColor(Red);
 { pro t od -1 do 1 }
 for I:= -1000 to 1000 do
  begin
   XX := R * ( (1-Sqr(I/1000)) / (1+Sqr(I/1000)) ); { POZOR /1000 }
   XX := XX + SX; { Stýed nen¡ v 0 }

   YY := R * ( (2*I/1000) / (1+Sqr(I/1000)) );      { POZOR /1000 }
   YY := YY + SY; { Stýed nen¡ v 0 }

   Prepocti(XX,YY,PX,PY,X,Y,JednX,JednY);
   PutPixel(PX,PY,Red);

   { Stýedov  soumØrnost pro 2. p…lku }
   PX := PX - 2*(PX-SPX);
   PY := PY - 2*(PY-SPY);
   PutPixel(PX,PY,Red);
  end;
end; { procedure Kruznice3 }

procedure Hyperbola(SX,SY,A,B:Real;X,Y:Integer;JednX,JednY:ShortInt);
var
      XX,YY:    Real;
      SPX,SPY:  Integer; { Stýed }
      { 1. p…lka }
      PX1,PY1:  Integer;
      PX2,PY2:  Integer;
      { 2. p…lka }
      PX3,PY3:  Integer;
      PX4,PY4:  Integer;
      { To by byly nuly ve jmenovateli }
      T_Dole,
      T_Nahore,
      Pom:      Real;  { Slou§¡ i jako promØnn  cyklu }
begin
 T_Dole   := -B/A;
 T_Nahore := +B/A;

 if T_Dole>T_Nahore then begin
                          Pom:=T_Nahore;
                          T_Nahore:=T_Dole;
                          T_Dole:=Pom;
                         end;

 Prepocti(SX,SY,SPX,SPY,X,Y,JednX,JednY);
 SetLineStyle(SolidLn,0,NormWidth);
 SetColor(Red);
 { pro t od -1 do 1 }
 Pom:=T_Dole+0.01;
 repeat
  XX := -A + ( (2*A*Sqr(B)) / ( Sqr(B)-(Sqr(A)*Sqr(Pom)) ) );
  XX := XX + SX; { Stýed nen¡ v 0 }

  YY := ( Pom * 2*A*Sqr(B) ) / (Sqr(B)-(Sqr(A)*Sqr(Pom)));
  YY := YY + SY; { Stýed nen¡ v 0 }

  Prepocti(XX,YY,PX2,PY2,X,Y,JednX,JednY);
  { Poprvì nezn me PX1 a PY1 }
  if Pom>(T_Dole+0.01) then Line(PX1,PY1,PX2,PY2);
  PX1:=PX2;
  PY1:=PY2;

  { Stýedov  soumØrnost pro 2. p…lku }
  PX4 := PX2 - 2*(PX2-SPX);
  PY4 := PY2 - 2*(PY2-SPY);
  { Poprvì nezn me PX3 a PY3 }
  if Pom>(T_Dole+0.01) then Line(PX3,PY3,PX4,PY4);
  PX3:=PX4;
  PY3:=PY4;

  Pom:=Pom+0.01;
  Delay(10);
 until Pom>=(T_Nahore-0.01);
end; { procedure Kruznice3 }

procedure Make2D(X,Y,Z:Real;H,D:Real;var XX,YY:Real);
begin
 XX := X *   ( D / (Y+D) );
 YY := H + ( ( D / (Y+D) ) * (Z-H) );
end; { procedure Make2D }

{
 d...distance
 h...vìçka horizontu

 S [ 0, -d, h ]      X`[ X`,  Y`, Z` ]

 X = S + t(X`-S)  ---> pý¡mka p

 x = 0 + t(X`-0)
 y = d + t(Y`+d) ---------------------+
 z = h + t(Z`-h)                      +               d
                                      +-----> t = ---------  ===+
 Y = 0 proto§e je to v pr…mØtnØ ------+            Y` + d       º
                                                                º
                                                                º
 +==============================================================+
 º
 º                                    d
 +==> X = 0 + t(X`-0)  =  tX`  =  --------- X`
                                   Y` + d

      Y = d + t(Y`+d)  =  0

                                   d
      Z = h + t(Z`-h)  =  h + [ -------- * (Z`-h) ]
                                 Y` + d

}

procedure Kresli6Sten3D(Co:T6Sten;H,D:Real;X,Y:Integer;JednX,JednY:ShortInt);
var
      I:        Byte;

      Pole_I8:  array[1..8] of record
                                X: Integer;
                                Y: Integer;
                               end;

      Pole_R8:  array[1..8] of record
                                X: Real;
                                Y: Real;
                               end;

begin
 for I:=1 to 8 do
  begin
   Make2D(Co[I].X,Co[I].Y,Co[I].Z,H,D,Pole_R8[I].X,Pole_R8[I].Y);
   Prepocti(Pole_R8[I].X,Pole_R8[I].Y,Pole_I8[I].X,Pole_I8[I].Y,X,Y,JednX,JednY);
  end;
 SetColor(Red);
 SetLineStyle(SolidLn,0,NormWidth);

 Line(Pole_I8[1].X,Pole_I8[1].Y,Pole_I8[2].X,Pole_I8[2].Y);
 Line(Pole_I8[2].X,Pole_I8[2].Y,Pole_I8[3].X,Pole_I8[3].Y);
 Line(Pole_I8[3].X,Pole_I8[3].Y,Pole_I8[4].X,Pole_I8[4].Y);
 Line(Pole_I8[4].X,Pole_I8[4].Y,Pole_I8[1].X,Pole_I8[1].Y);
 Line(Pole_I8[5].X,Pole_I8[5].Y,Pole_I8[6].X,Pole_I8[6].Y);
 Line(Pole_I8[6].X,Pole_I8[6].Y,Pole_I8[7].X,Pole_I8[7].Y);
 Line(Pole_I8[7].X,Pole_I8[7].Y,Pole_I8[8].X,Pole_I8[8].Y);
 Line(Pole_I8[8].X,Pole_I8[8].Y,Pole_I8[5].X,Pole_I8[5].Y);
 Line(Pole_I8[1].X,Pole_I8[1].Y,Pole_I8[5].X,Pole_I8[5].Y);
 Line(Pole_I8[2].X,Pole_I8[2].Y,Pole_I8[6].X,Pole_I8[6].Y);
 Line(Pole_I8[3].X,Pole_I8[3].Y,Pole_I8[7].X,Pole_I8[7].Y);
 Line(Pole_I8[4].X,Pole_I8[4].Y,Pole_I8[8].X,Pole_I8[8].Y);
end; { procedure Kresli6Sten3D }

end. { unit Grafika }





















(*
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

 Zde jsou pýebytenì procedury a fce nebo ty co se nepovedly

                      Je to natvrdo

function LaGrangeovaInter3(X:Real;X0,X1,X2,Y0,Y1,Y2:ShortInt):Real;
var Pom:Real;
begin
 Pom:= ( Y0 * ( ((X-X1)*(X-X2)) / ((X0-X1)*(X0-X2)) ) ) +
       ( Y1 * ( ((X-X0)*(X-X2)) / ((X1-X0)*(X1-X2)) ) ) +
       ( Y2 * ( ((X-X0)*(X-X1)) / ((X2-X0)*(X2-X1)) ) ) ;
 LaGrangeovaInter3:=Pom;
end;

                      Je to natvrdo

function  NewtonovaInter3(X:Real;X0,X1,X2,Y0,Y1,Y2:ShortInt):Real;
var A0,A1,A2:Real;
    Pom:     Real;
begin
 A0:=Y0;
 A1:=(Y1-A0)/(X1-X0);
 A2:=(Y2-A0-A1*(X2-X0))/((X2-X0)*(X2-X1));
 Pom:=A0+ A1*(X-X0)+ A2*(X-X0)*(X-X1);
 NewtonovaInter3:=Pom;
end;

function  NewtonovaInter(X:Real;Kolik:Byte;Pole:BodyInter):Real;

       {***************************************************}
       function DejZavorky(X:Real;Pozice:Byte;Pole:BodyInter):Real;
       var Pom:Real;
           I:  Byte;
       begin
        Pom:=1;
        for I:=0 to Pozice-1 do
         Pom:=Pom*(X-Pole[I].X);
        DejZavorky:=Pom;
       end;
       {***************************************************}
       procedure DejAcka(Pole:BodyInter;var X:PoleAcek);
       begin
        X[0]:=Pole[0].Y;
        X[1]:=(Pole[1].Y-X[0])/(Pole[1].X-Pole[0].X);
        X[2]:=(Pole[2].Y-X[0]-(X[1]*(Pole[2].X-Pole[0].X))) /
              ( (Pole[2].X-Pole[0].X)*(Pole[2].X-Pole[1].X) );
        X[3]:=(Pole[3].Y-X[0]-(X[1]*(Pole[3].X-Pole[0].X))-(X[2]*(Pole[3].X-Pole[0].X)*(Pole[3].X-Pole[1].X)) ) /
              ( (Pole[3].X-Pole[0].X)*(Pole[3].X-Pole[1].X)*(Pole[3].X-Pole[2].X) );
       end;
       {***************************************************}

var Pom:   Real;
    I:     Byte;
    Acka:  PoleAcek;
begin
 Pom:=0;
 DejAcka(Pole,Acka);
 for I:=0 to Kolik-1 do
  Pom:=Pom+(Acka[I]*DejZavorky(X,I,Pole));
 NewtonovaInter:=Pom;
end;

 Pro osy co nejsou v p…li


p DejPocatek(X,Y:Integer;JednX,JednY,MinX,MaxX,MinY,MaxY:ShortInt;var PocX,PocY:Integer);
p NewOsaX(X,Y,PocY:Integer);
p NewOsaY(X,Y,PocX:Integer);
p NewSipkaX(X,Y,PocY:Integer);
p NewSipkaY(X,Y,PocX:Integer);
p NewJednotkyX(X,Y:Integer;MinX,MaxX,JednX:ShortInt;PocX,PocY:Integer);
p NewJednotkyY(X,Y:Integer;MinY,MaxY,JednY:ShortInt;PocX,PocY:Integer);
f NewPrepoctiX(N:Real;JednX:ShortInt;X:Integer;PocX:Integer):Real;
f NewPrepoctiY(N:Real;JednY:ShortInt;Y:Integer;PocY:Integer):Real;
p NewZanesBod(S:String;PX,PY:Integer;X,Y:Integer;PocX,PocY:Integer);

     Od tedka to nefacha

procedure DejPocatek(X,Y:Integer;JednX,JednY,MinX,MaxX,MinY,MaxY:ShortInt;var PocX,PocY:Integer);
begin
 PocX:=(X div 2)-(JednX* ( Abs(MaxX)-Abs(MinX) ) );
       P…lka     jednotky   posun poŸ tku
 PocY:=(Y div 2)-(JednY* ( Abs(MaxY)-Abs(MinY) ) );
       P…lka     jednotky   posun poŸ tku
end;

procedure NewOsaX(X,Y,PocY:Integer);
var I:Integer;
begin
 for I:=1 to X do
  begin
   PutPixel(I,PocY+0,Green);
   PutPixel(I,PocY+1,Green);
   Sound(10*I);
   Delay(2);
   NoSound;
  end;
end;

procedure NewOsaY(X,Y,PocX:Integer);
var I:Integer;
begin
 for I:=Y downto 1 do
  begin
   PutPixel(PocX+0,I,Green);
   PutPixel(PocX+1,I,Green);
   Sound(10*(Y-I));
   Delay(2);
   NoSound;
  end;
end;

procedure NewSipkaX(X,Y,PocY:Integer);
begin
 Line(X-10,PocY-5,X-10,PocY+5);
 Line(X-10,PocY-5,X,PocY);
 Line(X-10,PocY+5,X,PocY);
 SetFillStyle(1,Green);
 FloodFill(X-8,PocY+2,Green);
 FloodFill(X-8,PocY-2,Green);
 SetTextJustify(0,0);
 OutTextXY(X-10,PocY-20,'x');
end;

procedure NewSipkaY(X,Y,PocX:Integer);
begin
 Line(PocX-5,10,PocX,0);
 Line(PocX+5,10,PocX,0);
 Line(PocX-5,10,PocX+5,10);
 SetFillStyle(1,Green);
 FloodFill(PocX-2,8,Green);
 FloodFill(PocX+2,8,Green);
 SetTextJustify(0,0);
 OutTextXY((X div 2)-15,10,'y');
end;

procedure NewJednotkyX(X,Y:Integer;MinX,MaxX,JednX:ShortInt;PocX,PocY:Integer);
var I:ShortInt;
    S:String[3];
begin
 SetLineStyle(SolidLn,0,NormWidth);
 SetTextStyle(DefaultFont,HorizDir,1);
 SetTextJustify(CenterText,CenterText);
 for I:=1 to MinX do
  begin
   Line(PocX-(I*JednX),PocY-5,
        PocX-(I*JednX),PocY+5 );
   Str(I,S);
   OutTextXY(PocX-(I*JednX),PocY+10,S);
   Sound(500);
   Delay(10);
   NoSound;
   Delay(100);
  end;
 for I:=1 to MaxX do
  begin
   Line(PocX+(I*JednX),PocY-5,
        PocX+(I*JednX),PocY+5 );
   Str(I,S);
   OutTextXY(PocX+(I*JednX),PocY+10,S);
   Sound(500);
   Delay(10);
   NoSound;
   Delay(100);
  end;
end;

procedure NewJednotkyY(X,Y:Integer;MinY,MaxY,JednY:ShortInt;PocX,PocY:Integer);
var I:ShortInt;
    S:String[3];
begin
 SetLineStyle(SolidLn,0,NormWidth);
 SetTextStyle(DefaultFont,HorizDir,1);
 SetTextJustify(CenterText,CenterText);
 for I:=1 to MinY do
  begin
   Line(PocX-5,PocY+(I*JednY),
        PocX+5,PocY+(I*JednY) );
   Str(I,S);
   OutTextXY(PocX+10,PocY+(I*JednY),S);
   Sound(500);
   Delay(10);
   NoSound;
   Delay(100);
  end;
 for I:=1 to MaxY do
  begin
   Line(PocX-5,PocY-(I*JednY),
        PocX+5,PocY-(I*JednY) );
   Str(I,S);
   OutTextXY(PocX+10,PocY-(I*JednY),S);
   Sound(500);
   Delay(10);
   NoSound;
   Delay(100);
  end;
end;

function  NewPrepoctiX(N:Real;JednX:ShortInt;X:Integer;PocX:Integer):Real;
var Pom:Real;
begin
 Pom:=PocX+(N*JednX);
 if Pom>X then Pom:=X;
 if Pom<0 then Pom:=0;
 NewPrepoctiX:=Pom;
end;

function  NewPrepoctiY(N:Real;JednY:ShortInt;Y:Integer;PocY:Integer):Real;
var Pom:Real;
begin
 Pom:=PocY+(N*JednY);
 if Pom>Y then Pom:=Y;
 if Pom<0 then Pom:=0;
 NewPrepoctiY:=Pom;
end;

procedure NewZanesBod(S:String;PX,PY:Integer;X,Y:Integer;PocX,PocY:Integer);
begin
 SetTextStyle(DefaultFont,HorizDir,1);
 SetTextJustify(CenterText,CenterText);
 SetColor(Blue);
 SetLineStyle(DottedLn,0,NormWidth);
 Line(PX,PY,PocX,PY);
 Line(PX,PY,PX,PocY);
 SetColor(Red);
 SetLineStyle(SolidLn,0,ThickWidth);
 Line(PX-5,PY-5,PX+5,PY+5);
 Line(PX+5,PY-5,PX-5,PY+5);
 OutTextXY(PX+10,PY-5,S);
end;

*)
