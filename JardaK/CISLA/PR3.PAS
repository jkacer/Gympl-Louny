{ Created by GAS 1995 }

program Priklad3;

uses Prvocis,Crt;

var
    Mat:Matice;
    Cel:Integer;

begin
 ClrScr;
 Napln_Mat(Mat);
 Pis_Mat(Mat);
 Cel:=Dej_Soucet_Prv_Mat(Mat);
 WriteLn('Součet všech prvočísel v matice je ',Cel,'.');
 ReadLn;
end.
