{
 BOOLEAN - p��klad 02
}

{
 Ur�ete hodnoty:
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

 WriteLn('Succ (True) = ',Succ (True),'  ???' ); { Nem�lo by b�t definov�no }
 WriteLn('Succ (False)= ',Succ (False) );

 WriteLn('Pred (True) = ',Pred (True)  );
 WriteLn('Pred (False)= ',Pred (False),' ???' ); { Nem�lo by b�t definov�no }

 ReadLn;
end.


