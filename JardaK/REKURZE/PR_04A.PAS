{
 Written by Gama Software 1996
}

program XXX;

uses
      Rekurze,Graph,Crt;

var
     Levelu: Byte;
begin
 ClrScr;
 Write('Kolik vnoýen¡ ? <1,256> ');
 ReadLn(Levelu);
 if Graph_Init = g_Chyba then begin
                               WriteLn('Exit');
                               Exit;
                              end;
 SetBkColor(White);
 ClearDevice;
 Rieger_Kob1(0,0,GetMaxY,GetMaxY,Levelu);

 CloseGraph;
 WriteLn('(c) Gama Software 1996');
end.


