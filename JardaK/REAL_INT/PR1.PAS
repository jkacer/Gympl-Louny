
 Celočíselné typy
 ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
Turbo Pascal obsahuje pět předdefinovaných celočíselných typů. Každý typ
popisuje určitou podmnožinu množiny celých čísel.

  Typ      │ Rozsah                  │ Formát
 ══════════│═════════════════════════│════════════════════════
  Shortint │ -128..127               │ Znaménkový 8-bitů
  Integer  │ -32768..32767           │ Znaménkový 16-bitů
  Longint  │ -2147483648..2147483647 │ Znaménkový 32-bitů
  Byte     │ 0..255                  │ Bez znaménka 8-bitů
  Word     │ 0..65535                │ Bez znaménka 16-bitů

Všechny celočíselné typy jsou ordinální typy.

Další čtyři předdefinované typy jsou Boolean, WordBool, LongBool (logické
typy) a Char (typ znak).

Výčtový typ (enumerated) a interval jsou uživatelsky definované ordinální
typy.

S ordinálními typy mohou pracovat tyto standardní funkce:

 Ord
 Pred
 Succ

 Reálné typy
 ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
Reálný typ obsahuje množinu hodnot, které jsou podmnožinou reálných čísel,
které mohou být reprezentovány ve formátu pohyblivé řádové čárky s pevným
počtem číslic.

Hodnota čísla v pohyblivé řádové čárce je tvořena z tří hodnot, M, B a E,
takových, že M x B E = N, kde B je vždy 2, a M i E jsou celé hodnoty v
rozsahu reálného typu.

Turbo Pascal obsahuje pět předdefinovaných typů čísel v pohyblivé řádové
čárce. Každý z těchto typů má svůj specifikovaný rozsah a přesnost.

  Typ      │ Rozsah              │ Číslic │ Bajtů
 ══════════│═════════════════════│════════│════════
  real     │ 2.9e-39..1.7e38     │ 11-12  │ 6
  single   │ 1.5e-45..3.4e38     │ 7-8    │ 4
  double   │ 5.0e-324..1.7e308   │ 15-16  │ 8
  extended │ 3.4e-4932..1.1e4932 │ 19-20  │ 10
  comp     │ -9.2e18..9.2e18     │ 19-20  │ 8

Pozn.: Typ comp je 64-bitové celé číslo (integer) v rozsahu od

  (-263 + 1) do (263 - 1).

Turbo Pascal podporuje dva modely generování kódu pro reálné typy:

 - Softwarový, {$N-}
 - Hardwarový 8087, {$N+}

Direktiva kompilátoru $N slouží k přepínání mezi těmito dvěma modely.

V režimu $N+, direktiva překladače $E řídí, zda v cílovém kódu bude zahrnuta
softwarová emulační knihovna 8087.


