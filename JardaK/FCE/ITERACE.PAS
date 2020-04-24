{ Created by GAS 1995 }
program XXX;
{
 Vyu§¡v  toho, §e do X dosazuje f(X), dokud X-Y>Eta = povolen  odchylka
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
 WriteLn('VìpoŸet " x=f(x) "');
 Prirad_Fci;

 X:=Dej_Real('ZaŸ tek ?');
 Eta:=Dej_Real('Pýesnost ?');
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
                      WriteLn('Pýeruçeno-vìsledek neplat¡');
                      Vysl:=0;
                     end;
  X:=Y; { Tady !!! }
 until Vyp;
 WriteLn;
 WriteLn('Vìsledek : ',Vysl:8:5);
 ReadLn;
end.


