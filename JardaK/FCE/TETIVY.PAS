{ Created by GAS 1995 }
program XXX;
{
 Vyuß°v† toho, ße vypoü°t†v† "st˝ed", dokud X-Y>Eta = povolen† odchylka
                              ||||
                              VVVV
                     C:=( (A*f(B)) - (B*f(A)) )/( f(B)-f(A) );
                     tj. dÿlen° intervalu v pomÿru y1 a y2
 Na C se pak uprav° bu‘ A nebo B, podle toho, aby to pak prot°nalo osu x
}
uses Crt,Pom_Un;

var
    A,B,C,
    Eta,Vysl,
    Pom,StC:    Real;
    Vyp:        Boolean;


begin  { program }
 ClrScr;
 WriteLn('VÏpoüet " 0=f(x) "');
 Prirad_Fci;

 A:=Dej_Real('Doln° interval ?');
 B:=Dej_Real('Horn° interval ?');
 Eta:=Dej_Real('P˝esnost ?');
 if A>B then begin
              Pom:=A;
              A:=B;
              B:=Pom;
             end;
 if Pocitej(A)*Pocitej(B)>0 then
     begin
      WriteLn('Funkce neproch†z° x pr†vÿ 1x !!! Konec.');
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
 WriteLn('VÏsledek : ',Vysl:8:5);
 ReadLn;
end.










































{
 Odvozen° vzoreüku pro vÏpoüet C:

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

