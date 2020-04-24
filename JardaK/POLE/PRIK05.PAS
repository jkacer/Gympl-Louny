{ Created by GAS 1995 }
program XXX;

uses Crt,GasCrt,Matika;

var A,B,C1,C2:PMatice44;

begin
 ClrScr;

 A :=New(PMatice44);
 B :=New(PMatice44);
 C1:=New(PMatice44);
 C2:=New(PMatice44);

 DejMatici(A);
 DejMatici(B);

 NasobMatice(A,B,C1);
 NasobMatice(B,A,C2);

 Desktop(Blue,LightGray,#176); { TeŸkov n¡}

 Ramecek(2, 3, 38,8, 'Matice A',Blue,White,Yellow,#32); { Vyplnit mezerou }
 Ramecek(41,3, 79,8, 'Matice B',Blue,White,Yellow,#32); { Vyplnit mezerou }
 Ramecek(2, 12,38,17,'A X B',   Blue,White,Yellow,#32); { Vyplnit mezerou }
 Ramecek(41,12,79,17,'B X A',   Blue,White,Yellow,#32); { Vyplnit mezerou }
 Ramecek(15,19,65,22,'Vìsledek',Blue,White,Yellow,#32); { Vyplnit mezerou }

 UmistiMatici(3, 4, A, Blue,Yellow);
 UmistiMatici(42,4, B, Blue,Yellow);
 UmistiMatici(3, 13,C1,Blue,Yellow);
 UmistiMatici(42,13,C2,Blue,Yellow);

 GoToXY(18,20);
 if Porovnani(C1,C2) then Write('Matice jsou stejn‚ !!!')
                     else Write('Matice jsou r…zn‚.');
 GoToXY(18,21);
 Write('StisknØte <Enter> pro ukonŸen¡ programu.');
 ReadLn;

 TextBackGround(Black);
 TextColor(White);
 ClrScr;
 WriteLn(' Eram quod es, erit quod sum.');
end.


