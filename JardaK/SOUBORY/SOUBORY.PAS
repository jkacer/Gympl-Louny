{ Created by GAS 1995 }
unit Soubory;

interface

uses Crt,Dos;

type
     F_Real = file of Real;
     F_Cely = file of Integer;

     Zastoupeni = record
                   Kolko:Byte;
                  end;

     RozklSlovo = array[32..255] of Zastoupeni;

procedure DejSlovo(S:String;var Poc,Kon:Word;var JeTam:Boolean);
procedure DejSlovoPlus(S:String;var Poc,Kon:Word;var JeTam:Boolean);
procedure VymazPosloupnost(var X:F_Cely);
procedure KopniPosloupnost(var S1,S2:F_Cely);
procedure InitRS(var X:RozklSlovo);
procedure DejZnaky(S:String;var X:RozklSlovo);
function  RovnostRS(A,B:RozklSlovo):Boolean;

implementation

procedure DejSlovo(S:String;var Poc,Kon:Word;var JeTam:Boolean);
label Konec;
var A,B:  Word;
    Znak: Char;
    Vypal:Boolean;
begin
 if Length(S)<1 then begin
                      Poc:=0;
                      Kon:=0;
                      JeTam:=False;
                      GoTo Konec;
                     end;
 A:=1;
 Znak:=S[1];
 Vypal:=False;

 { Tenhle cyklus zjisti pocatek 1.slova ve str. S }
 repeat
  case Znak of
   ' ':begin
        Inc(A);
        if A<=Length(S) then Znak:=S[A]
                        else begin
                              Vypal:=True;
                              JeTam:=False;
                             end;
       end;
   #13:begin
        Vypal:=True;
        JeTam:=False;
       end;
   else begin
         Poc:=A;
         JeTam:=True;
         Vypal:=True;
        end;
  end; { case Znak of }
 until Vypal;

 if not(JeTam) then begin
                     Poc:=0;
                     Kon:=0;
                     GoTo Konec;
                    end;

 B:=A+1;
 if B>Length(S) then begin
                      Kon:=A;
                      GoTo Konec;
                     end;
 Znak:=S[B];
 Vypal:=False;
 { Tenkle cyklus zjisti konec 1.slova ve str. S }
 repeat
  case Znak of
   ' ':begin
        Kon:=B-1;
        Vypal:=True;
       end;
   #13:begin
        Kon:=B-1;
        Vypal:=True;
       end;
   else begin
         Inc(B);
         if B<=Length(S) then Znak:=S[B]
                         else begin
                               Kon:=B-1;
                               Vypal:=True;
                              end;
        end;
  end; { case Znak of }
 until Vypal;

 Konec:
end; { procedure DejSlovo }

procedure DejSlovoPlus(S:String;var Poc,Kon:Word;var JeTam:Boolean);
label Konec;
var A,B:  Word;
    Znak: Char;
    Vypal:Boolean;
begin
 if Length(S)<1 then begin
                      Poc:=0;
                      Kon:=0;
                      JeTam:=False;
                      GoTo Konec;
                     end;
 A:=1;
 Znak:=S[1];
 Vypal:=False;

 { Tenhle cyklus zjisti pocatek 1.slova ve str. S }
 repeat
  case Znak of
   ' ':begin
        Inc(A);
        if A<=Length(S) then Znak:=S[A]
                        else begin
                              Vypal:=True;
                              JeTam:=False;
                             end;
       end;
   '.':begin
        Inc(A);
        if A<=Length(S) then Znak:=S[A]
                        else begin
                              Vypal:=True;
                              JeTam:=False;
                             end;
       end;
   ',':begin
        Inc(A);
        if A<=Length(S) then Znak:=S[A]
                        else begin
                              Vypal:=True;
                              JeTam:=False;
                             end;
       end;
   #13:begin
        Vypal:=True;
        JeTam:=False;
       end;
   else begin
         Poc:=A;
         JeTam:=True;
         Vypal:=True;
        end;
  end; { case Znak of }
 until Vypal;

 if not(JeTam) then begin
                     Poc:=0;
                     Kon:=0;
                     GoTo Konec;
                    end;

 B:=A+1;
 if B>Length(S) then begin
                      Kon:=A;
                      GoTo Konec;
                     end;
 Znak:=S[B];
 Vypal:=False;
 { Tenkle cyklus zjisti konec 1.slova ve str. S }
 repeat
  case Znak of
   ' ':begin
        Kon:=B-1;
        Vypal:=True;
       end;
   '.':begin
        Kon:=B-1;
        Vypal:=True;
       end;
   ',':begin
        Kon:=B-1;
        Vypal:=True;
       end;
   #13:begin
        Kon:=B-1;
        Vypal:=True;
       end;
   else begin
         Inc(B);
         if B<=Length(S) then Znak:=S[B]
                         else begin
                               Kon:=B-1;
                               Vypal:=True;
                              end;
        end;
  end; { case Znak of }
 until Vypal;

 Konec:
end; { procedure DejSlovoPlus }

procedure VymazPosloupnost(var X:F_Cely);
begin
 ReWrite(X);
end; { procedure VymazPosloupnost }

procedure KopniPosloupnost(var S1,S2:F_Cely);
var X:Integer;
begin
 Seek(S1,0);
 while not(Eof(S1)) do
  begin
   Read(S1,X);
   Write(S2,X);
  end;
end; { procedure KopniPosloupnost }

procedure InitRS(var X:RozklSlovo);
var I:Byte;
begin
 for I:=32 to 255 do
  X[I].Kolko:=0;
end;  { procedure InitRS }

procedure DejZnaky(S:String;var X:RozklSlovo);
var I:Byte;
    Z:Char;
begin
 for I:=1 to Length(S) do
  begin
   Z:=S[I];
   Inc(X[Ord(Z)].Kolko);
  end;
end;  { procedure DejZnaky }

function  RovnostRS(A,B:RozklSlovo):Boolean;
var I:   Byte;
    Bool:Boolean;
begin
 Bool:=True;
 for I:=32 to 255 do
  if A[I].Kolko<>B[I].Kolko then Bool:=False;
 RovnostRS:=Bool;
end; { function RovnostRS }

end. { unit Soubory }




