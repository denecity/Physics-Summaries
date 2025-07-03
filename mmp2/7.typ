#import "lib.typ": *
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

  Der Kommutator wird auch Lie Klammer genannt.
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
