#import "../../../lib/setup_flashcards.typ": flashcard, flashcard-setup, render-flashcards
#import "../../../lib/lib.typ": *

#show: flashcard-setup(
  card-width: 9cm,
  card-height: 5.5cm,
  margin: 0cm,
  show-cut-lines: true,
  topic: "Group Theory",
)

#let blue = rgb("#E3F2FD") // multiple choice
#let yellow = rgb("#FFF8E1") // Exam Question
#let red = rgb("#FFEBEE") // proof
#let green = rgb("#E8F5E8") // definition


#flashcard(
  title: "Multiple Choice",
  color: blue,
  question: [
    Sei $T subset U(n)$ die Menge der Diagonalmatrizen in $U(n)$. Welche Aussage ist falsch?

    + $T subset U(n)$ ist eine Unterrgruppe.
    + $T subset U(n)$ ist abelsch.
    + $T subset U(n)$ ist ein Normalteiler
    + Jede Konjugationsklasse in $U(n)$ enthält ein Element aus $T$.

  ],
  answer: [
    Antwort 3 ist falsch. Gegenbeispiel:
    $
      1/sqrt(2) mat(1, 1; -1, 1) mat(0.5, 0; 0, 2) 1/sqrt(2) mat(1, -1; 1, 1)
    $
  ],
)


// Definitions

#flashcard(
  title: "Definition",
  color: green,
  question: [
    Definiere den Begriff "Normalteiler".
  ],
  answer: [
    Eine Untergruppe $N$ einer Gruppe $G$ heißt Normalteiler, wenn für alle $g in G$ gilt: $g N g^{-1} = N$.
  ],
)

#flashcard(
  title: "Definition",
  color: green,
  question: [
    Was sind die Gruppenaxiome?
  ],
  answer: [
    1. Assoziativität: Für alle $a, b, c in G$ gilt $(a b) c = a (b c)$.
    2. Neutrales Element: Es gibt ein Element $e in G$, so dass für alle $a in G$ gilt: $e a = a e = a$.
    3. Inverses Element: Zu jedem $a in G$ gibt es ein Element $a^{-1} in G$, so dass $a a^{-1} = a^{-1} a = e$.
  ],
)

#flashcard(
  title: "Definition",
  color: green,
  question: [
    Definieren Gruppenhomomorphismus. Was muss dieser erfüllen?
  ],
  answer: [
    Ein Gruppenhomomorphismus ist eine Abbildung $phi: G => H$ zwischen zwei Gruppen $G$ und $H$, die die Gruppenoperation erhält, d.h. für alle $a, b in G$ gilt: $phi(a b) = phi(a) phi(b)$.
  ],
)

#flashcard(
  title: "Definition",
  color: green,
  question: [
    Wie wird eine Lie Algebra definiert?
  ],
  answer: [
    Lie Algebra ist der Tangentialraum am Einselement einer Lie Gruppe.

    $
      frak(g) = T_e G = { X in M_n(C) | exp(t X) in G forall t in R}
    $
  ],
)

#flashcard(
  title: "Definition",
  color: green,
  question: [
    Was ist eine Einparametergruppe?
  ],
  answer: [
    Eine Einparametergruppe ist eine stetige Gruppe von Transformationen, die durch einen einzigen Parameter beschrieben werden kann. In der Regel wird dieser Parameter als reelle Zahl betrachtet, und die Gruppe wird durch eine Abbildung $phi: R => G$ definiert, wobei $G$ die Gruppe ist.
  ],
)

#flashcard(
  title: "Definition",
  color: green,
  question: [
    Definiere den Begriff "Konjugationsklasse".
  ],
  answer: [
    Die Konjugationsklasse eines Elements $g$ in einer Gruppe $G$ ist die Menge aller Elemente, die durch Konjugation von $g$ mit allen Elementen der Gruppe entstehen. Formal ist die Konjugationsklasse von $g$ definiert als:

    $
      [g] = { h g h^{-1} | h in G }
    $
  ],
)



// Specific Groups
#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Was ist $G L (n, RR)$?
  ],
  answer: [
    Alle invertierbaren $n times n$ Matrizen mit Einträgen aus $RR$.
  ],
)

#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Was ist $G L (n, CC)$?
  ],
  answer: [
    Alle invertierbaren $n times n$ Matrizen mit Einträgen aus $CC$.
  ],
)

#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Was ist $G L (V)$?
  ],
  answer: [
    Alle invertierbaren linearen Abbildungen von $V$ nach $V$.
  ],
)

#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Was ist $O (n)$?
  ],
  answer: [
    Alle orthogonalen $n times n$ Matrizen mit Einträgen aus $RR$.

    $
      O(n) = { A in G L(n, RR) | A^T A = I }\
      = { A | (A x, A y) = (x, y) forall x, y in RR^n }
    $
  ],
)

#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Was ist $U (n)$
  ],
  answer: [
    Alle unitären $n times n$ Matrizen mit Einträgen aus $CC$.

    $
      U(n) = { A in G L(n, CC) | A^* A = I }\
      = { A | (A x, A y) = (x, y) forall x, y in CC^n }
    $
  ],
)

#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Was ist $S O (n)$
  ],
  answer: [
    Alle orthogonalen $n times n$ Matrizen mit Einträgen aus $RR$ und Determinante $1$.

    $
      S O(n) = { A in O(n) | det(A) = 1 }
    $
  ],
)

#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Was ist $S U (n)$?
  ],
  answer: [
    Alle unitären $n times n$ Matrizen mit Einträgen aus $CC$ und Determinante $1$.

    $
      S U(n) = { A in U(n) | det(A) = 1 }
    $
  ],
)

#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Was ist $S U(2)$? Gib die generelle Linearkombination und eine Basis an.
  ],
  answer: [
    Die Menge aller Matrizen der Form
    $
      mat(
        a, b;
        -overline(b), overline(a)
      )
    $
    mit $a, b in CC$ und $|a|^2 + |b|^2 = 1$.
    $
      U = a_0 I + i (a_1 sigma_1 + a_2 sigma_2 + a_3 sigma_3)\
      sigma_1 = mat(0, 1; 1, 0), sigma_2 = mat(0, -i; i, 0), sigma_3 = mat(1, 0; 0, -1)
    $
  ],
)

#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Was ist $S O (3)$ Was ist die Beziehung zu $S U(2)$?
  ],
  answer: [
    $
      S O (3) = { R in G L(3, RR) | R^T R = I, det(R) = 1 }\
      S O (3) approx S U(2) \/ ZZ_2
    $
  ],
)

#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Was ist die Lie Algebra $frak(s u) (2)$? Gib eine Basis an. Gib die Kommutatoren an.
  ],
  answer: [
    $
      frak(s u)(2) = { X in M_2(CC) | X^dagger = -X, tr(X) = 0 }\
    $

    Standard Basis:

    $
      T_i = 1/2 sigma_i, [T_i, T_j] = i epsilon_{i j k} T_k\
    $
  ],
)

#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Was ist $frak(s u) (3)$? Was ist die Dimension? Gib die Standardbasis an. Gib die Kommutatoren an.
  ],
  answer: [
    $
      frak(s u) (3) = { X in M_3(CC) | X^dagger = -X, tr(X) = 0 }\
    $

    Dimension: $8$, Standardbasis: $T_a = 1/2 lambda_a, a=1, ..., 8$
    $
      [T_a, T_b] = i f_{a b c} T_c\
    $
  ],
)

#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Ws ist die cyklische Gruppe $C_n$? Gib die Verknüpfung und Eigenschaften an.
  ],
  answer: [
    $
      C_n = ZZ \/ n ZZ = { 0, 1, ..., n-1 }\
    $

    mit der Addition modulo $n$ als Verknüpfung.

    Eigenschaften: Abelsch, endliche Gruppe mit $n$ Elementen.
  ],
)

#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Was ist $S_n$? Was ist die Ordnung? Was sind die Eigenschaften?
  ],
  answer: [
    $
      S_n = { "all permutations of n elements" }\
      = { sigma: {1, ..., n} => {1, ..., n} | sigma "bijective" }\
    $
    Ordnung: $n!$
    Eigenschaften: Nicht abelsch für $n >= 3$.
  ],
)

#flashcard(
  title: "Groups",
  color: yellow,
  question: [
    Was ist die dihedrale Gruppe $D_n$? Was ist ihre Ordnung?
  ],
  answer: [
    $
      D_n = < r, s | r^n = e, s^2 = e, s r s = r^{-1} >\
    $
    Ordnung: $2 n$

  ],
)

// Exam Questions

#flashcard(
  title: "Finite Groups",
  color: yellow,
  question: [
    We have Permutations of $S_3: alpha = (123), beta = (12), gamma = (13)$. Show that $(alpha beta) gamma = alpha (beta gamma)$
  ],
  answer: [
    $[(123)(12)](13) = (13)(13) = () = (123)(132) = (123)[(12)(13)]$
  ],
)

#flashcard(
  title: "Finite Groups",
  color: yellow,
  question: [
    Show that Permutations are always Associative.
  ],
  answer: [
    For $alpha, beta, gamma in S_n$ and $i in {1, ..., n}$ we have:

    $
      [(alpha beta) gamma](i) = (alpha beta)(gamma(i)) = alpha(beta(gamma(i))) = alpha[(beta gamma)(i)] = [alpha (beta gamma)](i)
    $
  ],
)

#flashcard(
  title: "Finite Groups",
  color: yellow,
  question: [
    Let $G$ be a group and $forall g in H: g^2 = 1$. Show that $H$ is abelian.
  ],
  answer: [
    Let $g,h in H$. Existence of the inverse: $g^(-1) g = 1 = g g^(-1) = g^2$.

    Thus $g = g^{-1}$ and $h = h^{-1}$.

    Groups are closed: $g h in H => (g h)^2 = 1$

    Then we can show: $(g h)^2 = g h g h => (g h)^2 h^(-1) g^(-1) = g h$

    Then $(g h)^2 h g = g h = h g$ because $(g h)^2 = 1$.
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Let $sigma$ be a permutation with $k$ being the smallest number where $sigma^k (x) = x$. From $tau = pi sigma pi^(-1)$ show that $tau$ has the same cycle length as $sigma$.
  ],
  answer: [
    $
      tau^k (x) = (pi sigma pi^(-1))^k (x) = pi sigma^k pi^(-1) (x) = pi pi^(-1) (x) = x => tau^k = 1\
    $
    We have $sigma^k = 1 = tau^k$ but we dont know yet if $k$ is the smallest number for $tau$.

    For $0 < m < k$ we want to show: $sigma^m != 1 => tau^m != 1$

    Contraposition: $tau^m = 1 => sigma^m = 1: tau^m = pi sigma^m pi^(-1) = 1$

    $=> sigma^m = 1$. Reverse Contraposition proven:

    $=> sigma^m != 1 => tau^m != 1$. Thus they have the same cycle length.
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    To what do the irreps of $S_n$ correspond?
  ],
  answer: [
    The irreps of $S_n$ correspond to the partitions of $n$.
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    What are the conjugacy classes of $S_4$? What are their sizes?
  ],
  answer: [
    The conjugacy classes of $S_4$ are equivalent to the cycle types which correspond to the partitions of $4$:

    $(1,1,1,1), (2,1,1), (2,2), (3,1), (4)$.

    Their sizes are:
    $1, 6, 3, 8, 6$.

    The corresponding elements are:

    $(), (12), (12)(34), (123), (1234)$.
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Compute the character table of $S_4$.
  ],
  answer: [
    The character table of $S_4$ is:

    $
      mat(
        "triv", 1, 1, 1, 1, 1;
        "sgn", 1, -1, 1, 1, -1;
        "std", 3, 1, -1, 0, -1;
        "perm", 4, 0, 0, 1, 0;
        "2-dim", 2, 0, 2, -1, 0
      )
    $
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Write down the dual representations of $S_4$. What is an easy way to find them? What is the rule for their characters?
  ],
  answer: [
    the dual reps are found by pairing the Young diagram with the one obtained by mirroring at the main diagonal.

    Thus we have the following dual pairs:
    $
      (4) <=> (1,1,1,1)\
      (3,1) <=> (2,1,1)\
      (2,2) <=> (2,2)\
    $
    The characters of dual representations are obtained by multiplying the characters of the original representation with the sign of the permutation.
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    What is the sum rule for the characters whose direct sum gives the regular representation of $S_4$?
  ],
  answer: [
    If $V_{"reg"} = V_1 xor V_2$ then $chi_{"reg"} (g) = chi_1 (g) + chi_2 (g)$.

    This implies $chi_1 = chi_"reg" - chi_2$.

    For example: $chi_"std" = chi_"perm" - chi_"triv"$
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Let $S_3$ and $V = V_"std" + V_"std"$. Calculate the character of the representation $V$. Show with the character of the irreps that $V$ is reducible and that it decomposes as $V = 2 V_"std"$.
  ],
  answer: [
    $
      chi_"std" = (2, 0, -1)\
      chi_V = chi_"std" + chi_"std" = 2 chi_"std" = (4, 0, -2)\
    $

    To show that $V$ is reducible we compute the inner product with $chi_"std"$:

    $
      < chi_V, chi_"std" > = 1/6 [ 1 dot 4 dot 2 + 3 dot 0 dot 0 + 2 dot (-2) dot (-1) ] = 2\
    $
    $
      < chi_V, chi_"triv" > = 1/6 [ 1 dot 4 dot 1 + 3 dot 0 dot 1 + 2 dot (-2) dot 1 ] = 0\
    $
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Write down the definition of the inner product of two characters. How can you use it to find the multiplicity of an irrep in a given representation?
  ],
  answer: [
    The inner product of two characters $chi_1$ and $chi_2$ of a group $G$ is defined as:

    $
      < chi_1, chi_2 > = 1/abs(G) sum_(g in G) chi_1(g) overline(chi_2(g))\
    $

    The multiplicity of an irrep with character $chi_"irrep"$ in a given representation with character $chi_"rep"$ is given by the inner product:

    $
      m = < chi_"rep", chi_"irrep" >\
    $
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Write down the definition of a representation. What are the conditions that have to be fulfilled?
  ],
  answer: [
    A complex representation of a group $G$ is a homomorphism $D: G => G L (V)$, where $V$ is a complex vector space.

    + Each $rho(g)$ is a invertible linear map from $V$ to $V$.

    + Each $rho(g)$ is a group homomorphism: $rho(g_1 g_2) = rho(g_1) rho(g_2)$ for all $g_1, g_2 in G$.

    + $rho(e) = "id"_V$
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Let $rho$ be a rep on $V$. Show that $rho^*: G -> V^*, g |-> rho_g^*$ with

    $
      rho^*_g (phi) = phi circ rho(g^m1)
    $

    (Show Linearity and Homomorphism Property using the fact that $rho$ already satisfies these properties).
  ],
  answer: [
    Linearity:

    $
      rho^*_g (a phi_1 + b phi_2) = (a phi_1 + b phi_2) circ rho(g^m1)\
      = a (phi_1 circ rho(g^m1)) + b (phi_2 circ rho(g^m1))\
      = a rho^*_g (phi_1) + b rho^*_g (phi_2)\
    $

    Homomorphism Property:

    $
      rho^*_(g h) (phi) = phi circ rho((g h)^m1)\
      = phi circ rho(h^m1 g^m1)\
      = (phi circ rho(h^m1)) circ rho(g^m1) = rho^*_g (rho^*_h (phi))\
    $
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Let $G = S_n, V=CC^n, rho:S_n -> GL(V), rho(sigma) e_i = e_(sigma(i)), sigma in G$

    Let
    $
      V_1 = {lambda sum_(i=1)^n e_i | lambda in CC }, V_2 = { sum_(i=1)^n lambda_i e_i | sum_(i=1)^n lambda_i = 0 }
    $

    *Show that* $V = V_1 oadd V_2$

    (Hint: Show: $V_1, V_2$ invariant under $rho$;
    $forall v in V exists v_1 in V_1, v_2 in V_2: v = v_1 + v_2$;
    if $v in V_1$ and $v in V_2 => v = 0$; $V_1, V_2$ irreducible.)
  ],
  answer: [
    $
      "Invariance: "rho(sigma) (v in V_1) = lambda sum e_(sigma(i)) in V_1\
      rho(sigma) (v in V_2) = sum lambda_i e_(sigma(i)); "let" j = sigma(i), mu_i = lambda_(sigma^(-1)(i))\
      = sum_j mu_j e_j in V_2
    $

    $
      "Sum"\
      v = sum lambda_i e_i = alpha sum e_i + (sum mu_i e_i), alpha = 1/n sum lambda_i, mu_i = lambda_i - alpha\
      sum mu_i = sum lambda_i - n alpha = 0 "(also show intersection is 0)"
    $

    Irreducibility of $V_2$ shown with: $W subset V_2$ and showing $W = V_2$

  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Show that irreducible characters are orthogonal.
  ],
  answer: [
    Let $chi_1, chi_2$ be irreducible characters of $G$ with representations $rho_1, rho_2$.
    $
      < chi_1, chi_2 > = 1/abs(G) sum_(g in G) chi_1(g) overline(chi_2(g)) = 1/abs(G) sum_(g in G) tr(rho_1(g)) tr(rho_2(g)^dagger)\
      = 1/abs(G) sum_(g in G) tr(rho_1(g) oprod rho_2(g)^dagger) = 1/abs(G) sum_(g in G) tr(rho_(1 oprod 2)(g))\
    $
    By Schur's lemma this is $0$ if $rho_1$ not equivalent to $rho_2$ and $1$ if they are equivalent.
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Let $G = S_n, V=CC^n, rho:S_n -> GL(V), rho(sigma) e_i = e_(sigma(i)), sigma in G$. Assume that $V = V_1 oadd V_2$ and that $V_1, V_2$ irreducible.
    $
      V_1 = {lambda sum_(i=1)^n e_i | lambda in CC }, V_2 = { sum_(i=1)^n lambda_i e_i | sum_(i=1)^n lambda_i = 0 }
    $

    *Show that:*

    $
      sum_G abs({i | sigma(i) = i })^2 = 2 n!
    $
  ],
  answer: [
    $
      chi = chi_1 + chi_2\
      (chi, chi) = 1/abs(G) sum_(g in G) abs(chi(g))^2
    $

    For a permutation: $chi(sigma) = abs({i, sigma(i) = i})$

    Because $V_1, V_2$ are irrep, their characters are orthogonal:

    $
      (chi, chi) = (chi_1, chi_1) + (chi_2, chi_2) = 2 => 1/n! sum_(sigma in S_n) abs(chi(sigma))^2 = 2\
      => sum_(sigma in S_n) abs({i | sigma(i) = i})^2 = 2 n!\
    $
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Show that all abelian groups are isomorphic to a direct product of cyclic groups and that all irreducible representations of abelian groups are one-dimensional. Also show that the number of irreducible representations equals the order of the group.
  ],
  answer: [
    $G$ Abelian $=> g h = g h => g h g^m1 = h$. This means every element of $g in G$ is its own conjugacy class. For finite groups the number of irreps equals the number of conjugacy classes $=k$.

    With the dimension formula

    $
      abs(G) = sum_(i=1)^k dim(V_i)^2\
    $

    we know the only way to satisfy this is if all irreps are one-dimensional. Thus $k = abs(G)$.
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Formulate Cauchy's theorem for finite groups.
  ],
  answer: [
    Definition: Let $G$ be a finite group and $p$ a prime number. If $p$ divides $abs(G)$, then there exists an element $g in G$ with order $p$. Order means smallest $n$ such that $g^n = e$.
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Formulate and prove Schur's lemma.
  ],
  answer: [
    Schur's lemma states that if $V$ and $W$ are irreducible representations of a group $G$ over an algebraically closed field, and $T: V => W$ is a linear map that intertwines the representations (i.e., $T rho_V(g) = rho_W(g) T$ for all $g in G$), then either $T$ is the zero map or $V$ and $W$ are isomorphic representations.
    Proof: 1. If $V$ and $W$ are not isomorphic, then the only intertwining map is the zero map. This follows from the fact that any non-zero intertwining map would imply a non-trivial subrepresentation, contradicting the irreducibility of $V$ and $W$.
    2. If $V$ and $W$ are isomorphic, then there exists an invertible intertwining map between them. By Schur's lemma, any such map must be a scalar multiple of the identity map on $V$. Thus, if $T: V => V$ is an intertwining map, then there exists a scalar $lambda in CC$ such that $T = lambda "id"_V$.
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Define Group Action, Orbit, and Stabilizer. State the Orbit-Stabilizer Theorem. Show how it can be used to determine the size of conjugacy classes.
  ],
  answer: [
    Group Action: $x in X: g x in X$ this means $G$ acts on $X$.

    Orbit of $x in X$: $orb(x) = { g x | g in G }$. This means all elements reachable from $x$ by the group action.
    Stabilizer of $x in X$: $stab(x) = { g in G | g x = x }$. This means all group elements that leave $x$ unchanged.
    Orbit-Stabilizer Theorem: $abs(G) = abs(orb(x)) abs(stab(x))$.

    For size of conjugacy classes use $G$ action on itself: $g x = g x g^m1$. Orbit of $x in G$ under this action is its conjugacy class. The stabilizer of $x$ is its centralizer: $stab(x) = { g in G | g x g^m1 = x }$. $abs(orb(x)) = abs(G) / abs(stab(x)) = abs(G) / abs("centralizer"(x))$
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Formulate and prove Lagrange's theorem.
  ],
  answer: [
    Let $G$ be a finite group and $H$ a subgroup of $G$. Then the order of $H$ divides the order of $G$. This also means that the Group $G$ contains subgroups only of orders that are divisors of $abs(G)$.

    Proof: Consider the left cosets of $H$ in $G$: $g H = { g h | h in H }$ for each $g in G$. The left cosets partition the group $G$ into disjoint subsets, each of size $abs(H)$. Let $k$ be the number of distinct left cosets. Then we have:

    $abs(G) = k abs(H)$

    Thus, $abs(H)$ divides $abs(G)$.
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Draw a cube and label its diagonals. Write down all symmetries of the cube that map the cube onto itself. Write down all group elements in cycle notation. Show that these symmetries form a group isomorphic to $S_4$. Order the group elements into conjugacy classes and give their sizes.
  ],
  answer: [
    $S_4 = {"identity:" e\
    "90, 180, 240 degree around opposite faces:"\
    (1234), (13)(24), (1432), (1342)\
    (14)(23), (1243), (1423), (12)(34), (1324)\
    "120, 240 degree around opposite vertices:"\
    (142), (124), (234), (243), (132), (123), (134), (143)\
    "180 degree around opposite edges:"\
    (13), (24), (12), (34), (14), (23)\}$
    This forms a group isomorphic to $S_4$ because the diagonals of the cube can be mapped to the elements being permuted in $S_4$.
    Each is their conjucgacy class except for the 180 around opposite faces. It is its own conjugacy class.
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    For marked shape problems, describe how to determine which subgroup is relevant for the symmetries of the marked shape. Use this to determine the subgroup for a tetrahedron (numbering 1,2,3,4) with marked edges 12, 23, 34, 41.
  ],
  answer: [
    We use the stabilizer to determine the subgroup relevant for the symmetries of the marked shape. The stabilizer consists of all group elements that leave the marked shape unchanged. The orbit can be determined by the formula: $|orb(x)| = |G| \/ |stab(x)|$.


    1. Work inside the rotation group $A_4$ (order 12).
    2. The marked edges form a 4-cycle on the vertices. Under $A_4$, there are exactly 3 distinct such 4-cycles, so the orbit of this marked configuration has size $3$.
    3. By orbit–stabilizer: $|stab| = 12 / 3 = 4$.
    4. The only subgroup of order $4$ in $A_4$ is the Klein four group $V_4$.

    Therefore, the rotational symmetry group of the marked tetrahedron is $V_4$.
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Let $G = C_3 = <r | r^3 = e>$. Consider $rho: C_3 -> GL(CC^3)$ with $rho(r) (e_0, e_1, e_2) = (e_1, e_2, e_0)$.

    Compute the characters of this representation and decompose it into irreducible representations by first writing down the character table of $C_3$.
  ],
  answer: [
    $chi(e) = 3, chi(r) = 0, chi(r^2) = 0$.

    The character table of $C_3$ is:

    $
      mat(
        chi_"triv", 1, 1, 1;
        chi_omega, 1, omega, omega^2;
        chi_(omega^2), 1, omega^2, omega
      )
    $

    With $omega = exp(2 pi i / 3)$ because $rho(r)^3 = rho(r^3) = rho(e) = 1$, thus roots of unity.

    To compute the multiplicities of the irreps in $rho$ we compute the inner products. Finally we get:$rho iso rho_"triv" oadd rho_"omega" oadd rho_"omega^2"\ $
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    What does the parity of a permutation mean tell us? Quick Facts.
  ],
  answer: [
    Parity = even or odd.

    $
      => det(sigma) = {1, -1}\
      => "sign function": sgn: S_n -> {1, -1}, sgn(sigma) = det(rho(sigma))\
      => sgn(sigma tau) = sgn(sigma) sgn(tau)
    $
  ],
)

#flashcard(
  title: "Finite Groups",
  color: blue,
  question: [
    Given this figure: Tetragon with market corners: (12), (23), (34), (41). Describe the steps to
    determine the number of possible eigenvalues and calculate the number of possible eigenvalues.
  ],
  answer: [
    To compute the number of possible eigenvalues:
    + Determine the subgroup that leaves the marked shape invariant.
    + Show that the subgroup is isomorphic to $D_4$.
    + Write down the character table of $D_4$.
    + Determine that the representation space is $V = CC^12$.
    + Compute the characters of each $CC^3$ subrepresentation.
    + Compute the full $CC^12$ representation.
    + Compute the multiplicities of each irrep in the full representation using the inner product.
    + The number of possible eigenvalues equals the number of distinct irreps in the decomposition.
  ],
)



#render-flashcards()
