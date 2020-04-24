{ Created by Gas 1995 }
{
 Vytvoý¡ dynamickou matici a pracuje s n¡.
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
 S:='Voln  pamØœ na zaŸ tku : '+S+' byt….';

 Randomize;
 Desktop(Blue,LightGray,#176);
 Ramecek(3,3,78,23,'GAS Pointer & Object Demo',Blue,White,Yellow,#32);
 Window(5,4,76,22);
 Pis(S,                                                   NeMez,JoPip);
 Pis('Bude vytvoýena dynamick  matice 5 X 5, jej¡§ prvky',NeMez,JoPip);
 Pis('budou m¡t poŸ teŸn¡ hodnotu  8.456',                NeMez,JoPip);
 Pis('Mat := New(PDynMatice,Init(5,5,8.456));',           NeMez,JoPip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Mat:=New(PDynMatice,Init(5,5,8.456));
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('Nyn¡ budeme vyu§¡vat funkc¡ pro zjiçtØn¡ poŸtu ý dk…',          NeMez,JoPip);
 Pis('a poŸtu sloupc… v jednotlivìch ý dc¡ch.',                       NeMez,JoPip);
 Pis('I := Mat^.GetPocetR;   J := Mat^.GetPocetS(Ÿ¡slo ý dku);',      NeMez,JoPip);
 I:=Mat^.GetPocetR;
 WriteLn('Pocet ý dk… = ',I);
 for J:=1 to I do
  WriteLn('PoŸet sloupeŸk… v ',J,'-t‚m ý dku je ',Mat^.GetPocetS(J));
 Enter;

 Pis('TØÔ se pýidaj¡ do matice n hodn  Ÿ¡sla na n hodn‚ pozice.',     NeMez,JoPip);
 Pis('Vol n¡ Mat^.Pridej(J,Random(Mat^.GetPocetS(J)+1),10*Random);',  NeMez,JoPip);
 for J:=1 to I do
  Mat^.Pridej(J,Random(Mat^.GetPocetS(J)+1),10*Random);
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('TØÔ se pýep¡ç¡ do matice n hodn  Ÿ¡sla na n hodn‚ pozice.',     NeMez,JoPip);
 Pis('Vol n¡ Mat^.Zapis(J,Random(Mat^.GetPocetS(J))+1,10*Random);',   NeMez,JoPip);
 for J:=1 to I do
  Mat^.Zapis(J,Random(Mat^.GetPocetS(J))+1,10*Random);
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('TØÔ se vyma§ou vçechny Ÿ¡sla na pozic¡ch 1,3 a 6.',             NeMez,JoPip);
 Pis('Vol n¡ Mat^.Uber(Ÿ¡slo ý dku,Ÿ¡slo sloupce);',                  NeMez,JoPip);
 for J:=1 to I do
  begin
   Mat^.Uber(J,1); { = 1. }
   Mat^.Uber(J,2); { = 3. }
   Mat^.Uber(J,4); { = 6. }
  end;
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('TØÔ se vyma§e ý dek Ÿ.4',                                       NeMez,JoPip);
 Pis('Vol n¡ Mat^.UberRad(4);',                                       NeMez,JoPip);
 Mat^.UberRad(4);
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('TØÔ se pýidaj¡ ý dky na pozici 1 a 6.',                         NeMez,JoPip);
 Pis('A ulo§¡me do nich Ÿ¡sla 11.0 (7X) a 55.5.(1X)',                 NeMez,JoPip);
 Pis('V GAS matic¡ch m…§e toti§ m¡t ka§dì ý dek jinì poŸet Ÿ¡sel !!!',NeMez,JoPip);
 Pis('Vol n¡ Mat^.PridejRad(za kterì ý dek);',                        NeMez,JoPip);
 Pis('Vol n¡ Mat^.Pridej(na kterì ý dek,za kterì sloupec,Ÿ¡slo);',    NeMez,JoPip);
 Mat^.PridejRad(0);
 Mat^.PridejRad(5);
 for I:=1 to 7 do
  Mat^.Pridej(1,I-1,11);
 Mat^.Pridej(6,0,55.5);
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('TeÔ celou matici zruç¡me vol n¡m destructoru Done.',            NeMez,JoPip);
 Dispose(Mat,Done);
 Enter;

 Po:=MemAvail;
 Str(Po,S);
 S:='Voln  pamØœ na konci : '+S+' byt….';
 Pis(S,                                                               NeMez,JoPip);

 Po:=Pred-Po;
 Str(Po,S);
 S:='To znamen , §e jsme ztratili '+S+' byt….';
 Pis(S,                                                               NeMez,JoPip);
 Enter;

 Window(1,1,80,25);
 TextColor(White);
 TextBackGround(Black);
 ClrScr;

end.




