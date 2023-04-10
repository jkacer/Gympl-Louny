{
 BOOLEAN - příklad 02
}

{
 Určete hodnoty:
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

 WriteLn('Succ (True) = ',Succ (True),'  ???' ); { Nemělo by být definováno }
 WriteLn('Succ (False)= ',Succ (False) );

 WriteLn('Pred (True) = ',Pred (True)  );
 WriteLn('Pred (False)= ',Pred (False),' ???' ); { Nemělo by být definováno }

 ReadLn;
end.


