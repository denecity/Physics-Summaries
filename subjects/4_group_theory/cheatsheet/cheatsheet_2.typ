#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Group Theory Cheatsheet",
  author: "Denis Titov",
  language: "GER",
)

= Gruppen

#section[Gruppe][
  *Gruppe* $(G, *)$: Menge mit Verknüpfung $G times G -> G$, $(g,h) |-> g h$
  - *Assoziativität*: $(g h)k = g(h k)$
  - *Einselement*: $exists bb(1): bb(1) g = g bb(1) = g$
  - *Inverse*: $forall g in G  hsmall exists g^(-1): g g^(-1) = g^(-1) g = bb(1)$
  - *Abelsch*: $g h = h g$ (kommutativ)

  *Direktes Produkt*: $circ = circ_(G cross H): (g, h) circ (g', h') = (g circ g', h circ h')$

  *Semidirektes Produkt*: $G times.r_phi H$ mit $rho: H -> "Aut"(G)$, $(g, h) circ (g', h') = (g rho(h)(g'), h h')$ 

  *Normalteiler*: $N "normalteiler" G$ falls $forall n in N, g in G: g n g^(-1) in N$

  *Untergruppe*: $H subset G != emptyset$ falls $h_1, h_2, h^m1 in H => h_1 h_2^(-1) in H$ etc.

  *Stab*: $Stab(x) = {g in G | g x = x}$ alle Elemente die x fixieren

  *Bahnen*: $"Orb"(x) = {g x | g in G}$ alle Bilder von x unter G

  *Zentrum*: $Z(G) = {z in G | forall g in G: z g = g z}$

  *Bahnensatz*: $|G| = |"Orb"(x)| dot  |Stab(x)|$

  
]

#section($"Gruppe:" ZZ_n$)[
  $
    ZZ_n = ZZ\/n ZZ #hspace "addition modulo n" #hspace [0], [1], ..., [n-1]\
  $
  Alle irreps sind eindimensional. Konjugationsklassen bestehen aus einzelnen Elementen.

  $omega = exp((2 pi i)/n) #hspace omega^n = 1$

#grid(
  columns: 2,
  column-gutter: 1em,
  character_table(
    (0, 1, 2),
    ($chi_0$, $chi_1$, $chi_2$),
    (1, 1, 1, 1, $omega$, $omega^2$, 1, $omega^2$, $omega^4$),
    group: $ZZ_3$
  ),

  character_table(
    (0, 1, 2, 3),
    ($chi_0$, $chi_1$, $chi_2$, $chi_3$),
    (1, 1, 1, 1, 1, $omega$, $omega^2$, $omega^3$, 1, $omega^2$, $omega^4$, $omega^6$, 1, $omega^3$, $omega^6$, $omega^9$),
    group: $ZZ_4$
  )
)
]

#section($"Gruppe:" S_n$)[
  Permutation von $n$ Elementen. Die Ordnung von $S_n$ ist $n!$. Für jede partition von $n$ gibt es eine irrep. Die Konjugationsklassen entsprechen den Zykelstrukturen der Permutationen. $abs(S_n) = n!$

  #grid(
    columns: 2,
    column-gutter: 1em,
    row-gutter: 0.5em,
    character_table(
      ($e$, $(1 2)$),
      ($chi_"triv"$, $chi_"sgn"$),
      (1, 1, 1, -1),
      group: $S_2$,
      class_sizes: (1, 1)
    ),

    character_table(
      ($e$, $(1 2)$, $(1 2 3)$),
      ($chi_"triv"$, $chi_"sgn"$, $chi_"3d"$),
      (1, 1, 1, 1, $-1$, 1, 2, 0, $-1$),
      group: $S_3$,
      class_sizes: (1, 2, 3)
    ),

    character_table(
      ($e$, $(1 2)$, $(1 2) (3 4)$, $( 1 2 3)$, $(1 2 3 4)$),
      ($chi^(4)_"triv"$, $chi^(1^4)_"sgn"$, $chi^(2,2)_"2d"$, $chi^(3,1)_"3d"$, $chi^(2,1,1)_"3d"$),
      (1,1,1,1,1,1, $-1$,1,1,$-1$,2,0,2,$-1$,0,3,1,$-1$,0,$-1$,3,$-1$,$-1$,0,1),
      group: $S_4$,
      class_sizes: (1,6,3,8,6)
    ),
    $
      "Young Tableau: Für Partitionen von"\ n "in" k "teile ist die dimension der irrep"\ 
      "gegeben durch"\ dim = n!\/(Pi_{"boxes"} "hook"("box")) ,\
      "Wobei die Hook Length gegeben ist"\
      "als anzahl der Boxen rechty und unter"\
      "der Box" + 1". Zum Beispiel für "n = 7\
      "und Partition" (4,2,1):
    $
  )

  #grid(
    columns: 2,
    column-gutter: 1em,
    young_tableau(
      (4,2,1),
      (6, 4, 2, 1, 3, 1, 1)
    ),
    $
      => "dim" = (7 dot 6 dot 5 dot 4 dot 3 dot 2 dot 1)/(6 dot 4 dot 2 dot 1 dot 3 dot 1 dot 1) = 35\
    $
  )
]


#section($"Gruppe:" D_n$)[
  $
    D_2 = {1, R, S, R S}\
    "mit" S R S = R, "abelbsch", D_2 iso ZZ_2 cross ZZ_2\
    D_n = {R^k, R^k S | k = 0, ..., n-1} = {1, R, R^2, ..., R^(n-1), S, R S, ..., R^(n-1) S}\
    R: "Rotation" 2 pi\/n, S: "Spiegelung" hspace abs(D_n) = 2 n\
  $
  

  #grid(
    columns: 2,
    column-gutter: 1em,
    row-gutter: 0.5em,
    character_table(
      ($e$, $R$, $S$, $R S$),
      ($chi_"triv"$, $chi_"sgnR"$, $chi_"sgnS"$, $chi_"sgnRS"$),
      (1,1,1,1,1,1,$-1$,$-1$,1,$-1$,1,$-1$,1,$-1$,$-1$,1),
      group: $|D_2| = 4$,
      class_sizes: (1,1,1,1)
    ),
    character_table(
      (1, $R, R^2$, $S, R S, R^2 S$),
      ($chi_"triv"$, $chi_"sgn"$, $chi_"2d"$),
      (1, 1, 1, 1, 1, $-1$, 2, $-1$, 0),
      group: $|D_3| = 6$,
    ), 
    character_table(
      (1, $R^2$, $R, R^3$, $S, R^2 S$, $R S , R^3 S$),
      ($chi_A_1$, $chi_A_2$, $chi_B_1$, $chi_B_2$, $chi_E^"2d"$),
      (1, 1, 1, 1, 1, 1, 1, 1, $-1$, $-1$, 1, 1, $-1$, 1, $-1$, 1, 1, $-1$, $-1$, 1, 2, $-2$, 0, 0, 0),
      group: $|D_4| = 8$
    ),

    $
      bold("Konjugationsklassen"):\
      "Für n ungerade:"\
      1[e], 2[R], 2[R^2], ..., 2 [R^((n-1)/2)], n[S]\
      "Für n gerade:"\
      1[e], 1[R^(n/2)], 2[R], 2[R^2], ...,\
       2[R^(n/2-1)],n/2[S], n/2[R S]\
    $
  )

]

#section($"Orthogonale Gruppen" O(3), SO(3)$)[
  $
    O(3) = {A | A^T A = I, det(A) = plus.minus 1}\
    SO(3) = {A | A^T A = I, det(A) = 1}\
    U(n) = {A in GL(n, CC) | A^* A = bb(1)}\
    SU(n) = {A in U(n) | det(A) = 1}
  $
  Orthogonale Gruppen erhalten Längen und Winkel. Jede Drehung in $R^3$ kann durch eine Achse $hat(n)$ und einen Winkel $alpha$ beschrieben werden. Die Matrixdarstellung ist gegeben durch die Rodrigues Formel:

  $
    R(hat(n), alpha) = I + sin(alpha) K + (1 - cos(alpha)) K^2 hspace
    "wobei" K = mat(0, -n_3, n_2; n_3, 0, -n_1; -n_2, n_1, 0) \
  $

  Für jedes Platonische Solid gibt es eine endliche Untergruppe $G$ von $O(3)$, die die Symmetrien des Körpers beschreibt. Für reine Rotationen (orientation preserving) gilt: $G^+ = G inter SO(3) subset SO(3)$.

  Tetrahedron: $  G iso S_4 hsmall abs(S_4) = 24 hspace G^+ iso A_4 hsmall abs(A_4) = 12$

  Cube: $ G iso S_4 cross ZZ_2 hsmall abs(S_4 cross ZZ_2) = 48 hspace G^+ iso S_4 hsmall abs(S_4) = 24$

  Dodeca, Isoca: $ G iso A_5 cross ZZ_2 hsmall abs(A_5 cross ZZ_2) = 120 hspace G^+ iso A_5 hsmall abs(A_5) = 60$
]

= Darstellungen

#section("Darstellungen")[
  $
    rho: G -> GL(V) hspace "check" forall g, h in G: rho(g) in GL(V) "and" rho(g h) = rho(g) rho(h) \
  $

  *Reguläre Darstellung*:

  *Invarianter Underraum*: $W subset V: rho(g) W subset W hsmall forall g in G$. Man kommt mit Gruppendarstellungen nicht aus dem Unterraum raus.

  *Underdarstellung*: Darstellung auf invariantem Unterraum. *Jede irrep* ist eine Underdarstellung und hat einen assoziierten *invariantem Unterraum*. 

  *Vollständige Reduzibilität*: Jede Darstellung endlicher Gruppe ist vollständig reduzibel, d.h. sie zerfällt in direkte Summe von irreps.

  *Unitäre Darstellung*: Darstellung auf einem unitären Vektorraum, d.h. $rho(g)^m1 = rho(g)^*$. Dann vollständig reduzibel und $rho <-> W => W^perp $ invariant.

  *Schurs Lemma*: Sei $(rho_1, V_1), (rho_2, V_2)$ irreps, komplex, endlichdimensional:

  1. Jede lineare Abbildung $T: V_1 -> V_2$ mit $T rho_1(g) = rho_2(g) T$ für alle $g in G$ ist entweder Nullabbildung oder Isomorphismus.

  2. Jede lineare Abbildung $T: V -> V$ mit $T rho(g) = rho(g) T$ für alle $g in G$ ist ein Vielfaches der Einheitsabbildung, d.h. $T = lambda bb(1)$ für ein $lambda in CC$.

  Beispiel: 

  *Abelsche Gruppen*: Abelsch wenn $g h = h g hsmall forall g, h in G$. Alle irreps sind eindimensional.
]

#section("Character")[
  $chi(rho) = tr(rho(g))$ konst auf Konjugationsklassen $chi_rho (g) =chi_rho (h g h^m1)$
  $
    rho iso rho' => chi_rho = chi_rho' hsmall chi_rho (id) = dim(V) hsmall chi_(rho oadd rho') = chi_rho + chi_rho' hsmall chi_(rho tensor rho') = chi_rho dot chi_rho' \
    chi_rho^* = overline(chi_rho) hspace chi_"reg" (g) = cases(abs(G) "if" g=1, 0 "else" )\
    rho bold("unitär") => chi_rho (g^m1) = overline(chi_rho (g)), hspace "ord"(g)= k => rho(g)^k = id\
    chi_rho (g) = dim rho "teiler" k => hspace abs(chi_rho (g)) <= dim(rho)\
    {g in G|_(chi_rho (g)) = m} "normalteiler" 
  $
]

#section("Skalarprodukt")[
  $
    (chi_1, chi_2) = 1/abs(G) sum_g overline(chi_1 (g)) chi_2 (g) = 1/abs(G) sum_"konj" abs(c) overline(chi_1 (c)) chi_2 (c)\
    (chi_rho, chi_rho') = cases(1 "if" rho iso rho', 0 "else") hspace rho "irrep" => (chi_rho, chi_rho) = 1\
    (chi_rho, chi_rho_1) = "Multiplicity of " rho_1 "in" rho\
    (chi_rho, chi_rho) = sum ("Multiplicities of irreps in" rho)^2\
    rho "irrep" => abs(G) = sum_"irrep" (dim rho_i)^2 hspace chi_1, ..., chi_k "ONB in" CC^k
  $
]

#section("Character Table")[
  $
    abs(G) = sum_"irrep" (dim rho_i)^2 hspace "Anzahl Konjugationsklassen = Anzahl irreps"\
    (chi_i, chi_j) = delta_(i j) hspace "Orthogonalität der Zeilen"\
    chi_i in.not RR => exists chi_j: chi_j = overline(chi_i) hspace "komplexe Darstellungen treten paarweise auf"\
    "if" dim(rho_i) = 1 "then" forall rho_j "irrep" => rho_i tensor rho_j "another irrep" rho_k "with" chi_k = chi_i dot chi_j\
    g^k = id => chi_rho (g) = tr(rho(g)) = sum_(r=1)^(dim rho) lambda_r "with" lambda_r^k = 1 hspace chi_rho(g) <= dim(rho)\

  $
]

#section("Isotypische Komponenten und Kanonische Zerlegung")[
  Let $K in CC^n$ be physical transform such that $K rho(g) = rho(g) K$ for all $g in G$. Then $CC^n = oadd_lambda V_lambda$ and $V_lambda = rho_i^(oadd m_lambda)$ is invariant under $rho$ and an Isotypical Component (all copies of one irrep type bundled). For each $lambda$ irrep type $rho_i$ there is a projector $p_lambda = (dim rho_i)/abs(G) sum_g overline(chi_i (g)) rho(g)$ projecting onto $V_lambda = p_lambda (V )$.
]

= Eigenwert mit Symmetrien

= Platinische Körper

= Drehgruppe und Lorentzgruppe

= Lie Gruppen und Lie Algebren

= Darstellungen von SU(2) und SO(3)