{
 BOOLEAN - příklad 08
}

{
 Zjistí, zda bod leží v obrázku podle zadání mat. ot.
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
 Write('X-ová složka = '); ReadLn(B.X);
 Write('Y-ová složka = '); ReadLn(B.Y);
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
 Lezi_4 := ( (B.Y>=0) and (B.Y<=2) and (B.X>=-1) and (B.X<=+1) ) or { čtverec }
           ( (B.Y<=0) and ((Abs(B.X) + Abs(B.Y)) <= 2) );   { trojúhelník }
end;

var
    Bod:        TBod;
begin
 ClrScr;
 Dej_Bod('B',Bod);

 if Lezi_1(Bod) then WriteLn('Leží v obr. 1')
                else WriteLn('Neleží v obr. 1');
 if Lezi_2(Bod) then WriteLn('Leží v obr. 2')
                else WriteLn('Neleží v obr. 2');
 if Lezi_3(Bod) then WriteLn('Leží v obr. 3')
                else WriteLn('Neleží v obr. 3');
 if Lezi_4(Bod) then WriteLn('Leží v obr. 4')
                else WriteLn('Neleží v obr. 4');

 ReadLn;
end.

