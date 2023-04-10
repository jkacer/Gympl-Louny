{ Created by GAS 1995 }

unit Vytazky;

interface

uses Crt,Dos,Objects,GasCrt;

const
      Ch_Syn = 'Chyba v synchronizaci seznamu !';
      Ch_OtS = 'Chyba při otevírání souboru ';
      Ch_Nil = ' je NIL,ale nic se neděje.';

type
     PPrvekChar = ^TPrvekChar;
     TPrvekChar =  record
                    Znak:  Char;
                    Kde:   Word;
                    Prev:  PPrvekChar;
                    Next:  PPrvekChar;
                   end;


     PCharSeznam = ^TCharSeznam;
     TCharSeznam =  object(TObject)

         { PRIVATE } private { Z venku nepřístupné !!! }

                     Hlava:     PPrvekChar;
                     Pata:      PPrvekChar;
                     Curr:      PPrvekChar;

                     Count:     Word;
                     Poz:       Word;
                     Jmeno:     PathStr;

                     Min:       Byte;
                     Max:       Byte;

         { PUBLIC }  public  { Z venku je přece musíme volat !!! }

                     constructor Init(Jm:PathStr;MinC,MaxC:Byte);
                     destructor  Done;                            virtual;

                     function    Check:Boolean;
                     procedure   Hop(OKolik:Word;Dopredu:Boolean);{skočí OKol}
                     function    MakeCur(Kde:Word):Boolean;{udělá akt.pol.Kde}
                     function    At(Kde:Word):Char;    {znak na pozici Kde   }
                     function    GetMin:Byte;          {vrátí min. pro výběr }
                     function    GetMax:Byte;          {vrátí max. pro výběr }
                     function    GetPocet:Word;        {vrátí počet položek  }
                     function    GetJmeno:PathStr;     {vrátí jméno souboru  }
                     function    CurNo:Word;           {aktuální položka     }
                     function    AtCurNo:Char;         {znak na aktual.polož.}

                     procedure   Tisk(Hlavicka:String);{vytiskne sez. s hlav.}
                     procedure   Zapis(Kam:Word;Co:Char);{zapíše Co na poz.Ka}
                     procedure   Prehod;               {přehodí všechny prvky}

                    end; { object TCharSeznam }


implementation


constructor TCharSeznam.Init(Jm:PathStr;MinC,MaxC:Byte);
var
     F:      Text;
     Pom1,
     Pom2:   PPrvekChar;
     I:      Word;

     S:      String;
     PZ:     Char;
     J:      Byte;
begin
 inherited Init;
 Min:=MinC; { OBJ }
 Max:=MaxC; { OBJ }
 Jmeno:=Jm; { OBJ }
 Count:=0;  { OBJ }
 Poz:=0;    { OBJ }
 Hlava:=nil;{ OBJ }
 Pata:=nil; { OBJ }
 Curr:=nil; { OBJ }

 Assign(F,Jm);
 {$I-}
 Reset(F);
 if IOResult<>0 then begin
                      WriteLn('"Constuctor TCharSeznam.Init" :');
                      WriteLn(Ch_OtS,Jm,' !!!');
                      WriteLn('Nelze načíst data do seznamu => Exit.');
                      Exit;
                     end;
 {$I+}

 { OBJ }
 New(Hlava);
 Hlava^.Znak:=#0;
 Hlava^.Kde :=0;
 Hlava^.Prev:=nil; { navždy }
 Hlava^.Next:=nil;

 { OBJ }
 New(Pata);
 Pata^.Znak:=#0;
 Pata^.Kde :=0;
 Pata^.Prev:=Hlava;
 Pata^.Next:=nil;  { navždy }

 Hlava^.Next:=Pata; { OBJ }

 I:=0;
 Pom1:=Hlava;

 while not(Eof(F)) do
  begin
   ReadLn(F,S);
   for J:=1 to Length(S) do
    begin
     PZ:=S[J];
     if (Ord(PZ)>=MinC) and (Ord(PZ)<=MaxC) then
          begin
           New(Pom2);
           Inc(I);
           Pom2^.Znak:=PZ;
           Pom2^.Kde:=I;

           Pom1^.Next:=Pom2;
           Pom2^.Prev:=Pom1;
           Pom2^.Next:=Pata;

           Pom1:=Pom2;

           Inc(Count); { OBJ }
           Poz:=1;     { OBJ }
          end; { end if }
    end; { end for }
  end; { end while }

 Close(F);
 if Count>0 then begin
                  Curr:=Hlava^.Next;
                  Poz:=1;
                  WriteLn('Vytvořen seznam s ',Count,' prvky.');
                 end
            else begin
                  Curr:=nil;
                  Poz:=0;
                  WriteLn('Nenalezen ani jeden prvek.');
                 end;
end;  { constructor TCharSeznam.Init }


destructor TCharSeznam.Done;
var
     I:      Word;
     Pom:    PPrvekChar;
begin
 for I:=1 to Count do
  begin
   Pom:=Hlava^.Next;
   Hlava^.Next:=Pom^.Next;
   Pom^.Next^.Prev:=Hlava;
   if Pom<>nil then Dispose(Pom);
   Dec(Count);
  end;
 if Count<>0 then WriteLn('Něco nesouhlasí !');
 Poz:=0;
 if Pata<>nil then Dispose(Pata)
              else begin
                    WriteLn('Chyba v "Destructor TCharSeznam.Done" !!!');
                    WriteLn('Pata',Ch_Nil);
                   end;
 if Hlava<>nil then Dispose(Hlava)
              else begin
                    WriteLn('Chyba v "Destructor TCharSeznam.Done" !!!');
                    WriteLn('Hlava',Ch_Nil);
                   end;
 inherited Done;
 WriteLn('Seznam zrušen.');
end; { destructor TCharSeznam.Done }


function TCharSeznam.Check:Boolean;
begin
 if Count<1 then Check:=True
            else if Poz=Curr^.Kde then Check:=True
                                  else Check:=False;
end; { function TCharSeznam.Check }


procedure TCharSeznam.Hop(OKolik:Word;Dopredu:Boolean);
var
     I:   Word;
     Pom: PPrvekChar;
begin
 Pom:=Curr;
 if Dopredu then begin
                  if Poz+OKolik>Count then OKolik:=Count-Poz;
                  for I:=1 to OKolik do
                   if Pom^.Next=nil then begin
                                          WriteLn('Chyba v "TCharSeznam.Hop" !!!');
                                          Exit;
                                         end
                                    else begin
                                          Pom:=Pom^.Next;
                                          Inc(Poz);
                                         end;
                 end { Dopredu }
            else begin
                  if Poz-OKolik<1 then OKolik:=Poz-1;
                  for I:=1 to OKolik do
                   if Pom^.Prev=nil then begin
                                          WriteLn('Chyba v "TCharSeznam.Hop" !!!');
                                          Exit;
                                         end
                                    else begin
                                          Pom:=Pom^.Prev;
                                          Dec(Poz);
                                         end;
                 end; { Dopredu }
 Curr:=Pom;
 if not(Check) then WriteLn(Ch_Syn);
end; { procedure TCharSeznam.Hop }


function TCharSeznam.MakeCur(Kde:Word):Boolean;
var
     I:Word;
begin
 MakeCur:=False;
 if Count<1 then Exit;
 if (Kde<1) or (Kde>Count) then begin
                                 WriteLn('"TCharSeznam.MakeCur" voláno se špatným parametrem !!!');
                                 Exit;
                                end;
 if Kde<Poz then begin
                  I:=Poz-Kde;
                  Hop(I,False);
                 end
            else begin
                  I:=Kde-Poz;
                  Hop(I,True);
                 end;
 if Check then MakeCur:=True
          else WriteLn(Ch_Syn);
end; { procedure MakeCur }


function TCharSeznam.At(Kde:Word):Char;
begin
 if MakeCur(Kde) then At:=Curr^.Znak
                 else At:=#0;
end; { function TCharSeznam.At }


function TCharSeznam.GetMin:Byte;
begin
 GetMin:=Min;
end; { function TCharSeznam.GetMin }


function TCharSeznam.GetMax:Byte;
begin
 GetMax:=Max;
end; { function TCharSeznam.GetMax }


function TCharSeznam.GetPocet:Word;
begin
 GetPocet:=Count;
end; { function TCharSeznam.GetPocet }


function TCharSeznam.GetJmeno:PathStr;
begin
 GetJmeno:=Jmeno;
end; { function TCharSeznam.GetJmeno }


function TCharSeznam.CurNo:Word;
begin
 CurNo:=Poz;
end; { function TCharSeznam.CurNo }


function TCharSeznam.AtCurNo:Char;
begin
 AtCurNo:=Curr^.Znak;
end; { function TCharSeznam.AtCurNo }


procedure TCharSeznam.Tisk(Hlavicka:String);
var
     I:  Word;
begin
 Pis(Hlavicka,NeMez,JoPip);
 for I:=1 to Count do
  if I<Count then Write(At(I),' , ')
             else Write(At(I),' .');
 WriteLn;
end; { procedure TCharSeznam.Tisk }

procedure TCharSeznam.Zapis(Kam:Word;Co:Char);
begin
 if MakeCur(Kam) then Curr^.Znak:=Co
                 else WriteLn('Chyba při zápisu znaku "',Co,'" na pozici ',Kam,'.');
end; { procedure TCharSeznam.Zapis }


procedure TCharSeznam.Prehod;
var
     I:    Word;
     Z:    Char;
begin
 for I:=1 to (Count div 2) do
  begin
   Z:=At(I);
   Zapis(I,At(Count+1-I));
   Zapis(Count+1-I,Z);
   if not(Check) then WriteLn(Ch_Syn);
  end;
end; { procedure TCharSeznam.Prehod }


begin { unit Vytazky }
end.  { unit Vytazky }


