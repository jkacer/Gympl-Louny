{ Created by GAS 1995 }

program Priklad4;

uses Prvocis,Crt;
{
 *******************************************
 *  Pro zm�nu rozm�r� matice modifikujte   *
 *  konstantu > MaxMat < v unitu PRVOCIS   *
 *  a v�e p�ekompilujte.                   *
 *  Dynamick� alokace je na dom�c� �kol    *
 *  p�eci jen trochu moc.                  *
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
   WriteLn('Obvod �.',I,': sou�et=',Cel,',po�et=',Kolik,' =>> ',(Cel/Kolik):6:3);
  end;
 if Odd(MaxMat) then begin
                      Cel:=Mat[(MaxMat div 2)+1,(MaxMat div 2)+1];
                      WriteLn('Obvod �.',(MaxMat div 2)+1,': sou�et=',Cel,',po�et=1 =>> ',Cel:3);
                     end;
 WriteLn('Obvody jsou ��slov�ny od kraje do st�edu.');
 ReadLn;
end.
