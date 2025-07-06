#import "lib.typ": *
#show: frame-style(styles.boxy)

= Crashkurs Tensorprodukt

== Definition

#definition[Definition][Tensorprodukt][
  Seien $V, W KK$-Vektorräume.

  $
    (e_i)_(i in I) "Basis von" V\
    (f_j)_(j in J) "Basis von" W\
  $

  Dann ist

  $
    V tensor W = sum_(i in I, j in J) lambda_(i, j) in KK e_i tensor f_j
  $

  der Vektorraum der endlichen Linearkombinationen.

  Also: $(e_i tensor f_j)$ bilden eine Basis von $V tensor W$.

  + Andere Wahl der Basen ergibt einen isomorphen Vektorraum.

  + Sind $V, W$ endlichdimensional, dann ist $dim(V tensor W) = dim(V) dot dim(W)$.

  + Notation: Für $v = sum_(i in I) v_i e_i in V, w = sum_(j in J) w_j f_j in W$ schreibe:

    $
      v tensor w = sum_(i in I, j in J) (v_i, w_j) e_i tensor f_j
      => - tensor -: V times W -> V tensor W
    $

  + Sind $U, V, W$ $KK$-Vektorräume, so gilt:

    $
      (U tensor V) tensor W iso U tensor (V tensor W)\
      (d_k tensor e_i) tensor f_j -> d_k tensor (e_i tensor f_j)\
    $
]