{ Created by GAS 1995 }

unit GJ_Elim;

interface

const
       Nez = 3;

       R   = Nez;
       S   = Nez+1;
type
       ElM       = array[1..R,1..S] of Real;
       Vysledky  = array[1..R]      of Real;


procedure Vypis(X:ElM);
procedure Udelej(var X:ElM);

function  GEM(var X:ElM):Boolean;
function  JEM(var X:ElM):Boolean;
function  ZpetnaSub(X:ElM;var Y:Vysledky):Boolean;
function  PrimaSub(X:ElM;var Y:Vysledky):Boolean;

implementation


procedure Vypis(X:ElM);
var
    I,J: Byte;
begin
 for I:=1 to R do
  begin
   for J:=1 to S do
    Write(X[I,J]:8:2,' ');
   WriteLn;
  end;
end; { procedure Vypis }

procedure Udelej(var X:ElM);
var
    I,J: Byte;
begin
 for I:=1 to R do
  for J:=1 to S do
   begin
    Write(Chr(64+J),I,'= ');
    ReadLn(X[I,J]);
   end;
end; { procedure Udelej }

function GEM(var X:ElM):Boolean;
var
     I,J,K:  Byte;
     Krok:   Byte;
     Nejde:  Boolean;
     Koef:   Real;
begin
 Nejde:=False;
 Krok:=0;

 for I:=1 to S-2 do
  for J:=I+1 to R do
   begin
    if X[I,I]=0 then Nejde:=True;
    if not(Nejde) then begin
                        { V�po�et koeficientu z akt. a "1." ��dku }
                        Koef := -( X[J,I] / X[I,I] );
                        for K:=1 to S do
                         { Koef. se n�sob� "1." �. a se��t� se s akt.�. }
                         X[J,K]:=X[I,K]*Koef+X[J,K];
                        Krok:=Krok+1;
                       end;
   end;

 if Nejde then begin
                WriteLn('V�po�et byl p�eru�en kv�li nule v d�len� na ',Krok,'. kroku.');
                GEM:=False;
               end
          else begin
                WriteLn('Metoda GEM byla �sp��n� dokon�ena.');
                GEM:=True;
               end;
end; { function GEM }

function JEM(var X:ElM):Boolean;
var
     I,J,K:  Byte;
     Krok:   Byte;
     Nejde:  Boolean;
     Koef:   Real;
begin
 Nejde:=False;
 Krok:=0;

 for I:=S-1 downto 2 do
  for J:=I-1 downto 1 do
   begin
    if X[I,I]=0 then Nejde:=True;
    if not(Nejde) then begin
                        { V�po�et koef. z akt. a "posledn�ho" ��dku }
                        Koef := -( X[J,I] / X[I,I] );
                        for K:=1 to S do
                       { Koef. se n�sob� "posledn�m" �. a se��t� se s akt.�. }
                         X[J,K]:=X[I,K]*Koef+X[J,K];
                        Krok:=Krok+1;
                       end;
   end;
 if Nejde then begin
                WriteLn('V�po�et byl p�eru�en kv�li nule v d�len� na ',Krok,'. kroku.');
                JEM:=False;
               end
          else begin
                WriteLn('Metoda JEM byla �sp��n� dokon�ena.');
                JEM:=True;
               end;
end; { function JEM }

function  ZpetnaSub(X:ElM;var Y:Vysledky):Boolean;
var
     I,J:    Byte;
     Krok:   Byte;
     Nejde:  Boolean;
     Souc:   Real;
     {**********************************************************************}
     function SoucetProm(Rad:Byte):Real;
     var
          Pom: Real;
          I:   Byte;
     begin
      Pom:=0;
      for I:=S-1 downto Rad do
       Pom:=Pom+ ( X[Rad,I] * Y[I] );
      SoucetProm:=Pom;
     end;
     {**********************************************************************}

begin
 Krok:=1;
 Nejde:=False;

 { Nulov�n� v�sledk� }
 for I:=1 to R do
  Y[I]:=0;

 { Pro posledn� ��slo mimo cyklus }
 if X[R,S-1] = 0 then begin
                       ZpetnaSub:=False;
                       WriteLn('V�po�et p�eru�en kv�li nule v 1. �lenu !');
                       Exit;
                      end;
 Y[R]:=X[R,S]/X[R,S-1];

 for I:=R-1 downto 1 do
  if not(Nejde) then begin
                      Inc(Krok);
                      Souc:=SoucetProm(I);
                      if X[I,I]=0 then Nejde:=True
                                  else Y[I]:= (X[I,S]-Souc)/X[I,I];
                     end;
 if Nejde then begin
                WriteLn('V�po�et byl p�eru�en kv�li nule v d�len� na ',Krok,'. kroku.');
                ZpetnaSub:=False;
               end
          else begin
                WriteLn('Metoda "Zp�tn�Substituce" byla �sp��n� dokon�ena.');
                ZpetnaSub:=True;
               end;
end; { function ZpetnaSub }

function  PrimaSub(X:ElM;var Y:Vysledky):Boolean;
var
     I,J:    Byte;
     Krok:   Byte;
     Nejde:  Boolean;
     Souc:   Real;
     {**********************************************************************}
     function SoucetProm(Rad:Byte):Real;
     var
          Pom: Real;
          I:   Byte;
     begin
      Pom:=0;
      for I:=1 to Rad-1 do
       Pom:=Pom+ ( X[Rad,I] * Y[I] );
      SoucetProm:=Pom;
     end;
     {**********************************************************************}

begin
 Krok:=1;
 Nejde:=False;

 { Nulov�n� v�sledk� }
 for I:=1 to R do
  Y[I]:=0;

 { Pro prvn� ��slo mimo cyklus }
 if X[1,1] = 0 then begin
                     PrimaSub:=False;
                     WriteLn('V�po�et p�eru�en kv�li nule v 1. �lenu !');
                     Exit;
                    end;
 Y[1]:=X[1,S]/X[1,1];

 for I:=2 to R do
  if not(Nejde) then begin
                      Inc(Krok);
                      Souc:=SoucetProm(I);
                      if X[I,I]=0 then Nejde:=True
                                  else Y[I]:= (X[I,S]-Souc)/X[I,I];
                     end;
 if Nejde then begin
                WriteLn('V�po�et byl p�eru�en kv�li nule v d�len� na ',Krok,'. kroku.');
                PrimaSub:=False;
               end
          else begin
                WriteLn('Metoda "P��m�Substituce" byla �sp��n� dokon�ena.');
                PrimaSub:=True;
               end;
end; { function PrimaSub }




begin { unit GJ_Elim }
end.  { unit GJ_Elim }


