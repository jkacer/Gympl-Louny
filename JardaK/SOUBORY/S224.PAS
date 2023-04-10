{ Created by GAS 1995 }
program Soub224;

uses Crt,Dos,Soubory;
var Odkud1:   F_Cely;
    Odkud2:   F_Cely;
    Odkud3:   F_Cely;
    Odkud4:   F_Cely;
    Kam:      F_Cely;
    Cislo1:   Integer;
    Cislo2:   Integer;
    PomC:     Integer;
    I,J:      Integer;
    Kolik:    Word;

begin
 ClrScr;
 Assign(Odkud1,'zdroj1.cis');
 Assign(Odkud2,'zdroj2.cis');
 Assign(Odkud3,'zdroj3.cis');
 Assign(Odkud4,'zdroj4.cis');
 Assign(Kam,'vysl.cis');
 {$I-}
 ReWrite(Kam);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k VYSL.CIS !!!');
                      Exit;
                     end;
 Reset(Odkud1);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k ZDROJ1.CIS !!!');
                      Exit;
                     end;
 Reset(Odkud2);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k ZDROJ2.CIS !!!');
                      Exit;
                     end;
 Reset(Odkud3);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k ZDROJ3.CIS !!!');
                      Exit;
                     end;
 Reset(Odkud4);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k ZDROJ4.CIS !!!');
                      Exit;
                     end;
 {$I+}

 Kolik:=0;
 while not(Eof(Odkud1)) do
  begin
   Read(Odkud1,Cislo1);
   Write(Kam,Cislo1);
   Inc(Kolik);
  end;
 while not(Eof(Odkud2)) do
  begin
   Read(Odkud2,Cislo1);
   Write(Kam,Cislo1);
   Inc(Kolik);
  end;
 while not(Eof(Odkud3)) do
  begin
   Read(Odkud3,Cislo1);
   Write(Kam,Cislo1);
   Inc(Kolik);
  end;
 while not(Eof(Odkud4)) do
  begin
   Read(Odkud4,Cislo1);
   Write(Kam,Cislo1);
   Inc(Kolik);
  end;

 Close(Odkud1);
 Close(Odkud2);
 Close(Odkud3);
 Close(Odkud4);
 Close(Kam);

 Reset(Kam);

 { Pomalu , ale jistě ! }
 { BubbleSort v souboru }

 for I:=Kolik downto 1 do
  for J:=2 to I do
   begin
    Seek(Kam,J-2);    { Seek zmenšuje o 1 }
    Read(Kam,Cislo1);
    Seek(Kam,J-1);
    Read(Kam,Cislo2); { Seek zmenšuje o 1 }
    if Cislo1>Cislo2 then begin
                           Seek(Kam,J-2);
                           Write(Kam,Cislo2);
                           Seek(Kam,J-1);
                           Write(Kam,Cislo1);
                          end;
   end;

 Close(Kam);

 Reset(Kam);
 Reset(Odkud1);
 Reset(Odkud2);
 Reset(Odkud3);
 Reset(Odkud4);

 WriteLn('Zdrojový soubor č.1:');
 while not(Eof(Odkud1)) do
  begin
   Read(Odkud1,Cislo1);
   if Eof(Odkud1) then Write(Cislo1,' . ')
                  else Write(Cislo1,' , ');
  end;
 WriteLn;
 WriteLn('Zdrojový soubor č.2:');
 while not(Eof(Odkud2)) do
  begin
   Read(Odkud2,Cislo2);
   if Eof(Odkud2) then Write(Cislo2,' . ')
                  else Write(Cislo2,' , ');
  end;
 WriteLn;
 WriteLn('Zdrojový soubor č.3:');
 while not(Eof(Odkud3)) do
  begin
   Read(Odkud3,Cislo1);
   if Eof(Odkud3) then Write(Cislo1,' . ')
                  else Write(Cislo1,' , ');
  end;
 WriteLn;
 WriteLn('Zdrojový soubor č.4:');
 while not(Eof(Odkud4)) do
  begin
   Read(Odkud4,Cislo2);
   if Eof(Odkud2) then Write(Cislo2,' . ')
                  else Write(Cislo2,' , ');
  end;
 WriteLn;
 WriteLn('Výsledný soubor :');
 while not(Eof(Kam)) do
  begin
   Read(Kam,Cislo1);
   if Eof(Kam) then Write(Cislo1,' . ')
               else Write(Cislo1,' , ');
  end;
 WriteLn;
 ReadLn;
end.




