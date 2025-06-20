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

