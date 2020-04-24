{ Written by GAS 1996 }

unit Sort;

interface

const
      MaxPrvku = 10;

type
      TPoleInt = array[1..MaxPrvku] of Integer;

procedure Napln(var X:TPoleInt);
procedure Vypis(X:TPoleInt);

procedure BubbleSort(var X:TPoleInt);
procedure HofmanSort(var X:TPoleInt);


implementation

procedure Napln(var X:TPoleInt);
var
      I:        Byte;
begin
 for I:=1 to MaxPrvku do
  X[I]:=Random(101);
end;

procedure Vypis(X:TPoleInt);
var
      I:        Byte;
begin
 for I:=1 to MaxPrvku do
  Write(X[I],' ');
 WriteLn;
end;

procedure BubbleSort(var X:TPoleInt);
var
      I,J:      Byte;
      Pom:      Integer;
begin
 for I:=MaxPrvku downto 2 do
  for J:=1 to I-1 do
   if X[J] > X[J+1] then begin
                          Pom:=X[J];
                          X[J]:=X[J+1];
                          X[J+1]:=Pom;
                         end;
end;

procedure HofmanSort(var X:TPoleInt);
var
      I,J:      Byte;
      Pom:      Integer;
      Kolik:    Byte;
      Celkem:   Word;
begin
 Celkem:=0;
 for I:=2 to MaxPrvku do { zmençuje se nesetý¡dØn  oblast }
  begin
   Kolik:=0;
   for J:=I to MaxPrvku do  { vyhled v n¡ nejvØtç¡ho prvku a n hrada }
    begin
     if X[J]<X[I-1] then begin
                          Pom:=X[J];
                          X[J]:=X[I-1];
                          X[I-1]:=Pom;
                         end;
     Inc(Kolik);
     Inc(Celkem);
    end;
   WriteLn(Kolik);
  end;
 WriteLn('-------');
 WriteLn(Celkem);
end;


begin { unit Sort }
 Randomize;
end.  { unit Sort }

