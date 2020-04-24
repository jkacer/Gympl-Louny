{ Created by GAS 1995 }

program Priklad2;

uses Prvocis,Crt;

var PoleCis: Rada;
    NejDels: Byte;
    Vysledky:Posloupnost;
    Zacatek: Byte;
    Zaznam:  Zaznam_Posl;
    Staci:   Boolean;
    Kolikata:Byte;
    I:       Byte;

begin
 ClrScr;
 Napln_Radu(PoleCis);
 Pis_Radu(PoleCis);
 Init_Posl(Vysledky);
 Zacatek:=1;
 Kolikata:=1;
 Staci:=False;
 repeat
  Dej_Posloupnost(PoleCis,Zacatek,Zaznam);
  Vysledky[Kolikata]:=Zaznam;
  if Zaznam.Kon=MaxPole then Staci:=True
                        else begin
                              Zacatek:=Zaznam.Kon+1;
                              Inc(Kolikata);
                             end;
 until Staci or (Zacatek>MaxPole);
 NejDels:=Dej_Max_Del_Posl(Vysledky);
 WriteLn('Nejdelç¡ posloupnost(i) m (j¡) ',NejDels,' Ÿ¡sel.');
 for I:=1 to MaxPole do
  begin
   Zaznam:=Vysledky[I];
   if Zaznam.Kolik=NejDels then Pis_Posl(PoleCis,Zaznam.Zac,Zaznam.Kon);
  end;
 ReadLn;
end.
