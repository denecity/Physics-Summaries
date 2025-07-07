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

== Mehrfaches Tensorprodukt

$
  V_1 tensor V_2 tensor ... tensor V_n = V_1 tensor (V_2 tensor (... tensor V_n)...)
$

Basis:

$
  (e_(1, i_i) tensor ... tensor e_(n, i_n))_(i_1 in I_1, ..., i_n in I_n )\
$

== Abbildungen von Tensorprodukten

+ Lineare Abbildung $V tensor W -> U$ ist das gleiche wie eine bilineare Abbildung $V times W -> U$.

+ Seien $F: V -> V', G: W -> W'$ linear. Dann ist

  $
    F tensor G: V tensor W -> V' tensor W'
  $

  definiert durch

  $
    (F tensor G)(e_i tensor f_j) = F(e_i) tensor G(f_j)\
    "bzw" (F tensor G)(v tensor w) = F(v) tensor G(w)\
  $

  Endlichdimensional: $A = (a_(i j))$ Matrix von $F$, $B = (b_(k l))$ Matrix von $G$.

  Matrix von $F tensor G$ ist dann:

+ Ordnung der Basiselemente von $V tensor W$ hat 2 mögliche Sortierungen:

  + $e_1 tensor f_1, e_2 tensor f_1, ... , e_n tensor f_1, e_1 tensor f_2, ...$

    oder

  + $e_1 tensor f_1, e_1 tensor f_2, ... , e_1 tensor f_m, e_2 tensor f_1, ...$

  In der Ordnung 1. ist die Matrix von $F tensor G$ gegeben durch:

  $
    mat(A b_(1 1), A b_(1 2), ..., A b_(1 m);
    A b_(2 1), A b_(2 2), ..., A b_(2 m);
    ...;
    A b_(n 1), A b_(n 2), ..., A b_(n m))\
  $

  In der Ordnung 2. ist die Matrix von $F tensor G$ gegeben durch:

  $
    mat(a_(1 1) B, a_(1 2) B, ..., a_(1 n) B;
    a_(2 1) B, a_(2 2) B, ..., a_(2 n) B;
    ...;
    a_(m 1) B, a_(m 2) B, ..., a_(m n) B)\
  $

Anwendung:

Tensorprodukte sind sehr konkret und nützlich.

== lineares Gleichungsystem:

  $
    A x = y, A in mattyp(m, n) (RR), y in RR^m\
  $

  Aber oft kommen Gleichungssysteme in einer anderen Form vor:

  $
    A X B = Y, A in mattyp(M, m) , B in mattyp(n, N), X in mattyp(M, N)\
  $

  Dies wäre möglich mit unserer klassischen Methode aber Tensoren geben uns eine bessere Sichtweise.

  Die obige Gleichung ist äquivalent zu einem klassischen

  $
    C x = y, x RR^(n dot m)\
  $

  Die Idee: lineare Abbildungen:

  $
    mattyp(m, n) (RR) -> mattyp(M, N) (RR)\
    x |-> A x B\
  $

  bildet ab: $u v^T |-> A u v^T B = (A u) (B^T v)^T$.

  Identifizieren: $mattyp(p, q) iso R^p tensor RR^q => u tensor v |-> u v^T$.

== Symmetrisches und äusseres Produkt

Betrachte einen Vektorraum $V$ mit Basis $(e_i)_(i = 1, ..., m)$.

Sei $V^(tensor N) = V tensor V tensor ... tensor V$. Die Basis ist dann gegeben durch:

$
  (e_(i i) tensor ... tensor e_(i N))
$

$
  dim(V^(tensor N)) = m^N
$

$V^(tensor N)$ trägt eine Darstellung $rho$ von $S_N$ durch Vertauschung der Faktoren:

$
  rho(sigma in S_N) (V_1 tensor ... tensor V_N) = V_(sigma^m1 (1)) tensor ... tensor V_(sigma^m1 (N))\
$

Wahl der Konvention:

+ Das symmetrische Produkt ist:

  $
    tilde(S^N V) = {x in V^(tensor N) | rho(sigma) x = x forall sigma in S_N} subset V^(tensor N)
  $

+ Das äussere Produkt ist:

  $
    tilde(and^N V) = {x in V^(tensor N) | rho(sigma) x = sgn(sigma) x forall sigma in S_N} subset V^(tensor N)
  $

+ Alternative Definition:

  $
    S^N V = V^(tensor N) \/ span({x - rho(sigma) x| rho in S_N, x in V^(tensor N)})\
    and^N V = V^(tensor N) \/ span({x - sgn(sigma) rho(sigma) x| rho in S_N, x in V^(tensor N)})\
  $

#theorem[Satz][
  $
    tilde(S^N V) -> S^N V\
    tilde(and^N V) -> and^N V\
  $

  sind Isomorphismen.
]

Eine Basis von $S^N V$ ist gegeben durch:

$
  [e_(i_1) tensor ... tensor e_(i_N) | 1 <= i_1 <= ... <= i_N]\
$

Eine Basis von $and^N V$ ist gegeben durch:

$
  [e_(i_1) tensor ... tensor e_(i_N) | 1 <= i_1 < ... < i_N]\
$

$
  dim(S^N V) = binom(m + N - 1, N)\
  dim(and^N V) = binom(m, N) = 0 "falls" N > m\
$

== Tensorprodukte von $SU(2)$-Darstellungen

Seien $rho: G -> GL(V), rho': G -> GL(V')$ zwei Darstellungen. Dann ist die Tensorproduktdarstellung gegeben durch:

$
  rho tensor rho': G -> GL(V tensor V')\
  g |-> rho(g) tensor rho'(g)\
  ((rho(g) tensor rho'(g))(v tensor v')) = (rho(g)v) tensor (rho'(g)v')\
$

Ziel: Für $G = SU(2)$ Zerlege $rho_n tensor rho_n'$ in irreduzible Darstellungen.

Es gilt: $rho tensor (rho' tensor rho'') iso (rho tensor rho') tensor rho''$.

Ist $G$ eine Lie-Gruppe mit Lie-Algebra $g = Lie(G)$, so gilt

$
  (rho tensor rho')_* (X in g) = (rho_* (X)) tensor id_V' + id_V tensor (rho'_* (X))\
$

Wichtige Unterscheidung. Also auf der Gruppe wirkt man gleichzeitig von links und rechts. Bei der Lie-Algebra wirkt man wie oben beschrieben.

Beweis:

$
  dv(, t)|_(t=0) (rho tensor rho')(exp(t X))\
  = dv(, t)|_(t=0) (rho(exp(t X)) tensor rho'(exp(t X)))\
  = (dv(, t)|_(t=0) rho(exp(t X))) tensor id_V' + id_V tensor (dv(, t)|_(t=0) rho'(exp(t X)))\
  = (rho_* (X)) tensor id_V' + id_V tensor (rho'_* (X))\
  qed
$

#definition[Definition][
  Seien $tau: g -> gl(V), tau': g -> gl(V')$ zwei Darstellungen der Lie-Algebra $g = Lie(G)$. Dann ist die Tensorproduktdarstellung gegeben durch:

  $
    tau tensor tau': g -> gl(V tensor V')\
    X |-> tau(X) tensor id_V' + id_V tensor tau'(X)\
  $
]

$G = SU(2)$

Wie zerfällt $rho_n' tensor rho_n'' = rho$ in irreduzible Darstellungen $rho_n$ von $SU(2)$?

Dazu betrachten wir die zugehörige $CC$-lineare Darstellung der Lie_Algebra $sl(2, C)$, und die Wirkung der Basisvektoren $e, f, h in sl(2, C)$.

Basis von $V_n': v'_0, ... , v'_n'$. Darstellung $tau_n' = (rho_n')_*$ erfüllt

$
  H v'_j = tau_n' (h) v'_j = (n' - 2j) v'_j\
  E v'_j = tau_n' (e) v'_j = j (n' + 1 - j) v'_(j - 1)\
  F v'_j = tau_n' (f) v'_j = v'_(j + 1)
$

Analog für Darstellung $tau_n''$ von $V_n''$.

$V_n' tensor V_n''$ hat Basis

$
  v'_j tensor v''_k, j = 0, ..., n', k = 0, ..., n''\
$

Es gilt mit $tau = rho_* = (rho_n' tensor rho_n'')$:

$
  tau(h) (v'_j tensor v''_k) = (tau_n' (h) v'_j) tensor v''_k + v'_j tensor (tau_n'' (h) v''_k)\
  = (n' - 2j + n'' - 2k) (v'_j tensor v''_k)
  = (n' + n'' - 2(j + k)) (v'_j tensor v''_k)\
$

Wir bekommen sogar Eigenwerte von $tau(h)$ $lambda = n' + n'' - 2(j + k)$. So oft wie wir Wege haben die Summe $j + k$ aus unseren Grenzen $n', n''$ zu bilden. 

#image("image-2.png")

Sei nun $rho iso oadd_alpha rho_alpha tensor CC^(n-alpha)$. Eigenwerte von $tau(h)$ sind: Jede Kopie von $tau_alpha$ trägt bei $alpha, alpha-2, ..., - alpha$.

$rho_alpha tensor CC^(n-alpha) =>$ alle kommen mit Vielfachheit $n_alpha$ vor.

$=>$ Vergleiche Eigenwerte + Vielfachheiten:

$
  n_alpha = 0, alpha > n' + n''\
  n_(n' + n'') = 1\
  n_(n' + n'' - 1) = 0\
  n_(n' + n'' - 2) = 1\
  n_(n' + n'' - 3) = 0\
  n_alpha = 0 "falls" n' + n'' = alpha mod 2\
  n_(n' + n'' - 2 p) =1 "für" p = 0, 1, ... , min(n', n'')\
  n_alpha = 0 "sonst"\
$

#theorem[Satz][Clebsch-Gordan-Zerlegung][
  $
    rho_n' tensor rho_n'' iso rho_(n' + n'') oadd rho_(n' + n'' - 2) oadd ... oadd rho_(abs(n' - n''))\
  $

  Die irreduzible Unterdarstellung $rho_(n' + n'' - 2l)$ wird aufgespannt durch

  $
    w_l, F w_l, ..., F^(n' + n'' - 2l) w_l\
    F = tau(f)\
    "mit" w_l = sum_(j=0)^l (-1)^j ((n'-j)! ( n'' - l + j)!)/(j! (l - j)!) v'_j tensor v''_(l - j)\
  $
]