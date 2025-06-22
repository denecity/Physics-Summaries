#import "lib.typ": *
#show: frame-style(styles.boxy)

= Endliche Gruppen

In diesem Kapitel sind alle Gruppen endliche und alle Darstellungen endlichdimensional und komplex.

== Orthogonalitätssrelation für die Matrixelemente

Sei $rho: G -> GL(V)$ eine irreduzible Darstellung von $G$.

Sei $(,)$ ein Skalarprodukt auf $V$ dessen $rho$ unitär ist.

Wir wählen eine Orthonormalbasis von $V$: $rho_(i j) (g)$ die Matrix von $rho(g)$ bezüglich dieser basis

Da die Matrix unitär:

$
  rho_(i j) (g^m1) = over(rho_(j i) (g)) <=> rho(g)^* = rho(g^m1)
$

#theorem[Satz][
  Seien $rho:G -> GL(V), rho': G -> GL(V')$ irreduzible unitäre Darstellungen von $G$ und $(rho_(i j) (g)), rho'_(i j) (g)$ die Matrizen von $rho(g), rho'(g)$ bezüglich (beliebigen) Orthonormalbasen von $V, V'$.

  + Sind $rho, rho'$ inäquivalent (nicht isomorph), so gilt:
  
    $
      1/abs(G) sum_(g in G) over(rho_(i j) (g)) rho'_(k l) (g) = 0
    $

    Dies sagt auch aus:

    $
      (rho_(i j), rho'_(k l)) = 0
    $

  + Sind $rho, rho'$ äquivalent (isomorph), so gilt:

    $
      1/abs(G) sum_(g in G) over(rho_(i j) (g)) rho'_(k l) (g) = (delta_(i k) delta_(j l))/(dim(V))
    $
]

Bemerkung: Auf dem Raum $CC(G) : {f: G -> CC}$ hat man folgendes Skalarprodukt:

$
  (phi, psi) = 1/abs(G) sum_(g in G) over(phi(g)) psi(g)
$

Dann folgt, dass $rho_(i j), rho'_(k l) in CC(G)$ orthogonal und "fast" orthonormal.

Beweis:

Wir benutzen Mittelwertbildung und das Lemma von Schur:

+ Wir bauen einen Homomorphismus von $rho$ zu $rho'$.

  Sei $phi: V -> V'$ irgendeine lineare Abbildung mit Matrix $phi_(i j)$.

  $
    phi_G = 1/abs(G) sum_(g in G) rho'(g^m1) phi rho(g)\
    "also" phi_G rho(h) = 1/abs(G) sum_(g in G) rho'(g^m1) phi rho(g h)\
    tilde(g) = g h\
    => = 1/abs(G) sum_(tilde in G) rho'((tilde(g) h)^m1) phi (rho(tilde(g)))\
    rho'((tilde(g) h^m1)^m1) = rho'(g tilde(g)^m1) = rho'(g) rho'(tilde(g)^m1)\
    => = 1/abs(G) sum_(tilde in G) rho'(h) rho'(tilde(g)^m1) phi rho(g)\
    = rho'(h) phi_G => phi_G in Hom_H (V, V')\
  $

  Also nach Schur 1: $phi_G = 0$. Wir schreiben also die Matrixelemente von $phi_G$:

  $
    (phi_G)_(j l) = 0 = 1/abs(G) sum_(g in G) sum_(i k) over(rho'_(i j) (g)) phi_(i k)  rho_(k l) (g)\
    = sum_(i k) phi_(i k) (1/abs(G) sum_(g in G) over(rho'_(i j) (g)) rho_(k l) (g)) = 0\
    forall phi\
  $

+ Wir benutzen Schur 2: $phi_G = lambda(phi) id_V$:

  $
    rho = rho'\
    => phi_G = lambda(phi) id_V\
    tr(phi_G) = 1/abs(G) sum_(g in G) tr(rho(g)^m1 phi rho(g))\
    = 1/abs(G) sum_(g in G) tr(phi)\
    = tr(phi)
    "Schur": = lambda (phi) dim(V)\
    => lambda(phi) = tr(phi)/(dim(V))\
    => phi_G - tr(phi)/(dim(V)) id_V = 0\
    0 = (tilde(phi))_(j l) = (phi_G)_(j l) - delta_(j l) 1/dim(V) sum_(i k) phi_(i k) delta(i k)\
    = sum_(i k) phi_(i k) (1/abs(G) sum_(g in G) over(rho_(i j) (g)) rho_(k l) (g) - delta_(j l) delta_(i k) 1/dim(V)) forall phi\
    => = 0 qed
  $

Zusammenfassed, wenn man zwei irreduzible Darstellungen $rho, rho'$ von $G$ hat, dann ist die representation der Matrixelemente von $rho$ bezüglich einer Orthonormalbasis orthogonal zu den Matrixelementen von $rho'$ bezüglich einer anderen Orthonormalbasis, wenn die Darstellungen nicht isomorph (nicht äquivalent) sind.

== Charakter einer Darstellung

#definition[Definition][Charakter][
  Der Charakter einer (endlichdimensionalen) Darstellung $rho: G -> GL(V)$ ist die Funktion:

  $
    chi_rho: G -> CC,\
    chi_rho (g) = tr(rho(g))\
    = sum_(i) rho_(i i) (g)\
    chi_rho in CC(G)\
  $

  Eigenschaften:

  + Invariant unter Konjugation:
    $
      chi_rho (g) = chi_rho (h g h^m1) forall h in G
    $

  + Sind $rho, rho'$ äquivalent, so gilt, dass die charaktere gleich sind:

    $
      chi_rho = chi_rho'
    $
]

Beweis:

$
  chi_rho (h g h^m1) = tr(rho(h g h^m1))\
  = tr( rho(h) rho(g) rho(h^m1))\
  = tr(rho(h) rho(h^m1) rho(g))\
  = tr(rho(g))\
  qed
$

Wei $tr$ die Spur ist, ist sie invariant unter Konjugation.

Sei $phi: V -> V'$ ein Isomorpohismus zwischen den Darstellungen $rho, rho'$. Das heisst:

$
  phi circ rho (g) = rho'(g) circ phi\
  => phi circ rho (g) circ phi^m1 = rho'(g)\ 
  => tr(rho'(g)) = tr(phi circ rho (g) circ phi^m1)\
  = tr(rho (g)) = chi_rho (g)\
  qed
$

=== Konjugationsklassen

#definition[Definition][Konjugationsklasse][
  Zwei Elemente $g, h in G$ sind in der gleichen Konjugationsklasse, wenn es ein $k in G$ gibt, so dass $h = k g k^m1$.

  Dies bildet ein Teilmenge der Form

  $
  { h g h^m1 | h in G }
  $

  Die  Konjugationsklassen sind die Äquivalenzklassen der Äquivalenzrelation $g ~ h' <=> g = h g' h^m1$ für ein $h in G$.

  Oder alternativ die Bahnen von der Wirkung von $G$ auf sich selbst durch Konjugation.
]

- vom Satz sagt, dass Charaktere auf Konjugationsklassen konstant sind:

  Man sagt $chi_rho$ ist eine Klassenfunktion.

Typische Operationen auf Darstellungen:

Seien $(rho, V), (rho', V')$ Darstellungen von $G$.

- Direkte Summe:

  $rho oadd rho'$ ist die Darstellung auf $V oadd V'$, sodass $(rho oadd rho') (g)  (v + v') = rho(g) v + rho'(g) v'$.

- Die Tensorproduktdarstellung:

  $rho oprod rho'$ ist die Darstellung auf $V oprod V'$, sodass:
  $
    (rho oprod rho') (g) (v oprod v') = (rho(g) v) oprod (rho'(g) v')
  $

- Duale Darstellung:

  Sei $rho_"dual", V^*)$ ist die Darstellung auf dem Dualraum $V^* = {lambda : V -> CC_"linear"}$, sodass

  $
    ((rho_"dual") (g) lambda) (v) = lambda (rho(g)^m1 v)
  $

=== Charakter der direkten Summe und des Tensorprodukts

#lemma[Lemma][
  - $
      chi_rho (1) = dim(V) = dim(rho)
    $

  - $
      chi_(rho oadd rho') = chi_rho + chi_rho'
    $
  
  - $
      chi_(rho oprod rho') = chi_rho chi_rho'
    $

  - $
      chi_rho (g^m1) = over(chi_rho (g))
    $
]

Beweis:

Sei $e_1, ..., e_n$ basis von $V$. $e'_1, ..., e'_n$ basis von $V'$.

Dann ist $e_1, ... , e_n, e'_1, ..., e'_n$ eine basis von $V oadd V'$.

Die Matrix von $(rho oadd rho') (g)$:

$
  mat(rho(g)_(i j), 0; 0, rho'(g)_(k l))\
  => tr(rho oadd rho' (g)) = tr(rho(g)) + tr(rho'(g))\
  qed
$

Wähle ein invariantes Skalarprodukt auf $V$, sodass $rho$ unitär ist.

$
  => (rho (g))_(i j) in U(n)
$

Die Darstellungsmatrizen sind unitär. Das heisst aber:

$
  rho(g^m1)_(i j) = over(rho(g)_(j i))\
  => tr(rho(g^m1)) = sum_(i) over(rho(g)_(i i)) = over(tr(rho(g)))\
$


Beispiele:

=== Charakter der regulären Darstellung

Die reguläre Darstellung war einfach die Darstellung von $G$ auf dem Raum $CC(G)$ der komplexen Funktionen auf $G$.

$
  (rho_"reg" (g)  f) (h) = f(g^m1 h)\
  f: G -> CC\
$

Die einfache Basis ist $delta_g (h) = delta_(g h)$.

#lemma[Lemma][
  $
    rho_"reg" (g) delta_h = delta_(g h)\
  $

  nur Diagonaleinträge falls $h = g h <=> g = 1$.

  $
    => chi_"reg" (g) = tr(rho_"reg" (g)) = abs(G) delta_(1 g) 
  $

  Dies wird später noch wichtig sein.
]

== Orthogonalität der Charaktere

Wir werden gleich sehen, dass die Charaktere irreduzibler Darstellungen orthogonal sind.

#theorem[Satz][Orthogonalität der Charaktere][
  Sei $rho, rho'$ *irreduzible* Darstellungen von $G$ mit Charakteren $chi_rho, chi_rho'$.

  Dann gilt:

  + Sind $rho, rho'$ inäquivalent (nicht isomorph), so gilt:

    $
      (chi_rho, chi_rho') = 1/abs(G) sum_(g in G) over(chi_rho (g)) chi_rho' (g) = 0
    $

  + Sind $rho, rho'$ äquivalent (isomorph), so gilt:

    $
      (chi_rho, chi_rho') = 1
    $
]

Beweis: 

$
  (chi_rho, chi_rho') = (sum_i rho_(i i), sum_j rho'_(j j))\
  = sum_(i, j) = (rho_(i i), rho'_(j j))
$

Da die Matrixelemente orthogonal sind, folgt:

$
  (rho_(i i), rho'_(j j)) = 0\
  qed
$

Wir nehmen an $chi_rho, chi_rho'$ gleich sind:

$
  (chi_rho, chi_rho') = sum_(i, j) (rho_(i i), rho'_(j j))\
  = sum_(i, j) delta_(i j) 1/(dim(rho))\
  = dim(rho)/(dim(rho)) = 1\
  qed
$

#corollary[korollar][
  Sei $rho iso rho_1 oadd rho_2 oadd ...$ eine Zerlegung der Darstellung $rho$ in irreduzible Darstellungen $rho_i$ auf $G$. Dann sei $chi_rho$ wie gehabt.

  Sei $sigma$ eine irreduzible Darstellung von $G$. Dann ist ist die anzahl von $rho_j$, die äquivalent zu $sigma$ ist, gegeben durch:

  $
    n_sigma = (chi_rho, chi_sigma) =  \#{j | rho_j iso sigma}
  $

  Dies nennt man auch die *Vielfachheit* von $sigma$ in $rho$.
]

Beweis:

$
  chi_rho = sum_(i) chi_(rho_i)\
  => (chi_rho, chi_sigma) = sum_(j) (chi_(rho_j), chi_sigma)\
  = \#{j | rho_j iso sigma}\
  qed
$

#corollary[korollar][
  Sei $rho$ eine irreduzible Darstellung von $G$. Dann ist die Vielfachheit von $rho$ in sich selbst gleich 1:

  $
    n_rho = (chi_rho, chi_rho) = 1
  $

  *Dies ist eine Möglichkeit, die Irreduzibilität nachzuweisen.*
]

Beweis:

Sei $rho$ reduzibel $rho = rho_1 oadd rho_2 oadd ...$ (n >= 2). 

$
  (chi_rho, chi_rho) = sum_(i j) (e_i, e_j) = >= n >= 2 != 1\
$

== Zerlegung der regulären Darstellung

Wir werden sehen, dass die reguläre Darstellung $rho_"reg"$ alle irreduziblen Darstellungen enthält.

#theorem[Satz][Zerlegung der regulären Darstellung][
  Jede irreduzible Darstellung $sigma$ von einer endlichen Gruppe $G$ kommt genau $n_sigma = (chi_"reg", chi_sigma) = dim(sigma)$ mal in der Zerlegung der regulären Darstellung $rho_"reg"$ vor.
]

Beweis:

$
  (chi_"reg", chi_sigma) = 1/abs(G) sum_(g in G) over(chi_"reg" (g)) chi_sigma (g)\
$

Alle terme verschwinden, ausser die, wo $g = 1$.

$
  = 1/abs(G) abs(G) chi_sigma (1)\
  = chi_sigma (1) = dim(sigma)\
  qed
$

#corollary[korollar][
  Der Raum der Funktionen auf $G$ ist endlichdimensional. Da $rho_"reg"$ eine Darstellung ist, ist sie auch endlichdimensional. Dies bedeutet auch, dass es endlich viele irreduzible Darstellungen gibt (bis auf äquivalenz).

  Seien $rho_1, ... , rho_k$ die irreduziblen Darstellungen von $G$ (bis auf Äquivalenz) mit Dimensionen $d_1, ..., d_k$.

  Dann gilt die Dimensionsformel:

  $
    dim(CC(G)) = abs(G)\
    = sum_(j = 1)^k d_j^2
  $

]

Beweis:

$
  abs(G) = dim(CC(G)) = chi_"reg" (1)\
  = sum_(j = 1)^k dim(rho_j) dim(rho_j)\
  "weil" chi_"reg" = sum_(j = 1)^k dim(rho_j) chi_j\
  qed
$

== Satz von Peter - Weyl

#corollary[korollar][Satz von Peter - Weyl][
  Sei $rho_1, ..., rho_k$ eine Liste der inäquivalenten irreduziblen Darstellungen von $G$.

  Seien  $(rho_(alpha, i j) (g))$ die Darstellungsmatrizen bezüglich einer orthogonalen Basen auf den unterliegenden Vektorräumen $V_alpha$.

  Die Funktionen

  $
    (rho_(alpha, i j), alpha = 1, ..., k, i, j = 1, ..., dim(rho_alpha)
  $

  bilden eine orthogonale Basis von $CC(G)$ bezüglich des Skalarprodukts.
]

Beweis:

Wir haben schon gesehen, dass die Vektoren dieser Liste orthogonal und $!= 0$ sind. Also gibt es


$
  sum_alpha (dim(rho_alpha))^2
$

viele Vektoren in der Liste. Diese bilden eine Basis von $CC(G)$, da die Dimension von $CC(G)$ gleich der Anzahl der Elemente in der Liste ist.

$
  qed
$

#corollary[korollar][
  Sei $G$ eine endliche Gruppe. Die Charaktere $chi_1, ..., chi_k$ der irreduziblen Darstellungen von $G$ bilden eine orthogonale Basis auf dem Raum der Klassenfunktionen.

  Klassenfunktionen sind definiter als:

  $
    {f: G -> CC | f(g) = f(h g h^m1) forall h in G} subset CC(G)
  $
]

Beweis:

Wüssten wir schon, dass die Dimension des Raumes der Klassenfunktionen gleich der Dimension der irreduziblen Darstellungen ist, dann wäre die Behauptung klar.

Da wir dies aber noch nicht wissen, zeigen wir dies mit Mittelwertbildung:

Wir wissen $chi_j$ bildet ein Orthonormalsystem auf dem Raum der Klassenfunktionen. Wir müssen nun zeigen, dass dies auch ein Erzeugendensystem ist.

Sei $f: G -> CC$ eine Klassenfunktion.

$
  => f(g) = 1/abs(G) sum_(h in G) f(h g h^m1)\
$

Die $rho_(alpha, i j)$ ist eine Basis von $CC(G)$. Es folgt

$
  f(g) = sum_(alpha i j) lambda_(alpha, i j) rho_(alpha, i j) (g)\
$

für alle $g in G$, für geeignete Koeffizienten $lambda_(alpha, i j)$.

Dies setzen wir in die Gleichung für $f(g)$ ein:

$
  f(g) = sum_(alpha i j) lambda_(alpha, i j) 1/abs(G) sum_(h in G) rho_(alpha, i j) (h g h^m1)\
  = sum_(alpha i j k l) lambda_(alpha, i j) 1/abs(G) sum_(h in G) rho_(alpha, i k) (h) rho_(alpha, k l) (g) rho_(alpha, l j) (h^m1)\
  = sum_(alpha i j k l) lambda_(alpha, i j) 1/abs(G) sum_(h in G) rho_(alpha, i k) (h) rho_(alpha, k l) (g) over(rho_(alpha, l j) (h))\
  = sum_(alpha i j k l) lambda_(alpha, i j) rho_(alpha, k l) (g) (rho_(alpha, j l), rho_(alpha, i k))\
  "weil" (rho_(alpha, i k), rho_(alpha, j l)) = delta_(i j) delta_(k l) 1/dim(rho_alpha)\
  => = sum_(alpha i) lambda_(alpha, i i) sum_k rho_(alpha, k k) (g) 1/dim(rho_alpha)\
  = sum_(alpha i) lambda_(alpha, i i) 1/dim(rho_alpha) chi_alpha (g)\
$

Somit ist $f$ ausgedrückt als Linearkombination der Charaktere $chi_alpha$.

$
  qed
$

*Wir beobachten, dass die Dimension des Raumes der Klassenfunktionen gleich ist wie die Anzahl der Konjugationsklassen.*

#corollary[Korollar][
  Eine endliche Gruppe hat genauso viele Äquivalenzklassen irreduzibler Darstellungen wie Konjugationsklassen.
]

== Die Charaktertafel

Die Charaktertafel einer endlichen Gruppe $G$ ist eine $k cross k$ Tabelle folgender Form:

#table(
  columns: (auto, auto, auto, auto, auto),
  [$GG$], [$c_1$], [$c_2$], [$...$], [$c_k$],
  [$chi_1$], [$chi_1 (c_1)$], [$chi_1 (c_2)$], [$...$], [$chi_1 (c_k)$],
  [$chi_2$], [$chi_2 (c_1)$], [$chi_2 (c_2)$], [$...$], [$chi_2 (c_k)$],
  [$...$], [$...$], [$...$], [$...$], [$...$],
  [$chi_k$], [$chi_k (c_1)$], [$chi_k (c_2)$], [$...$], [$chi_k (c_k)$]
)

$chi_i (c_j)$ bedeutet die Anwending von $chi_i$ auf ein beliebiges Element $g$ der Menge $c_j$.

Beispiel:

$G = S_3$ besteht aus allen Permutationen von ${1, 2, 3}$.

$
  abs(G) = 3! = 6\
$

- Konjugationsklassen: 

  Sei $s$ die Permutation $(1, 2, 3) -> (2, 1, 3)$ (vertausschung).

  Sei $f$ die Permutation $(1, 2, 3) -> (3, 1, 2)$ (cyklisch).

  $
    => S_3 = {1, s, t s t^m1, t^2 s t^(-2), t, s t s^m1}\
  $

  Daraus kann man nun die Konjugationsklassen extrahieren.

  In jeder Gruppe ist $1$ ihre eigene Konjugationsklasse:

  $
    C_1 = [1] = {1}\
    C_2 = [s] = {s, t s t^m1, t^2 s t^(-2)} "ungereade"\
    C_3 = [t] = {t, s t s^m1} "gerade"\
  $

  Gerade und ungerade Permutationen können nicht in der gleichen Konjugationsklasse liegen.

  Wir sehen, wir haben 3 Konjugationsklassen. Wir schauen uns die irreduziblen Darstellungen an. Wir wissen es gibt 3 viele (bis auf äquivalenz). Seien die jeweiligen Dimensionen $d_1, d_2, d_3$. Dimensionsformel:

  $
    sum_i d_i^2 = abs(S_3) = 6
  $

  Raten bringt us auf Dimensionen $(1, 1, 2)$ weil das die einzige Kombination ist, welche die Formel erfüllt.

  Bei einer beliebigen Gruppe gibt es immer die triviale Darstellung auf $CC$

  $
    rho_"triv" (g) = 1\
    dim(rho_"triv") = 1
  $

  Weiterhin haben Permutationsgruppen auch die Vorzeichendarstellung (Signumsdarstellung):

  $
    rho_epsilon (g) = sgn(g)\
    dim(rho_epsilon) = 1
  $

  Zufälligerweise haben wir bereits die Signumsdarstellung. In diesem fall ist $rho_sgn != rho_"triv"$. Somit haben wir eine weitere irreduzible Darstellung.

  Weiter benutzen wir die Charaktertafel:

  #table(
    columns: (auto, auto, auto, auto),
    [6 $S_3$], [$1 C_1$], [$3 C_2$], [$2 C_3$],
    [$chi_"triv"$], [1], [1], [1],
    [$chi_"sgn"$], [1], [-1], [1],
    [$chi_3$], [2], [$a$], [$b$]
  )

  Beim ausfüllen beachten wir, das $chi_"triv"$ immer 1 gibt und dass $C_1$ immer die dimension der Gruppe gibt. $chi_sgn$ gibt das signum. Die beiden letzten Einträge für $chi_3$ folgen aus der orthogonalität.

  Das Skalarprodukt ist definiert als:

  $
    (f, tilde(f)) = 1/abs(G) sum_(g in G) over(f(g)) tilde(f) (g)\
    = 1/abs(G) sum_(j = 1)^k abs(C_j) over(f(C_j)) tilde(f) (C_j)\
  $

  Wir wollen also mit dem Faktor gewichten.

  $
    0 = 1 dot 1 dot 2 dot abs(C_1) + abs(C_2) dot a + 2 dot b\
    0 = 1 dot 2 - 3 dot a + 2 b
    => a = 0\
    => b = -1
  $

  Also haben wir

  #table(
    columns: (auto, auto, auto, auto),
    [6 $S_3$], [$1 C_1$], [$3 C_2$], [$2 C_3$],
    [$chi_"triv"$], [1], [1], [1],
    [$chi_"sgn"$], [1], [-1], [1],
    [$chi_3$], [2], [0], [-1]
  )

- Konstruktion der 2 dimensionale irreduziblen Darstellung:

  Wir haben die (unitäre) Darstellung

  $
    rho: S_3 -> GL(CC^3)\
    rho(sigma) e_i = e_(sigma(i))\
    => chi (1) = 3 "dimension"\
    => chi (s) = 1\
    "weil" rho(s) = mat(0, 1, 0; 1, 0, 0; 0, 0, 1)\
    => chi (t) = 0\
    "weil" rho(t) = mat(0, 0, 1; 1, 0, 0; 0, 1, 0)\
    (chi, chi) = 2 "nicht irreduzibel"\
  $

  Wir suchen eine irreduzible Unterdarstellung von $rho$.
    
  $
    U = span(e_1, e_2, e_3)\
  $

  ist ein invarianter Unterraum. Wir wissen aber $rho|_U = rho_"triv"$

  $
    => U^perp = {mat(x_1;x_2;x_3) | x_1 + x_2 + x_3 = 0}\
  $

  Wir behaupten, dass $rho|_(U^perp)$ ist die gesuchte 2 dimensionale irreduzible Darstellung.

  Um zu zeigen, dass $rho|_(U^perp)$ irreduzibel ist, rechnen wir das Skalarprodukt vom Charakter mit sich selbst aus und zeigen, dass es 1 ist.

  Charakter $chi^perp$ von $rho|_(U^perp)$ erfüllt

  $
    chi = chi^perp + chi_"triv"\
    => chi^perp = chi - chi_"triv" = mat(1 |-> 2; s |-> 0; t |-> -1)\
    (chi^perp, chi^perp) = 1/6 (2^2 * 1 + 0^2 * 3 + (-1)^2 * 2) = 1\
  $

  Wir haben also eine irreduzible Darstellung gefunden.

Durch diese Berechnung haben wir mehrere wichtige Ziele erreicht und fundamentale Eigenschaften der symmetrischen Gruppe $S_3$ aufgedeckt:

*Was wir erreichen wollten:*
Unser Hauptziel war es, alle irreduziblen Darstellungen von $S_3$ zu klassifizieren und explizit zu konstruieren. Da wir bereits wussten, dass es drei Konjugationsklassen gibt, mussten nach der Darstellungstheorie genau drei irreduzible Darstellungen existieren mit Dimensionen, die die Gruppenordnung teilen.

*Die durchgeführten Schritte:*
1. *Dimensionsanalyse*: Durch die Formel $sum_i dim(rho_i)^2 = |G| = 6$ identifizierten wir die möglichen Dimensionen $(1,1,2)$.

2. *Triviale Konstruktionen*: Wir erkannten sofort die triviale Darstellung $rho_"triv"$ und die Signumsdarstellung $rho_"sgn"$, beide eindimensional.

3. *Permutationsdarstellung*: Wir konstruierten die natürliche 3-dimensionale Permutationsdarstellung $rho: S_3 -> GL(CC}^3)$ durch $rho(sigma)e_i = e_{sigma(i)}$.

4. *Charakterberechnung*: Durch explizite Matrixdarstellungen berechneten wir den Charakter $chi$ dieser Darstellung.

5. *Reduzibilität prüfen*: Das Skalarprodukt $(chi, chi) = 2$ bewies, dass diese Darstellung reduzibel ist.

6. *Invariante Unterräume*: Wir identifizierten $U = "span"(e_1 + e_2 + e_3)$ als invarianten Unterraum, der die triviale Darstellung trägt.

7. *Orthogonale Projektion*: Durch Übergang zum orthogonalen Komplement $U^perp$ extrahierten wir die gesuchte 2-dimensionale irreduzible Darstellung.

8. *Irreduzibilitätsnachweis*: Das Skalarprodukt $(chi^perp, chi^perp) = 1$ bestätigte die Irreduzibilität.

*Was uns das über $S_3$ aussagt:*
Diese Konstruktion offenbart die tiefe Struktur der symmetrischen Gruppe $S_3$:

- *Vollständige Klassifikation*: Wir haben nun alle irreduziblen Darstellungen gefunden: zwei eindimensionale (trivial und Signum) und eine zweidimensionale.

- *Geometrische Interpretation*: Die 2-dimensionale Darstellung entspricht der Wirkung von $S_3$ auf die Ebene senkrecht zur Hauptdiagonale im $RR^3$ - geometrisch die Symmetrien eines gleichseitigen Dreiecks.

- *Algebraische Struktur*: Die Zerlegung der Permutationsdarstellung zeigt, wie $S_3$ auf verschiedenen Unterräumen agiert und wie sich komplexere Darstellungen aus einfacheren zusammensetzen.


Bemerkung:

Die Orthonormalität der Charaktertafel sagt, dass die $k cross k$ Matrix

$
  A = (sqrt(abs(C_j)/ abs(G)) chi_i (C_j))_{i, j = 1, ..., k}
$

orthonormale Zeilen hat bezüglich des Standard-Skalarprodukts, also $A in U(n)$. $A$ hat auch orthonormale Spalten bezüglich des Standard-Skalarprodukts.

$
  sum_j chi_j (C_alpha) chi_j (C_beta) = abs(G)/abs(C_alpha) delta_(alpha beta)\
$

== Die Kanonische Zerlegung einer Darstellung

Sei $rho: G -> GL(V)$ (endlichdimensional, komplex).

Wir können $V$ schreiben als direkte Summe von invarianten, irreduziblen ($rho|U_i$ irreduzibel) Unterräumen $V = U_1 oadd U_2 oadd ... oadd U_n$.

Seien $rho_1, ... , rho_k$, $rho_i: G -> GL(V_i)$ die inäquivalenten irreduziblen Darstellungen von $G$.

Wir müssen nun die Unterräume $U_i$ finden, die $rho_i$ tragen.

Sei $W_i = oadd_j U_j| rho|_(U_j) iso e_i$, sodass $rho|_(U_i)$ äquivalent zu $rho_i$ ist.

$
  V = W_1 oadd W_2 oadd ... oadd W_k\ 
$

#theorem[Satz][Kanonische Zerlegung][
  Sei $rho: G -> GL(V)$ eine Darstellung von $G$.

  Dann gibt es eine eindeutige Zerlegung von $V$ in Invariante, irreduzible Unterräume:

  Die Zerlegung $W_i$ ist unabhängig von der Zerlegung in $U_i$.

  Die Projektion $P_i: V -> W_i$ ist eindeutig, sodass $rho|_(W_i)$ äquivalent zu $rho_i$ ist.

  $
    w_1 + ... + w_k |-> w_i = p_i (w_1 + ... + w_k)\
    p_i (v) = (dim(V_i))/(abs(G)) sum_(g in G) over(chi_i (g)) rho(g) v\
  $
]

Beweis:

Aus der 2. Aussage folgt die 1. Aussage, da die $W_i$ eindeutig sind.

1. Wir zeigen, dass die $p_i$ ein Gruppenhomomorphismus sind:

  $
    p_i rho(h) v = (dim(V_i))/(abs(G)) sum_(g in G) over(chi_i (g)) rho(g h) v\
    "substitution" g |-> h g h^m1\
    => = (dim(V_i))/(abs(G)) sum_(g in G) over(chi_i (h g h^m1)) rho(h g) v\
    = (dim(V_i))/(abs(G)) sum_(g in G) over(chi_i (g)) rho(h) rho(g) v\
    = rho(h) p_i (v)\
  $

  Dies ist die Homomorphismuseigenschaft.

2. Für $v in U_j$ ist $rho(g) v in U_j forall g$, da $U_j$ invariant.

  $
    => p_i|_(U_j): U_j -> U_j\
  $

  Wir verwenden das Lemma von Schur 2:

  $
    p_i|_(U_j) = lambda (p_i|_(U_j)) id_{U_j}\
    => p_i|_(U_j) = c_(i j) id_(U_j)
  $

  Um das $c_(i j)$ zu bestimmen, berechnen wir die Spur:

  $
    c_(i j) dim(U_j) = tr(p_i|_(U_j))\
    = (dim(V_i))/(abs(G)) sum_(g in G) over(chi_i (g)) tr(rho(g)|_(U_j))\
    = dim(V_i) (chi_i, chi_(rho|_(U_j)))\
    => c_(i j) = cases(0\, rho_i != rho|_(U_j), 1 \, rho_i iso rho|_(U_j))\
  $

Die Zerlegung von $V= W_1 oadd ... oadd W_k$ heisst die *kanonische Zerlegung* von $V$ bezüglich der Darstellung $rho$.

Wie $W_j$ nennt man *isotypische Komponenten*.

Bemerkung:

Jede endlichdimensionale, komplexe Darstllung einer endlichen Gruppe $G$ lässt sich also schreiben als:

$
  V iso oadd_(j = 1)^k (V_j oadd ... oadd V_j)\
  "Notation": W oadd ... oadd W iso W oprod CC^n\
  => = oprod_(j = 1)^k (V_j oprod CC^(n_j))\
  "mit" n_j = (chi_j, chi_rho)\
$

Der Isomorphismus ist eindeutig bestimmt bis auf Automorphismen der Form:

$
  oadd_(j = 1)^k id_(V_j) oprod F_j\
  "mit" CC^(n_j) -> CC^(n_j) "beliebig"\
$

== Beispiel: Die Diedergruppen

Ziel:

Finde alle irreduziblen Darstellungen der Diedergruppe $D_n = {R^a S^b| a = 0, ..., n-1; b = 0, 1}$.

Wir haben die Symmetrien der Rotation eines n-Ecks und die Symmetrien der Spiegelung.

Sei $rho: D_n -> GL(V)$ irgendeine Darstellung. Wir definieren $over(R) = rho(R), over(S) = rho(S)$.

Diese können nicht geliebig sein wegen $R^n = id$ und es gilt:

$
  => over(R^n) = id_V\
  => over(S^2) = id_V\
  S R = R^m1 S "oder" S R S^m1 = R^m1\
  => over(S) over(R) = over(R^m1) over(S)\
$

Sind umgekehrt $over(S), over(R) in GL(V)$, sodass die obigen Gleichungen gelten, dann gilt:

$
  rho(R^a S^b) = over(R)^a over(S)^b\
$

und ist eine Darstellung von $D_n$.

Beweis:

Da die Produktregeln $R^a R^b R^a' S^b' = R^(a + a' - 2 a' b) S^(b+b')$ von $rho$ respektiert wird.

=== Eindimensionale Darstellungen

$
  dim V = 1\
  => over(R^n) = over(S^2) = 1 = over(R^2)\
  => over(R), over(S) in {plus.minus 1}
$

und $over(R)= 1$ falls $n$ ungerade.

$
  n "gerade" => 4 "Dst." over(S), over(R) = {plus.minus 1}\
  n "ungerade" => 2 "Dst." over(S) = {plus.minus 1}, over(R) = 1\
$

=== Zweidimensionale Irreduzible Darstellungen

Sei $(rho, V)$ eine Darstellung von $D_n$ mit $dim(V) = 2$.

Sei $v$ ein Eigenvektor von $over(R) = rho(R)$ mit Eigenwert $epsilon$.

$
  over(R)^n = 1 => epsilon^n = 1\
  => epsilon = e^(2 pi i j/n), j= 0, ..., n-1\
  over(S) over(R) = over(R^m1) over(S)\
  => over(S) over(R) v = epsilon over(S) v = over(R^m1) over(S) v\
  => over(R) (over(S) v) = epsilon^m1 (over(S) v)\
$

Dies bedeutet, dass $over(S) v$ ein Eigenvektor von $over(R)$ ist mit Eigenwert $epsilon^m1$.

Wäre $over(S) v prop v$, so wäre $span(v)$ invariant, also $rho$ nicht irreduzibel.

Wir wollen $rho$ irreduzibel, also $(v, over(s) v)$ bilden Basis von $V$.

In dieser Basis:

$
  over(S) = mat(0, 1; 1, 0), over(R) = mat(epsilon, 0; 0, epsilon^m1)\
$

Diese Matrizen definieren eine Darstellung von $D_n$.

Wir müssen nun noch zeigen, dass diese Darstellungen irreduzibel und inäquivalent sind.

Falls $epsilon = epsilon^m1 <=> epsilon^2 = 1$, so ist die Darstellung nicht irreduzibel, da $span(mat(1;1))$ bzw. $span(v + over(S) v)$ ist invariant.

Wir nemhen an $epsilon != epsilon^m1$, also $j != 0, n/2$. In den anderen Fällen ist die Darstellung irreduzibel, denn falls er reduzibel wäre, dann gäbe es ein $w != 0 in V$, sodass $span(w)$ invariant ist.

Falls $w$ ein gemeinsamer Eigenvektor von $over(R)$ und $over(S)$ ist, gäbe es einen widerspruch, da $over(R)$ und $over(S)$ nicht gleichzeitig diagonalisiert werden können, da sie nicht kommutieren.

Vertauschen $epsilon <-> epsilon^m1 <=> j <-> n - j$ ergibt äquivalente Darstellungen.

Falls ${epsilon, epsilon^m1} != {epsilon', epsilon'^m1} =>$ Entsprechende Darstellungen sind inäquivalent.

Wir listen die inäquivalenten irreduziblen Darstellungen der Dimension 2 auf:

Sei $rho_j$ die Darstellung wie oben, mit $epsilon = e^(2 pi i j/n)$.

$
  rho_j, j = 1,2,... , "floor"((n-1)/2)\
$

sind die inäquivalenten irreduziblen Darstellungen von $D_n$ der Dimension 2.

Behauptung: 

Wir haben alle irreduziblen Darstellungen von $D_n$ gefunden.

Beweis:

Dimensionsformel:

$
  2 n = abs(G) = sum_i dim(rho_i)^2\
$

Wir unterscheiden $n$ gerade:

$
  1^2 + 1^2 + 1^2 + 1^2 + 2^2 (n/2 -1) = 4(1 + n/2 + 1) = 2 n\
$

$n$ ungerade:

$
  2 dot 1^2 + 2^2 (n-1)/2 = 2(1 + n - 1) = 2 n\
  qed
$

Charaktere der zweidimensionalen Darstellungen:

$
  chi_j = chi_(rho_j)\
  chi_j (R^a) = 2 cos(2 pi j/n)\
  chi_j (R^a S) = 0\
$

Schlussbemerkung:

Die meisten gier für endliche Gruppen gezeigten aussagen gelten weiterhin für kompakte Gruppen, wenn man ersetzt:

$
  1/abs(G) sum_(g in G) (-) -> integral_G (-)
$

Weiterhin können wir viele der Aussagen für nicht-kompakte Gruppen benutzen, mittels einer Lie-Algebra.










