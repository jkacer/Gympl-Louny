{ Written by GAS }

unit Complex;

interface

const
      PI             = 3.1415926;
      MaxPoc         = 10;

type
      PComplex_Alg = ^TComplex_Alg;
      TComplex_Alg =  record
                       Re: Real;
                       Im: Real;
                      end;

      PComplex_Gon = ^TComplex_Gon;
      TComplex_Gon =  record
                       Vel: Real;
                       Fi:  Real;
                      end;

      TBinRov_Alg = array[1..MaxPoc] of TComplex_Alg;
      TBinRov_Gon = array[1..MaxPoc] of TComplex_Gon;


function  Velikost(X:TComplex_Alg):Real;
procedure Dopln(X:TComplex_Alg;var Y:TComplex_Alg);

procedure Plus (A,B:TComplex_Alg;var X:TComplex_Alg);
procedure Minus(A,B:TComplex_Alg;var X:TComplex_Alg);

procedure Krat (A,B:TComplex_Alg;var X:TComplex_Alg);
procedure Delen(A,B:TComplex_Alg;var X:TComplex_Alg);

procedure Dej_Alg(var X:TComplex_Alg);
procedure Dej_Gon(var X:TComplex_Gon);

procedure Pis_Alg(X:TComplex_Alg);
procedure Pis_Gon(X:TComplex_Gon);

procedure Alg_Gon(X:TComplex_Alg;var Y:TComplex_Gon);
procedure Gon_Alg(X:TComplex_Gon;var Y:TComplex_Alg);

function  Nta_Odmocnina(ZCeho:Real;Kolikata:Byte):Real;

implementation

function  Velikost(X:TComplex_Alg):Real;
begin
 Velikost := Sqrt( Sqr(X.Re) + Sqr(X.Im) );
end;

procedure Dopln(X:TComplex_Alg;var Y:TComplex_Alg);
begin
 Y.Re := +X.Re;
 Y.Im := -X.Im;
end;

procedure Plus (A,B:TComplex_Alg;var X:TComplex_Alg);
begin
 X.Re := A.Re + B.Re;
 X.Im := A.Im + B.Im;
end;

procedure Minus(A,B:TComplex_Alg;var X:TComplex_Alg);
begin
 X.Re := A.Re - B.Re;
 X.Im := A.Im - B.Im;
end;

procedure Krat (A,B:TComplex_Alg;var X:TComplex_Alg);
begin
 X.Re := ( A.Re * B.Re ) - ( A.Im * B.Im );
 X.Im := ( A.Re * B.Im ) + ( A.Im * B.Re );
end;

procedure Delen(A,B:TComplex_Alg;var X:TComplex_Alg);
var
      DoplnekB: TComplex_Alg;
      Jmenov:   Real;      { Jmenovatel pro dØlen¡ }
      Citatel:  TComplex_Alg;
begin
 Dopln(B,DoplnekB);
 Jmenov := Sqr(DoplnekB.Re) + Sqr(DoplnekB.Im);

 Krat(A,DoplnekB,Citatel);

 X.Re := Citatel.Re / Jmenov;
 X.Im := Citatel.Im / Jmenov;
end;

procedure Dej_Alg(var X:TComplex_Alg);
begin
 Write('Re ln  slo§ka ? ');
 ReadLn(X.Re);
 Write('Imagin rn¡ slo§ka ? ');
 ReadLn(X.Im);
end;

procedure Dej_Gon(var X:TComplex_Gon);
begin
 Write('Velikost ? ');
 ReadLn(X.Vel);
 repeat
  Write('éhel ? <0,360>');
  ReadLn(X.Fi);
 until (X.Fi>=0) and (X.Fi<=360);
end;

procedure Pis_Alg(X:TComplex_Alg);
begin
 if X.Im>=0 then Write(X.Re:5:3,'+',X.Im:5:3,'i ')
            else Write(X.Re:5:3,X.Im:5:3,'i '); { Minus se dod  }
end;

procedure Pis_Gon(X:TComplex_Gon);
begin
 Write(X.Vel:5:3,' . (cos ',X.Fi:5:3,'ø + i.sin ',X.Fi:5:3,'ø )');
end;

procedure Alg_Gon(X:TComplex_Alg;var Y:TComplex_Gon);
var
      Uhel:     Real;
begin
 Y.Vel := Velikost(X);
 if X.Re<>0 then begin
                  Uhel := ArcTan( Abs(X.Im) / Abs(X.Re) );
                  Uhel := 180*Uhel/PI; { pýevod na stupnØ }
                 end
            else Uhel := 90;

 if X.Im >= 0 then if X.Re<0 then Uhel := 180-Uhel
                             else {}
              else if X.Re<0 then Uhel := 180+Uhel
                             else Uhel := 360-Uhel;
 Y.Fi := Uhel;
end;

procedure Gon_Alg(X:TComplex_Gon;var Y:TComplex_Alg);
begin
 Y.Re := X.Vel * Cos(PI*X.FI/180);
 Y.Im := X.Vel * Sin(PI*X.FI/180);
end;

function  Nta_Odmocnina(ZCeho:Real;Kolikata:Byte):Real;
begin
 Nta_Odmocnina := Exp( Ln(Abs(ZCeho)) / Kolikata );
end;
{
    n
   X       = A

       n
   ln X    = ln A

   n ln X  = ln A

              ln A
   ln X    = ------
               n

      X    = exp( ln A /n )
}

begin { unit Complex }
end.  { unit Complex }
