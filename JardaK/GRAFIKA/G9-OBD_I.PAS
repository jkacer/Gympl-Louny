program XXX;
{

===========================================================================
==========                                                       ==========
==========              Gama Software 1995                       ==========
==========                                                       ==========
===========================================================================

}

uses Crt,Graph,Grafika;


var GD,GM:   Integer;
    X,Y:     Integer;
    N:       Byte;
    AX,AY:   Word;


begin
 ClrScr;
 Randomize;
 DetectGraph(GD,GM);
 InitGraph(GD,GM,'');
 if GraphResult<>0 then begin
                         WriteLn('Chyba v inicializaci grafiky !');
                         Halt(1);
                        end;
 X:=GetMaxX;
 Y:=GetMaxY;
 N:=DejRozsah('Kolik vno�en� ?',1,20,X,Y);

 AX:=10;
 AY:=10;

 SetColor(Red);
 SetLineStyle(SolidLn,0,ThickWidth);
 MoveTo(AX,AY);
 LineTo(X-AX,AY);
 LineTo(X-AX,Y-AY);
 LineTo(AX,Y-AY);
 LineTo(AX,AY);
 ReadLn;

 SetLineStyle(SolidLn,0,NormWidth);
 FrObdelnikJednoduch_Iterace(N+1,AX,AY);

 Sound(1000); Delay(100); NoSound;
 ReadLn;
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1995.');
end.
