{ Created by GAS 1995 }

unit Pointery;

interface

uses Crt;


type
     PPrvekInt = ^TPrvekInt;
     TPrvekInt =  record
                   Cislo: Integer;
                   Dalsi: PPrvekInt;
                  end;


function  VytvorSez(Kolik:Integer):PPrvekInt;
procedure TiskniSez(Misto:PPrvekInt);
procedure ZrusSez(var Misto:PPrvekInt);

function  VytahniSez(Misto:PPrvekInt;Odkud,Kolik:Integer):PPrvekInt;
function  DejKolikDelSez(Misto:PPrvekInt;Cim:Integer):Integer;

function  DejMaxSez(Misto:PPrvekInt):Integer;
function  DejMinSez(Misto:PPrvekInt):Integer;

procedure ZrusDelCimSez(Misto:PPrvekInt;Cim:Integer);

procedure VymazPrvekZa(Kde:PPrvekInt);
procedure VlozPrvekZa(Kde:PPrvekInt;Co:Integer);


implementation

function  VytvorSez(Kolik:Integer):PPrvekInt;
var Pom1,                 { vlevo  od Pom2 }
    Pom2:  PPrvekInt;     { vpravo od Pom1 }
    Hlava: PPrvekInt;
    I:     Integer;
begin
 New(Hlava);
 New(Pom1);
 Hlava^.Dalsi:=Pom1;

 for I:=1 to Kolik do
  begin
   New(Pom2);
   Pom1^.Cislo:=I;
   if I<Kolik then begin      { Pro poslední prvek NEpotřebujeme další }
                    Pom1^.Dalsi:=Pom2;
                    Pom1:=Pom2;
                   end
              else Dispose(Pom2); { Pro posl. prvek se zruší složka Další }
  end;

 Pom1^.Dalsi:=nil;                { a nacpe se do ní NIL }
 VytvorSez:=Hlava;
 WriteLn('Seznam vytvořen.');
end; { VytvorSez }

procedure TiskniSez(Misto:PPrvekInt);
var Pom: PPrvekInt;
begin
 if Misto=nil then begin
                    WriteLn('Vstup v "TiskniSez" je NIL => Exit.');
                    Sound(500); Delay(500); NoSound;
                    Exit;
                   end;
 WriteLn('Tisk čísel : ');
 Pom:=Misto^.Dalsi;
 while Pom<>nil do
  begin
   Write(Pom^.Cislo,' , ');
   Pom:=Pom^.Dalsi;
  end;
 GoToXY(WhereX-2,WhereY);
 WriteLn('.');
end; { TiskniSez }

procedure ZrusSez(var Misto:PPrvekInt);
var Pom1,
    Pom2: PPrvekInt;
begin
 if Misto=nil then begin
                    WriteLn('Vstup v "ZrusSez" je NIL => Exit.');
                    WriteLn('(Seznam neexistuje).');
                    Sound(500); Delay(500); NoSound;
                    Exit;
                   end;
 Pom1:=Misto^.Dalsi;
 while Pom1<>nil do
  begin
   Pom2:=Pom1^.Dalsi;
   if Pom1<>nil then Dispose(Pom1);
   Pom1:=Pom2;
  end;
 if Misto<>nil then Dispose(Misto);
 Misto:=nil;
 WriteLn('Seznam uvolněn z paměti.');
end; { ZrusSez }

function  VytahniSez(Misto:PPrvekInt;Odkud,Kolik:Integer):PPrvekInt;
var Pom1,
    Pom2:      PPrvekInt;
    NovaHlava: PPrvekInt;
    Posledni : PPrvekInt;
    I:         Integer;
begin
 if Misto=nil then begin
                    WriteLn('Vstup v "VytahniSez" je NIL => Exit.');
                    Sound(500); Delay(500); NoSound;
                    Exit;
                   end;
 New(NovaHlava);
 Pom1:=Misto^.Dalsi;

 for I:=1 to Odkud-1 do
  if Pom1<>nil then begin
                     Pom2:=Pom1^.Dalsi;
                     if I<Odkud-1 then Pom1:=Pom2; { poslední před 1. vybraným}
                    end
               else begin
                     WriteLn('1 Seznam nemá dostatečný počet prvků => Exit.');
                     WriteLn('1 Neručím za správný chod programu !');
                     VytahniSez:=nil;
                     Exit;
                    end;
 { v Pom2 je začátek novýho seznamu }
 Posledni:=Pom1;
 NovaHlava^.Dalsi:=Pom2;

 for I:=1 to Kolik do
  begin
   Pom1:=Pom2^.Dalsi;
   if (Pom1=nil) and { ta 2. podmínka je tu kvůli tomu, kdyby se šlo až }
      (I<Kolik)  then{ nakonec řetězce=>Exit a pak by se to nenavázalo => }
                    begin { => runtime error 204 v ZrusSez }
                     WriteLn('2 Seznam nemá dostatečný počet prvků => Exit.');
                     WriteLn('2 Neručím za správný chod programu !');
                     VytahniSez:=NovaHlava;
                     Exit;
                    end;
   if I<Kolik then Pom2:=Pom1;
  end;

 { ukončení novýho seznamu a napojení zbytku na Posledni }
 Pom2^.Dalsi:=nil;
 Posledni^.Dalsi:=Pom1;

 VytahniSez:=NovaHlava;
end; { VytahniSez }

function  DejKolikDelSez(Misto:PPrvekInt;Cim:Integer):Integer;
var   Pom:  PPrvekInt;
      KKK:  Integer;
begin
 if Misto=nil then begin
                    WriteLn('Vstup v "DejKolikDelSez" je NIL => Exit.');
                    Sound(500); Delay(500); NoSound;
                    Exit;
                   end;
 KKK:=0;
 Pom:=Misto^.Dalsi;
 while Pom<>nil do
  begin
   if ((Pom^.Cislo mod Cim)=0) and (Pom^.Cislo<>0) then Inc(KKK);
   Pom:=Pom^.Dalsi;
  end;
 DejKolikDelSez:=KKK;
end; { DejKolikDelSez }

function  DejMaxSez(Misto:PPrvekInt):Integer;
var  KKK:  Integer;
     Pom:  PPrvekInt;
begin
 if Misto=nil then begin
                    WriteLn('Vstup v "DejMaxSez" je NIL => Exit.');
                    Sound(500); Delay(500); NoSound;
                    Exit;
                   end;
 Pom:=Misto^.Dalsi;
 KKK:=Pom^.Cislo;
 while Pom<>nil do
  begin
   if Pom^.Cislo > KKK then KKK:=Pom^.Cislo;
   Pom:=Pom^.Dalsi;
  end;
 DejMaxSez:=KKK;
end; { DejMaxSez }

function  DejMinSez(Misto:PPrvekInt):Integer;
var  KKK:  Integer;
     Pom:  PPrvekInt;
begin
 if Misto=nil then begin
                    WriteLn('Vstup v "DejMinSez" je NIL => Exit.');
                    Sound(500); Delay(500); NoSound;
                    Exit;
                   end;
 Pom:=Misto^.Dalsi;
 KKK:=Pom^.Cislo;
 while Pom<>nil do
  begin
   if Pom^.Cislo < KKK then KKK:=Pom^.Cislo;
   Pom:=Pom^.Dalsi;
  end;
 DejMinSez:=KKK;
end; { DejMinSez }

procedure VymazPrvekZa(Kde:PPrvekInt);
var  P1,             { na zrušení }
     P2:  PPrvekInt; { za nim }
begin
 if Kde=nil then begin
                  WriteLn('Vstup v "VymazPrvekZa" je NIL => Exit.');
                  Sound(500); Delay(500); NoSound;
                  Exit;
                 end;
 P1:=Kde^.Dalsi;
 if P1=nil then WriteLn('Prvek na zrušení je NIL => nelze zrušit.')
           else begin
                 P2:=P1^.Dalsi;
                 Kde^.Dalsi:=P2;
                 Dispose(P1);
                end;
end; { VymazPrvekZa }

procedure VlozPrvekZa(Kde:PPrvekInt;Co:Integer);
var  Pom,               { za Novym }
     Novej:  PPrvekInt;
begin
 if Kde=nil then begin
                  WriteLn('Vstup v "VlozPrvekZa" je NIL => Exit.');
                  Sound(500); Delay(500); NoSound;
                  Exit;
                 end;
 Pom:=Kde^.Dalsi;

 New(Novej);
 Novej^.Cislo:=Co;
 Novej^.Dalsi:=Pom;

 Kde^.Dalsi:=Novej;
end; { VlozPrvekZa }

procedure ZrusDelCimSez(Misto:PPrvekInt;Cim:Integer);
var   Pom1,
      Pom2:  PPrvekInt; { rušit }
begin
 if Misto=nil then begin
                    WriteLn('Vstup v "ZrusDelCimSez" je NIL => Exit.');
                    Sound(500); Delay(500); NoSound;
                    Exit;
                 end;

 {!!!!!!! V Ý J I M K A kvůli 1. členu }
 Pom1:=Misto;
 while Pom1^.Dalsi<>nil do { Tady by se u jenom Pom1 skákalo do nekoneč.}
  begin
   Pom2:=Pom1^.Dalsi;
   if Pom2<>nil then
    if ((Pom2^.Cislo mod Cim)=0) then begin
                                       VymazPrvekZa(Pom1);
{ aby se neskákalo přes/u 1=Cis        Pom1:=Pom1^.Dalsi; }
                                      end
                                 else Pom1:=Pom2;
  end;
end; { ZrusDelCimSez }

begin { unit Pointery }

Randomize;

end. { unit Pointery }
