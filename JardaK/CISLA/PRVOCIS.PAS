{ Created by GAS 1995 }

unit Prvocis;

interface

const
     MaxPole = 50;
     MaxMat  = 5;

type
     Rada = array[1..MaxPole] of Integer;

     Zaznam_Posl = record
                    Zac:Byte;
                    Kon:Byte;
                    Kolik:Byte;
                   end;

     Posloupnost = array[1..MaxPole] of Zaznam_Posl;

     Matice = array[1..MaxMat,1..MaxMat] of Byte;


function  Je_Prvoc(Cis:Integer):Boolean;
function  Nte_Prvoc(N:Integer):Integer;

procedure Napln_Radu(var X:Rada);
procedure Init_Posl(var X:Posloupnost);
procedure Dej_Posloupnost(X:Rada;Zacit:Byte;var Zazn:Zaznam_Posl);
procedure Zpracuj_Posl(Delka:Byte;var X:Posloupnost);
procedure Pis_Radu(X:Rada);
procedure Pis_Posl(X:Rada;Start,Fin:Byte);
function  Dej_Max_Del_Posl(X:Posloupnost):Byte;

procedure Napln_Mat(var X:Matice);
procedure Pis_Mat(X:Matice);
function  Dej_Soucet_Prv_Mat(X:Matice):Integer;

function  Dej_Soucet_Pruhu(X:Matice;Pruh:Byte):Integer;
function  Dej_Kolik_Pruhu(X:Matice;Pruh:Byte):Integer;

{
     1  2  3  2  1    - pruh

  1  x  x  x  x  x

  2  x  x  x  x  x

  3  x  x  x  x  x

  2  x  x  x  x  x

  1  x  x  x  x  x

}

implementation

function Je_Prvoc(Cis:Integer):Boolean;
var Odm:Integer;
    B:  Boolean;
    I:  Integer;
begin
 Odm:=Trunc(Sqrt(Cis));
 B:=True;
 for I:=2 to Odm do
  if (Cis mod I)=0 then B:=False;
 if Cis=1 then B:=False;
 Je_Prvoc:=B;
end;

function Nte_Prvoc(N:Integer):Integer;
var I    :Integer;
    Citac:Integer;
    Nalez:Boolean;
begin
 I:=0;
 Citac:=0;
 Nalez:=False;
 repeat
  Inc(I);
  if Je_Prvoc(I) then begin
                       Inc(Citac);
                       if Citac=N then Nalez:=True;
                      end;
 until Nalez;
 Nte_Prvoc:=I;
end;

procedure Napln_Radu(var X:Rada);
var I:Byte;
begin
 for I:=1 to MaxPole do
  X[I]:=Random(100);
end;

procedure Init_Posl(var X:Posloupnost);
var I:Byte;
begin
 for I:=1 to MaxPole do
  with X[I] do
   begin
    Zac:=0;
    Kon:=0;
    Kolik:=0;
   end;
end;

procedure Dej_Posloupnost(X:Rada;Zacit:Byte;var Zazn:Zaznam_Posl);
var Zacc,Konn:Byte;
    Vypadni:  Boolean;
    Cis1,
    Cis2:     Integer;
begin
 if Zacit>MaxPole then begin
                   WriteLn('Chyba ve vstup. parametru u proc. Dej_Posloupnost!');
                   Exit;
                  end;
 Zacc:=Zacit;
 Konn:=Zacc+1;
 Cis1:=X[Zacc];
 Vypadni:=False;
 while (not(Vypadni)) and (Konn<=MaxPole) do
  begin
   Cis2:=X[Konn];
   if not(Cis2>Cis1) then Vypadni:=True
                     else Inc(Konn);
   Cis1:=Cis2;
  end;
 Dec(Konn);
 if Konn>MaxPole then Konn:=MaxPole;
 with Zazn do
  begin
   Zac:=Zacc;
   Kon:=Konn;
   Kolik:=Kon-Zac+1;
  end;
end;

procedure Zpracuj_Posl(Delka:Byte;var X:Posloupnost);
var I:Byte;
begin
 for I:=1 to MaxPole do
  if X[I].Kolik<>Delka then X[I].Kolik:=0;
end;

procedure Pis_Radu(X:Rada);
var I:Byte;
begin
 WriteLn;
 WriteLn('Řada : ');
 for I:=1 to MaxPole do
  Write(X[I],' ');
 WriteLn;
end;

procedure Pis_Posl(X:Rada;Start,Fin:Byte);
var I:Byte;
begin
 Write(' ■ ');
 for I:=Start to Fin do
  Write(X[I],' ');
 WriteLn('■ ');
end;

function  Dej_Max_Del_Posl(X:Posloupnost):Byte;
var Pom:Integer;
    I:  Byte;
begin
 Pom:=X[1].Kolik;
 for I:=2 to MaxPole do
  if Pom<X[I].Kolik then Pom:=X[I].Kolik;
 Dej_Max_Del_Posl:=Pom;
end;

procedure Napln_Mat(var X:Matice);
var I,J:Byte;
begin
 for I:=1 to MaxMat do
  for J:=1 to MaxMat do
   X[I,J]:=Random(50);
end;

procedure Pis_Mat(X:Matice);
var I,J:Byte;
begin
 WriteLn;
 for I:=1 to MaxMat do
  begin
   for J:=1 to MaxMat do
    Write(X[I,J]:3);
   WriteLn;
  end;
end;

function  Dej_Soucet_Prv_Mat(X:Matice):Integer;
var I,J:Byte;
    Pom:Integer;
begin
 Pom:=0;
 for I:=1 to MaxMat do
  for J:=1 to MaxMat do
   if Je_Prvoc(X[I,J]) then Inc(Pom,X[I,J]);
 Dej_Soucet_Prv_Mat:=Pom;
end;

function  Dej_Soucet_Pruhu(X:Matice;Pruh:Byte):Integer;
{
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

 !!!!!!!!!!     Nelze použít na samostatnou kostičku uprostřed    !!!!!!!!!!

 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

var I:  Byte;
    Pom:Integer;
begin
 Pom:=0;

 { Svislej levej okraj }
 for I:=Pruh to MaxMat+1-Pruh do
  Inc(Pom,X[I,Pruh]);

 { Svislej pravej okraj }
 for I:=Pruh to MaxMat+1-Pruh do
  Inc(Pom,X[I,MaxMat+1-Pruh]);

 { Horní zbytek }
 for I:=Pruh+1 to MaxMat-Pruh do
  Inc(Pom,X[Pruh,I]);

 { Dolní zbytek }
 for I:=Pruh+1 to MaxMat-Pruh do
  Inc(Pom,X[MaxMat+1-Pruh,I]);

 Dej_Soucet_Pruhu:=Pom;
end;

function  Dej_Kolik_Pruhu(X:Matice;Pruh:Byte):Integer;
{
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

 !!!!!!!!!!     Nelze použít na samostatnou kostičku uprostřed    !!!!!!!!!!

 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

var I:  Byte;
    Pom:Integer;
begin
 Pom:=0;

 { Svislej levej okraj }
 for I:=Pruh to MaxMat+1-Pruh do
  Inc(Pom);

 { Svislej pravej okraj }
 for I:=Pruh to MaxMat+1-Pruh do
  Inc(Pom);

 { Horní zbytek }
 for I:=Pruh+1 to MaxMat-Pruh do
  Inc(Pom);

 { Dolní zbytek }
 for I:=Pruh+1 to MaxMat-Pruh do
  Inc(Pom);

 Dej_Kolik_Pruhu:=Pom;
end;

begin { unit Prvocis }

 Randomize;

end.  { unit Prvocis }




