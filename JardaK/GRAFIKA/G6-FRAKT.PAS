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
    AX,AY,
    BX,BY,
    CX,CY:   Word;


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
 N:=DejRozsah('Kolik vnoýen¡ ?',1,8,X,Y);

 AX:=0;
 AY:=0;
 BX:=X div 2;
 BY:=Y;
 CX:=X;
 CY:=0;

 SetColor(Red);
 SetLineStyle(SolidLn,0,ThickWidth);
 MoveTo(AX,AY);
 LineTo(BX,BY);
 LineTo(CX,CY);
 LineTo(AX,AY);
 ReadLn;

 SetLineStyle(SolidLn,0,NormWidth);
 FrTrojuhelnik(N,AX,AY,BX,BY,CX,CY);

 Sound(1000); Delay(100); NoSound;
 ReadLn;
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1995.');
end.
