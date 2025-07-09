#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheat.typ": cheatsheet-setup

#show: cheatsheet-setup(
  title: "MMP2 Cheatsheet",
  author: "Denis Titov",
  abstract: "Kompakte Zusammenfassung: Gruppen- und Darstellungstheorie, Lie-Gruppen, Praktische Beispiele",
  language: "GER",
  lib: "lib.typ",
)

#show: frame-style(styles.boxy)

#show: frame-style(styles.boxy)

= Grundbegriffe

#definition[Gruppe][
  Gruppe $(G, *)$: Menge mit Verknüpfung $G times G -> G$, $(g,h) |-> g h$
  - *Assoziativität*: $(g h)k = g(h k)$
  - *Einselement*: $exists bb(1): bb(1) g = g bb(1) = g$
  - *Inverse*: $forall g in G exists g^(-1): g g^(-1) = g^(-1) g = bb(1)$
  - *Abelsch*: $g h = h g$ (kommutativ)
]

== Wichtige Gruppen

#definition[Zyklische Gruppe $C_n$][
  $C_n = ZZ_n = {0,1,...,n-1}$ mit Addition modulo $n$
]

#definition[Symmetrische Gruppe $S_n$][
  Permutationen von $n$ Elementen, $|S_n| = n!$
]

#definition[Diedergruppe $D_n$][
  Symmetriegruppe eines $n$-Ecks, $|D_n| = 2n$
  $D_n = angle.l R, S angle.r = {R^k, S R^k | k in {0,...,n-1}}$
  mit $R^n = S^2 = bb(1)$, $S R S = R^(-1)$
]

#definition[Orthogonale Gruppen][
  - $O(n) = {A in GL(n, RR) | A^T A = bb(1)}$
  - $SO(n) = {A in O(n) | det(A) = 1}$
  - $U(n) = {A in GL(n, CC) | A^* A = bb(1)}$
  - $SU(n) = {A in U(n) | det(A) = 1}$
]

= Darstellungen

#definition[Darstellung][
  Gruppenhomomorphismus $rho: G -> GL(V)$ auf Vektorraum $V != {0}$
  $rho(g h) = rho(g) compose rho(h)$, $rho(bb(1)) = id_V$, $rho(g^(-1)) = rho(g)^(-1)$
]

#definition[Unitäre Darstellung][
  $rho(g)$ unitär für alle $g in G$: $(rho(g)u, rho(g)v) = (u,v)$
]

#theorem[Endliche Gruppen][
  Endlichdimensionale $CC$-Darstellungen endlicher Gruppen sind vollständig reduzibel.
]

#theorem[Lemma von Schur][
  Seien $(rho_1, V_1), (rho_2, V_2)$ irreduzible Darstellungen:
  1. $phi in Hom_G(V_1, V_2) => phi = 0$ oder Isomorphismus
  2. $phi in Hom_G(V, V) => phi = lambda id_V$, $lambda in CC$
]

#corollary[Abelsche Gruppen][
  Jede irreduzible endlichdimensionale $CC$-Darstellung abelscher Gruppen ist eindimensional.
]

= Charaktere

#definition[Charakter][
  $chi_rho: G -> CC$, $chi_rho(g) = tr(rho(g))$
  - Invariant unter Konjugation: $chi_rho(h g h^(-1)) = chi_rho(g)$
  - Äquivalente Darstellungen haben gleiche Charaktere
]

#definition[Konjugationsklasse][
  $[g] = {h g h^(-1) | h in G}$. Charakter konstant auf Konjugationsklassen.
]

#theorem[Orthogonalität der Charaktere][
  Für irreduzible Darstellungen $rho, rho'$:
  $(chi_rho, chi_(rho')) = 1/|G| sum_(g in G) overline(chi_rho(g)) chi_(rho')(g) = cases(1 "falls" rho equiv rho', 0 "sonst")$
]

#theorem[Zerlegung der regulären Darstellung][
  $rho_"reg" = plus.circle_i n_i rho^((i))$ mit $n_i = dim(rho^((i)))$
  $|G| = sum_i n_i^2$
]

= Frobenius-Formel & Young-Tableaux

#definition[Frobenius-Formel][
  Für $S_n$: $chi^lambda(sigma) = (product_((i,j) in lambda) h(i,j))^(-1) sum_(T) product_(k=1)^n x_k^(m_k(T))$
  wobei $h(i,j)$ der Hook-Länge entspricht.
]

= Young-Tableaux und $S_n$

#definition[Partition][
  Partition von $n$: $n = lambda_1 + lambda_2 + ... + lambda_k$ mit $lambda_1 >= lambda_2 >= ... >= lambda_k >= 1$
  Darstellung durch Young-Diagramm mit $lambda_i$ Kästchen in Zeile $i$.
]

#definition[Standard-Young-Tableau][
  Füllung eines Young-Diagramms mit Zahlen $1,...,n$, streng wachsend in Zeilen und Spalten.
]

#definition[Hook-Länge][
  Für Kästchen $(i,j)$: $h(i,j) = lambda_i + lambda'_j - i - j + 1$
  wobei $lambda'_j$ = Spaltenlänge der $j$-ten Spalte.
]

#theorem[Anzahl Standard-Tableaux][
  Anzahl Standard-Tableaux für Partition $lambda$: $f^lambda = n! / product_((i,j)) h(i,j)$
]

== Permutationstypen

#definition[Zyklentyp][
  Permutation $sigma in S_n$ bestimmt durch Zyklentyp $(1^(m_1) 2^(m_2) ... n^(m_n))$
  wobei $m_k$ = Anzahl der $k$-Zyklen. Konjugationsklassen ↔ Zyklentypen ↔ Partitionen.
]

= Tensorprodukte

#definition[Tensorprodukt von Darstellungen][
  $(rho_1 times.circle rho_2)(g) = rho_1(g) times.circle rho_2(g)$
  $dim(V_1 times.circle V_2) = dim(V_1) dot dim(V_2)$
]

#definition[Charaktere von Tensorprodukten][
  $chi_(rho_1 times.circle rho_2)(g) = chi_(rho_1)(g) dot chi_(rho_2)(g)$
]

= Reduktion und Irreduzibilität

#definition[Reduzible/Irreduzible Darstellung][
  - *Reduzibel*: $exists$ invarianter Unterraum $W subset V$, $W != {0}, V$
  - *Irreduzibel*: keine nichttrivialen invarianten Unterräume
  - *Vollständig reduzibel*: direkte Summe irreduzibler Darstellungen
]

#theorem[Maschkes Satz][
  Alle Darstellungen endlicher Gruppen über $CC$ sind vollständig reduzibel.
]

= Kristallgruppen und Physik

#definition[32 Punktgruppen][
  Alle möglichen Punktsymmetrien von Kristallen:
  - Zyklengruppen: $C_n$ (Rotation um $2pi/n$)
  - Diedergruppen: $D_n$ (Rotationen + Spiegelungen)
  - Platonische Körper: $T_d$ (Tetraeder), $O_h$ (Oktaeder), $I_h$ (Ikosaeder)
]

#example[Anwendungen][
  - *Molekülorbitale*: Symmetrie bestimmt erlaubte Übergänge
  - *Kristallfeld-Aufspaltung*: Entartung durch Symmetriebrechung
  - *Phononen*: Schwingungsmoden durch Gruppentheorie klassifiziert
]

= Kompakte Lie-Gruppen

#definition[Kompakte Lie-Gruppe][
  Lie-Gruppe, die als topologischer Raum kompakt ist.
  *Beispiele*: $U(n)$, $SU(n)$, $SO(n)$, $Sp(n)$
]

#theorem[Weyl-Satz][
  Alle Darstellungen kompakter Lie-Gruppen sind vollständig reduzibel.
]

#definition[Cartan-Unteralgebra][
  Maximale abelsche Unteralgebra $h subset g$.
  Dimension = Rang der Lie-Algebra.
]

#definition[Wurzeln und Gewichte][
  - *Wurzel*: Eigenwert von $ad(H)$ für $H in h$
  - *Gewicht*: Eigenwert in Darstellung
  - *Höchstes Gewicht*: charakterisiert irreduzible Darstellung eindeutig
]

= Wichtige Isomorphismen

#definition[Niedrigdimensionale Isomorphismen][
  - $SU(2) approx Sp(1) approx$ Einheits-Quaternionen
  - $SO(3) approx SU(2)/{plus.minus bb(1)}$ (Spin-Bahn-Kopplung)
  - $SO(4) approx SU(2) times SU(2)$
  - $SO(6) approx SU(4)$
  - $"Spin"(3) approx SU(2)$, $"Spin"(4) approx SU(2) times SU(2)$
]

= Formeln für Prüfung

#definition[Orthogonalitätsrelationen][
  Für endliche Gruppe $G$, irreduzible Darstellungen $rho^((i))$:
  $sum_(g in G) overline(rho^((i))_(a b)(g)) rho^((j))_(c d)(g) = |G|/n_i delta_(i j) delta_(a c) delta_(b d)$
]

#definition[Dimensionsformel][
  $sum_i (dim rho^((i)))^2 = |G|$ (Anzahl Konjugationsklassen = Anzahl irreduzibler Darstellungen)
]

#definition[Charakterorthogonalität][
  $(chi^((i)), chi^((j))) = sum_(g in G) overline(chi^((i))(g)) chi^((j))(g) / |G| = delta_(i j)$
]

= Symmetrisches und äußeres Produkt

#definition[Symmetrisches Produkt][
  $S^N V = {x in V^(tensor N) | rho(sigma) x = x forall sigma in S_N}$
  Basis: $[e_(i_1) tensor ... tensor e_(i_N) | 1 <= i_1 <= ... <= i_N]$
  $dim(S^N V) = binom(m+N-1, N)$ für $dim(V) = m$
]

#definition[Äußeres Produkt][
  $and^N V = {x in V^(tensor N) | rho(sigma) x = "sgn"(sigma) x forall sigma in S_N}$
  Basis: $[e_(i_1) and ... and e_(i_N) | 1 <= i_1 < ... < i_N]$
  $dim(and^N V) = binom(m, N)$ für $dim(V) = m$
]

= Eigenwertprobleme mit Symmetrie

#theorem[Diagonalisierung symmetrischer Operatoren][
  Sei $A: V -> V$ mit $rho(g) A = A rho(g)$ für alle $g in G$.
  Bei Zerlegung $V = V_1 plus.circle ... plus.circle V_n$ (irreduzibel):
  $A$ hat höchstens $n$ verschiedene Eigenwerte, konstant auf jeder Komponente $V_i$.
]

#example[Anwendung: Kristallfeldtheorie][
  Hamiltonoperator $H$ kommutiert mit Symmetriegruppe → Energieniveaus klassifiziert durch irreduzible Darstellungen.
]

= Spektraltheorie und Quantenmechanik

#definition[Irreduzible Darstellungen der Rotationsgruppe][
  $SO(3)$: Darstellungen $D^((l))$ mit $dim = 2l+1$, $l = 0, 1, 2, ...$
  Charaktere: $chi^((l))(phi) = sin((2l+1)phi/2) / sin(phi/2)$
]

#definition[Spin und SU(2)][
  $SU(2)$: Darstellungen $D^((j))$ mit $dim = 2j+1$, $j = 0, 1/2, 1, 3/2, ...$
  Covering: $SU(2) -> SO(3)$ mit Kern ${plus.minus bb(1)}$
]

#theorem[Clebsch-Gordan-Zerlegung][
  $D^((j_1)) times.circle D^((j_2)) = plus.circle_(J=|j_1-j_2|)^(j_1+j_2) D^((J))$
  Koeffizienten $angle.l j_1 m_1, j_2 m_2 | J M angle.r$ durch Rekursion oder Tabellen.
]

= Darstellungen klassischer Gruppen

#definition[GL(n) und SL(n)][
  $GL(n, CC)$: alle invertierbaren $n times n$ Matrizen
  $SL(n, CC) = {A in GL(n, CC) | det(A) = 1}$
  Fundamentaldarstellung: Standardaktion auf $CC^n$
]

#definition[Orthogonale und unitäre Gruppen][
  $O(n) = {A | A^T A = bb(1)}$, $SO(n) = O(n) inter {det = 1}$
  $U(n) = {A | A^* A = bb(1)}$, $SU(n) = U(n) inter {det = 1}$
  Kompakt → vollständig reduzible Darstellungen
]

#definition[Symplektische Gruppe][
  $Sp(2n) = {A | A^T J A = J}$ mit $J = mat(0, bb(1)_n; -bb(1)_n, 0)$
  Erhält symplektische Form, wichtig in Hamiltonscher Mechanik
]

= Lie-Algebren-Struktur

#definition[Lie-Klammer][
  $[X, Y] = X Y - Y X$ (Kommutator)
  *Eigenschaften*:
  - Bilinear: $[a X + b Y, Z] = a[X,Z] + b[Y,Z]$
  - Antisymmetrisch: $[X,Y] = -[Y,X]$
  - Jacobi-Identität: $[X,[Y,Z]] + [Y,[Z,X]] + [Z,[X,Y]] = 0$
]

#definition[Strukturkonstanten][
  Für Basis ${X_1, ..., X_n}$ von $g$:
  $[X_i, X_j] = sum_k c_(i j)^k X_k$
  $c_(i j)^k$ = Strukturkonstanten, bestimmen Lie-Algebra vollständig
]

= Wurzelsysteme

#definition[Cartan-Zerlegung][
  $g = h plus.circle (plus.circle_(alpha in Phi) g_alpha)$
  - $h$: Cartan-Unteralgebra (maximal abelsch)
  - $Phi$: Wurzelsystem
  - $g_alpha = {X in g | [H,X] = alpha(H) X forall H in h}$
]

#definition[Einfache Wurzeln][
  Minimale Teilmenge $Delta subset Phi$ mit:
  - Jede Wurzel ist Linearkombination mit ganzzahligen Koeffizienten gleichen Vorzeichens
  - $|Delta| =$ Rang von $g$
]

= Klassifikation einfacher Lie-Algebren

#definition[ADE-Klassifikation][
  *Klassische Reihen*:
  - $A_n = s l(n+1, CC)$, $n >= 1$
  - $B_n = s o(2n+1, CC)$, $n >= 2$
  - $C_n = s p(2n, CC)$, $n >= 3$
  - $D_n = s o(2n, CC)$, $n >= 4$

  *Ausnahme-Algebren*: $E_6, E_7, E_8, F_4, G_2$
]

= Darstellungstheorie von s l(2)

#definition[Basis von s l(2)][
  $H = mat(1, 0; 0, -1)$, $E = mat(0, 1; 0, 0)$, $F = mat(0, 0; 1, 0)$

  Relationen: $[H, E] = 2E$, $[H, F] = -2F$, $[E, F] = H$
]

#theorem[Darstellungen von sl(2)][
  Irreduzible Darstellungen $V_n$ mit $dim = n+1$, $n = 0, 1, 2, ...$
  Basis: ${v_0, v_1, ..., v_n}$ mit:
  - $H v_k = (n-2k) v_k$
  - $E v_k = k v_(k-1)$ (für $k > 0$)
  - $F v_k = (n-k) v_(k+1)$ (für $k < n$)
]

= Quantenfeldtheorie-Verbindungen

#definition[Poincaré-Gruppe][
  $"ISO"(1,3) = SO^+(1,3) times.circle RR^(1,3)$ (Lorentz-Gruppe ⋉ Translationen)
  Darstellungen klassifizieren Elementarteilchen (Masse, Spin)
]

#definition[Gauge-Theorien][
  - $SU(3)_C$: Starke Wechselwirkung (QCD)
  - $SU(2)_L times U(1)_Y$: Elektroschwache Theorie
  - $SU(5)$ oder $SO(10)$: Grand Unified Theories
]

= Computertechniken

#definition[Charaktertafel berechnen][
  1. Konjugationsklassen bestimmen
  2. Dimensionen durch $sum_i n_i^2 = |G|$
  3. Orthogonalitätsrelationen nutzen
  4. Produktzahlen prüfen
]

#definition[Projektionsoperatoren][
  Für irreduzible Darstellung $rho^((i))$:
  $P^((i)) = (n_i / |G|) sum_(g in G) chi^((i))(g^(-1)) rho(g)$
  Projiziert auf isotypische Komponente
]

= Wichtige Identitäten

#definition[Burnside-Lemma][
  Anzahl Bahnen unter Gruppenaktion: $|X/G| = (1/|G|) sum_(g in G) |X^g|$
  wobei $X^g = {x in X | g x = x}$
]

#definition[Frobenius-Reziprozität][
  Für Untergruppe $H subset G$:
  $(chi|_H, psi)_H = (chi, "Ind"_H^G psi)_G$
]

#theorem[Maschke-Satz][
  Gruppenalgebra $CC[G]$ ist halbeinfach ⟺ $"char"(CC) divides.not |G|$
]

#definition[Pauli-Matrizen und su(2)][
  $sigma_1 = mat(0, 1; 1, 0)$, $sigma_2 = mat(0, -i; i, 0)$, $sigma_3 = mat(1, 0; 0, -1)$

  $[sigma_i, sigma_j] = 2i epsilon_(i j k) sigma_k$
  $s u(2) = span{i sigma_1, i sigma_2, i sigma_3}$
]

#definition[Wichtige Lie-Algebren][
  - $s l(n) = {X | tr(X) = 0}$
  - $s o(n) = {X | X^T = -X}$ (schiefsymmetrisch)
  - $s u(n) = {X | X^* = -X, tr(X) = 0}$ (anti-hermitesch, spurlos)
]

= Praktische Beispiele & Rechnungen

== Young-Tableaux berechnen

#example[Young-Tableau für $S_4$][
  Partition $lambda = (3,1)$ von $4$:
  ```
  □ □ □
  □
  ```
  Hook-Längen: $h(1,1)=3, h(1,2)=2, h(1,3)=1, h(2,1)=1$
  Anzahl Standard-Tableaux: $f^((3,1)) = 4!/(3 dot 2 dot 1 dot 1) = 24/6 = 4$
  Standard-Tableaux:
  ```
  1 2 3  |  1 2 4  |  1 3 4  |  2 3 4
  4      |  3      |  2      |  1
  ```
]

== Charaktertafel berechnen

#example[$D_3$ Charaktertafel][
  $D_3 = {e, r, r^2, s, s r, s r^2}$, $|D_3| = 6$
  Konjugationsklassen: $[e], [r,r^2], [s,s r,s r^2]$
  3 irreduzible Darstellungen mit $n_1^2 + n_2^2 + n_3^2 = 6$
  → $n_1=n_2=1, n_3=2$

  | | $[e]$ | $[r,r^2]$ | $[s,s r,s r^2]$ |
  |---|---|---|---|
  | $rho_1$ | 1 | 1 | 1 |
  | $rho_2$ | 1 | 1 | -1 |
  | $rho_3$ | 2 | -1 | 0 |
]

== Schur-Lemma anwenden

#example[Schur für $C_n$][
  $C_n$ abelsch → alle irreduziblen Darstellungen eindimensional
  $rho_k: C_n -> CC^*$, $rho_k(g) = omega^k$ mit $omega = e^{2pi i/n}$
  Für $phi in Hom_(C_n)(CC,CC)$: $phi(rho_k(g)z) = rho_k(g)phi(z)$
  → $phi(omega^k z) = omega^k phi(z)$ → $phi = lambda id$
]

== Charakterformel nutzen

#example[Orthogonalität prüfen][
  Für $D_3$: $(chi_1, chi_3) = 1/6[1 dot 2 dot 1 + 1 dot (-1) dot 2 + 1 dot 0 dot 3] = 0$ ✓
  $(chi_3, chi_3) = 1/6[2^2 dot 1 + (-1)^2 dot 2 + 0^2 dot 3] = 6/6 = 1$ ✓
]

== Lie-Algebren berechnen

#example[$s u(2)$ Struktur][
  Basis: $X_1 = i sigma_1/2, X_2 = i sigma_2/2, X_3 = i sigma_3/2$
  $[X_i, X_j] = epsilon_(i j k) X_k$
  Strukturkonstanten: $c_(1 2)^3 = 1, c_(2 3)^1 = 1, c_(3 1)^2 = 1$
  Cartan: $h = span{X_3}$, Wurzeln: $alpha = plus.minus 2$
  $s u(2) = h plus.circle g_alpha plus.circle g_(-alpha)$
]

== Tensorprodukte

#example[Tensorprodukt-Zerlegung][
  $SU(2)$: $D^((1/2)) times.circle D^((1/2)) = D^((0)) plus.circle D^((1))$
  Charaktere: $chi^((1/2))(theta) = 2cos(theta/2)$
  $chi^((1/2)) dot chi^((1/2)) = 4cos^2(theta/2) = 2(1+cos theta) = 2 + 2cos theta$
  $= chi^((0)) + chi^((1))$ ✓
]

#example[Clebsch-Gordan][
  $j_1=1/2, j_2=1/2$: $|1/2,1/2angle.r times.circle |1/2,1/2angle.r$
  $= |1,1angle.r$ (Triplett) $plus.circle |0,0angle.r$ (Singulett)
  $|1,1angle.r = |↑↑angle.r$
  $|0,0angle.r = 1/sqrt(2)(|↑↓angle.r - |↓↑angle.r)$
]

== Irreduzible Darstellungen finden

#example[$S_3$ Darstellungen][
  1. Triviale: $rho_1(sigma) = 1$ für alle $sigma$
  2. Vorzeichen: $rho_2(sigma) = "sgn"(sigma)$
  3. Standard: $rho_3: S_3 -> GL(2, CC)$ durch Permutation von $(x,y,z)$ mit $x+y+z=0$
    $rho_3((12)) = mat(-1/2, sqrt(3)/2; sqrt(3)/2, 1/2)$
]
= Formeltabelle & Schnellreferenz

== Charakterformeln kompakt
$sum_i (dim rho^((i)))^2 = |G|$ • $(chi^((i)), chi^((j))) = delta_(i j)$ • $chi(g^(-1)) = overline(chi(g))$ • $chi(h g h^(-1)) = chi(g)$

== Wichtige Gruppen-Ordnungen
$|S_n| = n!$ • $|A_n| = n!/2$ • $|D_n| = 2n$ • $|GL(n, q)| = product_(i=0)^(n-1)(q^n-q^i)$ • $|SL(n, q)| = |GL(n, q)|/(q-1)$

== Standard-Darstellungen
$S_3$: $1,1,2$ • $S_4$: $1,1,2,3,3$ • $D_3$: $1,1,2$ • $D_4$: $1,1,1,1,2$ • $SU(2)$: $D^((j))$, $dim=2j+1$ • $SO(3)$: $D^((l))$, $dim=2l+1$

== Clebsch-Gordan Regeln
$j_1 times.circle j_2 = |j_1-j_2| plus.circle |j_1-j_2|+1 plus.circle ... plus.circle j_1+j_2-1 plus.circle j_1+j_2$
$l times.circle l = 0 plus.circle 1 plus.circle ... plus.circle 2l$ (für ganzzahlige $l$)

== Lie-Algebren Dimensionen
$dim(s l(n)) = n^2-1$ • $dim(s o(n)) = n(n-1)/2$ • $dim(s u(n)) = n^2-1$ • $dim(s p(2n)) = n(2n+1)$

== Young-Tableaux Quickfacts
Hook-Länge: $h(i,j) = lambda_i + lambda'_j - i - j + 1$ • Anzahl: $n!/product h(i,j)$ • Inhalt: $c(i,j) = j-i$

== Tensor-Identitäten
$(A times.circle B) times.circle C = A times.circle (B times.circle C)$ • $dim(V times.circle W) = dim(V) dim(W)$ • $tr(A times.circle B) = tr(A) tr(B)$

== Exponential-Tricks
$exp(A) exp(B) = exp(A+B)$ (falls $[A,B]=0$) • $det(exp(A)) = exp(tr(A))$ • $exp(P A P^(-1)) = P exp(A) P^(-1)$

== Kompakte Gruppen
Alle Darstellungen vollständig reduzibel • Unitäre Darstellungen existieren • $overline{rho} iso rho$ für reelle Gruppen

== Kristallgruppen (32 Punktgruppen)
$C_1, C_i, C_2, C_s, C_(2 h), D_2, C_(2 v), D_(2 h), C_4, S_4, C_(4 h), D_4, C_(4 v), D_(2 d), D_(4 h),$
$C_3, C_(3 i), D_3, C_(3 v), D_(3 d), C_6, C_(3 h), C_(6 h), D_6, C_(6 v), D_(3 h), D_(6 h), T, T_h, O, T_d, O_h$

== Nützliche Matrizen
$sigma_x = mat(0, 1; 1, 0)$, $sigma_y = mat(0, -i; i, 0)$, $sigma_z = mat(1, 0; 0, -1)$ • $tau_x = (sigma_x,0)$, $tau_y = (sigma_y,0)$, $tau_z = (0,sigma_z)$

== Schur-Orthogonalität
$sum_(g in G) overline(rho^((i))_(a b)(g)) rho^((j))_(c d)(g) = |G|/n_i delta_(i j) delta_(a c) delta_(b d)$

== Burnside-Lemma
$|X/G| = 1/|G| sum_(g in G) |X^g|$ wobei $X^g = {x | g x = x}$

== Wurzelsystem-Basics
Einfache Wurzeln bilden Basis • Positive/negative Wurzeln • Weyl-Gruppe permutiert Wurzeln • Gewichte = Darstellungstheorie

== Casimir-Operatoren
$SU(2)$: $C_2 = J_1^2 + J_2^2 + J_3^2$ • Eigenwert: $j(j+1)$ • $SO(3)$: $L^2 = L_x^2 + L_y^2 + L_z^2$, Eigenwert: $l(l+1)$

== Projektionsformeln
Projektion auf irred. Komp.: $P^((i)) = n_i/|G| sum_(g in G) chi^((i))(g^(-1)) rho(g)$
Multiplizität: $m_i = (chi, chi^((i)))$

== Quick-Tests
Irreduzibel? → $(chi, chi) = 1$ • Abelsch? → Alle irred. eindimensional • Einfach? → Nur $[G,G] = G$ oder $={1}$

== Darstellungen klassischer Gruppen
$GL(n)$: Alle polynomial Darst. • $SL(n)$: Spurlos • $O(n)$: Orthogonal-erhaltend • $Sp(2n)$: Symplektisch-erhaltend

== Induzierte Darstellungen
$"Ind"_H^G rho(g) = sum_(i) rho(t_i^(-1) g t_j)$ falls $g in t_j H t_j^(-1)$ • $dim("Ind"_H^G rho) = [G:H] dim(rho)$

== Frobenius-Reziprozität
$(chi|_H, psi) = (chi, "Ind"_H^G psi)$ • $"Res"^G_H "Ind"_H^G rho = sum_(g in G/H) rho^g$

== Exam Survival Kit

*Charaktertafel-Algorithmus:* 1) Konjugationsklassen → 2) $sum n_i^2 = |G|$ → 3) Orthogonalität → 4) Prüfung ✓

*Irreduzibel-Test:* $(chi,chi) = 1$ ✓ *Äquivalenz:* $(chi_1,chi_2) = 1$ ✓ *Multiplizität:* $m_i = (chi,chi^((i)))$

*Young-Tableaux:* Hook = rechts + unten + 1, Anzahl = $n!/product "hooks"$, Charakter via Tabloids

*Tensor-Zerlegung:* $chi_1 chi_2 = sum_i a_i chi^((i))$ mit $a_i = (chi_1 chi_2, chi^((i)))$

*Lie-Tricks:* $[X,Y] = X Y - Y X$, $exp([X,Y]) = exp(X)exp(Y)exp(-X)exp(-Y)$ (BCH), Cartan = maximal abelsch

*Kristall-Entscheidung:* Punktgruppe → irred. Darst. → Aufspaltung, Selection rules: $Gamma_i times.circle Gamma_j supset Gamma_"total"$

*Clebsch-Gordan:* $j_1 plus.circle j_2 = |j_1-j_2| plus.circle ... plus.circle j_1+j_2$, Multiplizität meist 1

*Schur anwenden:* Irreduzibel + $phi$ kommutiert → $phi = lambda id$, Verschiedene Darst. → $phi = 0$

*Casimir berechnen:* Quadratische Operatoren kommutieren mit allen, Eigenwerte klassifizieren

*Prüfungsstrategie:* Symmetrie erkennen → Gruppe identifizieren → Darstellungen → Aufspaltung/Entartung
