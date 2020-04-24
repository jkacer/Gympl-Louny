{ Written by GAS }

program PrikladC;

uses
      Crt;


function PocetMezer(S:string):Byte;
var
      I,Kolik:  Byte;
begin
 Kolik:=0;

 for I:=1 to Length(S) do
  if S[I]=#32 then Inc(Kolik);

 PocetMezer:=Kolik;
end;

var
      Veta:     string;

begin
 ClrScr;
 WriteLn('Zadej vÿtu, kde jsou slova oddÿlena jednou mezerou.');
 ReadLn(Veta);

 WriteLn('Ve vÿtÿ je ',PocetMezer(Veta)+1,' slov.');
 ReadLn;
end.

