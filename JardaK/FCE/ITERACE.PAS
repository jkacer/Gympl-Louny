{ Created by GAS 1995 }
program XXX;
{
 Využívá toho, že do X dosazuje f(X), dokud X-Y>Eta = povolená odchylka
                         ||||
                         VVVV
                        x=fce(x)
}
uses Crt,Pom_Un;

var
    X,Y,
    Eta,Vysl:  Real;
    Vyp:       Boolean;

begin  { program }
 ClrScr;
 WriteLn('Výpočet " x=f(x) "');
 Prirad_Fci;

 X:=Dej_Real('Začátek ?');
 Eta:=Dej_Real('Přesnost ?');
 Vyp:=False;
 repeat
  Y:=Pocitej(X);
  WriteLn(Y:8:3);
  if Abs(X-Y)<Eta then begin
                        Vyp:=True;
                        Vysl:=X;
                       end;
  if KeyPressed then begin
                      Vyp:=True;
                      WriteLn('Přerušeno-výsledek neplatí');
                      Vysl:=0;
                     end;
  X:=Y; { Tady !!! }
 until Vyp;
 WriteLn;
 WriteLn('Výsledek : ',Vysl:8:5);
 ReadLn;
end.


