{ Created by GAS 1995 }
program Soub215;
uses Crt,Dos,Soubory;
var F:       Text;
    S:       String;
    Poc:     Word;
    Poz:     Word;
    K:       Integer;
    Znak:    Char;
    Slovo:   String;
    PomStr:  String;
    Zac,Kon: Word;
    Je:      Boolean;

begin
 ClrScr;
 Assign(F,'soub1.txt');
 {$I-}
 Reset(F);
 if IOResult<>0 then begin
                      WriteLn('Chyba v přístupu k SOUB1.TXT !!!');
                      Exit;
                     end;
 {$I+}
 K:=0;
 while not(Eof(F)) do
  begin
   ReadLn(F,S);
   while Pos('.',S)>0 do
    begin
     Poz:=Pos('.',S);
     Inc(K);
     Delete(S,1,Poz);
    end;
  end;
 WriteLn('V souboru je ',K,' vět.');

 Close(F);
 Reset(F);


 Poz:=0;
 Slovo:='';
 PomStr:='';
 while not(Eof(F)) do
  begin
   Read(F,Znak);
   case Znak of
    ' ':begin
         if Length(PomStr)>Length(Slovo) then begin
                                               Slovo:=PomStr;
                                               PomStr:='';
                                              end;
        end;
    #13:begin
         if Length(PomStr)>Length(Slovo) then begin
                                               Slovo:=PomStr;
                                               PomStr:='';
                                              end;
        end;
    #10:begin
         if Length(PomStr)>Length(Slovo) then begin
                                               Slovo:=PomStr;
                                               PomStr:='';
                                              end;
        end;
    '.':begin
         Inc(Poz);
         if Length(PomStr)>Length(Slovo) then Slovo:=PomStr;
         WriteLn('Nejdelší slovo ',Poz,'. věty :',Slovo);
         Slovo:='';
         PomStr:='';
        end;
    else PomStr:=PomStr+Znak;
   end;

  end;

 Close(F);
 ReadLn;
end.




