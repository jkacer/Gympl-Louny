{ Written by GAS }

program PrikladE;

uses
      Crt;


function SoucLichCiselOdzadu(S:string):Byte;
var
      I:        Byte;
      Kolik:    Byte;
      Code:     Integer;
      DoVal:    Integer;
      LS:       Byte;
begin
 LS:=0;       { Lich‚/sud‚ }
 Kolik:=0;

 for I:=Length(S) downto 1 do
  begin
   Inc(LS); { Prvn¡ odzadu lichej }
   if Odd(LS) then begin
                    Val(S[I],DoVal,Code);
                    Kolik:=Kolik+DoVal;
                   end;
  end;
 SoucLichCiselOdzadu:=Kolik;
end;


var
      S:        string;
      C:        Integer;
begin
 ClrScr;
 Write('Zadej Ÿ¡slo ! ');
 ReadLn(C);
 Str(C,S);
 WriteLn('SouŸet lichìch Ÿ¡slic odzadu je ',SoucLichCiselOdzadu(S));
 ReadLn;
end.

