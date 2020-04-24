
 CeloŸ¡seln‚ typy
 ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
Turbo Pascal obsahuje pØt pıeddefinovanìch celoŸ¡selnìch typ…. Ka§dì typ
popisuje urŸitou podmno§inu mno§iny celìch Ÿ¡sel.

  Typ      ³ Rozsah                  ³ Form t
 ÍÍÍÍÍÍÍÍÍÍ³ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ³ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
  Shortint ³ -128..127               ³ Znam‚nkovì 8-bit…
  Integer  ³ -32768..32767           ³ Znam‚nkovì 16-bit…
  Longint  ³ -2147483648..2147483647 ³ Znam‚nkovì 32-bit…
  Byte     ³ 0..255                  ³ Bez znam‚nka 8-bit…
  Word     ³ 0..65535                ³ Bez znam‚nka 16-bit…

Vçechny celoŸ¡seln‚ typy jsou ordin ln¡ typy.

Dalç¡ Ÿtyıi pıeddefinovan‚ typy jsou Boolean, WordBool, LongBool (logick‚
typy) a Char (typ znak).

VìŸtovì typ (enumerated) a interval jsou u§ivatelsky definovan‚ ordin ln¡
typy.

S ordin ln¡mi typy mohou pracovat tyto standardn¡ funkce:

 Ord
 Pred
 Succ

 Re ln‚ typy
 ßßßßßßßßßßßßßßßßßßßßß
Re lnì typ obsahuje mno§inu hodnot, kter‚ jsou podmno§inou re lnìch Ÿ¡sel,
kter‚ mohou bìt reprezentov ny ve form tu pohybliv‚ ı dov‚ Ÿ rky s pevnìm
poŸtem Ÿ¡slic.

Hodnota Ÿ¡sla v pohybliv‚ ı dov‚ Ÿ rce je tvoıena z tı¡ hodnot, M, B a E,
takovìch, §e M x B E = N, kde B je v§dy 2, a M i E jsou cel‚ hodnoty v
rozsahu re ln‚ho typu.

Turbo Pascal obsahuje pØt pıeddefinovanìch typ… Ÿ¡sel v pohybliv‚ ı dov‚
Ÿ rce. Ka§dì z tØchto typ… m  sv…j specifikovanì rozsah a pıesnost.

  Typ      ³ Rozsah              ³ ¬¡slic ³ Bajt…
 ÍÍÍÍÍÍÍÍÍÍ³ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ³ÍÍÍÍÍÍÍÍ³ÍÍÍÍÍÍÍÍ
  real     ³ 2.9e-39..1.7e38     ³ 11-12  ³ 6
  single   ³ 1.5e-45..3.4e38     ³ 7-8    ³ 4
  double   ³ 5.0e-324..1.7e308   ³ 15-16  ³ 8
  extended ³ 3.4e-4932..1.1e4932 ³ 19-20  ³ 10
  comp     ³ -9.2e18..9.2e18     ³ 19-20  ³ 8

Pozn.: Typ comp je 64-bitov‚ cel‚ Ÿ¡slo (integer) v rozsahu od

  (-263 + 1) do (263 - 1).

Turbo Pascal podporuje dva modely generov n¡ k¢du pro re ln‚ typy:

 - Softwarovì, {$N-}
 - Hardwarovì 8087, {$N+}

Direktiva kompil toru $N slou§¡ k pıep¡n n¡ mezi tØmito dvØma modely.

V re§imu $N+, direktiva pıekladaŸe $E ı¡d¡, zda v c¡lov‚m k¢du bude zahrnuta
softwarov  emulaŸn¡ knihovna 8087.


