{ Written by GAS }

program Bin_Rov;

uses
      Crt,Complex,Com_Grph,Graph;


var
      Pole_A:   TBinRov_Alg;
      Pole_G:   TBinRov_Gon;
      N:        Byte;
      A:        TComplex_Alg;
      B:        TComplex_Gon;
      K:        Byte;

      Velikost: Real;
      Uhel:     Real;

      { Pro grafiku }
      AspX,
      AspY:     Word;
      Jak:      Byte;
      S:        string[3];

begin
 ClrScr;
 WriteLn('Binomická rovnice');
 WriteLn('Znění je: X^n = A       A-komplexní číslo');

 repeat
  WriteLn('Zadej N>0 a N<',MaxPoc+1);
  ReadLn(N);
 until (N>0) and (N<MaxPoc+1);

 WriteLn('Zadej A');
 Dej_Alg(A);
 Alg_Gon(A,B);

 Write('A = ');
 Pis_Gon(B);
 WriteLn;
 WriteLn;

 Velikost := Nta_Odmocnina(B.Vel,N);  { velikost všech výsledků }
 Uhel     := B.Fi / N;                { bude se přičítat část 360/N}

 for K := 0 to N-1 do   { naplnění pole čísel v gon. tvaru }
  begin
   Pole_G[K+1].Vel := Velikost;
   Pole_G[K+1].Fi  := Uhel + K*(360/N);
   { př.:   3Fi = 45 + k.360  ==>> Fi = 15 + k.120 }
  end;

 for K := 0 to N-1 do
  begin
   Write('X',K,' = ');
   Pis_Gon(Pole_G[K+1]);
   WriteLn;
  end;

 WriteLn;

 for K:=1 to N do
  begin
   Gon_Alg(Pole_G[K],Pole_A[K]);
   Write('X',K-1,' = ');
   Pis_Alg(Pole_A[K]);
   WriteLn;
  end;

 ReadLn;

 Jak := Com_Grph_Init(Pole_G[1].Vel);
 if Jak<>g_OK then Exit;

 for K:=1 to N do
  begin
   Str(K-1,S);
   S:='X'+S;
   ZanesBod(S,Pole_A[K].Re,Pole_A[K].Im);
  end;

 Pip;
 ReadLn;
 Com_Grph_Done;
end.




