{ Created by GAS 1995 }
program XXX;
{
 Vyu��v� toho, �e do X dosazuje f(X), dokud X-Y>Eta = povolen� odchylka
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
 WriteLn('V�po�et " x=f(x) "');
 Prirad_Fci;

 X:=Dej_Real('Za��tek ?');
 Eta:=Dej_Real('P�esnost ?');
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
                      WriteLn('P�eru�eno-v�sledek neplat�');
                      Vysl:=0;
                     end;
  X:=Y; { Tady !!! }
 until Vyp;
 WriteLn;
 WriteLn('V�sledek : ',Vysl:8:5);
 ReadLn;
end.


