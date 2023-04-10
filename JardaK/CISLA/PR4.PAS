{ Created by GAS 1995 }

program Priklad4;

uses Prvocis,Crt;
{
 *******************************************
 *  Pro změnu rozměrů matice modifikujte   *
 *  konstantu > MaxMat < v unitu PRVOCIS   *
 *  a vše překompilujte.                   *
 *  Dynamická alokace je na domácí úkol    *
 *  přeci jen trochu moc.                  *
 *******************************************
}


var
    Mat:   Matice;
    Cel:   Integer;
    I:     Byte;
    Kolik: Byte;
    Prumer:Real;

begin
 ClrScr;
 Napln_Mat(Mat);
 Pis_Mat(Mat);
 for I:=1 to MaxMat div 2 do
  begin
   Cel:=Dej_Soucet_Pruhu(Mat,I);
   Kolik:=Dej_Kolik_Pruhu(Mat,I);
   WriteLn('Obvod č.',I,': součet=',Cel,',počet=',Kolik,' =>> ',(Cel/Kolik):6:3);
  end;
 if Odd(MaxMat) then begin
                      Cel:=Mat[(MaxMat div 2)+1,(MaxMat div 2)+1];
                      WriteLn('Obvod č.',(MaxMat div 2)+1,': součet=',Cel,',počet=1 =>> ',Cel:3);
                     end;
 WriteLn('Obvody jsou číslovány od kraje do středu.');
 ReadLn;
end.
