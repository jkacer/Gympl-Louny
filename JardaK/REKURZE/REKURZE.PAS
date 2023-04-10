unit Rekurze;

interface

uses
       Graph,Dos,Crt;

const
       g_Chyba          =       0;
       g_OK             =       1;

       MullerConst      =       7/24; { Magic Number !!! }

type
       TTrojuh = array[1..3] of PointType;

const
       Troj : TTrojuh = (
                         (X:0;Y:0),
                         (X:0;Y:0),
                         (X:0;Y:0)
                        );

procedure Pip1;
procedure Pip2;
function  Graph_Init:Byte;

procedure Rieger_Kob1(X1,Y1,X2,Y2:Integer;Level:Byte);
procedure Rieger_Kob2(X1,Y1,X2,Y2:Integer;Level:Byte);
procedure Rieger_Kob3(X1,Y1,X2,Y2:Integer;Level:Byte);

function  N_Faktorial(Ceho:Byte):LongInt;
function  X_Na_N(X,N:Byte):LongInt;
function  N_Nad_K(N,K:Byte):LongInt;
function  FibonaccihoPosl(N:Byte):LongInt;
function  N_Faktorial_Iter(Ceho:Byte):LongInt;


implementation

procedure Pip1;
begin
 Sound(100); Delay(10); NoSound;
end;

procedure Pip2;
begin
 Sound(100); Delay(100); NoSound; Delay(100);
 ReadLn;
end;

function  Graph_Init:Byte;
var
    GD,GM:      Integer;
begin
 DetectGraph(GD,GM);
 InitGraph(GD,GM,'');
 if GraphResult<>grOK then begin
                            WriteLn('Chyba při inicializaci grafiky !');
                            Graph_Init := g_Chyba;
                           end
                      else Graph_Init := g_OK;
end; { function  Graph_Init }

procedure Rieger_Kob1(X1,Y1,X2,Y2:Integer;Level:Byte);
begin
 if Level>0 then begin
                  SetColor(Red);
                  SetFillStyle(1,Red);

                  Troj[1].X := X1;
                  Troj[1].Y := Y1;

                  Troj[2].X := X2;
                  Troj[2].Y := Y1;

                  Troj[3].X := X1;
                  Troj[3].Y := Y2;

                  FillPoly(SizeOf(Troj) div SizeOf(PointType),Troj);
                  Pip1;

                  Rieger_Kob1(X1+ ( (X2-X1) div 2),Y1+ ( (Y2-Y1) div 2),X2,Y2,Level-1);
                 end
            else Pip2; { nakonec }
end; { procedure Rieger_Kob1 }

procedure Rieger_Kob2(X1,Y1,X2,Y2:Integer;Level:Byte);
begin
 if Level>0 then begin
                  SetColor(Red);
                  SetFillStyle(1,Red);

                  Troj[1].X := X1;
                  Troj[1].Y := Y1;

                  Troj[2].X := X2;
                  Troj[2].Y := Y1;

                  Troj[3].X := X1;
                  Troj[3].Y := Y2;

                  FillPoly(SizeOf(Troj) div SizeOf(PointType),Troj);

                  SetColor(Yellow);
                  SetFillStyle(1,Yellow);

                  Troj[1].X := X1+ ( (X2-X1) div 2);
                  Troj[1].Y := Y1;

                  Troj[2].X := X1+ ( (X2-X1) div 2);
                  Troj[2].Y := Y1+ ( (Y2-Y1) div 2);

                  Troj[3].X := X1;
                  Troj[3].Y := Y1+ ( (Y2-Y1) div 2);

                  FillPoly(SizeOf(Troj) div SizeOf(PointType),Troj);


                  Pip1;

                  Rieger_Kob2(X1+ ( (X2-X1) div 2),Y1+ ( (Y2-Y1) div 2),X2,Y2,Level-1);
                 end
            else Pip2; { nakonec }
end; { procedure Rieger_Kob2 }


procedure Rieger_Kob3(X1,Y1,X2,Y2:Integer;Level:Byte);
var
    R:          Integer;
    SX,SY:      Integer;
    ESX,ESY:    Integer;
begin
 if Level>0 then begin
                  SetColor(Red);
                  SetFillStyle(1,Red);

                  Troj[1].X := X1;
                  Troj[1].Y := Y1;

                  Troj[2].X := X2;
                  Troj[2].Y := Y1;

                  Troj[3].X := X1;
                  Troj[3].Y := Y2;

                  FillPoly(SizeOf(Troj) div SizeOf(PointType),Troj);

                  SetColor(Yellow);
                  SetFillStyle(1,Yellow);

                  SX := X1+ ( (X2-X1) div 2); { poloviny uhlopříčky }
                  SY := Y1+ ( (Y2-Y1) div 2);

                  ESX := Round(X1+ ( (X2-X1) * MullerConst)); { střed elipsy }
                  ESY := Round(Y1+ ( (Y2-Y1) * MullerConst));

                  R:= Round( Sqrt( Abs( Sqr(SX-ESX) + Sqr(SY-ESY)) ) );
                  FillEllipse(ESX,ESY,R,R);

                  Pip1;

                  Rieger_Kob3(X1+ ( (X2-X1) div 2),Y1+ ( (Y2-Y1) div 2),X2,Y2,Level-1);
                 end
            else Pip2; { nakonec }
end; { procedure Rieger_Kob3 }


function N_Faktorial(Ceho:Byte):LongInt;
begin
 if Ceho=0 then N_Faktorial:=1
           else N_Faktorial:=Ceho*N_Faktorial(Ceho-1);
end; { function N_Faktorial }

function X_Na_N(X,N:Byte):LongInt;
begin
 if N=0 then X_Na_N:=1
        else if N=1 then X_Na_N:=X
                    else X_Na_N:=X*X_Na_N(X,N-1);
end; { function X_Na_N }

function N_Nad_K(N,K:Byte):LongInt;
begin
 N_Nad_K := N_Faktorial(N) div ( N_Faktorial(K) * N_Faktorial(N-K) );
end; { function N_Nad_K }

function FibonaccihoPosl(N:Byte):LongInt;
var
    F1,F2:      LongInt;
begin
 case N of
  0:   FibonaccihoPosl := 0;
  1:   FibonaccihoPosl := 1;
  else begin
        F1 := FibonaccihoPosl(N-1);
        F2 := FibonaccihoPosl(N-2);
        FibonaccihoPosl := F1+F2;
       end; { else }
 end; { case }
end; { function FibonaccihoPosl }

function N_Faktorial_Iter(Ceho:Byte):LongInt;
var
    I:  Byte;
    Pom:LongInt;
begin
 Pom:=1;
 for I:=2 to Ceho do
  Pom:=Pom*I;
 N_Faktorial_Iter := Pom;
end; { function N_Faktorial_Iter }



begin { unit Rekurze }
end.  { unit Rekurze }


