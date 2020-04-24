{ Created by GAS 1996 }
program XXX;
{
 Vyu§¡v  toho, §e vypoŸ¡t v  "stýed", dokud X-Y>Eta = povolen  odchylka
                              ||||
                              VVVV

                     C = ( (A*f`(A)) - f(A) )/( f`(A) );
                       = A - ( (f(A)) / (f`(A)) )

 Na C se pak uprav¡ buÔ A nebo B, podle toho, aby to pak prot¡nalo osu x
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
 WriteLn('VìpoŸet " 0=f(x) "');
 Prirad_Fci;

 A:=Dej_Real('Doln¡ interval ?');
 B:=Dej_Real('Horn¡ interval ?');
 Eta:=Dej_Real('Pýesnost ?');
 if A>B then begin
              Pom:=A;
              A:=B;
              B:=Pom;
             end;
 {
 if Pocitej(A)*Pocitej(B)>0 then
     begin
      WriteLn('Funkce neproch z¡ x pr vØ 1x !!! Konec.');
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
                                                      WriteLn('Vìsledek neplatnì.');
                                                      Vyp:=True;
                                                      Vysl:=0;
                                                     end;
  if KeyPressed then begin
                      Vyp:=True;
                      WriteLn('Pýeruçeno-vìsledek neplat¡');
                      Vysl:=0;
                     end;
 until Vyp;
 WriteLn;
 WriteLn('Vìsledek : ',Vysl:8:5);
 ReadLn;
end.










































{
 Odvozen¡ vzoreŸku pro vìpoŸet C:

        y - f(a)  =  k (x-a)
        y - f(a)  =  f`(a) (x-a)

               0  =  f`(a) (x-a)  +  f(a)
               0  =  xf`(a)  -  af`(a)  +  f(a)

                      af`(a) - f(a)               f(a)
               x  =  ---------------   =    a - ---------
                          f`(a)                   f`(a)
}

