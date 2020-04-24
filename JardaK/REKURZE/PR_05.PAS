{
 Written by Gama Software 1996
}

program XXX;

uses  Crt;

var
      PocetKr:  Byte;
      Presunu:  Word;

procedure MoveRing(Odkud,Kam:Byte);
begin
 WriteLn('Pýesuå disk z ### ',Odkud,' ### na ### ',Kam,' ###.');
 Inc(Presunu);
 ReadLn;
end;

procedure MoveTower(Kolik:Byte;Odkud,Kam,Pres:Byte);
begin
 if Kolik>0 then begin
                  MoveTower(Kolik-1,Odkud,Pres,Kam);
                  MoveRing(Odkud,Kam);
                  MoveTower(Kolik-1,Pres,Kam,Odkud);
                 end;
end; { procedure MoveTower }


begin
 ClrScr;
 Presunu:=0;
 WriteLn('Hanojsk‚ vØ§e');
 Write('Kolik disk… ? Max. 255 ');
 ReadLn(PocetKr);

 MoveTower(PocetKr,1,3,2);

 WriteLn('Celkem provedeno ',Presunu,' pýesun… disk….');
 WriteLn('Hotovo.');
 ReadLn;
 WriteLn('(c) Gama Software 1996');
end.
