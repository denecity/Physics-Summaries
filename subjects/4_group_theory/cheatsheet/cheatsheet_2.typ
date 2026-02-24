#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Group Theory Cheatsheet",
  author: "Denis Titov",
  language: "ENG",
)

= Finite Groups

#section[Group][
  - *Group* $(G, *)$: set with operation $G times G -> G$, $(g, h) |-> g h$.
    - *Associativity*: $(g h) k = g (h k)$.
    - *Identity element*: $exists bb(1): bb(1) g = g bb(1) = g$.
    - *Inverse*: $forall g in G, hsmall exists g^(-1): g g^(-1) = g^(-1) g = bb(1)$.
    - *Abelian*: $g h = h g$ (commutative).

  - *Direct product*: $circ = circ_(G cross H): (g, h) circ (g', h') = (g circ g', h circ h')$.

  - *Semidirect product*: $G times.r_phi H$ with $rho: H -> "Aut"(G)$, $(g, h) circ (g', h') = (g rho(h)(g'), h h')$.

  - *Normal subgroup*: $N "normal subgroup" G$ if $forall n in N, g in G: g n g^(-1) in N$.

  - *Subgroup*: $H subset G != emptyset$ if $h_1, h_2, h_1^m1 in H => h_1 h_2^(-1) in H$.

  - *Stabilizer*: $Stab(x) = {g in G | g x = x}$ (elements fixing $x$).

  - *Orbit*: $"Orb"(x) = {g x | g in G}$ (images of $x$ under $G$).

  - *Center*: $Z(G) = {z in G | forall g in G: z g = g z}$.

  - *Orbit-stabilizer*: $|G| = |"Orb"(x)| dot |Stab(x)|$.

    For a group action $G$ on a set $X$:
    - Orbit of $x$: $G x = "Orb"(x) = {g dot x | g in G} subset.eq X$.
    - Stabilizer of $x$: $Stab_G(x) = {g in G | g dot x = x} subset.eq G$.
    - Fixed-point set of $g$: $Fix_X(g) = {x in X | g dot x = x} subset.eq X$.
    - Orbit space: $X\/G = { "Orb"(x) | x in X }$.

  - *Fixpoint lemma*: $|X\/G| = 1/abs(G) sum_(g in G) abs(Fix_X(g))$.

    $sum_(g in G) abs(Fix_X(g)) = sum_(x in X) abs(Stab(x))$.
    Stabilizer sizes are constant on orbits: $x, y$ in the same orbit $=> abs(Stab(x)) = abs(Stab(y))$.
    If $Stab(x) = {1} forall x$: $abs(X\/G) = abs(X)/abs(G)$.
    Let $S = {(g, x) in G cross X: g dot x = x}$, then $abs(S) = sum_g abs(Fix_X(g)) = sum_x abs(Stab(x))$.
    If $V = CC^X$ (functions on a finite set) with permutation action, then $chi(g) = tr(rho(g)) = abs(Fix_X(g))$.
    Orbits partition $X$: $X = union.sq_(O in X\/G) O$.
]


#section[Group Homomorphisms][
  - *Homomorphism*: $phi: G -> H$ with $phi(g_1 g_2) = phi(g_1) phi(g_2)$.

  - *Consequences*:
  $
    phi(id_G) = id_H hspace phi(g^m1) = phi(g)^m1 hspace phi(g^n) = phi(g)^n\
    ker(phi) = {g in G | phi(g) = id_H} "normal subgroup" G\
    im(phi) = {h in H | exists g in G: phi(g) = h} "subgroup of" H\
    G/ker(phi) iso im(phi) 
  $

  - *Example*:
  $
    det(A B) = det(A)  
  $
]

#section[Representations][
  - *Representation*: $rho: G -> GL(V)$ is a homomorphism, $V$ is a vector space.

  - *Checklist*:
    $
      forall g in G, rho(g) in GL(V) "invertible, linear"\
      forall g, h in G, rho(g h) = rho(g) rho(h)\
    $

  - *Consequences*:
    $rho(g h) = rho(g) rho(h) hspace rho(id_G) = id_V hspace rho(g^m1) = rho(g)^m1$

    - *Invariant Subspace*: $W subset V: rho(g) W subset W hsmall forall g in G$

    - *Irreducible*: no invariant subspaces other than ${0}$ and $V$

    - *Equivalent*: $rho_1 iso rho_2$ if $exists T: V_1 -> V_2$ 
    
    - *invertible*: with $T rho_1(g) = rho_2(g) T forall g in G$

    - *Character*: $chi_rho(g) = tr(rho(g))$ constant on conjugacy classes

  - *Schur*: Commuting operator $=>$ block diagonal form.

  - *Fixed point = trace*: If $V = CC^X$, then $chi(g) = abs(Fix(g))$.


]

#section[Group: $ZZ_n$][
  - *Definition*:
    $
      ZZ_n = ZZ\/n ZZ #hspace "addition modulo n" #hspace [0], [1], ..., [n-1]\
    $

  - *Properties*: All irreps are one-dimensional. Conjugacy classes are single elements. $abs(ZZ_n) = n$. If a group has an element of order $abs(G)$, then it is cyclic and isomorphic to $ZZ_n$.

  - *Root*: $omega = exp((2 pi i)/n) #hspace omega^n = 1$.

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

#section[Group: $S_n$][
  Permutations of $n$ elements. The order of $S_n$ is $n!$. For each partition of $n$ there is an irrep. Conjugacy classes correspond to cycle structures of permutations. $abs(S_n) = n!$.

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
      ($e$, $(1 2)$, $(1 2)\ (3 4)$, $( 1 2 3)$, $(1 2 3 4)$),
      ($chi^(4)_"triv"$, $chi^(1^4)_"sgn"$, $chi^(2,2)_"2d"$, $chi^(3,1)_"3d"$, $chi^(2,1,1)_"3d"$),
      (1,1,1,1,1,1, $-1$,1,1,$-1$,2,0,2,$-1$,0,3,1,$-1$,0,$-1$,3,$-1$,$-1$,0,1),
      group: $S_4$,
      class_sizes: (1,6,3,8,6)
    ),
    [
      Young Tableau: For partitions of $n$ into $k$ parts, the dimension of the irrep
      is given by $dim = n!/(Pi_{"boxes"} "hook"("box"))$. The hook length is
      the number of boxes to the right and below the box + 1. For example, for $n = 7$
      and partition $(4,2,1)$:
    ]
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


#section[Group: $D_n$][
  $
    D_2 = {1, R, S, R S}\
    "with" S R S = R, "abelian", D_2 iso ZZ_2 cross ZZ_2\
    D_n = {R^k, R^k S | k = 0, ..., n-1} = {1, R, R^2, ..., R^(n-1), S, R S, ..., R^(n-1) S}\
    R: "rotation" 2 pi\/n, S: "reflection" hspace abs(D_n) = 2 n\
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
      bold("Conjugacy classes"):\
      "For n odd:"\
      1[e], 2[R], 2[R^2], ..., 2 [R^((n-1)/2)], n[S]\
      "For n even:"\
      1[e], 1[R^(n/2)], 2[R], 2[R^2], ...,\
       2[R^(n/2-1)], n/2[S], n/2[R S]\
    $
  )

]
#section[Group: $A_n$][
  Alternating group: even permutations in $S_n$. Order: $abs(A_n) = n!\/2$.

  #grid(
    columns: 2,
    column-gutter: 1em,
    row-gutter: 0.5em,
    character_table(
      ($e$, $(1 2)\ (34)$, $(1 2 3)$, $(1 3 2)$),
      ($chi_1$, $chi_1'$, $chi_1''$, $chi_3$),
      (1,1,1,1,1,1,$omega$, $omega^2$, 1,1,$omega^2$, $omega$, 3, -1, 0, 0),
      group: $abs(A_4)=12$,
      class_sizes: (1, 3, 4, 4)
    ),
    character_table(
      ($e$, $(1 2)\ (3 4)$, $(1 2 3)$, $(1 2 3 4 5)$, $(1 3 5 2 4)$),
      ($chi_1$, $chi_3$, $chi_3'$, $chi_4$, $chi_5$),
      (1, 1, 1, 1, 1, 3, $-1$, 0, $(1 + sqrt(5))/2$, $(1 - sqrt(5))/2$, 3, -1, 0, $(1 - sqrt(5))/2$, $(1 + sqrt(5))/2$, 4, 0, 1, -1, -1, 5, 1, -1, 0, 0),
      group: $A_5$,
      class_sizes: (1, 15, 20, 12, 12)
    ),
  )
]

= Infinite Groups

#section[Orthogonal Groups $O(3), SO(3)$][
  $
    O(3) = {A | A^T A = I, det(A) = plus.minus 1}\
    SO(3) = {A | A^T A = I, det(A) = 1}\
    U(n) = {A in GL(n, CC) | A^* A = bb(1)}\
    SU(n) = {A in U(n) | det(A) = 1}
  $
  Orthogonal groups preserve lengths and angles. Any rotation in $R^3$ can be described by an axis $hat(n)$ and an angle $alpha$. The matrix representation is given by Rodrigues' formula:

  $
    R(hat(n), alpha) = I + sin(alpha) K + (1 - cos(alpha)) K^2 hspace
    "where" K = mat(0, -n_3, n_2; n_3, 0, -n_1; -n_2, n_1, 0) \
  $

  For each Platonic solid there is a finite subgroup $G$ of $O(3)$ that describes its symmetries. For pure rotations (orientation preserving): $G^+ = G inter SO(3) subset SO(3)$.

  Tetrahedron: $  G iso S_4 hsmall abs(S_4) = 24 hspace G^+ iso A_4 hsmall abs(A_4) = 12$

  Cube: $ G iso S_4 cross ZZ_2 hsmall abs(S_4 cross ZZ_2) = 48 hspace G^+ iso S_4 hsmall abs(S_4) = 24$

  Dodeca, Isoca: $ G iso A_5 cross ZZ_2 hsmall abs(A_5 cross ZZ_2) = 120 hspace G^+ iso A_5 hsmall abs(A_5) = 60$
]

#section[Euclidean Group $IO(3)$][
  Transforms $x |-> R x + b$, with $R in O(3), b in RR^3 => M = mat(R, b; 0, 1)$

  #todo("more details")
]

#section[Lorentz Group $O(1,3), SO(1,3)$][
  
]

= Representations

#section[Representations][
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

#section[Representations (Notes)][
  $
    rho: G -> GL(V) hspace "check" forall g, h in G: rho(g) in GL(V) "and" rho(g h) = rho(g) rho(h) \
  $

  *Regular representation*:

  *Invariant subspace*: $W subset V: rho(g) W subset W hsmall forall g in G$. Group representations do not leave the subspace.

  *Subrepresentation*: Representation on an invariant subspace. *Every irrep* is a subrepresentation and has an associated *invariant subspace*. 

  *Complete reducibility*: Every representation of a finite group is completely reducible, i.e. it decomposes into a direct sum of irreps.

  *Unitary representation*: Representation on a unitary vector space, i.e. $rho(g)^m1 = rho(g)^*$. Then it is completely reducible and $rho <-> W => W^perp$ is invariant.

  *Schur's Lemma*: Let $(rho_1, V_1), (rho_2, V_2)$ be irreps, complex, finite-dimensional:

  1. Any linear map $T: V_1 -> V_2$ with $T rho_1(g) = rho_2(g) T$ for all $g in G$ is either the zero map or an isomorphism.

  2. Any linear map $T: V -> V$ with $T rho(g) = rho(g) T$ for all $g in G$ is a multiple of the identity map, i.e. $T = lambda bb(1)$ for some $lambda in CC$.

  Example: 

  *Abelian groups*: Abelian if $g h = h g hsmall forall g, h in G$. All irreps are one-dimensional.
]

#todo("combine the two representation sections")

#section[Maschkes Theorem (condition for full decomp into irreps)][
  Let $G$ be a finite group and $V$ a finite-dim vec-space over $K$, where $rho: G -> GL(V)$ is a rep. If the characteristic of $K$ does not divide $|G|$, then every invariant subspace $W subset V$ has an invariant complement $W'$ such that $V = W oadd W'$ and every vector can be written uniquely as $w + w'$. 
  
  For $CC$ or $RR$, $"char"(K) = 0$, so always holds. For $"char"(FF_p) = p$, not always.

  Also every finite-dim rep of a finite group over such a field is a direct sum of irreps.
]

#section[Character][
  $chi(rho) = tr(rho(g))$ constant on conjugacy classes $chi_rho (g) =chi_rho (h g h^m1)$
  $
    rho iso rho' => chi_rho = chi_rho' hsmall chi_rho (id) = dim(V) hsmall chi_(rho oadd rho') = chi_rho + chi_rho' hsmall chi_(rho tensor rho') = chi_rho dot chi_rho' \
    chi_rho^* = overline(chi_rho) hspace chi_"reg" (g) = cases(abs(G) "if" g=1, 0 "else" )\
    rho bold("unitary") => chi_rho (g^m1) = overline(chi_rho (g)), hspace "ord"(g)= k => rho(g)^k = id\
    chi_rho (g) = dim rho "divides" k => hspace abs(chi_rho (g)) <= dim(rho)\
    {g in G|_(chi_rho (g)) = m} "normal subgroup" 
  $
]

#section[Inner Product][
  $
    (chi_1, chi_2) = 1/abs(G) sum_g overline(chi_1 (g)) chi_2 (g) = 1/abs(G) sum_"conj" abs(c) overline(chi_1 (c)) chi_2 (c)\
    (chi_rho, chi_rho') = cases(1 "if" rho iso rho', 0 "else") hspace rho "irrep" => (chi_rho, chi_rho) = 1\
    (chi_rho, chi_rho_1) = "Multiplicity of " rho_1 "in" rho\
    (chi_rho, chi_rho) = sum ("Multiplicities of irreps in" rho)^2\
    rho "irrep" => abs(G) = sum_"irrep" (dim rho_i)^2 hspace chi_1, ..., chi_k "ONB in" CC^k
  $
]

#section[Character Table][
  $
    abs(G) = sum_"irrep" (dim rho_i)^2 hspace "number of conjugacy classes = number of irreps"\
    (chi_i, chi_j) = delta_(i j) hspace "orthogonality of rows"\
    chi_i in.not RR => exists chi_j: chi_j = overline(chi_i) hspace "complex representations occur in pairs"\
    "if" dim(rho_i) = 1 "then" forall rho_j "irrep" => rho_i tensor rho_j "another irrep" rho_k "with" chi_k = chi_i dot chi_j\
    g^k = id => chi_rho (g) = tr(rho(g)) = sum_(r=1)^(dim rho) lambda_r "with" lambda_r^k = 1 hspace chi_rho(g) <= dim(rho)\

  $
]

#section[Isotypic Components and Canonical Decomposition][
  Let $K in CC^n$ be physical transform such that $K rho(g) = rho(g) K$ for all $g in G$. Then $CC^n = oadd_lambda V_lambda$ and $V_lambda = rho_i^(oadd m_lambda)$ is invariant under $rho$ and an Isotypical Component (all copies of one irrep type bundled). For each $lambda$ irrep type $rho_i$ there is a projector $p_lambda = (dim rho_i)/abs(G) sum_g overline(chi_i (g)) rho(g)$ projecting onto $V_lambda = p_lambda (V )$.
]

= Eigenvalues with Symmetries

#section[Physical Setups][
  - Vectorspace $V = CC^n$ represents states: displacements, wavefunctions, etc
  - Group Action $rho: G -> GL(V)$ represents physical symmetries: rotations, reflections, translations
  - Operator $A: V -> V$ represents physical observable: Hamiltonian, Inertia Tensor, Stiffness Matrix, etc

  Symmetry Condition: $rho(g) A = A rho(g) forall g in G => A$ preserves symmetries of each irrep.

  Consequences: Schurs Lemma $=>$ if $V$ irreducible, then $A = lambda bb(1) =>$ 1 irrep = 1 eigenvalue (degeneracy 1).

  If $V = V_1 oadd V_2 oadd ... oadd V_k$ with $V_i$ irreducible, then $A$ has at most $k$ distinct eigenvalues.

  If some irrep $rho_i$ appears $m_i$ times in the decomposition of $V$, then each eigenvalue corresponding to this irrep has at least degeneracy $m_i$. 
]

#section[Recipe for Eigenvalue Problems with Symmetries][
  - Check overall symmetry decomposition of underlying object (e.g. molecule, platonic solid).
  - Determine which decomposition describes the modified object (e.g. with defects, external fields, etc).
  - Compute character of the representation on the modified object (usually fixpoint counting).
  - Decompose character into irreps to find multiplicities. $m_i = (chi_rho, chi_i)$.
  - Use multiplicities to determine eigenvalue degeneracies.
  - If you need actual eigenvectors, construct projectors onto isotypical components and solve smaller eigenvalue problems there. $p_i = (dim W_i)/abs(G) sum_g overline(chi_i (g)) rho(g)$.

  Always check if the question asks for proper or improper symmetries (i.e. $O(3)$ vs $SO(3)$).
]

#section[Marked Structures Recipe][
  + Identify ambient symmetry group $G$ of unmarked structure (eg $G^+ subset SO(3)$)
  + Determine symmetry group $H subset G$ of marked structure (usually via fixpoint counting). Usually reduce platonic to dihedral groups $D_n$ or dihedral to cyclic groups $ZZ_n$.
  + Compute stabilizers and orbits of representative features (vertex, edge, face).
    $
      H = Stab_G(x) = {g in G | g x = x} hspace
    $
    With Orbit-Stab trick: Compute orbit size by "how many distinc places can the marking be moved by symmetries?". Then:
    $
      abs("Orb"(x)) = abs(G)\/abs(Stab_G(x)) hspace => hspace abs(H) = abs(G)\/abs("Orb"(x))\
    $
]

#section[Unphysical Modes][
  For Eigenvalue problems we solve
  $
    V(y^* + x) approx V(y^*) + 1/2 x^TT H x hspace "for" y^* "equilibrium"\
  $
  This $H$ is usually out $A$. Then $ddot(x) = - A x => A x_0 = omega^2 x_0$.

  Unphysical modes correspond to eigenvalue 0 of $A$ (rigid body motions, gauge freedoms, etc). They dont change $V$ and thus dont have a rstoring force. Their number can be determined by symmetry analysis of $A$.

  For a System where translation and rotation are physically possible, there are always 6 unphysical modes in $RR^3$ (3 translations + 3 rotations) and 3 unphysical modes in $RR^2$ (2 translations + 1 rotation). If some symmetries are broken (e.g. fixed point, plane, axis), the number of unphysical modes is reduced accordingly.
]

#section[Traces of Common Orthogonal Matrices][
  - Identity: $tr(id_n) = n$
  - Minus Identity: $tr(-id_n) = -n$
  - Permutation Matrix: $tr(P) = $ number of fixed points of the permutation
  - O(2):
    - Rotation by $alpha$: $tr(R(alpha)) = 2 cos(alpha), hsmall 120 deg = 3/2 pi: -1, hsmall 90 deg = pi/2: 0, hsmall 180 deg = pi: -2, hsmall 0 deg = 0: 2$
    - Reflection across origin: $tr(S) = 0$
  - O(3):
    - Rotation by $alpha$ around axis: $tr(R(alpha)) = 1 + 2 cos(alpha) hsmall 120 deg = 3/2 pi: 0, hsmall 90 deg = pi/2: 1, hsmall 180 deg = pi: -1, hsmall 0 deg = 0: 3$
    - Reflection across plane in origin: $tr(S) = 1$
    - Inversion (x -> -x): $tr(-id_3) = -3$
]

= Platonic Solids

#section[Markings rule][
  $
    G subset O(3) hspace G^+ := G inter SO(3)\
    "If a feature" x "is marked, then" Stab(x) = {g in G | g x = x}\
    abs(G) = abs("Orb"(x)) dot abs(Stab(x))\
  $
  Oriented markings (arrow on face, directed edge) usually drop $D_n -> ZZ_n$.
]

#section[Tetrahedron][
  - *Group*: $G iso S_4$, $abs(G) = 24$, $G^+ iso A_4$, $abs(G^+) = 12$ (symmetry via vertex permutations).

  - *Proper*: $Stab_(G^+)("vertex/face") iso ZZ_3$, $Stab_(G^+)("edge") iso ZZ_2$.

  - *Chain*: $A_4 supset ZZ_3$, $ZZ_2 supset {1}$.

  - *Correspondence*: $e <-> id$, $(1 2 3) <-> 120 deg$ rot vertex-face, $(1 3 2) <-> 240 deg$ rot vertex-face, $(12)(34) <-> 180 deg$ rot edge.

  - *Improper*: $Stab_G("vertex/face") iso D_3$, $Stab_G("edge") iso D_2 iso ZZ_2 cross ZZ_2$.

  - *Chain*: $S_4 supset A_4, D_3, D_2 supset {1}$.

  - *Correspondence*: 
    $
      &(e) <-> id, hsmall &&(1 2) <-> "ref across edge",\
      &(1 2 3) <-> 120 deg "rot vertex-face", hsmall &&(1 2)(3 4) <-> 180 deg "rot edge",\ 
      &(1 2 3 4) <-> 90 deg "rot edges + ref", hsmall &&(1 3)(2 4) <-> "ref across face"\
    $
]

#section[Cube][
  - *Cube/Octa*: $G iso S_4 cross ZZ_2$, $abs(G) = 48$, $G^+ iso S_4$, $abs(G^+) = 24$. $S_4$ is permutations of body diagonals.

  - *Proper*: $Stab_(G^+)("vertex") iso ZZ_3$, $Stab_(G^+)("face") iso ZZ_4$, $Stab_(G^+)("edge") iso ZZ_2$.

  - *Chain*: $S_4 supset ZZ_4, ZZ_3, ZZ_2 supset {1}$.

  - *Correspondence*: $e <-> id$, $(1 2 3) <-> 120 deg$ rot vertex, $(1 2 3 4) <-> 90 deg$ rot face, $(1 2)(3 4) <-> 180 deg$ rot face, $(1 2) <-> 180 deg$ rot edge.

  - *Improper*: $Stab_G("vertex") iso D_3$, $Stab_G("face") iso D_4$, $Stab_G("edge") iso D_2$.

  - *Chain*: $S_4 cross ZZ_2 supset S_4 supset D_4, D_3, D_2 supset {1}$.

  - *Correspondence*: 
    $
      &(e, 1) <-> id, hsmall &&(e, -1) <-> "inversion"\
      &((1 2), 1) <-> 180 deg "rot edge", hsmall &&((1 2), -1) <-> "rot edge + inversion",\
      &((1 2 3), 1) <-> 120 deg "rot vertex",hsmall &&((1 2 3), -1) <-> "rot vertex + inversion",\
      &((1 2 3 4), 1) <-> 90 deg "rot face", hsmall &&((1 2 3 4), -1) <-> "rot face + inversion",\
      &((1 2)(3 4), 1) <-> 180 deg "rot face", hsmall &&((1 2)(3 4), -1) <-> "rot face + inversion"\
      &((1 2)), 1) <-> 180 deg "rot edge", hsmall &&((1 2), -1) <-> "rot edge + inversion"\
    $
]

#section[Dodeca / Icosa][
  - *Group*: $G iso A_5 cross ZZ_2$, $abs(G) = 120$, $G^+ iso A_5$, $abs(G^+) = 60$.

  - *Proper*: $Stab_(G^+)("vertex") iso ZZ_5$, $Stab_(G^+)("face") iso ZZ_3$, $Stab_(G^+)("edge") iso ZZ_2$.

  - *Chain*: $A_5 supset ZZ_5, ZZ_3, ZZ_2 supset {1}$.

  - *Correspondence*:
    $
      &(e) <-> id,\
      &hsmall (1 2 3 4 5) <-> 72 deg "rot vertex", hsmall (1 3 5 2 4) <-> 144 deg "rot vertex",\
      &hsmall (1 2 3) <-> 120 deg "rot face", hsmall (1 2)(3 4) <-> 180 deg "rot edge"\
    $

  - *Improper*: $Stab_G("vertex") iso D_5$, $Stab_G("face") iso D_3$, $Stab_G("edge") iso D_2$.

  - *Correspondence*:
    $
      &(e) <-> id,\
      &hsmall (1 2) <-> "ref across edge",\
      &hsmall (1 2 3) <-> 120 deg "rot face",\
      &hsmall (1 2 3 4 5) <-> 72 deg "rot vertex",\
      &hsmall (1 2)(3 4) <-> 180 deg "rot edge"\
    $

  - *Chain*: $A_5 cross ZZ_2 supset A_5 supset D_5, D_3, D_2 supset {1}$.
]

= Lie Groups and Lie Algebras

#section[General Linear Group $GL(n,\RR)$][
  $GL(n, CC) hspace GL(n, K) = {A in Mat(n, K)|det A != 0}$

  $gl(n, K) = Mat(n, K) hspace $
  
  *Basis:* $E_(i j), 1 "at" (i, j), "else" 0$

  $dim gl(n, RR) = dim GL(n, RR) = n^2$
  
  $dim gl(n, CC) = dim GL(n, CC) = 2 n^2$
  
  $GL(n, RR)$ has 2 connected components: $det>0$ and $det<0$.
]

#section[Special Linear Group $SL(n,\RR)$][
  $SL(n, RR), SL(n, CC)$
  
  $SL(n, K) = {A in GL(n, K)|det A = 1}$

  $sl(n, K) = {X in gl(n, K)|tr(X) = 0}$

  *Basis:* $E_(i j), i != j; H_k = E_(k k) - E_(k+1 k+1)$ for $k = 1, ..., n-1$

  $dim sl(n, RR) = n^2 - 1 = dim SL(n, RR) = n^2-1$

  $dim sl(n, CC) = dim SL(n, CC) = 2(n^2 - 1)$

  $SL(2, CC)$: Jordan-type $D mat(a, b; 0, a^m1) D^m1$ used for connectedness
]

#section[Orthogonal Group $O(n)$][
  $O(n) = {A in GL(n, RR)|A^T A = id}$
  
  $SO(n) = {A in O(n)|det A = 1}$

  $o(n) = so(n) = {X in gl(n, RR)|X^T + X = 0}$

  *Basis:* $F_(i j) = E_(i j) - E_(j i), 1 <= i < j <= n$

  $dim so(n) = dim o(n) = dim SO(n) = dim O(n) = (n(n-1))/2$

  Every $A in O(n)$ can be block-diagonalized $A = O D O^m1$ with $D$ being 2d rotation matrix or $plus.minus 1$.

  $O(n)$ has 2 connected components: $det>0$ and $det<0$.
]

#section[Unitary Group $U(n)$][
  $U(n) = {A in GL(n, CC)|A^* A = id}$
  
  $SU(n) = {A in U(n)|det A = 1}$

  $u(n) = {X in gl(n, CC)|X^* + X = 0} hspace su(n) = {X in u(n)|tr(X) = 0}$

  *Basis*: $i E_(k k), E_(i j) - E_(j i), i(E_(i j) + E_(j i))$ for $1 <= k <= n, 1 <= i < j <= n$

  $dim u(n) = dim U(n) = n^2 hspace dim su(n) = dim SU(n) = n^2 - 1$

  Every $B in U(n)$ is unitary diagonalizable $B = U D U^*$ with $D = diag(lambda_1, ..., lambda_n), abs(lambda_i) = 1$.

  $su(2) = {X in Mat(2, CC)|X = mat(i a, b + i c; -b + i c, -i a), a, b, c in RR} iso RR^3$ 
  
  via $X |-> (a, b, c)$

  *$SU(2)$ Standard Basis with Pauli Matrices:* $t_1 = i sigma_1 = mat(0, i; i, 0), t_2 = i sigma_2 = mat(0, 1; -1, 0), t_3 = i sigma_3 = mat(i, 0; 0, -i)$,
  Bracket: $[t_j, t_k] = - sum_(l=1)^3 2 epsilon_(j k l) t_l$.
]

#section[Symplectic Linear Group $Sp(2n,\RR)$][
  $Sp(2n, RR) = {A in GL(2n, RR)|A^T J A = J} hspace J = mat(0, id_n; -id_n, 0)$

  $sp(2n) = {X in gl(2n, RR)|X^T J + J X = 0} = {mat(A, B_1; B_2, -A^T)|B_i^T = B_i}$

  *Basis:* $A$ is free block: $n^2$, symmetric $B_i$: $n(n+1)/2$ each 
  
  $=> dim Sp(2n) = dim sp(2n) = n(2n + 1)$
]

#section[Lorentz Group $O(1,3)$][
  $O(1, 3) = {Lambda in GL(4, RR)| Lambda^T eta Lambda = eta}$
  
  $SO^+ (1, 3) = {Lambda in O(1, 3)|det Lambda = 1, Lambda_00 >= 1}$

  $so(1, 3) = {X in Mat(4, RR)| X^T eta + eta X = 0}$

  Any element $A = R_1 L(chi) R_2, hsmall R_1, R_2 in SO(3), chi in RR$, where 
  
  $L(chi) = mat(cosh(chi), sinh(chi), 0, 0; sinh(chi), cosh(chi), 0, 0; 0, 0, 1, 0; 0, 0, 0, 1)$ in x, with $L(chi_1) L(chi_2) = L(chi_1 + chi_2)$
  Components: $O(1, 3)$ has 4 connected components:
  
  $det>0, Lambda_00>1; det>0, Lambda_00< -1; det<0, Lambda_00>1; det<0, Lambda_00< -1$.

  Orthochrone means $Lambda_00 >= 1$. $abs(Lambda_00) >= 1$ always. 
  
  Time reversal with $T = diag(-1, 1, 1, 1)$
]

#section[$SL(2, CC)$ and $SO^+(1,3)$][
  $SL(2, CC) = {A in GL(2, CC)|det A = 1}$
  
  $sl(2, CC) = {X in gl(2, CC)|tr(X) = 0}$

  Identifies Minkovski vectors with 2x2 matrices $hat(x)$: $X |-> A X A^*$, thus:
  $SL(2, CC)\/{plus.minus id} iso SO^+(1, 3)$
]

#section[Euclidean Group $IO(3)$][
  $IO(3) = {mat(R, b; 0, 1)| R in O(3), b in RR^3}$
    
  $ = {x |-> R x + b|A in O(3), b in RR^3}$

  $(A_1, b_1) (A_2, b_2) = (A_1 A_2, A_1 b_2 + b_1)$
  $IO(3) iso O(3) times.l RR^3$

  $io(3) = {mat(Omega, v; 0, 0)| Omega in o(3), v in RR^3}$
    
  *Basis*: ${J_1, J_2, J_3, P_1, P_2, P_3}$ where $J_i$ are $so(3)$ generators and $P_i$ translations ($b$).
]

#section[Poincare Group $IO(1,3)$][
  $IO(1, 3) = {mat(Lambda, a; 0, 1)| Lambda in O(1, 3), a in RR^4}$
  
  $ = {x |-> Lambda x + a|Lambda in O(1, 3), a in RR^4}$

  $(Lambda_1, a_1) (Lambda_2, a_2) = (Lambda_1 Lambda_2, Lambda_1 a_2 + a_1)$
  $IO(1, 3) iso O(1, 3) times.l RR^4$

  $io(1, 3) = so(1, 3) times.l RR^4 = {mat(X, v; 0, 0)| X in so(1, 3), v in RR^4}$
]

#section[$H_0$ and Minkowski Space][
  $H_0 = {X in Mat_(2, 2) (CC)|X = X^*, tr(X) = 1}$
    $
      A in H_0 => A = mat(z, x + i y; x - i y, -z) hspace (x, y, z) in RR^3\
      det(A) = - (x^2 + y^2 + z^2)\
      "Thus" H_0 iso RR^3 "with metric" det(A - lambda id) = lambda^2 + (x^2 + y^2 + z^2)\
    $
]

#todo("what is tensoring characters?")

#todo("what are common irreps for character table generation")

#section[Isometry][
  Is a distance preserving map: $d(x, y) = d(f(x), f(y))$ of a metric space. Every isometry of Euclidean space is of the form $x |-> A x + b$ with $A in O(n), b in RR^n$. The set of all isometries forms the Euclidean Group $IO(n) = O(n) times.l RR^n$.
]

#section[Calculating Lie Algebra of a Lie Group][
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

#section[Lie Bracket][
  Commutator: $[g, h] = g h g^m1 h^m1$. For Matrix Lie Groups: $[X, Y] = X Y - Y X$  
]

= Reps of SU(2) and SO(3)

= Tensor Products and Clebsch-Gordan
