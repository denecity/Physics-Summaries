#import "lib.typ": *
#show: frame-style(styles.boxy)

= Eigenwertprobleme mit Symmetrie

== Eigenwerte und Eigenvektoren

Sei $rho: G -> GL(V)$ eine Darstellung der Gruppe $G$ und $A:V -> V$. Wir wollen $A$ diagonalisieren. Wir suchen $rho(g) A = A rho(g) forall g in G$.

Also $A in Hom_G(V, V)$. Ein Beispiel davon findet man in der Quantentheorie. In dem Fall wär $A$ der Hamiltonoperator und $rho(g)$ die Zeitentwicklung. Dann ist $V$ ein Hilbertraum.

Frage: Was bringt uns die Symmetrie um $A$ zu diagonalisieren? Was können wir über die Eigenwerte und Eigenvektoren von $A$ sagen durch die Symmetrie?

Wir kennen den Spezialfall: Falls unsere Darstellung $rho$ irreduzibel. Über das Lemma von Schur 2 $=>A = c id_V =>$ alle Eigenwerte von $A$ gleich, jedes $v in V, v!=0$ ist ein Eigenvektor.

#theorem[Satz][
  Sei $rho: G -> GL(V)$ eine endlichdimensionale, komplexe Datstellung einer endlichen Gruppe $G$ (geht auch für kompakte Gruppen, wir müssen nur vollständig reduzieren können).

  Sei $ A: V -> V$ eine diagonalisierbare lineare Abbildung, so dass $rho(g) A = A rho(g)$ für alle $g in G$ gilt.

  Sei $V iso V_1 oadd ... oadd V_n$ eine Zerlegung in irreduzible, invariante Unterräume. Dann hat $A$ höchstens $n$ verschiedene Eigenwerte und in einer geeigneten Basis gilt, dass $A$ Diagonalform hat:

  $
    diag(lambda_(1 1), ..., lambda_(1 n), lambda_(2 1), ..., lambda_(2 n), ..., lambda_(n 1), ..., lambda_(n n))
  $ 
]

Beweis:

Seien $E_1, ..., E_m$ die Eigenräume von $A$ mit den Eigenwerten $mu_1, ..., mu_m$. $A$ ist diagonalisierbar:

$
  V = E_1 oadd ... oadd E_m\
  forall g in G, v in E_j: A rho(g) v =  rho(g) A v = mu_j rho(g) v\
  => rho(g) v in E_j
$

$=>$ die $E_j$ sind invariante Unterräume.

Zerlege die Darstellungen $E_j$ seperat in irreduzible Unterdarstellungen:

$
  => V = V'_1 oadd ... oadd V'_n'\
  rho|_(V'_j) "irreduzibel"\
  => A|_(V'_j) = c_j id_{V'_j}\
$

$=>$ Es gilt $n = n'$ und die Dimensionen $dim(V'_1), ..., dim(V'_n)$ sind gleich der Dimensionen der $dim(V_1, ..., V_n)$ bis auf eine Permutation.

Man kann annehmen $V_j = V'_j$. Wähle eine Basis von $V$ als Vereinigung von Basen von $V_1, ..., V_n$. Dann ist wegen above $A$ automatisch diagonal in dieser Basis und alle Basiselemente von $V_j$ sind Eigenvektoren zum gleichen Eigenwert.

Bemerkung:

Sei $V iso W_1, ... , W_k$ die Zerleigung von $V$ in isotypische Komponenten. Also für $(rho_1, V_1), ..., (rho_k, V_k)$ die irreduziblen Darstellungen von $G$ mit $W_j iso V_j oadd ... oadd V_j$ mit Vielfachheit $n_j$ an $V_j$. $n_j = (chi_j, chi_rho)$.

Es gilt für $A in Hom_G(V, V)$:

$
  A: V -> V\
  forall g in G rho(g) A = A rho(g)\
$

Dann ist $A$ diagonalisierbar und in der Basis von $V$ mit Basisvektoren $v_{j i}$ für $i = 1, ..., n_j$ ist $A$ diagonal.

Beweis:

1. Zerlege die Darstellung $V$ in isotypische Komponenten. Zu jeder irreduziblen Darstellung von $G$ gibt es eine isotypische Komponente $W_j$ mit Vielfachheit $n_j$.

  $
  V = W_1 oadd ... oadd W_k\
  $

  Schreibe $A$ in Blockform:

  $
    A = (A_(i j))_(i j) in mattyp(k, k)\
    "mit" A_(i j): W_j -> W_i\
  $

2. Schreibe:

  $
    W_i = V_i oadd ... oadd V_i "vielfachheit" n_i\
  $

  Aber das ist nicht eindeutig. Schreibe $A_(i j)$ in Blockform bezüglich dieser Zerlegung:

  $
    A_(i j) = (A_(i j, p q))_(p q) in mattyp(n_i, n_j)\
    "mit" A_(i j, p q): V_j -> V_i\
  $

  In Blockschreibweise:

  $
    rho(g) = diag(rho_1 (g), ..., rho_1 (g), rho_2 (g), ..., rho_2 (g), ..., rho_k (g), ..., rho_k (g))\
  $

  Mit Blöcken $n_1, ..., n_k$.

  Wir schauen uns wieder $rho (g) A = A rho(g)$ an. Das heißt:

  $
    forall i, j, p, q, forall g in G:\
    rho_i (g) A_(i j, p q) = A_(i j , p q) rho_j (g)\
  $

  $
    => A_(i j, p q) in Hom_G(V_j, V_i)\
  $

  Wir benutzen das Lemma von Schur 2:

  Angenommen $V_i != V_j$, dann ist die Abbildung $A_(i j, p q) = 0$. Ist $V_i = V_j$, dann ist $A_(i j, p q) = c_(i j, p q) id_{V_i}$.

  $
    => A = diag(A_(1 1), ..., A_(k k))\
    A_(i i) = (a_(i, l m) id_(V_i))_(l m) in mattyp(n_i, n_i)\
  $

  Wir können es auch so schreiben:

  $
    W_i iso V_i oadd ... oadd V_i = = V_i oprod C^(n_i)\
    A_(i i) = id_(V_i) oprod a_i\
    a_i = (a_(i, l m))_(l m) in mattyp(n_i, n_i) in End(CC^n) 
  $

Die Diagonalisierung von $A$ ist also zurückgeführt auf die Diagonalisierung der Matrizen der $n_i prod n_i$ Matrizen $a_i$.

Spezialfall:

Seien alle $n_i in {0, 1}$. Sei $rho: G -> GL(V)$ eine Darstellung der endlichen Gruppe $G$ und $A in Hom_G(V, V)$.

Sei $V = U_1 oadd ... oadd U_n$ eine Zerlegung in irreduzible, invariante Unterräume, sodass $rho|_(U_i) != rho|_(U_j)$ für $i != j$.

Dann gilt:

$
  A U_i subset U_i\
  "und"\
  A|_(U_i) = lambda_i id_(U_i)\
$

Beispiel:

Diagonalisiere $A = mat(a, b, b; b, a, b; b, b, a)$. Wir haben viel Symmetrie.

Es gilt $rho(sigma) A = A rho(sigma) forall sigma in S_3$, mit $rho: S_3 -> GL(C^3)$ durch Permutation der Basisvektoren.

$
  rho(sigma) e_i = e_(sigma(i))\
$

Wir haben schon gesehen $rho iso rho_"triv" oadd rho_2$, wobei $rho_2$ die 2-dimensionale irreduzible Darstellung ist. Da die beiden Darstellungen inäquivalent sind, ist der Satz anwendbar.

$
  V = CC^3 = span(mat(1; 1; 1)) oadd span(mat(1; -1; 0), mat(0; 1; -1))
$

$=>$ Die Basisvektoren sind Eigenvektoren. Die Eigenwerte bestimmt man durch Anwendung:

$
  A mat(1; 1; 1) = (a + 2b) mat(1; 1; 1)\
  => lambda_1 = a + 2b\
  A mat(1; -1; 0) = (a - b) mat(1; -1; 0)\
  => lambda_2 = a - b
$

== Beipsiel: Kleine Schwingungen von Molekülen

Welche Schwingungsfrequenzen gibt es und mit welchen Amplituden schwingen die Atome?

#image("image-1.png")

1. Zuerst haben wir die Starrkörperbewegung. Die Atome bewegen sich linear und rotieren als ganzes.

Wir betracheten ein Molekül mit $N$ Atomen mit Koordinaten $y=mat(ay_1, ..., ay_N) in RR^(3N), ay_i in RR^3$, die wir als Punktmassen betrachten, mit Masse $m_i$. 

Die Atome bewegen sich in einem Potential

$
  V(y) = V(ay_1, ..., ay_N)\
$

Die neuton'sche Gleichung für die Bewegung der Atome ist:

$
  m_i dd(,ay_i^alpha (t), t, 2) = - pdv(V, ay_i^alpha (y(t)))\
$

Wir betrachten ein Kohlenstoff-Wasserstoff-Molekül $C, H_4$, wobei wir eine Tetraederstruktur haben. Wir haben 5 Atome, also $N = 5$ und $y in RR^{15}$.

Wir gucken uns die kleinen Schwingungen um die Gleichgewichtslage $y^*$ (lokales Minimum von $V$) an. Wir nehmen an, dass $V$ eine Taylorreihe bis zu zweiter Ordnung ist:

$
  y(t) = y^* + x(t)\
  x(t) "kleine Schwingung"\
  "Gleichgewichtslage:" Delta V (y^*) = 0\
$

Nähert man $V$ durch die Taylorreihe um $y^*$ an, so erhält man:

$
  m_i dv(x(t)_i^alpha, t, 2) =  - sum_(i j beta) pdv(V(y^*), y_i^alpha, y_j^beta) x_j^beta(t)  + o(x^2) \
  "Hesse Matrix in" y^*\
  => ddot(x) = - A x(t)\
  A = (m_i^m1 pdv(V(y^*), y_i^alpha, y_j^beta))_(i j) in mattyp(3N, 3N)\
$

Diese Matrix $A$ ist diagonalisierbar, da ähnlich zu Matrix mit Einträgen:

$
  m_1^(-1/2) pdv(V(y^*), y_i^alpha, y_j^beta) m_j^(-1/2)\
$

Diese Matrix ist diagonalisierbar.

Die Lösung der Differentialgleichung erhalten wir durch den Ansatz:

$
  x(t) = e^(i omega t) x_0\
  => -omega^2 e^(i omega t) x_0 = - A x_0\
  A x_0 = omega^2 x_0\
$

also ist $x_0$ ein Eigenvektor von $A$ und $omega^2$ der zugehörige Eigenwert. Die Eigenfrequenzen sind also die positiven Wurzeln der Eigenwerte von $A$.

Ziel: Diagonalisiere $A$. Dies sollte für die Matrix nicht zu schwierig sein, aber wir wollen die Symmetrie benutzen.

=== Symmetrien

1. Potential ist invariant unter Vertauschung gleicher Atome.

  $
    V(ay_(sigma(1)), ..., ay_(sigma(N))) = V(ay_1, ..., ay_N)\
  $

  Falls $sigma$ nur gleiche Atome vertauscht, dann ist $sigma$ eine Symmetrie des Potentials. Also $sigma in H = S_N_1 times S_N_2 times ... times S_N_K subset S_N$.

2. Wir nehmen an $V$ ist rotationsinvariant, spiegelungsinvariant und translationsinvariant. 

  $
    forall R in IO(3):  V(R ay_1, ...,  R ay_N) = V(ay_1, ..., ay_N)\
  $

3. Die Gleichgewichtslage $y^*$ ist invariant unter den der endlichen Untergruppe $G subset H times IO(3)$

  Schwerpunkt in $O =>$ ersetze $IO(3)$ durch $SO(3)$. Jedes $g in G, g = (sigma in H, R in O(3))$ workt auf einer Konfiguration $y in RR^(3N)$ wie folgt:

  $
    rho(g) (ay_1, ..., ay_N) = (R ay_(sigma^m1 (1)), ..., R ay_(sigma^m1 (N)))\
  $

  Zudem muss die Gleichgewichtslage $y^*$ invariant sein:

  $
    rho(g) y^* = y^*\
  $

  Wegen $V(rho(g) y) = V(y)$ folgt auch:

  $
    rho(g) A = A rho(g)\
  $

  $=> A$ ist ein Darstellungshomomorphismus von $G$ $A in Hom(RR^(3N), RR^(3N))$.

Unter der Annahme, dass in $y^*$ keine zwei Atome den gleichen Ort haben, bestimmt die Komponente $R$ von $g=(sigma, R)$ schon eindeutig.

Wir können $G subset O(3)$ als Untergruppe von $SO(3)$ betrachten, da $G$ auch die Spiegelungen enthält.

== Methan: Explizite Rechnung

Methan besteht aus einem Kohlenstoffatom und vier Wasserstoffatomen. Wir haben $N = 5$ und $y in RR^15$. Das Molekül hat eine Tetraederstruktur im Gleichgewichtszustand mit dem Kohlenstoffatom im Ursprung und den Wasserstoffatomen auf den Ecken des Tetraeders.

$
  y = (ay_1, ..., ay_4, ay_C)\
$

Symmetrieannahmen:

$
  V(ay_1, ..., ay_4, ay_C) = V(R ay_1, ..., R ay_4, R ay_C) forall R in IO(3)\
  = V(ay_(sigma(1)), ..., ay_(sigma(4)), ay_C) forall sigma in S_4\
$

Also:

$
  V(y) = V(rho(g) y) forall g in G\
  H_v (y) = rho(g)^T H_v (rho(g) y) rho(y)\
  => rho(g) H_v (y) = H_v (rho(g) y) rho(g)\
  y = y^*\
  => rho(g) H_v (y^*) = H_v (rho(g) y^* rho(g))\
  = H_v(y^*) rho(g)\
  M^m1 rho(g) H_v (y^*) = rho(g) M^m1 H_v (y^*)\
  = M^m1 H_v (y^*) rho(g)\
  => rho(g) A = A rho(g) 
$

Gleichgewichtslage $y^* in RR^15$ mit $y^*_C = 0, y^*_(1, ..., 4)$ sind Ecken eines Tetraeder.

Die Symmetriegruppe ist also die Tetraedergruppe $T iso S_4 = G$.

=== Charaktertafel $S_4$

$
  mat(24 T, [1], 8 [r_3], 3 [r_2], 6 [S_4], 6 [tau];
     chi_1, 1, 1, 1, 1, 1;
     chi_2, 2, -1, 2, 0, 0;
     chi_3, 1, 1, 1, -1, -1;
     chi_4, 3, 0, -1, 1, -1;
     chi_5, 3, 0,-1, -1, 1;)
$

Berechne $chi_rho (g) = tr(rho(g))$.

$
  tr(rho(1)) = tr(id) = 15\
  rho(tau) = mat(R, 0, 0, 0, 0; 0, R, 0, 0, 0; 0, 0, 0, R, 0; 0, 0, R, 0, 0; 0, 0, 0, 0, R), z.B. R = mat(1, 0, 0; 0, 1, 0; 0, 0, -1)\
  tr(rho(tau)) = 3
$

Allgemein ist $g in G$ mit zugehöriger Permutation $sigma in H$ der Atome und $R in O(3)$, so gilt:

$
  tr(rho(g)) = N_R dot tr(R)\
  N_R = "# Atome, die an Stelle bleiben"\
$

$
  tr(rho(r_3)) = 2 dot tr(R_(2/3 pi))
$

Allgemein in geeigneten Basisvektoren $e_1, e_2, e_3$:

$
  R_phi = mat(cos(phi), -sin(phi), 0; sin(phi), cos(phi), 0; 0, 0, 1)\
  => tr(R_phi) = 2 cos(phi) + 1\
  => tr(rho(r_3)) = 2 (2 cos(2/3 pi) + 1) = 0\
  chi_rho(r_2) = 1 dot (2 cos(pi) + 1) = -1\
  "allgemein" tr(R S) = 2 cos(0) - 1\
  chi_rho(S_4) = 1 dot (2 cos(pi/2) - 1) = -1\
  => chi_rho: (15, 0, -1, -1, 3)\
$

Vielfachheit der irreduziblen Darstellungen:

$
  n_1 = (chi_1, chi_rho) = 1/abs(G) 24 = 1\
  n_2 = (chi_2, chi_rho) = 1\
  n_3 = (chi_3, chi_rho) = 0\
  n_4 = (chi_4, chi_rho) = 1\
  n_5 = (chi_5, chi_rho) = 3\
$

Der Charekter zerfällt in folgende komponenten:

$
  chi_rho = chi_1 + chi_2 + chi_4 + 3 chi_5\
  => rho iso rho_1 oadd rho_2 oadd rho_4 oadd rho_5 oadd rho_5 oadd rho_5\
$

Wir haben aber noch nicht festgelegt, dass der Schwerpunkt im Ursprung ist. Für uns sind Verschiebungen aber keine Schwingungen. Wir könnten das Molekül auch als ganzes Rotieren. Beide führen zu Nullvektoren. Diese beiden Darstellungen müssen wir also noch rausnehmen.

Wir ziehen $rho_5$ (translation) und $rho_4$ (Rotation) ab. Es bleiben also 4 irreduzible Darstellungen übrig. Das heisst, wir haben 4 Eigenfrequenzen.

Translation:

Kleine Translationen aus der Ruhelageentsprechen Nullvekoren (Vektoren im Kern) von $A$, ergeben also keine Eigenschwingungen.

Beweis:

$
  V(ay_1, ..., ay_4, ay_C) = V(ay_1 + a, ..., ay_4 + a, ay_C + a) = V(y) = V(y + a)\
  A = (1/m_i pdv(V (y^*), y_i^alpha, y_j^beta))_(i j) in mattyp(15, 15)\
  => A y = 0\
  => sum_(i j beta) 1/m_i pdv(V (y^*), y_i^alpha, y_j^beta) a^beta\
  = 1/m_i pdv(, y_i^alpha) |_(y = y^*) (sum pdv(V (y), y_j^beta) a^beta) = 0\
$

Die Translation zerfällt in einen 3-dimensionalen Unterraum, der die Translationen in $RR^3$ beschreibt. Nun müssen wir aber herrausfinden, zu welchem irreduziblen Darstellung dieser Unterraum gehört.

$
  a in U\
  rho(g), g = (sigma, R)\
  rho(g) a = mat(R aa; R aa; ... ; R aa)\
  rho|_U iso G -> GL(RR^3), (sigma, R) |-> (x -> R x)\
  chi_"trans" ((sigma, R)) = tr(R) = 2 cos(theta) plus.minus 1\
  => chi_"trans" = chi_5
$

Drehung:

Wieder ein invarianter 3-dimensionaler Unterraum aus Nullvektoren von $A$. 

$
  U' = {mat(an cross ay_1^*, ..., an cross ay_4^*; 0, 0, 0)| an in RR^3} subset RR^15\
$

zerlege $rho|_(U')$ in irreduzible Darstellungen:

$
  rho^((sigma, R)) mat(an cross ay_1^*, ..., an cross ay_4^*; 0, 0, 0) = mat(r an cross R ay_(sigma^m1 (1)); ...) det(R)\
  = det(R) mat(an cross ay_1^*; ...)
$

Also ist $rho|_(U')$ isomorph zu $rho_"rot"$.

$
  chi_"rot" = mat(3, 0, -1, 1, -1)\
$

Über die Charaktertafel:

$
  => chi_"rot" = chi_4\
  => rho_"rot" iso rho_4\
$

Methan halt also höchstens 4 Eigenfrequenzen. Und die generieren jeweils noch in die Dimension der irreduziblen Darstellung.








