{ Created by GAS 1995 }
{
 Napište program pro počítání velkých mocnin matice 4 X 4.
 Prvky matice jsou čísla <-5,5>.
 Vstup N = mocnitel.
}

program XXX;

uses Crt,Matika;

var N:  Byte;
    Mat:PMatice44;
    Vys:PMatice44;
begin
 ClrScr;
 WriteLn('Náhodně vygenerovaná matice 4 X 4 bude umocněna');
 WriteLn('na Vámi zadaný exponent N.');
 Write('N ? (max. 255) ');
 ReadLn(N);
 Mat:=New(PMatice44);
 DejMatici(Mat);
 WriteLn('Vygenerovaná matice :');
 TiskMatice(Mat);
 Matice_Init(Mat);
 DejMocninuMat(N,Vys);
 WriteLn('Výsledná matice :');
 TiskMatice(Vys);
 Matice_Done;
 Dispose(Mat);
 Dispose(Vys);
end.



