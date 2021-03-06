
 Celo��seln� typy
 ������������������������������
Turbo Pascal obsahuje p�t p�eddefinovan�ch celo��seln�ch typ�. Ka�d� typ
popisuje ur�itou podmno�inu mno�iny cel�ch ��sel.

  Typ      � Rozsah                  � Form�t
 ���������ͳ������������������������ͳ������������������������
  Shortint � -128..127               � Znam�nkov� 8-bit�
  Integer  � -32768..32767           � Znam�nkov� 16-bit�
  Longint  � -2147483648..2147483647 � Znam�nkov� 32-bit�
  Byte     � 0..255                  � Bez znam�nka 8-bit�
  Word     � 0..65535                � Bez znam�nka 16-bit�

V�echny celo��seln� typy jsou ordin�ln� typy.

Dal� �ty�i p�eddefinovan� typy jsou Boolean, WordBool, LongBool (logick�
typy) a Char (typ znak).

V�tov� typ (enumerated) a interval jsou u�ivatelsky definovan� ordin�ln�
typy.

S ordin�ln�mi typy mohou pracovat tyto standardn� funkce:

 Ord
 Pred
 Succ

 Re�ln� typy
 ���������������������
Re�ln� typ obsahuje mno�inu hodnot, kter� jsou podmno�inou re�ln�ch ��sel,
kter� mohou b�t reprezentov�ny ve form�tu pohybliv� ��dov� ��rky s pevn�m
po�tem ��slic.

Hodnota ��sla v pohybliv� ��dov� ��rce je tvo�ena z t�� hodnot, M, B a E,
takov�ch, �e M x B E = N, kde B je v�dy 2, a M i E jsou cel� hodnoty v
rozsahu re�ln�ho typu.

Turbo Pascal obsahuje p�t p�eddefinovan�ch typ� ��sel v pohybliv� ��dov�
��rce. Ka�d� z t�chto typ� m� sv�j specifikovan� rozsah a p�esnost.

  Typ      � Rozsah              � ��slic � Bajt�
 ���������ͳ��������������������ͳ�������ͳ��������
  real     � 2.9e-39..1.7e38     � 11-12  � 6
  single   � 1.5e-45..3.4e38     � 7-8    � 4
  double   � 5.0e-324..1.7e308   � 15-16  � 8
  extended � 3.4e-4932..1.1e4932 � 19-20  � 10
  comp     � -9.2e18..9.2e18     � 19-20  � 8

Pozn.: Typ comp je 64-bitov� cel� ��slo (integer) v rozsahu od

  (-263 + 1) do (263 - 1).

Turbo Pascal podporuje dva modely generov�n� k�du pro re�ln� typy:

 - Softwarov�, {$N-}
 - Hardwarov� 8087, {$N+}

Direktiva kompil�toru $N slou�� k p�ep�n�n� mezi t�mito dv�ma modely.

V re�imu $N+, direktiva p�eklada�e $E ��d�, zda v c�lov�m k�du bude zahrnuta
softwarov� emula�n� knihovna 8087.


