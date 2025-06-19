#import "lib.typ": *
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