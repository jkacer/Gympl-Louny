{ Created by GAS 1995 }
unit Kombin;

interface

function Faktorial(ZCeho:Byte):LongInt;

function Variace(K,N:Byte):LongInt;
function Permutace(N:Byte):LongInt;
function Kombinace(K,N:Byte):LongInt;


implementation

function Faktorial(ZCeho:Byte):LongInt;
begin
 if (ZCeho=0) or (ZCeho=1) then Faktorial:=1
                           else Faktorial:=ZCeho*Faktorial(ZCeho-1);
end; { function Faktorial }


function Variace(K,N:Byte):LongInt;
begin
 Variace:=Faktorial(N) div Faktorial(N-K);
end; { function Variace }

function Permutace(N:Byte):LongInt;
begin
 Permutace:=Variace(N,N);
end; { function Permutace }

function Kombinace(K,N:Byte):LongInt;
begin
 Kombinace:=Faktorial(N) div (Faktorial(N-K)*Faktorial(K));
end; { function Kombinace }

begin
end.  { unit Kombin }



