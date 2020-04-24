{ Written by GAS }

program Veta;

uses
      Crt;

var
      S:        string;
      Kolik_AA,
      Kolik_A,
      Kolik_X:  Byte;
      I:        Byte;
      Tecka:    Boolean;

begin
 ClrScr;
 WriteLn('Zadej vÿtu zakonüenou teükou.');
 ReadLn(S);

 Kolik_AA :=0;
 Kolik_A  :=0;
 Kolik_X  :=0;

 Tecka := False;

 for I:=1 to Length(S) do
  if not(Tecka) then case S[I] of
                      'A': Inc(Kolik_AA);
                      'a': Inc(Kolik_A);
                      'x': Inc(Kolik_X);
                      '.': Tecka:=True;
                      else;
                     end; { case }

 WriteLn('Aß do prvn° teüky je tam :');
 WriteLn(Kolik_AA:3,' znakÖ A,');
 WriteLn(Kolik_A:3 ,' znakÖ a,');
 WriteLn(Kolik_X:3 ,' znakÖ x.');
 ReadLn;
end.





