program XXX;
uses Crt,Soubory;

var S:      String;
    Poc,Kon:Word;
    JeTam:  Boolean;
    Slovo:  String;

begin
 S:=' .  X,,,X.X , KKK. .OOO';
 JeTam:=True;
 repeat
  DejSlovoPlus(S,Poc,Kon,JeTam);
  WriteLn;
  WriteLn('Retezec :',S,'.');
  WriteLn('Pocatek :',Poc,'.');
  WriteLn('Konec   :',Kon,'.');
  WriteLn('Je tam ?:',JeTam,'.');
  Slovo:=Copy(S,Poc,Kon+1-Poc);
  WriteLn('Slovo   :',Slovo,'.');
  Delete(S,1,Kon);
  WriteLn('Po ukousnuti:',S,'.');
  ReadLn;
 until not(JeTam);
end.


