{ Created by GAS 1995 }
program Soub223;

uses Crt,Dos,Soubory;
var Odkud1:   F_Cely;
    Odkud2:   F_Cely;
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
 Assign(Kam,'vysl.cis');
 {$I-}
 ReWrite(Kam);
 if IOResult<>0 then begin
                      WriteLn('Chyba v p��stupu k VYSL.CIS !!!');
                      Exit;
                     end;
 Reset(Odkud1);
 if IOResult<>0 then begin
                      WriteLn('Chyba v p��stupu k ZDROJ1.CIS !!!');
                      Exit;
                     end;
 Reset(Odkud2);
 if IOResult<>0 then begin
                      WriteLn('Chyba v p��stupu k ZDROJ2.CIS !!!');
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

 Close(Odkud1);
 Close(Odkud2);
 Close(Kam);

 Reset(Kam);

 { Pomalu , ale jist� ! }
 { BubbleSort v souboru }

 for I:=Kolik downto 1 do
  for J:=2 to I do
   begin
    Seek(Kam,J-2);    { Seek zmen�uje o 1 }
    Read(Kam,Cislo1);
    Seek(Kam,J-1);
    Read(Kam,Cislo2); { Seek zmen�uje o 1 }
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

 WriteLn('Zdrojov� soubor �.1:');
 while not(Eof(Odkud1)) do
  begin
   Read(Odkud1,Cislo1);
   if Eof(Odkud1) then Write(Cislo1,' . ')
                  else Write(Cislo1,' , ');
  end;
 WriteLn;
 WriteLn('Zdrojov� soubor �.2:');
 while not(Eof(Odkud2)) do
  begin
   Read(Odkud2,Cislo2);
   if Eof(Odkud2) then Write(Cislo2,' . ')
                  else Write(Cislo2,' , ');
  end;
 WriteLn;
 WriteLn('V�sledn� soubor :');
 while not(Eof(Kam)) do
  begin
   Read(Kam,Cislo1);
   if Eof(Kam) then Write(Cislo1,' . ')
               else Write(Cislo1,' , ');
  end;
 WriteLn;
 ReadLn;
end.




