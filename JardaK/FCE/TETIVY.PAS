{ Created by GAS 1995 }
program XXX;
{
 Využívá toho, že vypočítává "střed", dokud X-Y>Eta = povolená odchylka
                              ||||
                              VVVV
                     C:=( (A*f(B)) - (B*f(A)) )/( f(B)-f(A) );
                     tj. dělení intervalu v poměru y1 a y2
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
  C:=( (A*Pocitej(B)) - (B*Pocitej(A)) )/( Pocitej(B)-Pocitej(A) );
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










































{
 Odvození vzorečku pro výpočet C:

        y - f(a)  =  k (x-a)
               y  =  k (x-a) + f(a)

                               f(b) - f(a)
               k  =  tg(FI) = -------------
                                 b  -   a

                      f(b) - f(a)
               y  =  ------------ (x - a)   + f(a)
                        b  -  a

                      f(b) - f(a)
               0  =  ------------ (x - a)   + f(a)
                        b  -  a


               0  =  [ f(b) - f(a) ] (x-a)  +  f(a)(b-a)
               0  =  xf(b) - xf(a) - af(b) + af(a) + f(a)(b-a)
               0  =  xf(b) - xf(a) - af(b) + af(a) + bf(a) - af(a)
   xf(a) - xf(b)  =  bf(a) - af(b)

                      bf(a) - af(b)
               x  =  ---------------
                       f(a) - f(b)

}

