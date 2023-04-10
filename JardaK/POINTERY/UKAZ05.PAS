{ Created by Gas 1995 }
{
 Napište program, kt. přečte ze vstup. txt souboru zadanou posloupnost
 znaků a vytvoří 2 spojové seznamy znaků. První bude obs. všechna velká
 písmena angl. abecedy ve stejném pořadí, jako byla zadána.
 Do druhého seznamu se uloží všechny číslice v opačném pořadí,
 než byly zadány.
}
program XXX;

uses Crt,GasCrt,Vytazky;

const
      JmenoS = 'VYTAHNI.TXT';

var
     Pismena:  PCharSeznam;
     Cisla:    PCharSeznam;
     S:        String;
begin
 Desktop(Blue,LightGray,#176);
 Ramecek(3,3,78,23,'GAS Pointer & Object Demo',Blue,White,Yellow,#32);
 Window(5,4,76,22);
 Pis('Budou vytvořeny 2 seznamy znaků ze souboru '+JmenoS+'.',NeMez,NePip);
 Pis('1.seznam: velká písmena.',                             NeMez,NePip);
 Pis('2.seznam: číslice.',                                   NeMez,NePip);
 Pis('2.seznam bude poté přehozen od začátku do konce.',     NeMez,NePip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Pismena:=New(PCharSeznam,Init(JmenoS,65,90));
 Cisla  :=New(PCharSeznam,Init(JmenoS,48,57));
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');

 Pismena^.Tisk('Seznam písmen:');
 Cisla^.Tisk('Seznam čísel:');
 WriteLn('==== Enter ====');
 ReadLn;

 Pis('Hraniční znaky obou seznamů,počty položek a názvy souborů:',NeMez,NePip);
 Pis('První: MIN="'+Chr(Pismena^.GetMin)+'" , MAX="'+Chr(Pismena^.GetMax)+'".',NeMez,NePip);
 Pis('Druhy: MIN="'+Chr(Cisla^.GetMin)  +'" , MAX="'+Chr(Cisla^.GetMax)  +'".',NeMez,NePip);
 Str(Pismena^.GetPocet,S);
 Pis('První: '+S+' položek.',NeMez,NePip);
 Str(Cisla^.GetPocet,S);
 Pis('Druhý: '+S+' položek.',NeMez,NePip);
 Pis('První je natažen ze souboru '+Pismena^.GetJmeno+'.',NeMez,NePip);
 Pis('Druhý je natažen ze souboru '+Cisla^.GetJmeno+'.',NeMez,NePip);
 Cisla^.Prehod;
 Cisla^.Tisk('Seznam čísel po přehození:');

 Dispose(Pismena,Done);
 Dispose(Cisla,Done);

 WriteLn('==== Enter ====');
 ReadLn;
 Window(1,1,80,25);
 TextColor(White);
 TextBackGround(Black);
 ClrScr;
 WriteLn('That''s all falks.');
end.




