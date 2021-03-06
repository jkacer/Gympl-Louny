{ Created by Gas 1995 }
{
 Napi�te program, kt. p�e�te ze vstup. txt souboru zadanou posloupnost
 znak� a vytvo�� 2 spojov� seznamy znak�. Prvn� bude obs. v�echna velk�
 p�smena angl. abecedy ve stejn�m po�ad�, jako byla zad�na.
 Do druh�ho seznamu se ulo�� v�echny ��slice v opa�n�m po�ad�,
 ne� byly zad�ny.
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
 Pis('Budou vytvo�eny 2 seznamy znak� ze souboru '+JmenoS+'.',NeMez,NePip);
 Pis('1.seznam: velk� p�smena.',                             NeMez,NePip);
 Pis('2.seznam: ��slice.',                                   NeMez,NePip);
 Pis('2.seznam bude pot� p�ehozen od za��tku do konce.',     NeMez,NePip);
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
 Pismena:=New(PCharSeznam,Init(JmenoS,65,90));
 Cisla  :=New(PCharSeznam,Init(JmenoS,48,57));
 WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');

 Pismena^.Tisk('Seznam p�smen:');
 Cisla^.Tisk('Seznam ��sel:');
 WriteLn('==== Enter ====');
 ReadLn;

 Pis('Hrani�n� znaky obou seznam�,po�ty polo�ek a n�zvy soubor�:',NeMez,NePip);
 Pis('Prvn�: MIN="'+Chr(Pismena^.GetMin)+'" , MAX="'+Chr(Pismena^.GetMax)+'".',NeMez,NePip);
 Pis('Druhy: MIN="'+Chr(Cisla^.GetMin)  +'" , MAX="'+Chr(Cisla^.GetMax)  +'".',NeMez,NePip);
 Str(Pismena^.GetPocet,S);
 Pis('Prvn�: '+S+' polo�ek.',NeMez,NePip);
 Str(Cisla^.GetPocet,S);
 Pis('Druh�: '+S+' polo�ek.',NeMez,NePip);
 Pis('Prvn� je nata�en ze souboru '+Pismena^.GetJmeno+'.',NeMez,NePip);
 Pis('Druh� je nata�en ze souboru '+Cisla^.GetJmeno+'.',NeMez,NePip);
 Cisla^.Prehod;
 Cisla^.Tisk('Seznam ��sel po p�ehozen�:');

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




