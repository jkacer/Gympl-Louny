{ Created by Gas 1995 }
{
 Vytvo�� dynamickou matici a pracuje s n�.
}
program XXX;

uses Crt,GasCrt,Dyn_Mat;


var
    Mat:    PDynMatice;
    I,J:    Word;
    Pred,
    Po:     LongInt;
    S:      String;
begin
 Pred:=MemAvail;
 Str(Pred,S);
 S:='Voln� pam؜ na za��tku : '+S+' byt�.';

 Randomize;
 Desktop(Blue,LightGray,#176);
 Ramecek(3,3,78,23,'GAS Pointer & Object Demo',Blue,White,Yellow,#32);
 Window(5,4,76,22);
 Pis(S,                                                   NeMez,JoPip);
 Pis('Bude vytvo�ena dynamick� matice 5 X 5, jej�� prvky',NeMez,JoPip);
 Pis('budou m�t po��te�n� hodnotu  8.456',                NeMez,JoPip);
 Pis('Mat := New(PDynMatice,Init(5,5,8.456));',           NeMez,JoPip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Mat:=New(PDynMatice,Init(5,5,8.456));
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('Nyn� budeme vyu��vat funkc� pro zji�t�n� po�tu ��dk�',          NeMez,JoPip);
 Pis('a po�tu sloupc� v jednotliv�ch ��dc�ch.',                       NeMez,JoPip);
 Pis('I := Mat^.GetPocetR;   J := Mat^.GetPocetS(��slo ��dku);',      NeMez,JoPip);
 I:=Mat^.GetPocetR;
 WriteLn('Pocet ��dk� = ',I);
 for J:=1 to I do
  WriteLn('Po�et sloupe�k� v ',J,'-t�m ��dku je ',Mat^.GetPocetS(J));
 Enter;

 Pis('T�� se p�idaj� do matice n�hodn� ��sla na n�hodn� pozice.',     NeMez,JoPip);
 Pis('Vol�n� Mat^.Pridej(J,Random(Mat^.GetPocetS(J)+1),10*Random);',  NeMez,JoPip);
 for J:=1 to I do
  Mat^.Pridej(J,Random(Mat^.GetPocetS(J)+1),10*Random);
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('T�� se p�ep�� do matice n�hodn� ��sla na n�hodn� pozice.',     NeMez,JoPip);
 Pis('Vol�n� Mat^.Zapis(J,Random(Mat^.GetPocetS(J))+1,10*Random);',   NeMez,JoPip);
 for J:=1 to I do
  Mat^.Zapis(J,Random(Mat^.GetPocetS(J))+1,10*Random);
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('T�� se vyma�ou v�echny ��sla na pozic�ch 1,3 a 6.',             NeMez,JoPip);
 Pis('Vol�n� Mat^.Uber(��slo ��dku,��slo sloupce);',                  NeMez,JoPip);
 for J:=1 to I do
  begin
   Mat^.Uber(J,1); { = 1. }
   Mat^.Uber(J,2); { = 3. }
   Mat^.Uber(J,4); { = 6. }
  end;
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('T�� se vyma�e ��dek �.4',                                       NeMez,JoPip);
 Pis('Vol�n� Mat^.UberRad(4);',                                       NeMez,JoPip);
 Mat^.UberRad(4);
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('T�� se p�idaj� ��dky na pozici 1 a 6.',                         NeMez,JoPip);
 Pis('A ulo��me do nich ��sla 11.0 (7X) a 55.5.(1X)',                 NeMez,JoPip);
 Pis('V GAS matic�ch m��e toti� m�t ka�d� ��dek jin� po�et ��sel !!!',NeMez,JoPip);
 Pis('Vol�n� Mat^.PridejRad(za kter� ��dek);',                        NeMez,JoPip);
 Pis('Vol�n� Mat^.Pridej(na kter� ��dek,za kter� sloupec,��slo);',    NeMez,JoPip);
 Mat^.PridejRad(0);
 Mat^.PridejRad(5);
 for I:=1 to 7 do
  Mat^.Pridej(1,I-1,11);
 Mat^.Pridej(6,0,55.5);
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('Te� celou matici zru�me vol�n�m destructoru Done.',            NeMez,JoPip);
 Dispose(Mat,Done);
 Enter;

 Po:=MemAvail;
 Str(Po,S);
 S:='Voln� pam؜ na konci : '+S+' byt�.';
 Pis(S,                                                               NeMez,JoPip);

 Po:=Pred-Po;
 Str(Po,S);
 S:='To znamen�, �e jsme ztratili '+S+' byt�.';
 Pis(S,                                                               NeMez,JoPip);
 Enter;

 Window(1,1,80,25);
 TextColor(White);
 TextBackGround(Black);
 ClrScr;

end.




