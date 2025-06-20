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
