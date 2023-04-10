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
 N:=DejRozsah('Kolik vnoření ?',1,5,X,Y);

 AX:=0;
 AY:=Y;
 BX:=X;
 BY:=Y;
 CX:=X div 2;
 CY:=0;

 SetColor(Red);
 SetLineStyle(SolidLn,0,ThickWidth);
 MoveTo(AX,AY);
 LineTo(BX,BY);
 LineTo(CX,CY);
 LineTo(AX,AY);
 ReadLn;

 SetLineStyle(SolidLn,0,NormWidth);
 FrTrojuhelnik_Mitsubishi(N,AX,AY,BX,BY,CX,CY);

 Sound(1000); Delay(100); NoSound;
 ReadLn;
 CloseGraph;
 ClrScr;
 WriteLn(' (c) Gama Software 1995.');
end.
