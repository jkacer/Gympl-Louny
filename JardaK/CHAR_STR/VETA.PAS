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
 WriteLn('Zadej v�tu zakon�enou te�kou.');
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

 WriteLn('A� do prvn� te�ky je tam :');
 WriteLn(Kolik_AA:3,' znak� A,');
 WriteLn(Kolik_A:3 ,' znak� a,');
 WriteLn(Kolik_X:3 ,' znak� x.');
 ReadLn;
end.





