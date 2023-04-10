{ Created by GAS 1995 }

unit Matika;

interface

uses Crt;

type
     PPoleDel = ^TPoleDel;
     TPoleDel =  array[1..5] of Byte;

     PPoleCif = ^TPoleCif;
     TPoleCif =  array[0..9] of Byte;

     PMatice44 = ^TMatice44;
     TMatice44 =  array[1..4,1..4] of LongInt;

     PSadaMat = ^TSadaMat;
     TSadaMat =  array[1..8] of PMatice44;

function  JeDelKazSvCif(Cislo:Integer):Boolean;
function  JePalindrom(Cislo:Integer):Boolean;
function  CifryJenJednou(Cislo:Integer):Boolean;

procedure DejMocninuMat(N:Byte;var V:PMatice44);

procedure Matice_Init(Vzor:PMatice44);
procedure Matice_Done;

procedure NasobMatice(A,B:PMatice44;var V:PMatice44);
procedure TiskMatice(X:PMatice44);
procedure DejMatici(var X:PMatice44);
function  DoBinarni(X:Byte):String;
procedure UmistiMatici(X,Y:Byte;M:PMatice44;Poz,Pop:Byte);

function  Porovnani(A,B:PMatice44):Boolean;

function  JePythagTrojuh(A,B,C:Integer):Boolean;

var
     Zaklad: TSadaMat;

implementation


procedure NasobMatice(A,B:PMatice44;var V:PMatice44);
var I,J,X: Byte;
    Soucet:LongInt;
begin
 if (A=nil) or (B=nil) then begin
                             WriteLn('Vstup v "NasobMatice" je NIL. => Exit');
                             Sound(500); Delay(500); NoSound;
                             for I:=1 to 4 do
                              for J:=1 to 4 do
                               V^[I,J]:=0;
                             Exit;
                            end;
 if V=nil then V:=New(PMatice44);
 for I:=1 to 4 do
  for J:=1 to 4 do
   begin
    Soucet:=0;
    for X:=1 to 4 do
     Soucet:=Soucet+(A^[I,X]*B^[X,J]);
    V^[I,J]:=Soucet;
   end;
end; { NasobMatice }

function JeDelKazSvCif(Cislo:Integer):Boolean;
var Pole:    TPoleDel;
    Cislice: Byte;
    PomC:    Integer;
    I:       Byte;
    B:       Boolean;
begin
 for I:=1 to 5 do { Nulování pole }
  Pole[I]:=25;

 PomC:=Cislo;
 I:=1;

 { Dávání číslic do pole }
 Cislice:=PomC mod 10;
 PomC:=PomC div 10;
 Pole[I]:=Cislice;

 while PomC<>0 do
  begin
   Inc(I);
   Cislice:=PomC mod 10;
   PomC:=PomC div 10;
   Pole[I]:=Cislice;
  end;

 B:=True;
 for I:=1 to 5 do
  if Pole[I]<>25 then
   if Pole[I]=0 then B:=False
                else if ((Cislo mod Pole[I])<>0) then B:=False;
 JeDelKazSvCif:=B;
end; { JeDelKazSvCis }

function JePalindrom(Cislo:Integer):Boolean;
var I:      Byte;
    Z1,Z2:  Char;
    B:      Boolean;
    PS:     String[5];
    Delka:  Byte;
begin
 B:=True;
 Str(Cislo,PS);
 Delka:=Length(PS);
 for I:=1 to (Delka div 2) do
  begin
   Z1:=PS[I];
   Z2:=PS[Delka+1-I];
   if Z1<>Z2 then B:=False;
  end;
 JePalindrom:=B;
end; { JePalindrom }

function CifryJenJednou(Cislo:Integer):Boolean;
var Pole:   TPoleCif;
    PS:     String[5];
    Z:      Char;
    I:      Byte;
    B:      Boolean;
begin
 { Vynulovat pole }
 for I:=0 to 9 do
  Pole[I]:=0;

 Str(Cislo,PS);
 for I:=1 to Length(PS) do
  begin
   Z:=PS[I];
   Inc(Pole[Ord(Z)-Ord('0')]); { Zvětšit položku pole podle číslice }
  end;

 B:=True;
 for I:=0 to 9 do
  if Pole[I]>1 then B:=False; { Musí bejt 0 nebo 1 }

 CifryJenJednou:=B;
end; { CifryJenJednou }

procedure TiskMatice(X:PMatice44);
var I,J:Byte;
begin
 if X=nil then begin
                WriteLn('Vstup v "TiskMatice" je NIL. => Exit');
                Sound(500); Delay(500); NoSound;
                Exit;
               end;

 for I:=1 to 4 do
  begin
   for J:=1 to 4 do
    Write(X^[I,J]:8);
   WriteLn;
  end;
 WriteLn('==== Enter ====');
 ReadLn;
end; { TiskMatice44 }

procedure DejMatici(var X:PMatice44);
var I,J:Byte;
    Pom:Byte;
begin
 for I:=1 to 4 do
  for J:=1 to 4 do
   begin
    X^[I,J]:=Random(6);
    Pom:=Random(10);
    if Pom<5 then X^[I,J]:= -1*X^[I,J];
   end;
end; { DejMatice44 }

function  DoBinarni(X:Byte):String;
var I:      Byte;
    S:      String[8];
    Podil:  Byte;
    Zbytek: Byte;
    Z:      Char;
    PS:     String[1];
    CitacB: Byte;
begin
 CitacB:=8;
 Podil:=X;
 S:='00000000';
 while Podil>0 do
  begin
   Zbytek:=Podil mod 2;
   Podil:=Podil div 2;

   Str(Zbytek,PS);
   Z:=PS[1];
   S[CitacB]:=Z;
   Dec(CitacB);
  end;
 DoBinarni:=S;
end; { DoBinarni }

function KopirujPP(A:PMatice44):PMatice44;
var X:  PMatice44;
    I,J:Byte;
begin
 if A=nil then begin
                WriteLn('Vstup v "KopirujPP" je NIL. => Exit');
                Sound(500); Delay(500); NoSound;
                KopirujPP:=nil;
                Exit;
               end;

 X:=New(PMatice44);
 for I:=1 to 4 do
  for J:=1 to 4 do
   X^[I,J]:=A^[I,J];
 KopirujPP:=X;
end; { KopirujPP }

procedure DejMocninuMat(N:Byte;var V:PMatice44);
var CoDelat:      String[8];
    Pom1,
    Pom2:         PMatice44;
    UzNasobeno:   Boolean;
    I:            Byte;
begin
 if N<1 then begin
              WriteLn('Exponent musí být větší než 1 ! => Exit.');
              Exit;
             end;
 UzNasobeno:=False;
 CoDelat:=DoBinarni(N);
 Pom1:=New(PMatice44);
 Pom2:=New(PMatice44);

 for I:=1 to 8 do
  if CoDelat[9-I]='1' then begin { U 1 k tomu nedojde }
                         if UzNasobeno then NasobMatice(Pom1,Zaklad[I],Pom2)
                                       else Pom2:=KopirujPP(Zaklad[I]);
                         Pom1:=KopirujPP(Pom2);
                         UzNasobeno:=True;
                        end;
 V:=Pom1;
 Dispose(Pom2);
end; { DejMocninuMat}

procedure Matice_Init(Vzor:PMatice44);
var I:Byte;
begin
 Zaklad[1]:=KopirujPP(Vzor);
 for I:=2 to 8 do
  Zaklad[I]:=New(PMatice44);

 {
  Naplnění základních matic (expon=násobky 2 do 128)

 }
 for I:=2 to 8 do
  NasobMatice(Zaklad[I-1],Zaklad[I-1],Zaklad[I]);

 WriteLn('Matice nahozeny.');
 WriteLn('Programátor nezodpovídá za případné chyby programu.');
end; { Matice_Init }

procedure Matice_Done;
var I:Byte;
begin
 for I:=1 to 8 do
 Dispose(Zaklad[I]);

 WriteLn('Matice uvolněny.');
end;

function  Porovnani(A,B:PMatice44):Boolean;
var Bool:  Boolean;
    I,J:   Byte;
begin
 if (A=nil) or (B=nil) then begin
                             WriteLn('Vstup do "Porovnani" je NIL => Exit.');
                             Porovnani:=False;
                             Sound(500); Delay(500); NoSound;
                             Exit;
                            end;
 Bool:=True;
 I:=0;
 J:=0;

 while Bool and (I<5) do
  begin
   Inc(I);
   while Bool and (J<5) do
    begin
     Inc(J);
     if A^[I,J]<>B^[I,J] then Bool:=False;
    end;
  end;
 Porovnani:=Bool;
end; { Porovnani }

procedure UmistiMatici(X,Y:Byte;M:PMatice44;Poz,Pop:Byte);
var I,J:Byte;
begin
 TextBackGround(Poz);
 TextColor(Pop);
 if M=nil then begin
                GoToXY(X,Y);
                WriteLn('Vstup je NIL v "UmistiMatici" => Exit.');
                Sound(500); Delay(500); NoSound;
                Exit;
               end;

 for I:=1 to 4 do
  begin
   GoToXY(X,Y+I-1);
   for J:=1 to 4 do
    Write(M^[I,J]:8);
   WriteLn;
  end;
end; { UmistiMatici }

function  JePythagTrojuh(A,B,C:Integer):Boolean;
var P:  Integer;
begin
 { Do C se nacpe největší číslo = odvěsna }
 P:=C;
 if A>C then begin
              C:=A;
              A:=P;
             end;
 P:=C;
 if B>C then begin
              C:=B;
              B:=P;
             end;

 JePythagTrojuh:= (Sqr(A)+Sqr(B)) = Sqr(C);
end; { JePythagTroj }


begin { unit Matika }

 Randomize;

end. { unit Matika }


