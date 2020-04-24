{ Written by Jan Hofmann }

program Brain;
uses Crt;

type
            PC = ^TC;
            TC = record
                  A:     Real;
                  PD,PR: PC;
                 end;



function Alokuj(N:Integer):PC;
var I,J:   Integer;
    P,Z,Y: PC;
begin
 New(P);
 Z:=P;
 for I:=1 to N do begin
                   New(Z^.PD);
                   Y:=Z^.PD;
                   for J:=1 to N do begin
                                     New(Y^.PR);
                                     Y:=Y^.PR;
                                    end;
                   Y:=nil;
                   Z:=Z^.PD;
                  end;
 Z:=nil;
 Alokuj:=P;
end;

function M(P:PC;X,Y:Integer):PC;
var I,J:Integer;
begin
 for I:=1 to X do
  P:=P^.PD;
 for J:=1 to Pred(Y) do
  P:=P^.PR;
 M:=P;
end;

procedure Znic(var P:PC;N:Integer);
var I,J:Integer;
begin
 for I:=N downto 1 do
  begin
   for J:=N downto 2 do
    Dispose(M(P,I,J));
   if not(I=N) then Dispose(M(P,I,1));
  end;
 Dispose(P);
end;

procedure Priprav(var P:PC;var N:Integer);
begin
 WriteLn('Pocet neznamych');
 ReadLn(N);
 P:=Alokuj(N);
 WriteLn;
end;

procedure Nacti(P:PC;N:Integer);
var I,J:Integer;
begin
 WriteLn('Zadejte koeficienty');
 for I:=1 to N do
  begin
   for J:=1 to N do
    Read(M(P,I,J)^.A);
   ReadLn(M(P,I,Succ(N))^.A);
  end;
 WriteLn;
end;

procedure Reseni(P:PC;N:Integer);

procedure Gem(P:PC;N:Integer;var B:Boolean);
var G,I,J:Integer;
    X:    Real;
begin
 B:=True;
 for G:=1 to N-1 do
  for I:=G+1 to N do
   if B then if M(P,G,G)^.A=0 then B:=False
                              else begin
                                    X:=M(P,I,G)^.A/M(P,G,G)^.A*(-1);
                                    for J:=1 to N+1 do
                                     M(P,I,J)^.A:=M(P,G,J)^.A*X+M(P,I,J)^.A;
                                   end;
end;

procedure Jem(P:PC;N:Integer;var B:Boolean);
var G,I,J:Integer;
    X:    Real;
begin
 B:=True;
 for G:=N downto 2 do
  for I:=G-1 downto 1 do
   if B then if M(P,G,G)^.A=0 then B:=False
                              else begin
                                    X:=M(P,I,G)^.A/M(P,G,G)^.A*(-1);
                                    for J:=1 to N+1 do
                                     M(P,I,J)^.A:=M(P,G,J)^.A*X+M(P,I,J)^.A;
                                   end;
end;

procedure Koreny(P:PC;N:Integer);
var G:Integer;
begin
 WriteLn('Koreny soustavy');
 for G:=1 to N do
  WriteLn(M(P,G,N+1)^.A/M(P,G,G)^.A:6:2);
 WriteLn;
end;

var B:Boolean;
begin
 Gem(P,N,B);
 if B then Jem(P,N,B);
 if B then Koreny(P,N)
      else WriteLn('Nedokazu soustavu vyresit');
end;


var D:PC;
    E:Integer;

begin
 ClrScr;
 Priprav(D,E);
 Nacti(D,E);
 Reseni(D,E);
 Znic(D,E);
 ReadLn;
end.


























































































