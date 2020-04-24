{ Written by GAS }

program Priklad8;

uses
      Crt;

const
      MaxPocet = 50;
type
      TPoradi = record
                 Jmeno: string[20];
                 Beh:   Integer;
                 Plav:  Integer;
                 Cyklo: Integer;
                end;

      TTabulka = array[1..MaxPocet] of TPoradi;


procedure Natahni(var X:TTabulka;var KolikZ:Byte);
var
      I:        Byte;
begin
 Write('PoŸet z vodn¡k… ? ');
 ReadLn(KolikZ);

 for I:=1 to KolikZ do
  begin
   WriteLn(I,'.z vodn¡k------------------------------');
   Write('Jm‚no:          '); ReadLn(X[I].Jmeno);
   Write('BØh (s):        '); ReadLn(X[I].Beh);
   Write('Plav n¡ (s):    '); ReadLn(X[I].Plav);
   Write('Cyklistika (s): '); ReadLn(X[I].Cyklo);
   WriteLn;
  end;
end;

procedure Print_B(KolikZ:Byte;X:TTabulka);
var
      I,J:      Byte;
      Pom:      TPoradi;
begin
 { Bubble Sort }
 for I:=KolikZ downto 2 do
  for J:=1 to I-1 do
   if X[J].Beh > X[J+1].Beh then begin
                                  Pom:=X[J];
                                  X[J]:=X[J+1];
                                  X[J+1]:=Pom;
                                 end;

 for I:=1 to KolikZ do
  WriteLn(X[I].Jmeno:22,KolikZ+1-I:3);
 ReadLn;
end;

procedure Print_P(KolikZ:Byte;X:TTabulka);
var
      I,J:      Byte;
      Pom:      TPoradi;
begin
 { Bubble Sort }
 for I:=KolikZ downto 2 do
  for J:=1 to I-1 do
   if X[J].Plav > X[J+1].Plav then begin
                                    Pom:=X[J];
                                    X[J]:=X[J+1];
                                    X[J+1]:=Pom;
                                   end;

 for I:=1 to KolikZ do
  WriteLn(X[I].Jmeno:22,KolikZ+1-I:3);
 ReadLn;
end;

procedure Print_C(KolikZ:Byte;X:TTabulka);
var
      I,J:      Byte;
      Pom:      TPoradi;
begin
 { Bubble Sort }
 for I:=KolikZ downto 2 do
  for J:=1 to I-1 do
   if X[J].Cyklo > X[J+1].Cyklo then begin
                                      Pom:=X[J];
                                      X[J]:=X[J+1];
                                      X[J+1]:=Pom;
                                     end;

 for I:=1 to KolikZ do
  WriteLn(X[I].Jmeno:22,KolikZ+1-I:3);
 ReadLn;
end;


procedure Print_Celkem(KolikZ:Byte;X:TTabulka);
var
      I,J:      Byte;
      Pom:      TPoradi;
begin
 { Bubble Sort }
 for I:=KolikZ downto 2 do
  for J:=1 to I-1 do
   if
     ( X[J].Beh  +
       X[J].Plav +
       X[J].Cyklo )  >
     ( X[J+1].Beh  +
       X[J+1].Plav +
       X[J+1].Cyklo )  then begin
                             Pom:=X[J];
                             X[J]:=X[J+1];
                             X[J+1]:=Pom;
                            end;

 for I:=1 to KolikZ do
  WriteLn(X[I].Jmeno:22,KolikZ+1-I:3);
 ReadLn;
end;



var
      KolikZ:   Byte;
      Tab:      TTabulka;
begin
 ClrScr;
 WriteLn('*** Zad v n¡ vìsledk… ***');
 Natahni     (Tab,KolikZ);
 WriteLn('*** Poýad¡ v bØhu ***');
 Print_B     (KolikZ,Tab);
 WriteLn('*** Poýad¡ v plav n¡ ***');
 Print_P     (KolikZ,Tab);
 WriteLn('*** Poýad¡ v cyklystice ***');
 Print_C     (KolikZ,Tab);
 WriteLn('*** Celkov‚ poýad¡ ***');
 Print_Celkem(KolikZ,Tab);
 WriteLn('*** Enter ***');
 ReadLn;
end.
