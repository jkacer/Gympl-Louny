{ Created by GAS 1995 }
{
 Napi�te program pro po��t�n� velk�ch mocnin matice 4 X 4.
 Prvky matice jsou ��sla <-5,5>.
 Vstup N = mocnitel.
}

program XXX;

uses Crt,Matika;

var N:  Byte;
    Mat:PMatice44;
    Vys:PMatice44;
begin
 ClrScr;
 WriteLn('N�hodn� vygenerovan� matice 4 X 4 bude umocn�na');
 WriteLn('na V�mi zadan� exponent N.');
 Write('N ? (max. 255) ');
 ReadLn(N);
 Mat:=New(PMatice44);
 DejMatici(Mat);
 WriteLn('Vygenerovan� matice :');
 TiskMatice(Mat);
 Matice_Init(Mat);
 DejMocninuMat(N,Vys);
 WriteLn('V�sledn� matice :');
 TiskMatice(Vys);
 Matice_Done;
 Dispose(Mat);
 Dispose(Vys);
end.



