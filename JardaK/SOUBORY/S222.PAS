{ Created by GAS 1995 }
program Soub222;

{
*******************************************************************

 V souboru SOUB2.CIS nesmějí být záporná čísla
 kvůli závěr. výpisu !

*******************************************************************
}

uses Crt,Dos,Soubory;
const Jedna:Integer = -1;
var PomS:    F_Cely;
    OdkudS:  F_Cely;
    Kam1:    F_Cely;
    Kam2:    F_Cely;
    Cislo1:  Integer;
    Cislo2:  Integer;
    Lichy:   Boolean;
    JeTam:   Boolean;

begin
 ClrScr;
 Assign(PomS,'swapfile.!!!');
 Assign(OdkudS,'soub2.cis');
 Assign(Kam1,'posl1.cis');
 Assign(Kam2,'posl2.cis');
 {$I-}
 ReWrite(PomS);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k pomocnému souboru !!!');
                      Exit;
                     end;
 Reset(OdkudS);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB2.CIS !!!');
                      Exit;
                     end;
 ReWrite(Kam1);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k POSL1.CIS !!!');
                      Exit;
                     end;
 ReWrite(Kam2);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k POSL2.CIS !!!');
                      Exit;
                     end;
 {$I+}

 Lichy:=True;
 JeTam:=False;
 Read(OdkudS,Cislo1);
 Write(PomS,Cislo1);

 while not(Eof(OdkudS)) do
  begin
   Read(OdkudS,Cislo2);
   if Cislo2>=Cislo1 then begin
                           Write(PomS,Cislo2);
                           Cislo1:=Cislo2;
                           JeTam:=True;
                          end
                     else begin
                           if JeTam then begin
                                          if Lichy then begin
                                                         KopniPosloupnost(PomS,Kam1);
                                                         Write(Kam1,Jedna);
                                                        end
                                                   else begin
                                                         KopniPosloupnost(PomS,Kam2);
                                                         Write(Kam2,Jedna);
                                                        end;
                                          Lichy:=not(Lichy);
                                          JeTam:=False;
                                         end;
                           VymazPosloupnost(PomS);
                           Write(PomS,Cislo2);
                           Cislo1:=Cislo2;
                          end;
  end;
 if JeTam then begin
                if Lichy then KopniPosloupnost(PomS,Kam1)
                         else KopniPosloupnost(PomS,Kam2);
                Lichy:=not(Lichy);
                JeTam:=False;
               end;

 Close(OdkudS);
 Close(PomS);
 Erase(PomS);
 Close(Kam1);
 Close(Kam2);
 WriteLn('OK');
 ReadLn;
 Reset(Kam1);
 Reset(Kam2);
 WriteLn('Cílový soubor č.1:');
 while not(Eof(Kam1)) do
  begin
   Read(Kam1,Cislo1);
   if Cislo1=-1 then if not(Eof(Kam1)) then Write(' ■ ,')
                                       else Write(' ■ .')
                else Write(Cislo1,' , ');
  end;
 WriteLn;
 WriteLn('Cílový soubor č.2:');
 while not(Eof(Kam2)) do
  begin
   Read(Kam2,Cislo1);
   if Cislo1=-1 then if not(Eof(Kam2)) then Write(' ■ ,')
                                       else Write(' ■ .')
                else Write(Cislo1,' , ');
  end;
 WriteLn;
 ReadLn;
end.




