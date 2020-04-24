{ Created by GAS 1995 }

program Priklad4;

uses Prvocis,Crt;
{
 *******************************************
 *  Pro zmØnu rozmØr… matice modifikujte   *
 *  konstantu > MaxMat < v unitu PRVOCIS   *
 *  a vçe pýekompilujte.                   *
 *  Dynamick  alokace je na dom c¡ £kol    *
 *  pýeci jen trochu moc.                  *
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
   WriteLn('Obvod Ÿ.',I,': souŸet=',Cel,',poŸet=',Kolik,' =>> ',(Cel/Kolik):6:3);
  end;
 if Odd(MaxMat) then begin
                      Cel:=Mat[(MaxMat div 2)+1,(MaxMat div 2)+1];
                      WriteLn('Obvod Ÿ.',(MaxMat div 2)+1,': souŸet=',Cel,',poŸet=1 =>> ',Cel:3);
                     end;
 WriteLn('Obvody jsou Ÿ¡slov ny od kraje do stýedu.');
 ReadLn;
end.
