{ Created by GAS 1995 }
{
 Napiçte program pro poŸ¡t n¡ velkìch mocnin matice 4 X 4.
 Prvky matice jsou Ÿ¡sla <-5,5>.
 Vstup N = mocnitel.
}

program XXX;

uses Crt,Matika;

var N:  Byte;
    Mat:PMatice44;
    Vys:PMatice44;
begin
 ClrScr;
 WriteLn('N hodnØ vygenerovan  matice 4 X 4 bude umocnØna');
 WriteLn('na V mi zadanì exponent N.');
 Write('N ? (max. 255) ');
 ReadLn(N);
 Mat:=New(PMatice44);
 DejMatici(Mat);
 WriteLn('Vygenerovan  matice :');
 TiskMatice(Mat);
 Matice_Init(Mat);
 DejMocninuMat(N,Vys);
 WriteLn('Vìsledn  matice :');
 TiskMatice(Vys);
 Matice_Done;
 Dispose(Mat);
 Dispose(Vys);
end.



