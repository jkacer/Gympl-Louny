{ Created by GAS 1995 }
program XXX;
{
 Využívá toho, že vypočítává střed, dokud X-Y>Eta = povolená odchylka
 Na C se pak upraví buď A nebo B, podle toho, aby to pak protínalo osu x
}
uses Crt,Pom_Un;

var
    A,B,C,
    Eta,Vysl,
    Pom,StC:    Real;
    Vyp:        Boolean;


begin  { program }
 ClrScr;
 WriteLn('Výpočet " 0=f(x) "');
 Prirad_Fci;

 A:=Dej_Real('Dolní interval ?');
 B:=Dej_Real('Horní interval ?');
 Eta:=Dej_Real('Přesnost ?');
 if A>B then begin
              Pom:=A;
              A:=B;
              B:=Pom;
             end;
 if Pocitej(A)*Pocitej(B)>0 then
     begin
      WriteLn('Funkce neprochází x právě 1x !!! Konec.');
      Sound(500);Delay(100);NoSound;
      Exit;
     end;

 Vyp:=False;
 C:=A;
 repeat
  StC:=C;
  C:=(A+B) / 2;
  if Pocitej(C)=0 then begin
                        Vyp:=True;
                        Vysl:=C;
                       end;
  if Abs(C-StC)<Eta then begin
                          Vyp:=True;
                          Vysl:=C;
                         end
                   else if Pocitej(A)*Pocitej(C)<0 then begin
                                                         A:=A;
                                                         B:=C;
                                                         Write('< ');
                                                         WriteLn(C);
                                                        end
                                                   else begin
                                                         A:=C;
                                                         B:=B;
                                                         Write('> ');
                                                         WriteLn(C);
                                                        end;
 until Vyp;
 WriteLn;
 WriteLn('Výsledek : ',Vysl:8:5);
 ReadLn;
end.
