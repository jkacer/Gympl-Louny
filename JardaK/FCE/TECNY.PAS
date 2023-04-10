{ Created by GAS 1996 }
program XXX;
{
 Využívá toho, že vypočítává "střed", dokud X-Y>Eta = povolená odchylka
                              ||||
                              VVVV

                     C = ( (A*f`(A)) - f(A) )/( f`(A) );
                       = A - ( (f(A)) / (f`(A)) )

 Na C se pak upraví buď A nebo B, podle toho, aby to pak protínalo osu x
}
uses Crt,Pom_Un;

var
    A,B,
    Eta,Vysl,
    Pom,StC:    Real;
    Vyp:        Boolean;
    KdeTecnu:   Real;


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
 {
 if Pocitej(A)*Pocitej(B)>0 then
     begin
      WriteLn('Funkce neprochází x právě 1x !!! Konec.');
      Sound(500);Delay(100);NoSound;
      Exit;
     end;
 }
 Vyp:=False;
 KdeTecnu:=A;
 repeat
  StC:=KdeTecnu;
  KdeTecnu:= KdeTecnu - (Pocitej(KdeTecnu) / Derivace(KdeTecnu));
  WriteLn(KdeTecnu);
  if Pocitej(KdeTecnu)=0 then begin
                               Vyp:=True;
                               Vysl:=KdeTecnu;
                               WriteLn('PC0');
                              end;
  if Abs(KdeTecnu-StC)<Eta then begin
                                 Vyp:=True;
                                 Vysl:=KdeTecnu;
                                 WriteLn('ETA');
                                end
                           else if (KdeTecnu<A) or
                                   (KdeTecnu>B) then begin
                                                      WriteLn('Mimo interval <a,b> !!!');
                                                      WriteLn('Výsledek neplatný.');
                                                      Vyp:=True;
                                                      Vysl:=0;
                                                     end;
  if KeyPressed then begin
                      Vyp:=True;
                      WriteLn('Přerušeno-výsledek neplatí');
                      Vysl:=0;
                     end;
 until Vyp;
 WriteLn;
 WriteLn('Výsledek : ',Vysl:8:5);
 ReadLn;
end.










































{
 Odvození vzorečku pro výpočet C:

        y - f(a)  =  k (x-a)
        y - f(a)  =  f`(a) (x-a)

               0  =  f`(a) (x-a)  +  f(a)
               0  =  xf`(a)  -  af`(a)  +  f(a)

                      af`(a) - f(a)               f(a)
               x  =  ---------------   =    a - ---------
                          f`(a)                   f`(a)
}

