{ Written by GAS }

unit Real_Int;

interface

function SoucetSudCis(Cis:LongInt):Integer;
function Je_Prvoc(Cis:Integer):Boolean;

implementation

function SoucetSudCis(Cis:LongInt):Integer;
var
      Soucet:   Integer;
      I:        Byte;
      S:        string;
      C:        Byte;
      Code:     Integer;

begin
 Str(Cis,S);
 Soucet:=0;

 for I:=1 to Length(S) do
  if not(Odd(I)) then begin
                       Val(S[I],C,Code);
                       Inc(Soucet,C);
                      end;
 SoucetSudCis:=Soucet;
end; { function SoucetSudCis }

function Je_Prvoc(Cis:Integer):Boolean;
var
      Odm:Integer;
      B:  Boolean;
      I:  Integer;
begin
 Odm:=Trunc(Sqrt(Cis));
 B:=True;

 for I:=2 to Odm do
  if (Cis mod I)=0 then B:=False;

 if Cis=1 then B:=False;
 Je_Prvoc:=B;
end; { function Je_Prvoc }

begin
end.


