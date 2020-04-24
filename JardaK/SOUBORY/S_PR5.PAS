{ Created by GAS 1996 }
program MatOt_16_5;

uses
      Crt;

var
      F1,F2:    Text;
      Z:        Char;
      Chyba:    Boolean;
begin
 ClrScr;
 {$I-}
 Assign(F1,'C:\BANKA\T1.TXT');
 Assign(F2,'C:\BANKA\K_T1.TXT');

 Reset(F1);
 if IOResult<>0 then begin
                      WriteLn('Unable to open C:\BANKA\T1.TXT');
                      Exit;
                     end;
 Rewrite(F2);
 if IOResult<>0 then begin
                      WriteLn('Unable to create C:\BANKA\K_T1.TXT');
                      Exit;
                     end;

 Chyba:=False;
 while (not(Eof(F1))) and (not(Chyba)) do
  begin
   Read(F1,Z);
   if IOResult<>0 then begin
                        Chyba:=True;
                        WriteLn('Error reading C:\BANKA\T1.TXT');
                       end
                  else begin
                        Write(F2,Z);
                        if IOResult<>0 then begin
                                             Chyba:=True;
                                             WriteLn('Error writing C:\BANKA\K_T1.TXT');
                                            end;
                        if (Z='a') then Write(Z)
                                   else Write(' ');
                       end;
   if Eoln(F1) then WriteLn;
  end; { while1 }
 Close(F1);
 Close(F2);
 ReadLn;
end.


