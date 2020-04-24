{ Created by Gas 1995 }
{
 Napiçte program, kt. pýeŸte ze vstup. txt souboru zadanou posloupnost
 znak… a vytvoý¡ 2 spojov‚ seznamy znak…. Prvn¡ bude obs. vçechna velk 
 p¡smena angl. abecedy ve stejn‚m poýad¡, jako byla zad na.
 Do druh‚ho seznamu se ulo§¡ vçechny Ÿ¡slice v opaŸn‚m poýad¡,
 ne§ byly zad ny.
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
 Pis('Budou vytvoýeny 2 seznamy znak… ze souboru '+JmenoS+'.',NeMez,NePip);
 Pis('1.seznam: velk  p¡smena.',                             NeMez,NePip);
 Pis('2.seznam: Ÿ¡slice.',                                   NeMez,NePip);
 Pis('2.seznam bude pot‚ pýehozen od zaŸ tku do konce.',     NeMez,NePip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Pismena:=New(PCharSeznam,Init(JmenoS,65,90));
 Cisla  :=New(PCharSeznam,Init(JmenoS,48,57));
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');

 Pismena^.Tisk('Seznam p¡smen:');
 Cisla^.Tisk('Seznam Ÿ¡sel:');
 WriteLn('==== Enter ====');
 ReadLn;

 Pis('HraniŸn¡ znaky obou seznam…,poŸty polo§ek a n zvy soubor…:',NeMez,NePip);
 Pis('Prvn¡: MIN="'+Chr(Pismena^.GetMin)+'" , MAX="'+Chr(Pismena^.GetMax)+'".',NeMez,NePip);
 Pis('Druhy: MIN="'+Chr(Cisla^.GetMin)  +'" , MAX="'+Chr(Cisla^.GetMax)  +'".',NeMez,NePip);
 Str(Pismena^.GetPocet,S);
 Pis('Prvn¡: '+S+' polo§ek.',NeMez,NePip);
 Str(Cisla^.GetPocet,S);
 Pis('Druhì: '+S+' polo§ek.',NeMez,NePip);
 Pis('Prvn¡ je nata§en ze souboru '+Pismena^.GetJmeno+'.',NeMez,NePip);
 Pis('Druhì je nata§en ze souboru '+Cisla^.GetJmeno+'.',NeMez,NePip);
 Cisla^.Prehod;
 Cisla^.Tisk('Seznam Ÿ¡sel po pýehozen¡:');

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




