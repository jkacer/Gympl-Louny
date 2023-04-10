{ Created by GAS 1995 }
{
 Spočítejte a vytiskněte všechna 3-ciferná čísla,
 v nichž se žádná cifra neopakuje-všechny 3 cifry jsou různé.
}

program XXX;

uses Crt,Matika;

var I:Word;

begin
 ClrScr;
 WriteLn('Budou vypsána všechna trojciferná čísla,');
 WriteLn('která mají všechny 3 cifry různé.');
 for I:=100 to 999 do
  if CifryJenJednou(I) then Write(I,' , ');
 GoToXY(WhereX-2,WhereY);
 WriteLn('.');
 Write('==== Enter ====');
 ReadLn;
end.
