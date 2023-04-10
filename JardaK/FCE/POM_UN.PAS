{ Created by GAS 1995-6 }

unit Pom_Un;

interface

uses Crt;

type
      TRealFce = function(X:Real):Real;

var
      AktFce: TRealFce;


function  Dej_Real(S:String):Real;

procedure Prirad_Fci;
function  Pocitej(X:Real):Real;
function  Derivace(X:Real):Real;

implementation

function Dej_Real(S:String):Real;
var
    X:Real;
begin
 Write(S,' ');
 ReadLn(X);
 Dej_Real:=X;
end; { function Dej_Real }


{ Část fcí typu TRealFce - BEGIN }

function SinX(X:Real):Real; far;
begin
 SinX:=Sin(X);
end;

function ArcSinX(X:Real):Real; far;
var
    Pom: Real;
begin
 Pom:=Sqrt(Abs(1-Sqr(X)));
 if Pom=0 then ArcSinX:=1.7E38
          else ArcSinX:=ArcTan( X / Pom );
end;

function CosX(X:Real):Real; far;
begin
 CosX:=Cos(X);
end;

function ArcCosX(X:Real):Real; far;
begin
 if X=0 then ArcCosX:=1.7E38
        else ArcCosX:=ArcTan( Sqrt(Abs(1-Sqr(X))) / X );
end;

function TanX(X:Real):Real; far;
begin
 TanX:=Sin(X)/Cos(X);
end;

function ArcTanX(X:Real):Real; far;
begin
 ArcTanX:=Cos(X);
end;

{ Část fcí typu TRealFce - END }

procedure Prirad_Fci;
var
    C: Char;
    B: Boolean;
begin
 (*
 WriteLn('Vyberte si: ');
 WriteLn('1: Sinus       ');
 WriteLn('2: ArcusSinus  ');
 WriteLn('3: Cosinus     ');
 WriteLn('4: ArcusCosinus');
 WriteLn('5: Tangens     ');
 WriteLn('6: ArcusTangens');
 repeat
  B:=True;
  WriteLn('Vaše volba ? ');
  C:=ReadKey;
  case C of
   '1': AktFce:=SinX;
   '2': AktFce:=ArcSinX;
   '3': AktFce:=CosX;
   '4': AktFce:=ArcCosX;
   '5': AktFce:=TanX;
   '6': AktFce:=ArcTanX;
   else begin
         WriteLn('1..6 !!!');
         Sound(500); Delay(100); NoSound;
         B:=False;
        end;
  end; { case }
 until B;
 *)
 WriteLn('Implicitně přiřazena funkce Sinus (x) .');
 AktFce:=SinX;
end; { procedure Prirad_Fci }


function  Pocitej(X:Real):Real;
begin
 Pocitej:=AktFce(X);
end; { function  Pocitej }

{
 POZOR :  Jenom pro SinX !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!++
}
function Derivace(X:Real):Real;
begin
 Derivace:=Cos(X);
end; { function Derivace }



begin  { unit Pom_Un }
end.   { unit Pom_Un }