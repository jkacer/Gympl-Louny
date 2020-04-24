{
 BOOLEAN - pý¡klad 02
}

{
 UrŸete hodnoty:
   Ord (True)
   Ord (False)

   Succ (True)
   Succ (False)

   Pred (True)
   Pred (False)

}

program XXX;

uses Crt;

begin
 ClrScr;

 WriteLn('Ord (True)  = ',Ord (True)   );
 WriteLn('Ord (False) = ',Ord (False)  );

 WriteLn('Succ (True) = ',Succ (True),'  ???' ); { NemØlo by bìt definov no }
 WriteLn('Succ (False)= ',Succ (False) );

 WriteLn('Pred (True) = ',Pred (True)  );
 WriteLn('Pred (False)= ',Pred (False),' ???' ); { NemØlo by bìt definov no }

 ReadLn;
end.


