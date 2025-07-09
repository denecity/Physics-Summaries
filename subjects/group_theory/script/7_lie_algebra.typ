#import "../../../lib/lib.typ": *
#show: frame-style(styles.boxy)

= Lie Algebren

Es gibt keine Darstellungstheorie für allgemeine Lie Gruppen, aber es existeiert für bestimmte Klassen von Lie Gruppen.

Wir werden versuchen, die Betrachtung der Mannigfaltigkeit lokal auf die Betrachtung der Vektorräume zu reduzieren.

== Exponentialabbildungen

Wir nehmen die Frobeniusnorm auf $mattyp(n, n) (KK), KK = RR, CC$.

$
  norm(X) = (sum_(i j) abs(x_(i j))^2)^(1/2)\
  = sqrt(tr(X^m1 X))\
$

Es gilt $norm(X Y) <= norm(X) norm(Y)$.

Die Reihe (Exponentialreihe)

$
  exp(X) = sum_(k=0)^oo X^k / k!\
$

konvergiert absolut für alle $X in mattyp(n, n) (KK)$.

Absolut heisst, dass die entsprechende Reihe der Normen konvergiert:

$
  sum_k 1/k! norm(X)^k "konvergiert"\
$

=== Eigenschaften der Exponentialabbildung

+ falls $X Y = Y X$: $exp(X) exp(Y) = exp(X + Y)$

+ $exp(X)^m1 = exp(-X)$, insbesondere $exp(X) in GL(n, KK)$.

+ $A exp(X) ^m1 = exp(A X A^m1) forall A in GL(n, KK)$.

+ $det(exp(X)) = exp(tr(X))$

  Herleitung:

  Schreibe $X= A D A^m1, D$ Jordan-Form. Dann folgt:

  $
    det(exp(X)) = det(A exp(D) A^m1)\
    = det(exp(D))\
    = e^(tr(D))\
    = e^(tr(X))\
  $

+ $exp(X^*) = exp(X)^*$

+ $exp(X^T) = exp(X)^T$

+ $exp(over(X)) = over(exp(X))$

+ Ist $N$ nilpotent, so gilt $exp(N) = 1 + N + N^2/2! + ... + N^k/k!$ für $N^(k+ 1) = 0$.

Beispiel:

$
  X = mat(0, -phi; phi, 0)\
  => exp(X) = mat(cos(phi), -sin(phi); sin(phi), cos(phi))\
$

Elemente der Lie Algebra werden durch die Exponentialabbildung auf Elemente der Lie Algebra abgebildet.


#lemma[Lemma][
  Die Exponentialabbildung ist lokal ein Isomorphismus.

  Die inverse Abbildung ist die Logarithmusabbildung, welche auf der Lie Gruppe definiert ist:

  $
    log(x) = sum_(k=1)^oo (-1)^(k+1) (x - 1)^k / k\
  $
]

== Einparametergruppen

#definition[Definition][Einparametergruppe][
  Eine Abbildung $x: RR -> GL(n, KK)$ heisst Einparametergruppe, falls 
  
  + $x$ stetig differenzierbar ist.

  + $x(0) = id$

  + x(s + t) = x(s) x(t) für alle $s, t in RR$.

    Das heisst, $x$ ist ein Gruppenhomomorphismus von $(RR, +)$ nach $(GL(n, KK), *)$.
]

#theorem[Satz][
  + $forall A in mattyp(n, n) (KK), t |-> exp(t A)$ ist eine Einparametergruppe.

  + Alle Einparametergruppen sind von dieser Form.
]

Beweis:

+ Ist klar wegen den Eigenschaften der Exponentialabbildung.

+ Sei $t |-> X(t)$ eine Einparametergruppe und $A = dot(X) (0) in mattyp(n, n) (KK)$.

  Es gilt:

  $
    dot(X) (t) = lim_(h -> 0) (X(t + h) - X(t)) / h\
    = X(t) lim_(h -> 0) (exp(h) - id) / h\
    = X(t) A\
  $

  Dies ist eine lineare gewöhnliche Differentialgleichung mit Anfangsbedingung $X(0) = id$.
  
  $t -> exp(t A)$ erfüllt die gleiche Differentialgleichung und Anfangsbedingung.

  Wir haben also eine eindeutige Lösung gefunden. Das heisst, dass die Exponentialabbildung die Einparametergruppe eindeutig bestimmt.

  $
    qed
  $

== Matrix-Lie Gruppen

#definition[Definition][Matrix-Lie Gruppe][
  Eine Matrix-Lie Gruppe ist eine abgeschlossene Untergruppe $G subset GL(n, KK)$.

  Abgeschlossen heisst:

  $
    forall "Folgen" x_n in G, lim_(n -> oo) x_n = x in GL(n, KK) => x in G\
  $
]

#definition[Definition][Lie Algebra][
  $
    Lie(G) = {X in mattyp(n, n) (KK) | exp(t X) in G forall t in RR}\
  $

  $Lie(G)$ heisst Lie Algebra der Matrix-Lie Gruppe $G$.
]

#theorem[Satz][
  $
    G subset GL(n, KK) "abgeschlossen"\
    => Lie(G) "reeler Vektorraum"\
    "Kommutator": forall X, Y in Lie(G): [X, Y] = X Y - Y X in Lie(G)
  $

  Die Lie Algebra $Lie(G)$ ist also ein reeller Vektorraum. Der Kommutator wird auch Lie Klammer genannt. Der Kommutator von zwei Elementen $X, Y in Lie(G)$ ist wieder in $Lie(G)$ enthalten.
]

#lemma[Lemma][
  $Lie(G)$ besteht aus allen Tangentialvektoren $dot(X(0))$ von glatten Kurven $X: ]-epsilon, epsilon[ -> G, X(0) = id$.

  Mit anderen Worten: Die Lie Algebra von $G$ ist der Tangentialraum an der Identität $id$ der Lie Gruppe $G$.

  $
    Lie(G) = T_id G
  $
]

Beweis:

+ $Lie(G)$ enthält alle Tangentialvektoren. 

  Einparametergruppen $t -> exp(t A)$ sind glatte Kurven wie gefordert.

+ Für jedes Element von $Lie(G)$ gibt es eine glatte Kurve. 

  Wir müssen zeigen: $exp(t X(0)) in G, forall t in RR$. Betrachte $t in RR$ und $X(t/n)^n in G$ für $n -> oo$.

  Wir können auch annehmen, dass $norm(X(t/n)- id) < 1$:

  $
    X(t/n)^n = exp(n log(X(t/n))) |"Taylor"\
    = exp(n log(id + t/n dot(X) (0) + o(1/n^2)))\
    = exp(n (t/n dot(X) (0) + o(1/n^2))) | n->oo\
    = exp(t dot(X) (0)) in GL(m, KK)\
  $

  Wegen Abgeschlossenheit von $G$ folgt $exp(t dot(X) (0)) in G$.

  $
    qed
  $


Beispiel:

- $
    Lie(GL(n, KK)) = gl(n, KK) = mattyp(n, n) (KK)\
    KK-"Basis": E_(i j), (E_(i j))_(i j) = 1, "sonst" 0
  $

- $
    u(n) = Lie(U(n)) = {X in mattyp(n, n) (CC) | X^* = -X}
  $

- $
    su(n) = Lie(SU(n)) = {X in mattyp(n, n) (CC) | X^* = -X, tr(X) = 0}
  $

=== Eigenschaften des Kommutators

#theorem[Satz][
  + $[X, Y] = -[Y, X]$ (Antisymmetrie)

  + Der Kommutator ist bilinear: 
    $[a X + b Y, Z] = a [X, Z] + b [Y, Z]$ und $[X, a Y + b Z] = a [X, Y] + b [X, Z]$ für alle $a, b in KK$ und $X, Y, Z in Lie(G)$.

  + Jacobi Identität: $[X, [Y, Z]] + [Y, [Z, X]] + [Z, [X, Y]] = 0$ für alle $X, Y, Z in Lie(G)$.
]

Beweis:

$
  X Y Z - X Z Y - Y Z X + Z Y X\
  + Y Z X - Y X Z - Z X Y + X Z Y\
  + Z X Y - Z Y X - X Y Z + Y X Z\
  = 0\
$

#definition[Definition][Lie Algebra][
  Ein reeler oder komplexer Vektorraum $g$, versehen mit einer Abbildung (Lie Klammer)

  $
    [., .]: g x g -> g\
  $

  die die Eigenschaften 1-3 erfüllt, heisst (reele oder komplexe) *Lie Algebra*

  Ein Homomorphismus $phi:g_1 -> g_2$ von Lie Algebren ist eine lineare Abbildung, die die Lie Klammer erhält:

  $
    phi([X, Y]) = [phi(X), phi(Y)] forall X, Y in g_1
  $

  Isomorphismus von Lie Algebren falls $phi$ bijektiv ist.
]

Beispiele:

$
  o(n) = Lie(O(n)) = {X in mattyp(n, n) (RR) | X^T = -X}\
  so(n) = Lie(SO(n)) = o(n)
$ 

Beweis:

$
  X in o(n) <=> id = exp(t X)^T exp(t X) forall t in RR\
  = exp(t X^T) exp(t X) "erfüllt eigenschaft"\
  qed
$

$
  det(exp(t X)) = det(t tr(X)) = 1\
  "weil" X = -X^T\
  => so(n) = o(n)\
$

Die Lie Algebra kann also die Zusammenhangskomponenten von $O$ und $SO$ nicht unterscheiden. Dies liegt daran, dass die Lie Algebra durch lokale Eigenschaften bei der Identität $id$ charakterisiert wird. Die Lie Algebra kann globale Eigenschaften nicht erkennen.

Weiterhin: $sp(2 n) = Lie(Sp(2 n)) = {X in mattyp(2 n, 2 n) (RR) | X^T J + J X = 0}$

$
  Sp(2 n) = {A in mattyp(2 n, 2 n) (RR) | A^T J A = J, J = mat(0, -id; id, 0)}\
  = {mat(A, B; C, -A^T) | A, B, C in mattyp(n, n) (RR), B = B^T, C = C^T}
$

$
  su(2) = {mattyp(2, 2) (CC) | X + X^* = 0, tr(X) = 0}\
  "Basis" t_1 = i sigma_1, t_2 = i sigma_2, t_3 = i sigma_3\
  [t_j, t_k] = - sum_(l = 1)^3 e_(j k l) t_l
$

== Campbell-Baker-Hausdorff Formel

#theorem[Satz][
  Sei $X, Y in mattyp(n, n) (KK)$. Dann gilt (für $t$ klein genug), dass:

  $
    exp(t X) exp(t Y) = exp(t X + t Y + t^2/2 [X, Y] + o(t^3))
  $

   
]

Beweis:

Sei $t$ so klein, dass $norm(exp(t X) exp(t Y) - id) < 1 =>$ $log(-)$ anwendbar.

$
  => exp(t X) exp(t Y) = exp(Z(t))\
  "mit" Z(t) = log(exp(t X ) exp(t Y))\
$

Entwickle beide Seiten in Potenzreihen in $t$ und vergleiche die Koeffizienten:

$
  1 + t X + (t^2 X)/2 + ...) ( 1 + t Y + (t^2 Y)/2 + ...) = 1 + t (X + Y) + t^2/2 (x^2 + 2 X Y + Y^2) + o(t^3)\
  = exp(Z(t)) = exp(t Z_1 + t^2 Z_2 + ...)
  = 1 + (t Z_1 + t^2 Z_2) + 1/2 t^2 Z_1^2 + o(t^3)\
  = 1 + t Z_1 + t^2/2 (Z_1^2 + 2 Z_2)\
$

Koeffizientenvergleich:

$
  Z_1 = X + Y\
  Z_1^2 + 2 Z_2 = = X^2 + 2 X Y + Y^2\
  => Z_2 = 1/2 [X, Y]\
$

Kommutator:

$
  exp(1/n X) exp(1/n Y) exp(-1/n X) exp(-1/n Y) \
  = exp(1/n (X + Y + 1/2 1/n^2 [X, Y] + o(1/n^3)))\
  + exp(-1/n (X + Y + 1/2 1/n^2 [X, Y] + o(1/n^3)))\
  = exp([X, Y] + o(1/n))\
  => exp([X, Y])
$

Der Kommutator ist also in der Lie Algebra enthalten (weil die Gruppe abgeschlossen ist, also Limes enthalten).

=== Exponentialabbildung

Sei $exp: Lie(G)-> G, X |-> exp(X)$

Die Abbildung ist weder immer injektiv noch surjektiv.

Nicht injektiv, betrachte $Lie(O(2))$ (rotationen periodisch mit $2 pi$).

Nicht surjektiv, betrachte $Lie(SL(2, RR))$ (determinante ist nicht immer $1$).

Jedoch ist die Exponentialabbildung lokal ein Diffeomorphismus um $0 in Lie(G)$ mit einer Umgebung der Identität $id in G_0$, wobei $G_0$ die Zusammenhangskomponente der Identität ist.

#theorem[Satz][
  Sei $G subset GL(N, KK)$ eine Matrix-Lie Gruppe mit Lie Algebra $Lie(G)$ und $G_0$ die Zusammenhangskomponente der Identität $id in G$.

  Dann ist $G_0$ gleich der Gruppe aller Matrizen der Form

  $
    exp(X_1) ... exp(X_n), (X_1, ..., X_n in G)\

  $
]

Beispiel

$
  G = U(n)
$

dann ist $exp: u(n) -> U(n)$ surjektiv.

Jedes $U in U(n)$ ist diagonalisierbar.

$
  U = A diag(e^(i phi_1), ..., e^(i phi_n)) A^m1, A in U(n)\
  = exp(A diag(i phi_1, ..., i phi_n) A^*) in u(n)\
$

