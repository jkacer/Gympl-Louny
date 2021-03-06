{
 BOOLEAN - p��klad 07
}

{
 Zjist�, zda existuje troj�heln�k, kdy� se zadaj� b. A B C.
}

program XXX;

uses Crt;

type
        TBod = record
                X:   Real;
                Y:   Real;
               end;



procedure Dej_Bod(Z:Char;var B:TBod);
begin
 WriteLn('Zadej bod ',Z,' !');
 Write('X-ov� slo�ka = '); ReadLn(B.X);
 Write('Y-ov� slo�ka = '); ReadLn(B.Y);
end;


function Strana(A,B:TBod):Real;
begin
 Strana := Sqrt( Sqr(A.X - B.X) + Sqr(A.Y - B.Y) );
end;


function Exist_Troj(A,B,C:TBod):Boolean;
var
    S1,S2,S3: Real;
begin
 S1 := Strana(A,B);
 S2 := Strana(A,C);
 S3 := Strana(C,B);

 Exist_Troj := ( (S1+S2) > S3 ) and
               ( (S1+S3) > S2 ) and
               ( (S3+S2) > S1 ) ;
end;


var
    A,B,C:  TBod;

begin
 ClrScr;
 Dej_Bod('A',A);
 Dej_Bod('B',B);
 Dej_Bod('C',C);

 if Exist_Troj(A,B,C) then WriteLn('Troj�heln�k existuje.')
                      else WriteLn('Troj�heln�k neexistuje.');
 ReadLn;
end.
