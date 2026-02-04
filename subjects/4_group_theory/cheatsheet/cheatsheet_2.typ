#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Group Theory Cheatsheet",
  author: "Denis Titov",
  language: "GER",
)

= Finite Groups

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

  For a Group $G$ acting on a set $X$:

  - Orbit of point $x$:  $G x = Orb(x) = {g dot x | g in G} subset.eq X$

  - Stabilizer of point $x$:  $Stab_G(x) = {g in G | g dot x = x} subset.eq G$

  - fixed-point set of $g$:  $Fix_X(g) = {x in X | g dot x = x} subset.eq X$

  - Orbit Space:  $X\/G = {Orb(x) | x in X}$

  *Fixpoint Lemma*: $|X\/G| = 1/abs(G) sum_(g in G) abs(Fix_X(g))$

  $sum_(g in G) abs(Fix(g)) = sum_(x in X) abs(Stab(x))$

  Stabilizer sizes are constant on orbits: $x, y in X$ in same orbit $=> abs(Stab(x)) = abs(Stab(y))$

  Iff $Stab(x) = {1} forall x: abs(X\/G) = abs(X) / abs(G)$

  Let $S = {(g, x) in G cross X: g dot x = x}$, then $abs(S) = sum_g abs(Fix(g)) = sum_x abs(Stab(x))$. Then also $sum_(x in O) abs(Stab(x)) = abs(O) dot abs(G)/abs(O) = abs(G)$

  If $V = CC^X$ (functions on a finite set) with permutation action, then: $chi(g) = tr(rho(g)) = abs(Fix(g))$

  Orbits Partition $X$: $X = union.sq_(O in X\/G) O$
]

#section("Group Homomorphisms")[
  Map: $phi: G -> H$. Homomorphism if $phi(g_1 g_2) = phi(g_1) phi(g_2)$

  Implications:
  $
    phi(id_G) = id_H hspace phi(g^m1) = phi(g)^m1 hspace phi(g^n) = phi(g)^n\
    ker(phi) = {g in G | phi(g) = id_H} "normalteiler" G\
    im(phi) = {h in H | exists g in G: phi(g) = h} "subgroup of" H\
    G/ker(phi) iso im(phi) 
  $

  Examples:
  $
    det(A B) = det(A)  
  $
]

#section("Representations")[
  $rho:G->GL(V)$ is homomorphism where $V$ is a vector space.

  Checklist:
  $
    forall g in G, rho(g) in GL(V) "invertible, linear"\
    forall g, h in G, rho(g h) = rho(g) rho(h)\
  $

  Implications:
  $
    rho(g h) = rho(g) rho(h) hspace rho(id_G) = id_V hspace rho(g^m1) = rho(g)^m1\
    "Invariant Subspace:" W subset V: rho(g) W subset W hsmall forall g in G\
    "Irreducible: no invariant subspaces other than "{0}" and "V\
    "Equivalent:" rho_1 iso rho_2 "if" exists T: V_1 -> V_2 "invertible" hsmall "with" T rho_1(g) = rho_2(g) T forall g in G\
    "Character:" chi_rho(g) = tr(rho(g)) "constant on conjugacy classes"\
  $

  Commuting Operator $=>$ Block Diagonal (Schur).

  Fixed Point = Trace: if $V = CC^X$, then $chi(g) = abs(Fix(g))$


]

#section($"Gruppe:" ZZ_n$)[
  $
    ZZ_n = ZZ\/n ZZ #hspace "addition modulo n" #hspace [0], [1], ..., [n-1]\
  $
  Alle irreps sind eindimensional. Konjugationsklassen bestehen aus einzelnen Elementen. $abs(ZZ_n) = n$. If any group has an element of order $abs(G)$, then it is cyclic and isomorphic to $ZZ_n$.

  $omega = exp((2 pi i)/n) #hspace omega^n = 1$

#grid(
  columns: 3,
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
  ),

  "A direct product of cyclic groups is abelian and all its irreps are one-dimensional."
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
      ($chi_"triv"$, $chi_"sgn"$, $chi_"2d"$),
      (1, 1, 1, 1, $-1$, 1, 2, 0, $-1$),
      group: $S_3$,
      class_sizes: (1, 3, 2)
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
#section("Group: A_n")[
  Alternierende Gruppe: gerade Permutationen in $S_n$. Ordnung: $abs(A_n) = n!\/2$.

  #grid(
    columns: 2,
    column-gutter: 1em,
    row-gutter: 0.5em,
    character_table(
      ($e$, $(1 2)(34)$, $(1 2 3)$, $(1 3 2)$),
      ($chi_1$, $chi_1'$, $chi_1''$, $chi_3$),
      (1,1,1,1,1,1,$omega$, $omega^2$, 1,1,$omega^2$, $omega$, 3, -1, 0, 0),
      group: $abs(A_4)=12$,
      class_sizes: (1, 3, 4, 4)
    ),
    character_table(
      ($e$, $(1 2)(3 4)$, $(1 2 3)$, $(1 2 3 4 5)$, $(1 3 5 2 4)$),
      ($chi_1$, $chi_3$, $chi_3'$, $chi_4$, $chi_5$),
      (1, 1, 1, 1, 1, 3, $-1$, 0, $(1 + sqrt(5))/2$, $(1 - sqrt(5))/2$, 3, -1, 0, $(1 - sqrt(5))/2$, $(1 + sqrt(5))/2$, 4, 0, 1, -1, -1, 5, 1, -1, 0, 0),
      group: $A_5$,
      class_sizes: (1, 15, 20, 12, 12)
    ),
  )
]

= Infinite Groups

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

#section($"Euklidische Gruppe" IO(3)$)[
  Transforms $x |-> R x + b$, with $R in O(3), b in RR^3 => M = mat(R, b; 0, 1)$

  #todo("more details")
]

#section($"Lorentzgruppe" O(1,3), SO(1,3)$)[
  
]

= Darstellungen

#section("Representations")[
  $rho:G->GL(V)$ is homomorphism where $V$ is a vector space.

  Checklist:
  $
    forall g in G, rho(g) in GL(V) "invertible, linear"\
    forall g, h in G, rho(g h) = rho(g) rho(h)\
  $

  Implications:
  $
    rho(g h) = rho(g) rho(h) hspace rho(id_G) = id_V hspace rho(g^m1) = rho(g)^m1\
    "Invariant Subspace:" W subset V: rho(g) W subset W hsmall forall g in G\
    "Irreducible: no invariant subspaces other than "{0}"and"V\
    "Equivalent:" rho_1 iso rho_2 "if" exists T: V_1 -> V_2 "invertible" hspace "with" T rho_1(g) = rho_2(g) T forall g in G\
    "Character:" chi_rho(g) = tr(rho(g)) "constant on conjugacy classes"\
  $

  Commuting Operator $=>$ Block Diagonal (Schur).

  Fixed Point = Trace: if $V = CC^X$, then $chi(g) = abs(Fix(g))$


]

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

#todo("combine the two representation sections")

#section("Maschkes Theorem (condition for full decomp into irreps)")[
  Let $G$ be a finite group and $V$ a finite-dim vec-space over $K$, where $rho: G -> GL(V)$ is a rep. If the characteristic of $K$ does not divide $|G|$, then every invariant subspace $W subset V$ has an invariant complement $W'$ such that $V = W oadd W'$ and every vector can be written uniquely as $w + w'$. 
  
  For $CC$ or $RR$, $"char"(K) = 0$, so always holds. For $"char"(FF_p) = p$, not always.

  Also every finite-dim rep of a finite group over such a field is a direct sum of irreps.
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

#section("Phsyical Setups")[
  + Vectorspace $V = CC^n$ represents states: displacements, wavefunctions, etc
  + Group Action $rho: G -> GL(V)$ represents physical symmetries: rotations, reflections, translations
  + Operator $A: V -> V$ represents physical observable: Hamiltonian, Inertia Tensor, Stiffness Matrix, etc

  Symmetry Condition: $rho(g) A = A rho(g) forall g in G => A$ preserves symmetries of each irrep.

  Consequences: Schurs Lemma $=>$ if $V$ irreducible, then $A = lambda bb(1) =>$ 1 irrep = 1 eigenvalue (degeneracy 1).

  If $V = V_1 oadd V_2 oadd ... oadd V_k$ with $V_i$ irreducible, then $A$ has at most $k$ distinct eigenvalues.

  If some irrep $rho_i$ appears $m_i$ times in the decomposition of $V$, then each eigenvalue corresponding to this irrep has at least degeneracy $m_i$. 
]

#section("Recipe for Eigenvalue Problems with Symmetries")[
  + Check overall symmetry decomposition of underlying object (e.g. molecule, platonic solid).
  + Determine which decomposition describes the modified object (e.g. with defects, external fields, etc).
  + Compute character of the representation on the modified object (usually fixpoint counting).
  + Decompose character into irreps to find multiplicities. $m_i = (chi_rho, chi_i)$.
  + Use multiplicities to determine eigenvalue degeneracies.
  + If you need actual eigenvectors, construct projectors onto isotypical components and solve smaller eigenvalue problems there. $p_i = (dim W_i)/abs(G) sum_g overline(chi_i (g)) rho(g)$.

  Always check if the question asks for proper or improper symmetries (i.e. $O(3)$ vs $SO(3)$).
]

#section("Marked Structures Recipe")[
  + Identify ambient symmetry group $G$ of unmarked structure (eg $G^+ subset SO(3)$)
  + Determine symmetry group $H subset G$ of marked structure (usually via fixpoint counting). Unually reduce platonic to dihedral groups $D_n$ or dihedral to cyclic groups $ZZ_n$.
  + Compute stabilizers and orbits of representative features (vertex, edge, face).
    $
      H = Stab_G(x) = {g in G | g x = x} hspace
    $
    With Orbit-Stab trick: Compute orbit size by "how many distinc places can the marking be moved by symmetries?". Then:
    $
      abs("Orb"(x)) = abs(G)\/abs(Stab_G(x)) hspace => hspace abs(H) = abs(G)\/abs("Orb"(x))\
    $
]

#section("Unphysical Modes")[
  For Eigenvalue problems we solve
  $
    V(y^* + x) approx V(y^*) + 1/2 x^TT H x hspace "for" y^* "equilibrium"\
  $
  This $H$ is usually out $A$. Then $ddot(x) = - A x => A x_0 = omega^2 x_0$.

  Unphysical modes correspond to eigenvalue 0 of $A$ (rigid body motions, gauge freedoms, etc). They dont change $V$ and thus dont have a rstoring force. Their number can be determined by symmetry analysis of $A$.

  For a System where translation and rotation are physically possible, there are always 6 unphysical modes in $RR^3$ (3 translations + 3 rotations) and 3 unphysical modes in $RR^2$ (2 translations + 1 rotation). If some symmetries are broken (e.g. fixed point, plane, axis), the number of unphysical modes is reduced accordingly.
]

#section("Traces of Common Orthogonal Matrices")[
  - Identity: $tr(id_n) = n$
  - Minus Identity: $tr(-id_n) = -n$
  - Permutation Matrix: $tr(P) = $ number of fixed points of the permutation
  - O(2):
    - Rotation by $alpha$: $tr(R(alpha)) = 2 cos(alpha), hsmall 120 deg = 3/2 pi: -1, hsmall 90 deg = pi/2: 0, hsmall 180 deg = pi: -2, hsmall 0 deg = 0: 2$
    - Reflection across origin: $tr(S) = 0$
  - O(3):
    - Rotation by $alpha$ around axis: $tr(R(alpha)) = 1 + 2 cos(alpha) hsmall 120 deg = 3/2 pi: 0, hsmall 90 deg = pi/2: 1, hsmall 180 deg = pi: -1, hsmall 0 deg = 0: 3$
    - Reflection across plane in origin: $tr(S) = 1$
    - Invesion (x -> -x): $tr(-id_3) = -3$
]

= Platonic Solids

#section("Markings rule")[
  $
    G subset O(3) hspace G^+ := G inter SO(3)\
    "If a feature" x "is marked, then" Stab(x) = {g in G | g x = x}\
    abs(G) = abs("Orb"(x)) dot abs(Stab(x))\
  $
  Oriented markings (arrow on face, directed edge) usually drop $D_n -> ZZ_n$.
]

#section("Tetrahedron")[
  $
    G iso S_4 hsmall abs(G) = 24 hspace G^+ iso A_4 hsmall abs(G^+) = 12 hsmall  "symmetry via vertex permut."\
    "Proper:" Stab_(G^+)("vertex/face") iso ZZ_3, Stab_(G^+)("edge") iso ZZ_2\
    "Chain:" A_4 supset ZZ_3, ZZ_2 supset {1}\
    "Corresp:" e <-> id, hsmall (1 2 3) <-> 120 deg "rot vertex-face", hsmall (1 3 2) <-> 240 deg "rot vertex-face"\
    (12)(34) <-> 180 deg "rot edge"\
    "Improper:" Stab_G("vertex/face") iso D_3, Stab_G("edge") iso D_2 iso ZZ_2 cross ZZ_2\
    "Chain:" S_4 supset A_4, D_3, D_2 supset {1}\
    "Corresp:" (e) <-> id, hsmall (1 2) <-> "ref across edge", hsmall (1 2 3) <-> 120 deg "rot vertex-face",\
    (1 2)(3 4) <-> 180 deg "rot edge", hsmall (1 2 3 4) <->  90 deg "turn through edges + reflection"\
  $
]

#section("Cube")[
  $
    "Cube/Octa:" G iso S_4 cross ZZ_2 hsmall abs(G) = 48 hspace G^+ iso S_4 hsmall abs(G^+) = 24\
    S_4" is permutations of body diagonals"\
    "Proper:" Stab_(G^+)("vertex") iso ZZ_3, Stab_(G^+)("face") iso ZZ_4, Stab_(G^+)("edge") iso ZZ_2\
    "Chain:" S_4 supset ZZ_4, ZZ_3, ZZ_2 supset {1}\
    "Corresp:" e <-> id, hsmall (1 2 3) <-> 120 deg "rot vertex", hsmall (1 2 3 4) <-> 90 deg "rot face"\
    (1 2)(3 4) <-> 180 deg "rot face", hsmall (1 2) <-> 180 deg "rot edge"\
     
    "Improper:" Stab_G("vertex") iso D_3, Stab_G("face") iso D_4, Stab_G("edge") iso D_2\
    "Chain:" S_4 cross ZZ_2 supset S_4 supset D_4, D_3, D_2 supset {1}\
    "Corresp:" (e, 1) <-> id, hsmall (e, -1) <-> "inversion", hsmall ((1 2), 1) <-> 180 deg "rot edge",\
    ((1 2 3), 1) <-> 120 deg "rot vertex",hsmall ((1 2 3), -1) <-> "rot vertex + inversion",\
    ((1 2 3 4), 1) <-> 90 deg "rot face", hsmall ((1 2 3 4), -1) <-> "rot face + inversion",\
    ((1 2)(3 4), 1) <-> 180 deg "rot face", hsmall ((1 2)(3 4), -1) <-> "rot face + inversion"\
    ((1 2)), 1) <-> 180 deg "rot edge", hsmall ((1 2), -1) <-> "rot edge + inversion"\
  $
]

#section("Dodeca / Icosa")[
  $
    G iso A_5 cross ZZ_2 hsmall abs(G) = 120 hspace G^+ iso A_5 hsmall abs(G^+) = 60\
    "Proper:" Stab_(G^+)("vertex") iso ZZ_5, Stab_(G^+)("face") iso ZZ_3, Stab_(G^+)("edge") iso ZZ_2\
    "Chain:" A_5 supset ZZ_5, ZZ_3, ZZ_2 supset {1}\
    "Improper:" Stab_G("vertex") iso D_5, Stab_G("face") iso D_3, Stab_G("edge") iso D_2\
    "Chain:" A_5 cross ZZ_2 supset A_5 supset D_5, D_3, D_2 supset {1}\
  $
]

= Lie Gruppen und Lie Algebren

#section("Infinite Groups")[
  - $GL(n, RR), GL(n, CC) hspace GL(n, K) = {A in Mat(n, K)|det A != 0}$

    $gl(n, K) = Mat(n, K)hspace $ Basis: $E_(i j), 1 "at" (i, j), "else" 0$

    $dim gl(n, RR) = dim GL(n, RR) = n^2 hsmall dim gl(n, CC) = dim GL(n, CC) = 2 n^2$
    GL(n, RR) has 2 connected components: $det>0$ and $det<0$.
  
  - $SL(n, RR), SL(n, CC) hspace SL(n, K) = {A in GL(n, K)|det A = 1}$
    $sl(n, K) = {X in gl(n, K)|tr(X) = 0}$

    Basis: $E_(i j), i != j; H_k = E_(k k) - E_(k+1 k+1)$ for $k = 1, ..., n-1$

    $dim sl(n, RR) = n^2 - 1 = dim SL(n, RR) = n^2-1$

    $dim sl(n, CC) = dim SL(n, CC) = 2(n^2 - 1)$

    $SL(2, CC)$: Jordan-type $D mat(a, b; 0, a^m1) D^m1$ used for connectedness

  - $O(n) = {A in GL(n, RR)|A^T A = id} hspace SO(n) = {A in O(n)|det A = 1}$

    $o(n) = so(n) = {X in gl(n, RR)|X^T + X = 0}$

    Basis: $F_(i j) = E_(i j) - E_(j i), 1 <= i < j <= n$

    $dim so(n) = dim o(n) = dim SO(n) = dim O(n) = (n(n-1))/2$

    Every $A in O(n)$ can be block-diagonalized $A = O D O^m1$ with $D$ being 2d rotation matrix or $plus.minus 1$.

    $O(n)$ has 2 connected components: $det>0$ and $det<0$.

  - $U(n) = {A in GL(n, CC)|A^* A = id} hspace SU(n) = {A in U(n)|det A = 1}$

    $u(n) = {X in gl(n, CC)|X^* + X = 0} hspace su(n) = {X in u(n)|tr(X) = 0}$
    Basis: $i E_(k k), E_(i j) - E_(j i), i(E_(i j) + E_(j i))$ for $1 <= k <= n, 1 <= i < j <= n$

    $dim u(n) = dim U(n) = n^2 hspace dim su(n) = dim SU(n) = n^2 - 1$

    Every $B in U(n)$ is unitary diagonalizable $B = U D U^*$ with $D = diag(lambda_1, ..., lambda_n), abs(lambda_i) = 1$.

    $su(2) = {X in Mat(2, CC)|X = mat(i a, b + i c; -b + i c, -i a), a, b, c in RR} iso RR^3$ 
    
    via $X |-> (a, b, c)$

    $SU(2)$ Standard Basis with Pauli Matrices: $t_1 = i sigma_1 = mat(0, i; i, 0), t_2 = i sigma_2 = mat(0, 1; -1, 0), t_3 = i sigma_3 = mat(i, 0; 0, -i)$,
    Bracket: $[t_j, t_k] = - sum_(l=1)^3 2 epsilon_(j k l) t_l$.

  - Symplect. $Sp(2n, RR) = {A in GL(2n, RR)|A^T J A = J} hspace J = mat(0, id_n; -id_n, 0)$

    $sp(2n) = {X in gl(2n, RR)|X^T J + J X = 0} = {mat(A, B_1; B_2, -A^T)|B_i^T = B_i}$

    Basis: $A$ is free block: $n^2$, symmetric $B_i$: $n(n+1)/2$ each 
    
    $=> dim Sp(2n) = dim sp(2n) = n(2n + 1)$

  - Lorentz $O(1, 3) = {Lambda in GL(4, RR)| Lambda^T eta Lambda = eta}$
  
    $SO^+ (1, 3) = {Lambda in O(1, 3)|det Lambda = 1, Lambda_00 >= 1}$

    $so(1, 3) = {X in Mat(4, RR)| X^T eta + eta X = 0}$

    Any element $A = R_1 L(chi) R_2, hsmall R_1, R_2 in SO(3), chi in RR$, where 
    
    $L(chi) = mat(cosh(chi), sinh(chi), 0, 0; sinh(chi), cosh(chi), 0, 0; 0, 0, 1, 0; 0, 0, 0, 1)$ in x, with $L(chi_1) L(chi_2) = L(chi_1 + chi_2)$
    Components: $O(1, 3)$ has 4 connected components:
    
    $det>0, Lambda_00>1; det>0, Lambda_00< -1; det<0, Lambda_00>1; det<0, Lambda_00< -1$.

    Orthochrone means $Lambda_00 >= 1$. $abs(Lambda_00) >= 1$ always. 
    
    Time reversal with $T = diag(-1, 1, 1, 1)$

  - $SL(2, CC) = {A in GL(2, CC)|det A = 1}$
  
    $sl(2, CC) = {X in gl(2, CC)|tr(X) = 0}$

    Identifies Minkovski vectors with 2x2 matrices $hat(x)$: $X |-> A X A^*$, thus:
    $SL(2, CC)\/{plus.minus id} iso SO^+(1, 3)$

  - Euclidean $IO(3) = {mat(R, b; 0, 1)| R in O(3), b in RR^3}$
    
    $ = {x |-> R x + b|A in O(3), b in RR^3}$

    $(A_1, b_1) (A_2, b_2) = (A_1 A_2, A_1 b_2 + b_1)$
    $IO(3) iso O(3) times.l RR^3$

    $io(3) = {mat(Omega, v; 0, 0)| Omega in o(3), v in RR^3}$
    Basis: ${J_1, J_2, J_3, P_1, P_2, P_3}$ where $J_i$ are $so(3)$ generators and $P_i$ translations ($b$).

  - Poincare $IO(1, 3) = {mat(Lambda, a; 0, 1)| Lambda in O(1, 3), a in RR^4}$
  
    $ = {x |-> Lambda x + a|Lambda in O(1, 3), a in RR^4}$

    $(Lambda_1, a_1) (Lambda_2, a_2) = (Lambda_1 Lambda_2, Lambda_1 a_2 + a_1)$
    $IO(1, 3) iso O(1, 3) times.l RR^4$

    $io(1, 3) = so(1, 3) times.l RR^4 = {mat(X, v; 0, 0)| X in so(1, 3), v in RR^4}$

  - $H_0 = {X in Mat_(2, 2) (CC)|X = X^*, tr(X) = 1}$
    $
      A in H_0 => A = mat(z, x + i y; x - i y, -z) hspace (x, y, z) in RR^3\
      det(A) = - (x^2 + y^2 + z^2)\
      "Thus" H_0 iso RR^3 "with metric" det(A - lambda id) = lambda^2 + (x^2 + y^2 + z^2)\
    $
]
#todo("what is tensoring characters?")

#todo("what are common irreps for character table generation")

#section("Isometry")[
  Is a distance preserving map: $d(x, y) = d(f(x), f(y))$ of a metric space. Every isometry of Euclidean space is of the form $x |-> A x + b$ with $A in O(n), b in RR^n$. The set of all isometries forms the Euclidean Group $IO(n) = O(n) times.l RR^n$.
]

#section("Calculating Lie Algebra of a Lie Group")[
  *IF* group is defined as matrices satisfying certain equations:
  + Take smooth curve $A(t)$ in group with $A(0) = id$
  + Plug in constraints on group matrices into $A(t)$
  + Differentiate equations at $t = 0$ to get constraints on $A dot(0)$
  + The set of all $X = A'(0)$ satisfying these constraints is the Lie Algebra

  Determinant: $dv(, t) det(A(t)) = det(A(t)) tr(A(t)^m1 A'(t))$

  *Adjoint Reps*: $Ad(g) = g X g^m1, hsmall ad(X) Y = dv(,t)|_0 exp(t X) Y exp(-t X)$

  $
    bold("Example:") SU(n) = {A in GL(n, CC)|A^* A = id, det A = 1}\
    A(0) = id, X = dv(, t)|_0 A(t) => hspace dv(, t)|_0 det(A(t)) = det(id) tr(id X) = tr(X) = 0\
    dv(, t)|_0 A(t)^* A(t) = A'(0) A^* + A A'(0)^*
    = id^* X + X^* id = X + X^* = 0 hspace \
    => su(n) = {X in gl(n, CC)|X^* + X = 0, tr(X) = 0}\
  $

  *IF* Group defined as $F(A) = 0$ of some map $F$:
  + $frak(g) = ker(dd(F))_I$ (compute the jacobian at $id$)

  *IF* Group defined via Exponential Map:
  + $frak(g) = <X | exp(t X_i) in G forall t in RR>$
]

#section("Lie Bracket")[
  Commutatior: $[g, h] = g h g^m1 h^m1$. For Matrix Lie Groups: $[X, Y] = X Y - Y X$  
]

= Reps of SU(2) und SO(3)

= Tensor Products and Clebsch-Gordan
