{ Created by GAS 1995 }

unit Determ;

interface

uses Crt;

type
      Determinant22 = array[1..2,1..2] of Real;
      Determinant33 = array[1..3,1..3] of Real;

      Soustava2 = array[1..2,1..3] of Real;
      Soustava3 = array[1..3,1..4] of Real;

function  Dej_Det22(X:Determinant22):Real;
function  Dej_Det33(X:Determinant33):Real;

procedure Res_Sous2(X:Soustava2;var DX,DY,   D:Real);
procedure Res_Sous3(X:Soustava3;var DX,DY,DZ,D:Real);




implementation

procedure Pis_Det33(X:Determinant33);
var I:Byte;
begin
 for I:=1 to 3 do
  WriteLn(X[I,1],'  ',X[I,2],'  ',X[I,3]);
end;


function Dej_Det22(X:Determinant22):Real;
begin
 Dej_Det22:=( X[1,1] * X[2,2] )-( X[1,2] * X[2,1]);
end; { function Dej_Det22 }

function Dej_Det33(X:Determinant33):Real;
begin
 Dej_Det33:=  + ( X[1,1] * X[2,2] * X[3,3] )
              + ( X[2,1] * X[3,2] * X[1,3] )
              + ( X[3,1] * X[1,2] * X[2,3] )
              - ( X[1,3] * X[2,2] * X[3,1] )
              - ( X[2,3] * X[3,2] * X[1,1] )
              - ( X[3,3] * X[1,2] * X[2,1] );
end; { function Dej_Det33 }


procedure Res_Sous2(X:Soustava2;var DX,DY,D:Real);
var
    Det: Determinant22;
begin
 { Původní naplnění }
 Det[1,1]:=X[1,1];
 Det[1,2]:=X[1,2];
 Det[2,1]:=X[2,1];
 Det[2,2]:=X[2,2];

 D:=Dej_Det22(Det);

 { Sloupec pravejch stran za X - do 1. sloupce }
 Det[1,1]:=X[1,3];
 Det[2,1]:=X[2,3];

 DX:=Dej_Det22(Det);

 { Obnova 1. sloupce }
 Det[1,1]:=X[1,1];
 Det[2,1]:=X[2,1];

 { Sloupec pravejch stran za Y - do 2. sloupce }
 Det[1,2]:=X[1,3];
 Det[2,2]:=X[2,3];

 DY:=Dej_Det22(Det);
end; { procedure Res_Sous2 }

procedure Res_Sous3(X:Soustava3;var DX,DY,DZ,D:Real);
var
     Det: Determinant33;
begin
 { Původní naplnění }
 Det[1,1]:=X[1,1];
 Det[1,2]:=X[1,2];
 Det[1,3]:=X[1,3];

 Det[2,1]:=X[2,1];
 Det[2,2]:=X[2,2];
 Det[2,3]:=X[2,3];

 Det[3,1]:=X[3,1];
 Det[3,2]:=X[3,2];
 Det[3,3]:=X[3,3];

 D:=Dej_Det33(Det);

 { Sloupec pravejch stran za X - do 1. sloupce }
 Det[1,1]:=X[1,4];
 Det[2,1]:=X[2,4];
 Det[3,1]:=X[3,4];

 DX:=Dej_Det33(Det);

 { Obnova 1. sloupce }
 Det[1,1]:=X[1,1];
 Det[2,1]:=X[2,1];
 Det[3,1]:=X[3,1];

 { Sloupec pravejch stran za Y - do 2. sloupce }
 Det[1,2]:=X[1,4];
 Det[2,2]:=X[2,4];
 Det[3,2]:=X[3,4];

 DY:=Dej_Det33(Det);

 { Obnova 2. sloupce }
 Det[1,2]:=X[1,2];
 Det[2,2]:=X[2,2];
 Det[3,2]:=X[3,2];

 { Sloupec pravejch stran za Z - do 3. sloupce }
 Det[1,3]:=X[1,4];
 Det[2,3]:=X[2,4];
 Det[3,3]:=X[3,4];

 DZ:=Dej_Det33(Det);
end; { procedure Res_Sous3 }





begin { unit Determ }
end.  { unit Determ }










