{
 BOOLEAN - pý¡klad 08
}

{
 Zjist¡, zda bod le§¡ v obr zku podle zad n¡ mat. ot.
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
 Write('X-ov  slo§ka = '); ReadLn(B.X);
 Write('Y-ov  slo§ka = '); ReadLn(B.Y);
end;


function Lezi_1(B:TBod):Boolean;
begin
 Lezi_1 := ( Abs(B.X) + Abs(B.Y) ) <= 2;
end;

function Lezi_2(B:TBod):Boolean;
begin
 Lezi_2 := ((Sqr(B.X) + Sqr(B.Y)) <= 4 ) and ( Abs(B.X) + Abs(B.Y) <= 2 );
end;

function Lezi_3(B:TBod):Boolean;
begin
 Lezi_3 := ((Abs(B.X)<=2) and (Abs(B.Y)<=2) ) and ( Abs(B.X) + Abs(B.Y) <= 2 );
end;

function Lezi_4(B:TBod):Boolean;
begin
 Lezi_4 := ( (B.Y>=0) and (B.Y<=2) and (B.X>=-1) and (B.X<=+1) ) or { Ÿtverec }
           ( (B.Y<=0) and ((Abs(B.X) + Abs(B.Y)) <= 2) );   { troj£heln¡k }
end;

var
    Bod:        TBod;
begin
 ClrScr;
 Dej_Bod('B',Bod);

 if Lezi_1(Bod) then WriteLn('Le§¡ v obr. 1')
                else WriteLn('Nele§¡ v obr. 1');
 if Lezi_2(Bod) then WriteLn('Le§¡ v obr. 2')
                else WriteLn('Nele§¡ v obr. 2');
 if Lezi_3(Bod) then WriteLn('Le§¡ v obr. 3')
                else WriteLn('Nele§¡ v obr. 3');
 if Lezi_4(Bod) then WriteLn('Le§¡ v obr. 4')
                else WriteLn('Nele§¡ v obr. 4');

 ReadLn;
end.

