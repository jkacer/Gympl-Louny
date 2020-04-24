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
    CX,CY,
    DX,DY:   Word;


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
 N:=DejRozsah('Kolik vnoýen¡ ?',1,6,X,Y);

 AX:=10;
 AY:=10;
 BX:=X-10;
 BY:=10;
 CX:=X-10;
 CY:=Y-10;
 DX:=10;
 DY:=Y-10;

 SetColor(Red);
 SetLineStyle(SolidLn,0,ThickWidth);
 MoveTo(AX,AY);
 LineTo(BX,BY);
 LineTo(CX,CY);
 LineTo(DX,DY);
 LineTo(AX,AY);
 ReadLn;

 SetLineStyle(SolidLn,0,NormWidth);
 FrObdelnik(N,AX,AY,BX,BY,CX,CY,DX,DY);

 Sound(1000); Delay(100); NoSound;
 ReadLn;
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1995.');
end.
