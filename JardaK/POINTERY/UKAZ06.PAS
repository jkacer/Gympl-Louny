{ Created by Gas 1995 }
{
 Vytvoří dynamickou matici a pracuje s ní.
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
 S:='Volná paměť na začátku : '+S+' bytů.';

 Randomize;
 Desktop(Blue,LightGray,#176);
 Ramecek(3,3,78,23,'GAS Pointer & Object Demo',Blue,White,Yellow,#32);
 Window(5,4,76,22);
 Pis(S,                                                   NeMez,JoPip);
 Pis('Bude vytvořena dynamická matice 5 X 5, jejíž prvky',NeMez,JoPip);
 Pis('budou mít počáteční hodnotu  8.456',                NeMez,JoPip);
 Pis('Mat := New(PDynMatice,Init(5,5,8.456));',           NeMez,JoPip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Mat:=New(PDynMatice,Init(5,5,8.456));
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('Nyní budeme využívat funkcí pro zjištění počtu řádků',          NeMez,JoPip);
 Pis('a počtu sloupců v jednotlivých řádcích.',                       NeMez,JoPip);
 Pis('I := Mat^.GetPocetR;   J := Mat^.GetPocetS(číslo řádku);',      NeMez,JoPip);
 I:=Mat^.GetPocetR;
 WriteLn('Pocet řádků = ',I);
 for J:=1 to I do
  WriteLn('Počet sloupečků v ',J,'-tém řádku je ',Mat^.GetPocetS(J));
 Enter;

 Pis('Těď se přidají do matice náhodná čísla na náhodné pozice.',     NeMez,JoPip);
 Pis('Volání Mat^.Pridej(J,Random(Mat^.GetPocetS(J)+1),10*Random);',  NeMez,JoPip);
 for J:=1 to I do
  Mat^.Pridej(J,Random(Mat^.GetPocetS(J)+1),10*Random);
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('Těď se přepíší do matice náhodná čísla na náhodné pozice.',     NeMez,JoPip);
 Pis('Volání Mat^.Zapis(J,Random(Mat^.GetPocetS(J))+1,10*Random);',   NeMez,JoPip);
 for J:=1 to I do
  Mat^.Zapis(J,Random(Mat^.GetPocetS(J))+1,10*Random);
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('Těď se vymažou všechny čísla na pozicích 1,3 a 6.',             NeMez,JoPip);
 Pis('Volání Mat^.Uber(číslo řádku,číslo sloupce);',                  NeMez,JoPip);
 for J:=1 to I do
  begin
   Mat^.Uber(J,1); { = 1. }
   Mat^.Uber(J,2); { = 3. }
   Mat^.Uber(J,4); { = 6. }
  end;
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('Těď se vymaže řádek č.4',                                       NeMez,JoPip);
 Pis('Volání Mat^.UberRad(4);',                                       NeMez,JoPip);
 Mat^.UberRad(4);
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('Těď se přidají řádky na pozici 1 a 6.',                         NeMez,JoPip);
 Pis('A uložíme do nich čísla 11.0 (7X) a 55.5.(1X)',                 NeMez,JoPip);
 Pis('V GAS maticích může totiž mít každý řádek jiný počet čísel !!!',NeMez,JoPip);
 Pis('Volání Mat^.PridejRad(za který řádek);',                        NeMez,JoPip);
 Pis('Volání Mat^.Pridej(na který řádek,za který sloupec,číslo);',    NeMez,JoPip);
 Mat^.PridejRad(0);
 Mat^.PridejRad(5);
 for I:=1 to 7 do
  Mat^.Pridej(1,I-1,11);
 Mat^.Pridej(6,0,55.5);
 Mat^.Tisk('Tisk matice:');
 Enter;

 Pis('Teď celou matici zrušíme voláním destructoru Done.',            NeMez,JoPip);
 Dispose(Mat,Done);
 Enter;

 Po:=MemAvail;
 Str(Po,S);
 S:='Volná paměť na konci : '+S+' bytů.';
 Pis(S,                                                               NeMez,JoPip);

 Po:=Pred-Po;
 Str(Po,S);
 S:='To znamená, že jsme ztratili '+S+' bytů.';
 Pis(S,                                                               NeMez,JoPip);
 Enter;

 Window(1,1,80,25);
 TextColor(White);
 TextBackGround(Black);
 ClrScr;

end.




