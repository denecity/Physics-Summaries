#import "../../../lib/lib.typ": *
#show: frame-style(styles.boxy)


= Darstellungen von Gruppen

Nun haben wir die Symmetriegruppen bestimmt. Dies reicht nocht nicht um das System zu charakterisieren, da es viele Systeme mit den selben Symmetrien gibt.

Wir müssen noch herrausfinden, wie eine jeweilige Gruppe auf diephysikalischen Elemente des Systems wirkt. 

#definition[Definition][Darstellung][
  Eine (reele bzw. komplexe) *Darstellung* einer Gruppe $G$ auf einem (reelen oder komplexen) Vektorraum $V != {0}$ ist ein Gruppenhomomorphismus $rho: G -> GL(V)$ (Abbildung von Gruppenelementen auf invertierbare lineare Abbildungen).

  $V$ heisst dann *Darstellungsraum* von $rho$. 

  Also ordnet $rho$ jedem Gruppenelement $g in G$ eine invertierbare lineare Abbildung $rho(g) in GL(V)$ zu, so dass

  $
    rho(g h) = rho(g) circ rho(h)
  $

  Man nennt $rho(g)$ auch *Darstellung* oder *Datstellungsmatrix* von $g$ (Matrix setzt Basis und Dimension voraus).

  Es gilt:

  $
    rho(1) = id_V\
    rho(g^m1) = rho(g)^m1\
  $
]

Beispiele:

- Triviale Darstellung:
  $
    V = CC\
    rho(g) = id_V = 1 in CC\
  $

- $
    G = S_n, V= CC^n, "Standardbasis"\
    rho(sigma) e_i = e_(sigma(i))\
  $

- $
    G = ZZ_n, V = CC\
    rho(m) = e^(2 pi i m / n) in GL(1, CC)\
  $

- $
    G = O(3), V = CC^oo (RR^3)\
    (rho(g) f) (x) = f(g^m1 x)\
  $

#definition[Definition][Reguläre Darstellung][
  Die *reguläre Darstellung* einer endlichen Gruppe $G$ ist die Darstellung $rho_"reg": G -> GL(CC(G))$ auf der Menge

  $
    CC(G) = { f: G -> CC}\
    (rho_"reg" (g) f) (x) = f(g^m1 x)
    f in CC(G), g, x in G
  $
  
]

== Vollständig Reduzibel

#definition[Definition][Vollständig Reduzibel][
  Eine Darstellung $rho: G -> GL(V)$ heisst *vollständig reduzibel*, wenn es eine Basis $B$ von $V$ gibt, so dass die Darstellungsmatrix von $rho(g)$ in dieser Basis diagonalisierbar ist für alle $g in G$.

  Das heisst, es gibt eine Basis $B$ von $V$, so dass die Darstellungsmatrix von $rho(g)$ in dieser Basis eine Diagonalmatrix ist.
]

== Unitäre Datstellung

#definition[Definition][Unitäre Darstellung][
  Eine Darstellung $rho$ von $G$ auf dem $CC-$Vektorraum $V$ mit Skalarprodukt $( , )$ heisst *unitär*, falls $rho(g)$ unitär für alle $g in G$ ist.

  (d.h. $(rho(g) u, rho(g) v) = (u, v)$
]

Dann gilt:

$
  rho(g)^m1 = rho(g^m1) = rho(g)^*\
$

#theorem[Satz][Unitäre Darstellungen][
  Endlich dimensionale unitäre Darstellungen sind vollständig reduzibel.
]

Weil:

Sei $W subset V$ ein invarianter Unterraum der Darstellung $(rho, V)$. Dann ist $W^perp = {v in V | (v, w) = 0}$ invariant, denn 
$
  forall v in W^perp, g in G => (rho(g)v, w)\
  = (v, rho(g)^*)\
  = (v, rho(g^m1) w) = 0\
  => rho(g) v in W^perp
$

Da $V = W oadd W^perp$ ist, ist $W^perp$ ein Invarianter Komplement zu $W$.

#theorem[Satz][Endliche Gruppen][
  Sei $(rho, V)$ eine Darstellung einer endlichen Gruppe $G$ auf einem endlich-dimensionalen $CC-$Vekrorraum $V$.

  Dann existiert ein Skalarprodukt $( , )$ auf $V$, so dass $(rho, V)$ bezüglich diesem Skalarprodukt unitär ist.

  Dies bedeutet auch, dass endlich dimensionale $CC-$Darstellungen endlicher Gruppen vollständig reduzibel sind.
]

Beweis:

Wir verwenden Mittelwertsbildungen. Wir fangen an mit einem beliebigen (nicht notwendigerweise unitären) Skalarprodukt $( , )_0$ auf $V$.

Wir setzen:

$
  (v, w) = sum_(g in G) (rho(g) v, rho(g) w)_0\
$

Dann ist $( , )$ ein Skalarprodukt, denn $(rho(g) -, rho(g) -)_0$ ist ein Skalarprodukt. Die Summe von Skalarprodukten ist ein Skalarprodukt.

$rho$ ist unitär bezüglich $( , )$:

$
  (rho(h) v, rho(h) w)\
  = sum_(g in G) (rho(g) rho(h) v, rho(g) rho(h) w)_0\
  = sum_(g in G) (rho(g h) v, rho(g h) w)_0\
  = (v, w)\
  "setze" tilde(g) = g h\
  => = sum_(tilde(g) in G) (rho(tilde(g)) v, rho(tilde(g)) w)_0 = (v, w)
$

Dies ist ein Trick den man sehr oft verwenden kann, um unitäre Darstellungen zu konstruieren.

== Lemma von Schur

#theorem[Satz][Schur][
  Sei $(rho_1, V_1), (rho_2, V_2)$ endlich-dimensionalle Darstellungen der Gruppe $G$.

  Wir untersuchen den Vektorraum

  $
    Hom_G (V_1, V_2) = { phi: V_1 -> V_2 | phi(rho_1 (g) v) = rho_2(g) (phi (v))\
  $

  Seien $(rho_1, V_1), (rho_2, V_2)$ *irreduzible* endlich-dimensionale Darstellungen von $G$.

  - $
      Phi in Hom_G (V_1, V_2) => Phi = 0 "oder " phi "Isomorphismus"\
      "und" rho_1, rho_2 "äquivalent"\
    $

  - $
      phi in Hom_G (V_1, V_1) => phi = lambda id_(V_1), lambda in CC\
    $

  Wenn wir zwei irreduzible Darstellungen haben, welche nicht äquivalent sind, dann gibt es zwischen diesen beiden Darstellungen keine Abbildung ausser dem null-Homomorphismus.

  Falls man in den selben Darstellungsraum abbildet, dann ist die Abbildung ein Skalar mal die Identität.
]

Beweis:

- Das Bild und der Kern sind invariante Unterräume:

  $
    Ker(V_1) subset V_1, Im(V_2):
    1. phi(v) = 0 => phi(rho_1(g) v) = rho_2(g) (phi(v)) = 0\
    => rho_1(g) v in Ker(phi)\
    2. w = phi(v)\
    rho_2(g) w = rho_2(g) phi(v) = phi(rho_1(g) v) in Im(phi)\
  $

  Da $rho_1, rho_2$ irreduzibel sind, ist:

  $Ker(phi) = {0}$ oder $V_1$ und oder $Im(phi) = {0}$ oder $V_2$.

  - Falls $Ker(phi) = V_1$ dann ist $phi = 0$ per Definition.

  - Falls $Ker(phi) = 0$ dann ist $phi$ injektiv (auch $phi != 0$). Dann ist $Im(phi)$ auch nicht der Nullraum, also $Im(phi) = V_2$. Dann ist $phi$ auch surjektiv, also ein Isomorphismus.

- Hier nutzen wir, dass der Körper über $CC$ ist. Sei $lambda$ ein Eigenwert von $phi$, also $phi - lambda id_(V_1) in Hom_G(V_1, V_1)$ nicht invertierbar ($det = 0$). 
  
  Wir benutzen den vorherigen Satz und sehen, dass $tilde(phi) = 0$ oder invertierbar. Invertierbar haben wir schon ausgeschlossen, also ist $tilde(phi) = 0$.

  $=> phi = lambda id_(V_1)$


Die physikalische Interpretation ist, dass zwei irreduzible Darstellungen nicht miteinander wechselwirken können, wenn sie nicht äquivalent sind, da der Operator dann einfach Null wäre.

#corollary[Korollar][Abelsche Gruppen][
  Für abelsche Gruppen: Jede irreduzible endlich-dimensionale $CC-$ Darstellung ist eindimensional.
]

Beweis:

Bei abelschen Gruppen gilt, dass beliebige zwei Elemente kommutieren. Das heisst auch, dass die Darstellungsmatrizen kommutieren. Das heisst, dass die Darstellungsmatrizen diagonalisiert werden können.

$
  g h = h g => rho(g) rho(h) = rho(h) rho(g)\
  forall g in G => rho(g) in Hom_G(V, V)\
  "weil" rho(g) rho(h) = rho(g h) = rho(h g) = rho(h) rho(g)\
  => rho(g) lambda_g id_V, lambda_g in CC\

$

Dies impliziert, dass jeder beliebige Unterraum von $V$ invariant ist. $=> dim(V) = 1$.


== Recap

- Eine Darstellung wird dadurch klassifiziert, wie reduzibel sie ist und welche irreduziblen Darstellungen es gibt.

- Alle unitären Darstellungen sind vollständig reduzibel.

- Alle endlichen Gruppen haben eine unitäre Darstellung, also auch vollständig reduzibel.