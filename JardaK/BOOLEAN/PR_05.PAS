{
 BOOLEAN - příklad 05
}

{
 Tabulka log. hodnot implikace a ekvivalence
}

program XXX;

uses Crt;


function Implikace(A,B:Boolean):Boolean;
begin
 Implikace := (not(A)) or (B);
end;

function Ekvivalence(A,B:Boolean):Boolean;
begin
 Ekvivalence := not( ( (A) and (not(B)) ) or ( (B) and not(A) ) );
end;


procedure Tiskni_I;
var
       I,J:  Boolean;
begin
 for I:=False to True do
  for J:=False to True do
   WriteLn(Ord(I):5,Ord(J):5,Ord(Implikace(I,J)):5);
end;

procedure Tiskni_E;
var
       I,J:  Boolean;
begin
 for I:=False to True do
  for J:=False to True do
   WriteLn(Ord(I):5,Ord(J):5,Ord(Ekvivalence(I,J)):5);
end;


begin
 ClrScr;
 WriteLn('Tabulka imlikace:');
 WriteLn;
 Tiskni_I;
 WriteLn('Tabulka ekvivalence:');
 WriteLn;
 Tiskni_E;
 ReadLn;
end.




