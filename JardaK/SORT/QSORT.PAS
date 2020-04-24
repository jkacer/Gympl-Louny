program QSort;

{$R-,S-}
uses Crt;

const
      Max = 100;

type
      List = array[1..Max] of Integer;

var
      Data: List;
      I:    Integer;

procedure QuickSort(var A:List;Lo,Hi:Integer);

       {*************************************}
       procedure Sort(L,R:Integer);
       var
             I,J,X,Y: Integer;
       begin
        I:=L;
        J:=R;
        X:=A[(L+R) div 2];
        repeat

         while A[I]<X do
          I:=I+1;

         while X<A[J] do
          J:=J-1;

         if I<=J then begin
                       Y:=A[I];       { prohozen¡ }
                       A[I]:=A[J];
                       A[J]:=Y;

                       I:=I+1;
                       J:=J-1;
                      end;
        until I>J;
        if L<J then Sort(L,J);
        if I<R then Sort(I,R);
       end;
       {*************************************}

begin {quicksort};
 Sort(Lo,Hi);
end;

begin {qsort}
 Randomize;
 for I:=1 to Max do
  Data[I]:=Random(30000);
 WriteLn;

 Write('Tý¡d¡m...');
 QuickSort(Data,1,Max);
 WriteLn;
 for I:=1 to Max do
  Write(Data[i]:8);
 ReadLn;
end.
