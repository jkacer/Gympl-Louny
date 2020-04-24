{ Created by Gas 1994}

unit Matice;

Interface

uses Crt;
const R=10;
      S=10;

      M=3;
      K=4;
      L=5;

type Mat = array[1..R,1..S] of Integer;
     Mat1= array[1..M,1..L] of Integer;
     Mat2= array[1..L,1..K] of Integer;
     Mat3= array[1..M,1..K] of Integer;
     Pol = array[1..S]      of Integer;
     Ver = array[1..R]      of Integer;

procedure DejMat(var X:Mat);
procedure Secti(A,B:Mat;var X:Mat);
procedure Vypis(X:Mat);
function  Vektor(X:Mat;Sl:Byte):Real;
procedure Soucin(A:Mat1;B:Mat2;var C:Mat3);
procedure Vypis1(X:Mat1);
procedure Vypis2(X:Mat2);
procedure Vypis3(X:Mat3);
procedure DejMat1(var X:Mat1);
procedure DejMat2(var X:Mat2);
procedure DejMat3(var X:Mat3);
function  Sloupec(X:Mat;Sl:Byte):Integer;
function  Radek(X:Mat;Rad:Byte):Integer;
procedure Jak(X:Mat;var Y:Pol);
procedure Dej_Ver(X:Mat;Sl:Byte;var Y:Ver);
procedure Dej_Pol(X:Mat;Rad:Byte;var Y:Pol);
function  Stejne_Ver(A,B:Ver):Boolean;
procedure Setrid_Ver(var X:Ver);
procedure Vepis_Ver(X:Ver;Sl:Byte;var Y:Mat);
procedure Setrid_Ver_Plus(var X,Y:Ver);
procedure Vepis_Pol(X:Pol;Rad:Byte;var Y:Mat);
function  Permutace_Ver(X:Ver):Boolean;
function  Permutace_Pol(X:Pol):Boolean;
function  Vaha(A:Mat;Rad,Sl:Byte):Integer;
function  NejV_Ver(X:Mat;Rad,Sl:Byte):Boolean;
function  NejV_Pol(X:Mat;Rad,Sl:Byte):Boolean;
function  NejM_Ver(X:Mat;Rad,Sl:Byte):Boolean;
function  NejM_Pol(X:Mat;Rad,Sl:Byte):Boolean;
procedure DejMatR(var X:Mat);
function  Max_Rad_Pos(X:Mat;Rad:Byte):Integer;
function  Max_Sl_Pos (X:Mat;Sl:Byte):Integer;
function  Min_Rad_Pos(X:Mat;Rad:Byte):Integer;
function  Min_Sl_Pos (X:Mat;Sl:Byte):Integer;

implementation

procedure DejMat(var X:Mat);
var I,J:Integer;
    Y:  Byte;
begin
 for I:=1 to R do
  for J:=1 to S do
   begin
    X[I,J]:=Random(20);
    Y:=Random(5);
    if Y<3 then X[I,J]:=0-X[I,J];
   end;
end;

procedure DejMat1(var X:Mat1);
var I,J:Integer;
    Y:  Byte;
begin
 for I:=1 to M do
  for J:=1 to L do
   begin
    X[I,J]:=Random(20);
    Y:=Random(5);
    if Y<3 then X[I,J]:=0-X[I,J];
   end;
end;

procedure DejMat2(var X:Mat2);
var I,J:Integer;
    Y:  Byte;
begin
 for I:=1 to L do
  for J:=1 to K do
   begin
    X[I,J]:=Random(20);
    Y:=Random(5);
    if Y<3 then X[I,J]:=0-X[I,J];
   end;
end;

procedure DejMat3(var X:Mat3);
var I,J:Integer;
    Y:  Byte;
begin
 for I:=1 to M do
  for J:=1 to K do
   begin
    X[I,J]:=Random(20);
    Y:=Random(5);
    if Y<3 then X[I,J]:=0-X[I,J];
   end;
end;

procedure Secti(A,B:Mat;var X:Mat);
var I,J:Integer;
begin
 for I:=1 to R do
  for J:=1 to S do
   X[I,J]:=A[I,J]+B[I,J];
end;

procedure Vypis(X:Mat);
var I,J:Integer;
begin
 for I:=1 to R do
  begin
   for J:=1 to S do
    case X[I,J] of
     -999..-100:Write(X[I,J],' ');
      -99..-10 :Write(' ',X[I,J],' ');
       -9..-1  :Write('  ',X[I,J],' ');
        0..9   :Write('   ',X[I,J],' ');
       10..99  :Write('  ',X[I,J],' ');
      100..999 :Write(' ',X[I,J],' ');
     else       Write('  ? ');
    end;
   WriteLn;
  end;
end;

procedure Vypis1(X:Mat1);
var I,J:Integer;
begin
 for I:=1 to M do
  begin
   for J:=1 to L do
    case X[I,J] of
     -999..-100:Write(X[I,J],' ');
      -99..-10 :Write(' ',X[I,J],' ');
       -9..-1  :Write('  ',X[I,J],' ');
        0..9   :Write('   ',X[I,J],' ');
       10..99  :Write('  ',X[I,J],' ');
      100..999 :Write(' ',X[I,J],' ');
     else       Write('  ? ');
    end;
   WriteLn;
  end;
end;

procedure Vypis2(X:Mat2);
var I,J:Integer;
begin
 for I:=1 to L do
  begin
   for J:=1 to K do
    case X[I,J] of
     -999..-100:Write(X[I,J],' ');
      -99..-10 :Write(' ',X[I,J],' ');
       -9..-1  :Write('  ',X[I,J],' ');
        0..9   :Write('   ',X[I,J],' ');
       10..99  :Write('  ',X[I,J],' ');
      100..999 :Write(' ',X[I,J],' ');
     else       Write('  ? ');
    end;
   WriteLn;
  end;
end;

procedure Vypis3(X:Mat3);
var I,J:Integer;
begin
 for I:=1 to M do
  begin
   for J:=1 to K do
    case X[I,J] of
     -999..-100:Write(X[I,J],' ');
      -99..-10 :Write(' ',X[I,J],' ');
       -9..-1  :Write('  ',X[I,J],' ');
        0..9   :Write('   ',X[I,J],' ');
       10..99  :Write('  ',X[I,J],' ');
      100..999 :Write(' ',X[I,J],' ');
     else       Write('  ? ');
    end;
   WriteLn;
  end;
end;


function  Vektor(X:Mat;Sl:Byte):Real;
var Celek: Integer;
    I:   Integer;
begin
 Celek:=0;
 for I:=1 to R do
  Celek:=Celek+Sqr(X[I,Sl]);
 Vektor:=Sqrt(Celek);
end;

procedure Soucin(A:Mat1;B:Mat2;var C:Mat3);
var I,J,X:Integer;
    Celek:      Integer;
begin
 for I:=1 to M do
  for J:=1 to K do
   begin
    C[I,J]:=0;
    for X:=1 to L do
     C[I,J]:=A[I,X]*B[X,J]+C[I,J];
   end;
end;

function  Sloupec(X:Mat;Sl:Byte):Integer;
var Celek: Integer;
    I:   Integer;
begin
 Celek:=0;
 for I:=1 to R do
  Celek:=Celek+X[I,Sl];
 Sloupec:=Celek;
end;

function  Radek(X:Mat;Rad:Byte):Integer;
var Celek: Integer;
    I:   Integer;
begin
 Celek:=0;
 for I:=1 to S do
  Celek:=Celek+X[Rad,I];
 Radek:=Celek;
end;

procedure Jak(X:Mat;var Y:Pol);
var I,J:     Integer;
    Soucet:Integer;
begin
 for I:=1 to S do
  begin
   Soucet:=0;
   for J:=1 to R do
    Soucet:=Soucet+X[J,I];
   Y[I]:=Soucet;
  end;
end;

procedure Dej_Ver(X:Mat;Sl:Byte;var Y:Ver);
var I:Byte;
begin
 for I:=1 to R do
  Y[I]:=X[I,Sl];
end;

procedure Dej_Pol(X:Mat;Rad:Byte;var Y:Pol);
var I:Byte;
begin
 for I:=1 to S do
  Y[I]:=X[Rad,I];
end;

function  Stejne_Ver(A,B:Ver):Boolean;
var X:Boolean;
    I:Byte;
begin
 X:=True;
 for I:=1 to R do
  if A[I]<>B[I] then X:=False;
 Stejne_Ver:=X;
end;

procedure Setrid_Ver(var X:Ver);
var I,J:Byte;
    Pom:Integer;
begin
 for I:=R downto 1 do
  for J:=2 to I do
   if X[J]<X[J-1] then begin
                        Pom   :=X[J];
                        X[J]  :=X[J-1];
                        X[J-1]:=Pom;
                       end;
end;

procedure Vepis_Ver(X:Ver;Sl:Byte;var Y:Mat);
var I:Byte;
begin
 for I:=1 to R do
  Y[I,Sl]:=X[I];
end;

procedure Setrid_Ver_Plus(var X,Y:Ver);
var I,J:Byte;
    Pom:Integer;
begin
 for I:=R downto 1 do
  for J:=2 to I do
   if X[J]<X[J-1] then begin
                        Pom   :=X[J];
                        X[J]  :=X[J-1];
                        X[J-1]:=Pom;
                        Pom   :=Y[J];
                        Y[J]  :=Y[J-1];
                        Y[J-1]:=Pom;
                       end;
end;

procedure Vepis_Pol(X:Pol;Rad:Byte;var Y:Mat);
var I:Byte;
begin
 for I:=1 to S do
  Y[Rad,I]:=X[I];
end;

function  Permutace_Pol(X:Pol):Boolean;
var A:    array[1..S] of Boolean;
    I,J:  Integer;
    B:    Boolean;
    Kolik:Integer;
begin
 for I:=1 to S do
  begin
   Kolik:=0;
   for J:=1 to S do
    if X[J]=I then Inc(Kolik);
   if Kolik=1 then A[I]:=True
              else A[I]:=False;
  end;
 Permutace_Pol:=True;
 for I:=1 to S do
  if A[I]=False then Permutace_Pol:=False;
end;

function  Permutace_Ver(X:Ver):Boolean;
var A:    array[1..R] of Boolean;
    I,J:  Integer;
    B:    Boolean;
    Kolik:Integer;
begin
 for I:=1 to R do
  begin
   Kolik:=0;
   for J:=1 to R do
    if X[J]=I then Inc(Kolik);
   if Kolik=1 then A[I]:=True
              else A[I]:=False;
  end;
 Permutace_Ver:=True;
 for I:=1 to R do
  if A[I]=False then Permutace_Ver:=False;
end;

function  Vaha(A:Mat;Rad,Sl:Byte):Integer;
var Souc :Integer;
begin
 Souc:=0;
 case Rad of
  1:   case Sl of
        1:   Souc:=2*A[1,1]+A[2,1]+A[1,2]+A[2,2];
        S:   Souc:=2*A[1,S]+A[2,S]+A[1,S-1]+A[2,S-1];
        else Souc:=2*A[1,Sl]+A[1,Sl-1]+A[1,Sl+1]+A[2,Sl-1]+A[2,Sl]+A[2,Sl+1];
       end;
  R:   case Sl of
        1:   Souc:=2*A[R,1]+A[R-1,1]+A[R,2]+A[R-1,2];
        S:   Souc:=2*A[R,S]+A[R,S-1]+A[R-1,S]+A[R-1,S-1];
        else Souc:=2*A[R,Sl]+A[R,Sl-1]+A[R,Sl+1]+A[R-1,Sl-1]+A[R-1,Sl]+A[R-1,Sl+1];
       end;
  else case Sl of
        1:   Souc:=2*A[Rad,1]+A[Rad-1,1]+A[Rad+1,1]+
                     A[Rad,2]+A[Rad-1,2]+A[Rad+1,2];
        S:   Souc:=2*A[Rad,S]+A[Rad-1,S]+A[Rad+1,S]+
                     A[Rad,S-1]+A[Rad-1,S-1]+A[Rad+1,S-1];
        else Souc:=2*A[Rad,Sl]+A[Rad,Sl-1]+A[Rad,Sl+1]+
                     A[Rad-1,Sl]+A[Rad-1,Sl-1]+A[Rad-1,Sl+1]+
                     A[Rad+1,Sl]+A[Rad+1,Sl-1]+A[Rad+1,Sl+1];
       end;
 end;
 Vaha:=Souc;
end;

function  NejV_Ver(X:Mat;Rad,Sl:Byte):Boolean;
var I:    Byte;
begin
 NejV_Ver:=True;
 for I:=1 to R do
  if X[I,Sl]>X[Rad,Sl] then NejV_Ver:=False;
end;

function  NejM_Ver(X:Mat;Rad,Sl:Byte):Boolean;
var I:    Byte;
begin
 NejM_Ver:=True;
 for I:=1 to R do
  if X[I,Sl]<X[Rad,Sl] then NejM_Ver:=False;
end;

function  NejV_Pol(X:Mat;Rad,Sl:Byte):Boolean;
var I:    Byte;
begin
 NejV_Pol:=True;
 for I:=1 to S do
  if X[Rad,I]>X[Rad,Sl] then NejV_Pol:=False;
end;

function  NejM_Pol(X:Mat;Rad,Sl:Byte):Boolean;
var I:    Byte;
begin
 NejM_Pol:=True;
 for I:=1 to S do
  if X[Rad,I]<X[Rad,Sl] then NejM_Pol:=False;
end;

procedure DejMatR(var X:Mat);
var I,J:Byte;
begin
 for I:=1 to R do
  for J:=1 to S do
   begin
    Write('R=',I,'S=',J,' ');
    ReadLn(X[I,J]);
   end;
end;

function  Max_Rad_Pos(X:Mat;Rad:Byte):Integer;
var I:Byte;
    P:Integer;
    K:Byte;
begin
 P:=X[Rad,1];
 K:=1;
 for I:=2 to S do
  if X[Rad,I]>P then begin
                      P:=X[Rad,I];
                      K:=I;
                     end;
 Max_Rad_Pos:=K;
end;

function  Max_Sl_Pos (X:Mat;Sl:Byte):Integer;
var I:Byte;
    P:Integer;
    K:Byte;
begin
 P:=X[1,Sl];
 K:=1;
 for I:=2 to R do
  if X[I,Sl]>P then begin
                     P:=X[I,Sl];
                     K:=I;
                    end;
 Max_Sl_Pos:=K;
end;

function  Min_Rad_Pos(X:Mat;Rad:Byte):Integer;
var I:Byte;
    P:Integer;
    K:Byte;
begin
 P:=X[Rad,1];
 K:=1;
 for I:=2 to S do
  if X[Rad,I]<P then begin
                      P:=X[Rad,I];
                      K:=I;
                     end;
 Min_Rad_Pos:=K;
end;

function  Min_Sl_Pos (X:Mat;Sl:Byte):Integer;
var I:Byte;
    P:Integer;
    K:Byte;
begin
 P:=X[1,Sl];
 K:=1;
 for I:=2 to R do
  if X[I,Sl]<P then begin
                     P:=X[I,Sl];
                     K:=I;
                    end;
 Min_Sl_Pos:=K;
end;


begin
 Randomize;
end.