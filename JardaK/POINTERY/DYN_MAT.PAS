{ Created by GAS 1995 }

unit Dyn_Mat;

interface

uses Crt,Dos,Objects,GasCrt;

const
      Ch_Intg = 'Matice porušena !'#13#10'==>Exit';

type
      PObecRealPrvek = ^TObecRealPrvek;
      TObecRealPrvek =  record
                         Cislo:   Real;
                         Pos_Sl:  Word;

                         Prev:    PObecRealPrvek;
                         Next:    PObecRealPrvek;
                        end;

      PVytahPrvek = ^TVytahPrvek;
      TVytahPrvek =  record
                      Pocet_Sl:  Word;
                      Pos_Rad:   Word;

                      Ukaz:      PObecRealPrvek;

                      Prev:      PVytahPrvek;
                      Next:      PVytahPrvek;
                     end;


      PDynMatice = ^TDynMatice;
      TDynMatice =  object(TObject)

         { PRIVATE } private { Z venku nepřístupné !!! }

                     Pocet_Rad:  Word;
                     Hlava:      PVytahPrvek;

         { PUBLIC }  public  { Z venku je přece musíme volat !!! }

                     constructor Init(Rad,Sl:Word;Hod:Real);
                     destructor  Done;                       virtual;


                     function    Check:Boolean;              virtual;
                     function    GetPocetR:Word;
                     function    GetPocetS(Rad:Word):Word;

                     procedure   Tisk(Hlavicka:String);
                     procedure   LadTisk;

                     procedure   Zapis(R,S:Word;Co:Real);
                     function    At(R,S:Word):Real;

                     procedure   Pridej(R,ZaS:Word;Co:Real);
                     procedure   Uber(R,S:Word);

                     procedure   PridejRad(Za:Word);
                     procedure   UberRad(Co:Word);
                    end;

procedure Enter;


implementation

procedure Enter;
begin
 WriteLn('==== Enter ====');
 ReadLn;
end;

constructor TDynMatice.Init(Rad,Sl:Word;Hod:Real);
var
     PomV1,
     PomV2:  PVytahPrvek;
     PomH1,
     PomH2:  PObecRealPrvek;
     I,J:    Word;

begin
 inherited Init;
 Pocet_Rad:=0; { OBJ }

 { OBJ }
 New(Hlava);
 Hlava^.Pocet_Sl:=0;
 Hlava^.Pos_Rad :=0;
 Hlava^.Ukaz:=nil; { navždy }
 Hlava^.Prev:=nil; { navždy }
 Hlava^.Next:=nil;

 { samotná matice }
 PomV1:=Hlava;
 for I:=1 to Rad do
  begin
   { Řádky }
   New(PomV2);
   PomV2^.Pocet_Sl:=0;
   PomV2^.Pos_Rad :=I;

   PomV1^.Next:=PomV2;
   PomV2^.Prev:=PomV1;
   PomV2^.Next:=nil;
   PomV2^.Ukaz:=nil;

   { 1. sloupec a jeho nastavení }
   New(PomH1);

   if Sl>0 then begin
                 { Napojení z výtahu na 1. prvek }
                 PomV2^.Ukaz:=PomH1;

                 PomH1^.Cislo :=Hod;
                 PomH1^.Pos_Sl:=1;

                 PomH1^.Prev:=nil; { navždy }
                 PomH1^.Next:=nil;
                 Inc(PomV2^.Pocet_Sl);

                 for J:=2 to Sl do
                  begin
                   New(PomH2);
                   PomH2^.Cislo :=Hod;
                   PomH2^.Pos_Sl:=J;

                   PomH1^.Next:=PomH2;
                   PomH2^.Prev:=PomH1;
                   PomH2^.Next:=nil;

                   PomH1:=PomH2;
                   Inc(PomV2^.Pocet_Sl);
                  end; { for J }

                end { if }
           else Dispose(PomH1); { alokováno zbytečně při 0 sloupců }
   PomV1:=PomV2;
   Inc(Pocet_Rad); { OBJ }
  end; { for I }
 WriteLn('Vytvořena dynamická matice s ',Rad,' řádky.');
 WriteLn('Každý řádek má ',Sl,' sloupců o hodnotě ',Hod:5:3,'.');
end;  { constructor TDynMatice.Init }


destructor TDynMatice.Done;
var    I:    Word;
begin
 for I:=1 to Pocet_Rad do
  UberRad(1);  { Dolejší řádky se posouvají nahoru ==>> nutno 1 }
 if Hlava<>nil then Dispose(Hlava)
               else WriteLn('Chyba při rušení hlavy !');
 inherited Done;
 WriteLn('Dynamická matice zrušena.');
end; { destructor TDynMatice.Done }


function TDynMatice.Check:Boolean;
var
    I,J:    Word;
    V:      PVytahPrvek;
    H:      PObecRealPrvek;
    B:      Boolean;
    Kolik1,
    Kolik2: Word;
begin
 B:=True;
 V:=Hlava;
 Kolik1:=0;
 for I:=1 to Pocet_Rad do
  begin
   V:=V^.Next;
   B:=B and (V^.Pos_Rad=I);
   H:=V^.Ukaz;
   Kolik2:=0;
   for J:=1 to V^.Pocet_Sl do
    begin
     B:=B and (H^.Pos_Sl=J);
     H:=H^.Next;
     Inc(Kolik2);
    end;
   B:=B and (Kolik2=V^.Pocet_Sl);
   Inc(Kolik1);
  end;
 B:=B and (Kolik1=Pocet_Rad);
{
 if B then WriteLn('Checking.........OK.')
      else WriteLn('Checking......Error!');
}
 Check:=B;
end; { function TDynMatice.Check }


function TDynMatice.GetPocetR:Word;
begin
 if not(Check) then begin
                     WriteLn(Ch_Intg);
                     Exit;
                    end;
 GetPocetR:=Pocet_Rad;
end; { function TDynMatice.GetPocetR }


function TDynMatice.GetPocetS(Rad:Word):Word;
var
    I: Word;
    V: PVytahPrvek;
begin
 if not(Check) then begin
                     WriteLn(Ch_Intg);
                     Exit;
                    end;
 V:=Hlava;
 for I:=1 to Rad do
  V:=V^.Next;
 GetPocetS:=V^.Pocet_Sl;
end; { function TDynMatice.GetPocetS }

procedure TDynMatice.Tisk(Hlavicka:String);
var
    I,J:   Word;
    V:     PVytahPrvek;
    H:     PObecRealPrvek;
begin
 if not(Check) then begin
                     WriteLn(Ch_Intg);
                    { Exit; }
                    end;
 WriteLn(Hlavicka);
 V:=Hlava;
 for I:=1 to Pocet_Rad do
  begin
   V:=V^.Next;
   Write(I,'(',V^.Pocet_Sl,'): ');
   H:=V^.Ukaz;
   for J:=1 to V^.Pocet_Sl do
    begin
     Write(H^.Cislo:5:3);
     if J=V^.Pocet_Sl then WriteLn('.')
                      else Write(', ');
     H:=H^.Next;
    end;
  end;
end; { procedure TDynMatice.Tisk }

procedure TDynMatice.LadTisk;
var
    I,J:   Word;
    V:     PVytahPrvek;
    H:     PObecRealPrvek;
begin
 if not(Check) then begin
                     WriteLn(Ch_Intg);
                     WriteLn('Exit se nekoná.');
                    end;
 WriteLn('Tisk matice pouze pro účely ladění.');
 V:=Hlava;
 for I:=1 to Pocet_Rad do
  begin
   V:=V^.Next;
   WriteLn('I=',I,', V^.Pocet_Sl=',V^.Pocet_Sl,', V^.Pos_Rad=',V^.Pos_Rad);
   WriteLn('Řádek č.',I,' obsahuje ',V^.Pocet_Sl,' čísel : ');
   Enter;
   H:=V^.Ukaz;
   for J:=1 to V^.Pocet_Sl do
    begin
     Write('J=',J,', H^.Pos_Sl=',H^.Pos_Sl,', H^.Cislo=',H^.Cislo);
     Write(' ■■■ ',H^.Cislo:5:3);
     if J=V^.Pocet_Sl then WriteLn('.')
                      else WriteLn(', ');
     Enter;
     H:=H^.Next;
    end;
  end;
end; { procedure TDynMatice.LadTisk }

procedure TDynMatice.Zapis(R,S:Word;Co:Real);
var
    I:     Word;
    V:     PVytahPrvek;
    H:     PObecRealPrvek;
begin
 if (R<1) or (R>Pocet_Rad) then Exit;
 if not(Check) then begin
                     WriteLn(Ch_Intg);
                     Exit;
                    end;
 V:=Hlava;
 for I:=1 to R do
  V:=V^.Next;
 H:=V^.Ukaz;
 if (S<1) or(S>V^.Pocet_Sl) then Exit;
 Dec(S);
 for I:=1 to S do
  H:=H^.Next;
 { zápis }
 H^.Cislo:=Co;
end; { procedure TDynMatice.Zapis }

function TDynMatice.At(R,S:Word):Real;
var
    I:     Word;
    V:     PVytahPrvek;
    H:     PObecRealPrvek;
begin
 if (R<1) or (R>Pocet_Rad) then Exit;
 if not(Check) then begin
                     WriteLn(Ch_Intg);
                     Exit;
                    end;
 V:=Hlava;
 for I:=1 to R do
  V:=V^.Next;
 H:=V^.Ukaz;
 if (S<1) or(S>V^.Pocet_Sl) then Exit;
 Dec(S);
 for I:=1 to S do
  H:=H^.Next;
 { čtení }
 At:=H^.Cislo;
end; { function TDynMatice.At }

procedure TDynMatice.Pridej(R,ZaS:Word;Co:Real);
var
    I:     Word;
    V:     PVytahPrvek;
    H:     PObecRealPrvek;
    Nov:   PObecRealPrvek;
begin
 if (R<1) or (R>Pocet_Rad) then Exit;
 if not(Check) then begin
                     WriteLn(Ch_Intg);
                     WriteLn('blablabala');
{                     Exit; }
                    end;
 V:=Hlava;
 for I:=1 to R do
  V:=V^.Next;
 H:=V^.Ukaz;
 New(Nov);
 Nov^.Cislo:=Co;
 Nov^.Pos_Sl:=ZaS+1;
 if ZaS=0 then begin
                Nov^.Prev:=nil; { navždy }
                Nov^.Next:=V^.Ukaz;
                V^.Ukaz:=Nov;
                Nov^.Next^.Prev:=Nov;
               end
          else begin
                if ZaS<1 then Exit;
                if ZaS>V^.Pocet_Sl then ZaS:=V^.Pocet_Sl;
                Dec(Zas);
                for I:=1 to ZaS do
                 H:=H^.Next;
                Nov^.Prev:=H;
                Nov^.Next:=H^.Next;
                H^.Next:=Nov;
                if (ZaS+1)<>V^.Pocet_Sl then Nov^.Next^.Prev:=Nov;
               end;
 Inc(V^.Pocet_Sl);
 { Přečíslování sloupečků }
 H:=V^.Ukaz;
 for I:=1 to V^.Pocet_Sl do
  begin
   H^.Pos_Sl:=I;
   H:=H^.Next;
  end;
end; { procedure TDynMatice.Pridej }

procedure TDynMatice.Uber(R,S:Word);
var
    I:     Word;
    V:     PVytahPrvek;
    H:     PObecRealPrvek;
begin
 if (R<1) or (R>Pocet_Rad) then Exit;
 if not(Check) then begin
                     WriteLn(Ch_Intg);
                     Exit;
                    end;
 V:=Hlava;
 for I:=1 to R do
  V:=V^.Next;
 H:=V^.Ukaz;
 if (S<1) or (S>V^.Pocet_Sl) then Exit;
 Dec(S);
 for I:=1 to S do
  H:=H^.Next;
 if (S+1)<>1 then           H^.Prev^.Next:=H^.Next
             else           begin
                             H^.Next^.Prev:=nil;
                             { Speciální případ-nutno navázat z výtahu }
                             V^.Ukaz:=H^.Next;
                            end;
 if (S+1)<>V^.Pocet_Sl then H^.Next^.Prev:=H^.Prev
                       else H^.Prev^.Next:=nil;
 Dispose(H);
 Dec(V^.Pocet_Sl);
 { Přečíslování sloupečků }
 H:=V^.Ukaz;
 for I:=1 to V^.Pocet_Sl do
  begin
   H^.Pos_Sl:=I;
   H:=H^.Next;
  end;
end; { procedure TDynMatice.Uber }

procedure TDynMatice.PridejRad(Za:Word);
var
    I:      Word;
    V1,V2:  PVytahPrvek;
begin
 if (Za<0) or (Za>Pocet_Rad) then Exit;
 if not(Check) then begin
                     WriteLn(Ch_Intg);
                     Exit;
                    end;
 V1:=Hlava;
 for I:=1 to Za do
  V1:=V1^.Next;
 { Vložíme ZA V1 }

 { Nový prvek a jeho svázání }
 New(V2);
 V2^.Pocet_Sl:=0;
 V2^.Pos_Rad :=Za+1;
 V2^.Ukaz    :=nil;
 V2^.Prev    :=V1;
 V2^.Next    :=V1^.Next;

 V2^.Next^.Prev:=V2;
 V1^.Next:=V2;

 Inc(Pocet_Rad);
 { Přečíslování výtahových prvků }
 V1:=Hlava;
 for I:=1 to Pocet_Rad do
  begin
   V1:=V1^.Next;
   V1^.Pos_Rad:=I;
  end;
end; { procedure TDynMatice.PridejRad }


procedure TDynMatice.UberRad(Co:Word);
var
    I,J:      Word;
    V1,V2:    PVytahPrvek;
    H1,H2:    PObecRealPrvek;
begin
 if (Co<1) or (Co>Pocet_Rad) then Exit;
 if not(Check) then begin
                     WriteLn(Ch_Intg);
                     Exit;
                    end;
 V1:=Hlava;
 { Zrušíme V1 }
 for J:=1 to Co do
  V1:=V1^.Next;
 { Vyčlenění V1 }
 V2:=V1^.Prev;
 V2^.Next:=V1^.Next;
 V1^.Next^.Prev:=V2;

 for J:=1 to V1^.Pocet_Sl do
  begin
   H1:=V1^.Ukaz;
   H2:=H1^.Next;
   V1^.Ukaz:=H2;                    { H1 vyčleněno }
   if H1<>nil then Dispose(H1)      { a zrušeno }
              else WriteLn('Chyba při rušení obecného prvku !');
  end;
 if V1<>nil then Dispose(V1) { PomV1 zrušeno (vyčleněno dříve) }
            else WriteLn('Chyba při rušení prvku výtahu !');
 Dec(Pocet_Rad);
 { Přečíslování výtahových prvků }
 V1:=Hlava;
 for I:=1 to Pocet_Rad do
  begin
   V1:=V1^.Next;
   V1^.Pos_Rad:=I;
  end;
end; { procedure TDynMatice.UberRad }

begin { unit Dyn_Mat }
end.  { unit Dyn_Mat }
