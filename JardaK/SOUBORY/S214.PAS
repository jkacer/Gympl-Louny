{ Created by GAS 1995 }
program Soub214;
uses Crt,Dos,Soubory;
var F:       Text;
    S:       String;
    Poc:     Word;
    Poz:     Word;
    K:       Integer;
    NejV,
    NejM:    Integer;
    Znak:    Char;
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

 NejV:=0;
 NejM:=32767;

 Poc:=0;
 while not(Eof(F)) do
  begin
   Read(F,Znak);
   case Znak of
    ' ':begin
        end;
    #13:begin
        end;
    #10:begin
        end;
    '.':begin
         if Poc>NejV then NejV:=Poc;
         if Poc<NejM then NejM:=Poc;
         Poc:=0;
        end;
    else Inc(Poc);
   end;
  end;

 WriteLn('Nejkratší věta : ',NejM,' pismen .');
 WriteLn('Nejdelší  věta : ',NejV,' pismen .');
 Close(F);
 ReadLn;
end.
