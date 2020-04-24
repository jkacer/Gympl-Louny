{ Created by GAS 1995 }
program XXX;
{
 Vyuß°v† toho, ße vypoü°t†v† st˝ed, dokud X-Y>Eta = povolen† odchylka
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
 WriteLn('VÏsledek : ',Vysl:8:5);
 ReadLn;
end.
