#import "../../../lib/lib.typ": *
#show: frame-style(styles.boxy)


= Grundbebriffe

== Gruppen


#definition[Definition][Gruppe][
  Eine Gruppe ist eine Menge $G$ mit einer Verknüpfung/Produkt/Gruppenoperation:

  $
    G cross G -> G\
    (g,h) |-> g h
  $

  sodass

  $
    (g h)k = g (h k)\
    exists bb(1) => bb(1) g = g bb(1) = g\
    forall g in G exists g^m1 in G => g g^m1 = g^m1 g = bb(1)\
  $

  Das Einselement ist eindeutig. Das inverse ist eindeutig.

  Rechenregeln:

  $
    (g h)^m1 = h^m1 g^m1\
    h^m1 g^m1 g h = h^m1 h = bb(1)\
  $

  Die Ordnung von G:

  $
    abs(G) in NN union infinity
  $

  $G$ ist *abelsch*, wenn die Verknüpfung kommutativ ist:

  $
    g h = h g\
  $

  Bei einer abelschen Gruppe ist die Verknüpfung oft als Addition geschrieben. Einselement wird zur Null.

  Beispiele: $ZZ, RR, CC$ mit $+$ oder Vektorräume.
]

=== Untergruppe

#definition[Definition][Untergruppe][
  Eine Untergruppe $H subset G$ ist eine nicht-leere Teilmenge, sodass:

  $
    h_1, h_2 in H => h_1 h_2 in H\
    h in H => h^m1 in H\
    => bb(1) in H\
  $

  Eine Untergruppe ist eine Gruppe mit der gleichen Verknüpfung wie $G$.
]

=== Direktes Produkt 

#definition[Definition][Direktes Produkt][
  Das direkte Produkt $G_1 cross G_2$ ist das karthesisches Produkt:

  $
    (g_1, g_2)(h_1, h_2) = (g_1 h_1, g_2 h_2)\
  $

  Das Einselement ist $(bb(1), bb(1))$ und das Inverse ist $(g_1, g_2)^m1 = (g_1^m1, g_2^m1)$.

  Direkte Produkte benutzt man in fällen, wo zwei Gruppen unabhängig sind, also die Verknüpfung nicht von der anderen abhängt oder nicht kompatibel ist.
]

=== Zyklische Gruppe $C_n$

#definition[Zyklische Gruppen][
  $C_n$ Zyklische Gruppen der Ordnung $n$: $ZZ_n = ZZ\/n ZZ =$ Restklassen ${0, 1, ..., n-1}$ mit $+$ modulo $n$. $a = b$ falls $a - b$ ein Vielfaches von $n$ ist. Das produkt ist die Addition modulo $n$.
]

=== Symmetrische Gruppe $S_n$

#definition[Symmetrische Gruppe][
  $S_n$ Symmetrische Gruppe der Ordnung $n$: Permutation von $n$ Elementen. Ist eine bijektive Abbildung $pi: {1, ..., n} -> {1, ..., n}$ mit der Verknüpfung $pi_1 pi_2 = pi_1 circ pi_2$ mit offensichtlichem Einselement $id$ und Inversen $pi^m1$.
]

=== Diedergruppe $D_n$

#definition[Diedergruppe][
  Diedergruppe $D_n$ der Ordnung $2n, n >= 3$: Symmetriegruppe eines n-Ecks. Es besteht aus $n$ Rotationen und $n$ Spiegelungen: $X in O(2)$ die das im Ursprung zentriertes n-Eck wieder auf sich selbst abbildet.

  Lemma: Sei $R in S O(2) subset O(2)$ die Drehung um $(2 pi)/n$, $S in O(2)$ die Spiegelung an der x-Achse, dann ist $D_n = <R, S> = {R^k, S R^k | k in {0, ..., n-1}}$.

  Es gilt:

  $
    S R S = R^m1\
    R S = S R^m1\
  $
]

Sei $v_0, ... , n_(n-1)$ in $RR^2$, die Ecken eines n-Ecks, dann:

$
  R v_j = v_(j+1)\
  S v_j = v_(n-j)\
$

Das Paar $(v_0, v_1)$ wird durch die $2n$ Elemente der Diedergruppe $D_n$ auf verschiedene Paare abgebildet. Genauer: Für jedes $g in D_n$ ist $g(v_0, v_1)$ ein Paar benachbarter Ecken des n-Ecks, und für zwei verschiedene Elemente $g, h in D_n$ gilt $g(v_0, v_1) != h(v_0, v_1)$. Umgekehrt gibt es für jedes Paar benachbarter Ecken $(v_i, v_{i+1 mod n})$ oder $(v_{i+1 mod n}, v_i)$ genau ein Element $g in D_n$ mit $g(v_0, v_1) = (v_i, v_{i+1 mod n})$ bzw. $g(v_0, v_1) = (v_{i+1 mod n}, v_i)$.

Es ist generell zielführender, die wirkung von Operationen auf einzelne Elemente zu betrachten, als die Wirkung auf ganze Mengen.


=== Allgemeine lineare Gruppe $KK$

#definition[Definition][Allgemeine lineare Gruppe][
  Die allgemeine lineare Gruppe $G L(n, KK)$ ist die Gruppe der invertierbaren Matrizen der Ordnung $n$ über dem Körper $KK$ mit der Matrixmultiplikation als Verknüpfung. Das Einselement ist die Einheitsmatrix und das Inverse ist die Inverse Matrix.

  $
    G L(n, KK) = {A in mattyp(n, n) (KK) | det(A) != 0}\
  $

  Die Ordnung von $G L(n, KK)$ ist $abs(KK)^{n^2} - |KK|^{n^2-1}$.
]
=== Vektorraum $V$

#definition[Definition][Vektorraum $V$][
  $
    V "Vektorraum" -> G L (V) = {f:V -> V|"f linear"}
  $
]

=== Orthogonale Gruppe $O(n)$

#definition[Definition][Orthogonale Gruppe][
  $
    O(n) = {A in mattyp(n ,n) (RR) | A^T A = id}
  $

  Es gilt:

  $
    A^m1 = A^T\
    O(n) subset G L(n, RR)\
    A, B in O(n) => A B in O(n)\
    (A B)^T A B = id
  $
]

=== $O(p, q)$

#definition[Definition][$O(p, q)$][
  Sei für $x, y in RR^(p + q)$:

  $
    (x, y)_(p, q) = sum_(i=1)^p x_i y_i - sum_(i=p+1)^(p+q) y_i x_i\
  $

  $
    O(p, q) = {A in G L (p + q, RR)\
    | forall x, y in RR^(p + q): (A x, A y)_(p, q) = (x, y)_(p, q)}\
  $

  Beispiele:

  $
    O(n, 0) = O(n)\
    O(1, 3) = "Lorentzgruppe"\

  $
]

=== Unitäre Gruppe $U(n)$

#definition[Definition][Unitäre Gruppe][
  $
    U(n) subset G L(n, CC)\
    U(n) = {A in G L(n, CC) | A^* A = id}\
    = {A in G L(n, CC) | (A u, A v) = (u, v) forall u, v in CC^n}\
    A^* = over(A^T) = A^dagger\
  $

  Mit dem normalen Skalarprodukt.
]

=== Symplektische Gruppe $S p(n)$

#definition[Definition][Symplektische Gruppe][
  Betrachte die antisymmetische Bilinearform auf dem Vektorraum $RR^{2n}$:

  $
    omega(X, Y) = sum_(i=1)^n (X_(2i-1) Y_(2i) - X_(2i) Y_(2i-1))\
    => mat(0, 1, 0; 1, 0, 0; 0, 0, 1; 0, 0, 0)\
    
    S p (2n) = {A in G L(2n, RR) | omega(A X, A Y) = omega(X, Y)}\
    = {A in G L(2n, RR) | A^T Omega_(2n) A = Omega_(2n)}\
  $
]

=== Spezielle lineare Gruppe $S G$

#definition[Definition][$S G$][
  $
    S G = {A in G L(n, KK) | det(A) = 1 } subset G\
  $

  Beispiele:

  $S O(n), S U(n), S L(n, KK) = S G L (n, KK)$.
]

== Gruppenoperationen

#definition[Definition][Gruppenwirkung][
  Eine Gruppe $G$ wirkt auf eine Menge $M$, wenn eine Abbildung gegeben ist:

  $
    G cross M -> M\
    (g, x) |-> g x
  $

  welche folgende Eigenschaften erfüllt:

  $
    g_1 (g_2 x) = (g_1 g_2) x\
    bb(1) x = x\
    forall g in G exists g^m1 in G => g^m1 g x = id x
  $

  Beispiele:

  - Jede Gruppe $G$ wirkt auf sich selbst durch die Links- und Rechtsmultiplikation und durch Konjugation $M = G$:

    $
      L: g dot x = g x\
      R: g dot x = x g^m1\
      g dot x = g x g^m1\
    $

    Dies mag trivial erscheinen, es ist aber sehr wichtig die beiden Richtungen nicht zu vertauschen.

  - $G L$ wirft auf $RR^n$:
    $
      A dot x = A x
    $
  
  - $O(n)$ wirkt auf $S^(n-1) = {x in RR^n | norm(x) = 1}$:

    $
      A dot x = A x\
    $
]
  
=== Gruppenhmomorphismus

#definition[Definition][Gruppenhomomorphismus][
  Ein Gruppenhomomorphismus $phi: G -> H$ ist eine Abbildung zwischen zwei Gruppen, die die Verknüpfung erhält:

  $
    phi(g_1 g_2) = phi(g_1) phi(g_2)\
  $

  Das Einselement wird auf das Einselement abgebildet:

  $
    f(bb(1)_G) = bb(1)_H\
  $

  Das Inverse wird auf das Inverse abgebildet:

  $
    f(g^m1) = f(g)^m1\
  $

  Beispiele: $f: G L(n, KK) -> O(n)$, $f: S L(n, KK) -> S O(n)$.
]

=== Gruppenisomorphismus

#definition[Definition][Gruppenisomorphismus][
  Ein Gruppenisomorphismus ist ein Gruppenhomomorphismus, der bijektiv ist. Zwei Gruppen $G$ und $H$ sind isomorph $G tilde.equiv H$, wenn es einen Gruppenisomorphismus zwischen ihnen gibt.

  Wir müssen keine weiteren Eigenschaften annehmen weil wir in der Definition bereits die Gruppenstruktur voraussetzen:

  $
    phi(id_G) = id_H\
    phi(g^m1) = phi(g)^m1\
  $
]

Gruppenisomorphismen kann man verknüpfen:

$
  psi circ phi: G -> H -> K\
$

Ist $phi$ ein Gruppenisomorphismus, dann ist $phi^m1$ auch ein Gruppenisomorphismus.

=== Kern und Bild eines Gruppenhomomorphismus

#definition[Definition][Kern][
  Der Kern eines Gruppenhomomorphismus $phi: G -> H$ ist die Menge der Elemente, die auf das Einselement abgebildet werden:

  $
    ker(phi) = {g in G | phi(g) = id_H} subset G\
  $

  Der Kern ist eine Untergruppe von $G$.
]

#definition[Definition][Bild][
  Das Bild eines Gruppenhomomorphismus $phi: G -> H$ ist die Menge der Elemente, die erreicht werden:

  $
    im(phi) = {h in H | exists g in G: phi(g) = h} subset H\
  $

  Das Bild ist eine Untergruppe von $H$.
]

Ein Gruppenhomomorphismus $G -> H$ ist genau dann ein Isomorphismus, wenn $ker(phi) = {id}$ und $im(phi) = H$.

=== Nebenklassen

#definition[Definition][Nebenklassen][
  Sei $H subset G$ eine Untergruppe. Die Menge $G\/H$ der links Nebenklassen ist die Menge der £quivalenzklassen bezüglich der Äquivalenzrelation $g_1 ~ g_2$ genau dann, wenn $exists h in H: g_2 = g_1 h$.
]

Beispiel:

$
  N_g = {g' in G | g'  tilde g}\
$

Alle $N_g$ sind gleich gross, denn:

$
  g^m1 (-) :N_g arrows.lr N_1: g(-)\
$

sind inverse Abbildungen.

Die Nebenklasse $N_1 = H$. Das bedeutet, dass alle Nebenklassen die gleiche Grösse haben und sind disjunkt. Also falls $abs(G)$ endlich ist, dann ist $abs(G) = abs(H) abs(G\/H)$.

Man muss aufpassen, denn $G\/H$ hat keine natürliche Gruppenstruktur.

=== Normalteiler

#definition[Definition][Normalteiler][
  Ein Normalteiler $H subset G$ ist eine Untergruppe, die invariant unter Konjugation ist:

  $
    g h g^m1 in H\
  $

  Das bedeutet, dass $g h g^m1 in H$ für alle $g in G$ und $h in H$.

  Beispiel: $G$ Abelsch: jede Untergruppe ist Normalteiler, denn $g h g^m1 = h$.

  Normalteiler sind genau die Nebenklassen, die eine Gruppenstruktur haben. Die Quotientengruppe $G\/H$ ist die Menge der Nebenklassen bezüglich der Äquivalenzrelation $g_1 ~ g_2$ genau dann, wenn $exists h in H: g_2 = g_1 h$.

  Sei $[g]$ die Nebenklasse von $g$ in $G\/H$.

  Sei $H subset G$ ein Normalteiler, dann ist

  $
    G\/H cross G\/H -> G\/H\
    ([g_1], [g_2]) |-> [g_1 g_2]\
  $

  ein *wohldefiniertes* Produkt auf $G\/H$. Dann ist $G\/H$ eine Gruppe, gennant *Faktorgruppe* mit dem Einselement $[id]$.
]

Beispiel:

- $V$ Vektorraum $=> (V, +)$ ist eine Gruppe. $U subset V$ ist Untervektorraum 
  $
    => U subset V "Untergruppe"\
    => U "Normalteiler" in $V$\
    => V\/U "Quotientenraum"\
  $

-$ZZ\/n ZZ$ ist der Quotient von $ZZ$ und $n ZZ subset ZZ$

-$phi: G -> H "Hom" => ker(phi) subset G$ ist ein Normalteiler in $G$.

- $G L(n, KK) ->^(det) G l(1, KK) = {x in KK| x != 0}$. ist ein Gruppenhomomorphismus:

  $
    det(A B) = det(A) det(B)\
    => ker(phi) = S L (n, KK) subset G L(n, KK) "Normalteiler"\
  $

#theorem[Theorem][
  Sei $phi: G -> H$ Gruppenhomomorphismus, dann:
  $
    G\/ker(phi) tilde.equiv im(phi)\
    [g] |-> phi(g)\
  $
]

=== Semidirekte Produkte

Beispiel:

Die *Bewegungsgruppe* von $RR^3$ ist die Gruppe der affinen Transformationen:

$
  x in RR^3 |-> A x + b\
  A in O(3), b in RR^3\
$

Das Produkt ist die Komposition von Abbildungen:

$
  (A_1, b_1)(A_2, b_2) = (A_1 A_2, A_1 b_2 + b_1)\
  x |-> A_2 x + b_2 |-> A_1 (A_2 x + b_2) + b_1 = A_1 A_2 x + A_1 b_2 + b_1\
  id = (id, 0)\
  (A, b)^m1 = (A^m1, -A^m1 b)\
$

Wir schreiben $I O(3)$ für die inhomogene Orthogonale Gruppe.

Wir haben die Gruppen $I O(3)$ (Inhomogene Orthogonale Gruppe) und $I O (1,3)$ (Inhomogene Lorentzgruppe). Diese Gruppen sind semidirekte Produkte:

#definition[Definition][Semidirekte Produkte][
    Seien $G, H$ Gruppen und $rho: G = aut(H) = {phi:H -> H| "Gruppensiom"}$

    Dann ist $G cross H$ mit Produkt

    $
      (g_1, h_1)(g_2, h_2) = (g_1 g_2, h_1 rho_g_1 (h_2)) \(rho_(g_1) (h_2) = rho(g_1)(h_2)
    $

    eine Gruppe: Das semidirekte Produkt $G times.r_h H$.

    Beispiel:

    $I O (3) = O(3) times.l_rho RR^3$ mir $rho_A (b) = A b$ für $A in O(3)$ und $b in RR^3$.

    Es gilt:

    $
      rho_g_1 times rho_g_2 = rho_(g_1 g_2)\
      rho_g (h_1 h_2) = rho_g (h_1) rho_g (h_2)\
    $

    Impliziert assoziativität:
    $
      ((g_1, h_1)(g_2, h_2))(g_3, h_3) = (g_1, h_1) ((g_2, h_2)(g_3, h_3))\
    $
    

    Einsnelement: $(1, 1)$

    Inverses: $(g, h)^m1 = (g^m1, rho_(g^m1) h^m1)$.
]

== Lie Gruppen

Sind Gruppen die einerseits die Struktur einer Mannigfaltigkeit haben und andererseits die Verknüpfung und Inversen Abbildung glatt sind.

#definition[Definition][Lie Gruppe][
  Eine Lie-Gruppe ist eine Gruppe $G$ die gleichzeitig eine $C^infinity$ Mannigfaltigkeit ist, sodass das Produkt $G cross G -> G$ und die Inversen Abbildung $G -> G$ beide $C^infinity$ sind.
]

Beispiele: $G L(n, RR)$, $G L(n, CC)$, $O(p ,q)$, $U(p, q)$, $S O(p, q)$, $S U(p, q)$, $S L(n, RR)$.

$G$ ist jeweils eine Untermannigfaltigkeit von $RR^(N cross N)$. Zum Beispiel ist $S L (n, RR) = {A in RR^(n cross n) | det(A) = 1} = det^m1(1)$ eine Untermannigfaltigkeit von $RR^(n cross n)$.

- Mult ist Matrizenmultiplikation, also $C^infinity$.

- Inverse $A^m1 = 1/det(A) adj(A)$ ist $C^infinity$ auf ${A | det(A) != 0}$


=== Zusammenhangseigenschaften

#definition[Definition][Zusammenhang][
  $X$ sein ein metrischer Raum, dann ist $X$ wegzusammenhängend, falls:

  $
    forall x, y in X exists gamma: [0, 1] -> X "stetig"\
    gamma(0) = x, gamma(1) = y\
  $
]

#definition[Definition][Zusammenhangskomponenten][
  Die Zusammenhangskomponenten einer Menge $X$ sind die maximalen zusammenhängenden Teilmengen von $X$. Diese werden durch die Äquivalenzrelation $x tilde y$ definiert, wenn es einen Weg $gamma: [0, 1] -> X$ gibt, sodass $gamma(0) = x$ und $gamma(1) = y$.

  Eine Menge ist zusammenhängend, wenn sie nicht in zwei disjunkte offene Mengen zerlegt werden kann.
]

#theorem[Theorem][
  Sei $G subset G L (n, KK)$ eine Untergruppe.
  Sei $G_0$ die Zusammenhangskomponente von $id in G$, dann:

  $
    G_0 subset G "Normalteiler"\
    => G\/G_0 tilde.equiv "Menge der Kusammenhangskomp."
  $
]

#theorem[Theorem][Zusammenhänge][
  - $SO(n), SU(n), U(n)$ sind zusammenhängend.

  - $O(n)$ besteht aus zwei Zusammenhangskomponenten:

    $
      O(n) = {A in O(n) | det(A) = 1} union {A in O(n) | det(A) = -1}\
    $ 
]

Um zu zeigen, dass eine Gruppe zusammenhängend ist, genügt es zu zeigen, dass jedes Element $g in G$ zu $id$ verbunden werden kann. 
  
Beispiel $SU(n)$:

Jedes Element $A in SU(n)$ ist eine unitäre Matrix mit $det(A) = 1$. $A = U D U^m1$.

Wir können annehmen, dass $D$ eine Diagonalmatrix ist mit exponentiellen Einträgen $e^(i phi_1), ..., e^(i phi_n)$. Die stetig Abbildung besteht dann aus $e^(i phi_i t)$. Für $SU(n)$ müssen wir zusätzlich annehmen, dass $sum_i phi_i = 0$. Dies folgt aus der Freiheit beliebige $phi$ zu wählen. Daraus folgt, dass $det(D) = 1$.

Beispiel $SO(n)$:

Wir benutzen die Normalform für orthogonale Matrizen:

$
  forall A in O(n) exists O in O(n):\
  A = O diag(R(phi_1), ..., R(phi_k), plus.minus 1, ..., plus.minus 1) O^m1\
  R(phi_i) = mat(cos(phi_j), -sin(phi_j); sin(phi_j), cos(phi_j)) in SO(2)\
$

Nun müssen wir zeigen, dass die Determinante $det(A) = 1$ ist. Dies kann man für $A in SO(n)$ wegen $R(pi) = mat(-1, 0; 0, -1)$ annehmen.

Unsere stetige Abbildung ist dann:

$
  gamma t |-> O diag(R(phi_1 t), ..., R(phi_k t), 1, ..., 1) O^m1\
$

Dies zeigt, dass $SO(n)$ zusammenhängend ist.


Gegenbeispiel $O(n)$:

Wir werden zeigen, dass $O(n)$ aus zwei disjunkten Zusammenhangskomponenten besteht. Wir haben bereits gezeigt, dass $SO(n)$ zusammenhängend ist. Dies ist eine derKomponenten. Die andere Komponente ist $det(A) = -1$.

$
  P = diag(1, 1, ..., 1, -1) in O(n)\
$

Wir wollen $P$ und jedes $A$ mit einer stetigen kurve verbinden.

$
  P A in SO(n)\
  tilde(gamma): [0, 1] -> O(n)\
  tilde(gamma)(0) = id\
  tilde(gamma)(1) = P A\
  gamma(t) = P tilde(gamma)(t)\ 
$

Dies ist eine stetige Abbildung, die $P$ mit $A$ verbindet. Um zu zeigen, dass die zwei Komponenten disjunkt sind, müssen wir zeigen, dass es keine stetige Abbildung zwischen ihnen gibt. 

Das ist klar weil die Determinante eine stetige Abbildung ist, und Abbildungen in $det(P) = -1$ und $det(A) = 1$ somit nicht stetig verbunden werden können.

Genauer:

$
  t |-> det(gamma(t)) "stetig"\
  det(gamma(0)) = det(gamma(0)) = 1\
  det(gamma(1)) = det(gamma(1)) = -1\
$

Dies ist nicht möglich, da die Determinante stetig ist und somit nicht von $1$ auf $-1$ springen kann.

== Bahnensatz und Bahnenformel

#definition[Definition][Bahn][
  Sei $G$ eine Gruppe, die auf einer Menge $X$ wirkt.
  
  Für $x in X$ ist

  $
    G_x = {g dot x | g in G} subset X\
  $

  die Bahn (orbit) von $x in X$
]

#definition[Definition][Stabilisator][
  $
    Stab_x = {g in G | g x = x} subset G\
  $

  Der Stabilisator ist nicht nur eine Untermenge, sondern eine Untergruppe von $G$.
]

#theorem[Theorem][Bahnensatz und Bahnenformel][
  Wirkt die Gruppe $G$ auf der Menge $X$, so ist für alle $x in X$:

  $
    G\/Stab_x ->G_x\
    [g] |-> g x
  $

  ist wohldefiniert und bijektiv. 

  Insbesondere, wenn $G$ endlich ist, dann gilt die *Bahnformel*:

  $
    abs(G) = abs(G_x) abs(Stab_x)
  $
]

Beispiel: 

Die *Oktaeder Gruppe* $O subset O(3)$ ist die Symmetriegruppe eines im Ursprung zentrierten Würfels oder Oktaeders. Sie hat $48$ Elemente.

Um zu zeigen, dass $abs(O) = 48$, betrachten wir die Bahn und den Stabilisator.

$O$ wirkt auf $X$ (Eckpunkte des Würfels). Sei $x in X$ eine Ecke: $O_x = X$. $abs(O_x) = 6$

Der Stabilisator $Stab_x$ ist die Gruppe der Symmetrien, die die spezifische Ecke $x in X$ fixieren. Diese Gruppe ist isomorph zu $D_3$ (Diedergruppe der Ordnung $6$), da sie die Symmetrien des Dreiecks ist, das die drei anderen Ecken des Würfels verbindet.

Die Ordnung des Gesamten Würfels ist also:
$
  abs(O) = abs(O_x) abs(Stab_x) = 8 * 6 = 48\
$

Beispiel:

*Kristallographie*: Man hat Salz NaCl mit der sich absechselnden kubischen Struktur:

$
  mat(N a, C l, N a; C l, N a, C l; N a, C l, N a)\
$

$
  "Na": Gamma_(f c c) = {(i, j, k) in ZZ^3 | i + j + k = "gerade"}\
$

Sei $G_"NaCl" subset IO(3) = O(3) prodl RR^3$, die Symmetriegruppe, welche das Gitter auf sich selbst abbildet. Diese Gruppen nennt man auch Kristallographische Gruppen (es gibt nur 230 davon).

$O$ ist die oktaeder Gruppe, die die Symmetrie des Würfels beschreibt, also geeignet ist, um die Symmetrie des Gitters zu beschreiben.

Wir wollen nun die Symmetriegruppen unseres Gitters bestimmen.

- $Gamma_(f c c) subset G_"NaCl"$

- $U subset G_"NaCl"$

Wir müssen zeigen:

$
  G_"NaCl" = O prodl Gamma_(f c c)
$

Beweis:

Sei $X = Gamma_(f c c)$ die Menge der Natrium-Ionen. $G_"NaCl"$ operiert also auf $X$.

$
  x = 0\
  G_("NaCl" )x = Gamma_(f c c) = X\
  "Aber" Stab_x = O\
$

Nach Bahnensatz:

$
  G_"NaCl"\/O tilde.equiv Gamma_(f c c)
  => G_"NaCl"\/ O tilde.equiv O prodl Gamma_(f c c)\/O\
$

Dies kann nur eine Bijektion sein, falls die Abbildung schon bijektiv, also schon surjektiv ist. Die surjektivität beweist die Behauptung.

== To Know

- Bekomme System und sage was die Symmetriegruppe ist.

- Bekomme System und sage wieviele Elemente die Symmetriegruppe hat.

- Bekomme System und sage, wie man alle Symmetriegruppen findet.




