#import "lib.typ": *
#show: frame-style(styles.boxy)

== Darstellungstheorie von $S_n$

Ziele:

- Konjugationsklassen

- Irreduziblen Darstellungen

- Charaktere der Darstellungen

== Partitionen

Sei $n in NN$

Dann ist eine Partition (Zerlegung, Zahlpartition) von $n$ eine Zerlegung von $n$ in eine Summe von ganzen Zahlen $>= 1$:

$
  n = lambda_1 + lambda_2 + ... + lambda_k\
$

Diese ist äquivalent unter Vertauschung.

Beispiel: $n = 4$ hat 5 verschiedene Partitionen:

$
  4 =4=3+1=2+2=2+1+1=1+1+1+1
$

Man gibt sie oft an, indem man festhält wie oft eine jeweilige Zahl vorkommt. Diese Angabe ist dann auch eindeutig. Es gilt dann:

$
  n = sum_j j dot i_j
$

Wir schreiben $under(i) = mat(i_1, i_2, ..., i_n)$.

Beispiel: $4 = 2 + 1 + 1$:

$
  under(i) = mat(2, 1, 0, 0, ...)
$

Eine Partition lässt sich durch ein *Young-Tableau* darstellen. 

Sei $lambda_1 >= lambda_2 >= lambda_2 >= ...$.

$
  lambda = (lambda_1, lambda_2, ..., lambda_k)
$

#image("image.png")

Beschreibt $12 = 5 + 3 + 2 + 1 + 1$.

== Permutationen und Konjugationsklassen

Sei $sigma in S_n = Bij({1, ..., n} -> {1, ..., .n})$ eine Permutation.

Schreibweisen:

1. Wertetabelle/Zweizeilenschreibweise:

  $
    sigma = mat(1, 2, 3, 4, 5; 4, 1, 5, 2, 3)
    => sigma(1) = 4, sigma(2) = 1...
  $

2. Zyklenschreibweise: Im vorherigen Beispiel:

  $
    sigma = (1 4 2) (3 5)\
    sigma(1) = 4, sigma(4) = 2, sigma(2) = 1\
    sigma(3) = 5, sigma(5) = 3
  $

  Die einzelnen Blöcke heissen *Zyklen*. Die Reihenfolge der Zyklen ist egal, aber die Reihenfolge der Elemente in einem Zyklus ist wichtig. In einem Zyklus kann man jedoch die Zahlen zyklisch verschieben, z.B. $(1 4 2) = (4 2 1) = (2 1 4)$.

  $
    => (142) (35) = (421) (35)
  $

Sei $i_k (sigma)$ die Anzahl der Zyklen der Länge $k$ in $sigma$ in der Zyklenschreibweise von $sigma$.

$
  under(i) (sigma) = (i_1 (sigma), (i_2 (sigma), ...)
$

Beispiel:

$
  under(i) (sigma) = (0, 1, 1, 0)
$

Es gilt:

$
  sum_k i_k (sigma) k = n\
$

$under(i) (sigma)$ bestimmt eine Partition von $n$.

Wir schauen uns an, wie oft wie lange Zyklen in $sigma$ vorkommen. Das ist eine Partition von $n$.

#lemma[Lemma][
  Sei $tau in S_n$ eine Permutation, in Zyklenschreibweise.

  $
    tau = (i_(1, 1) ... i_(1, lambda_1)) ( i_(2, 1) ... i_(2, lambda_2)) ... (i_(k, 1) ... i_(k, lambda_k))
  $

  Sei $sigma in S_n$ beliebig. Dann gilt:

  $
    sigma tau sigma^m1 = (sigma(i_(1, 1)) ... sigma(i_(1, lambda_1))) (sigma(i_(2, 1)) ... sigma(i_(2, lambda_2))) ... (sigma(i_(k, 1)) ... sigma(i_(k, lambda_k))) = tau'
  $
]

Beweis:

Zu zeigen: $sigma tau = tau' sigma$

$
  <=> sigma tau (j) = tau' (sigma(j)) forall j in {1, ..., n}\
$

O.B.d.A. $i_(1, 1) = j$.

$
  tau' sigma(j) tau' (sigma(i_1, 1)) = sigma(i_(1, 2))\
  sigma tau (j) = sigma tau(i_(1, 1)) = sigma(i_(1, 2))\
$

#corollary[Korollar][
  + $i_k (sigma tau sigma^m1) = i_k (tau)$

  + Jedes $sigma$, welches die Konugation erfüllt muss auch die gleiche Partition wie $tau$ haben.

    $tau, tau' in S_n$ sind in der gleichen Konjugationsklasse, genau dann wenn $under(i) (tau) = under(i) (tau')$.

  + Die Konjugationsklassen von $S_n$ sind 1 zu 1 genau die Partitionen von $n$.

    Also sind die Konjugationsklassen von $S_n$ einfach zu finden, indem wir die Partitionen von $n$ finden.
]

Beispiel: Konjugationsklassen von $S_3$

Partitionen: 3, 2+1, 1+1+1 also 3 Konjugationsklassen:

$
  [(1 2 3)] = {(1 2 3), (1 3 2), (2 1 3), (2 3 1), (3 1 2), (3 2 1)}\
  [(1 2)(3)] = {(1 2)(3), (1 3)(2), (2 3)(1)}\
  [(1)(2)(3)] = {(1)(2)(3) = 1}\
$

In der Literatur werden die Zyklen von Länge 1 oft weggelassen.

Für jede Gruppe wissen wir, dass es genausov viele irreduzible Darstellungen wie Konjugationsklassen gibt. Es gibt also genauso viele irreduzible Darstellungen wie Partitionen von $n$. Für die symmetrische Gruppe gilt vor ales, dass es eine Abbildung von Partitionen von $n$ auf irreduzible Darstellungen gibt.

== Die Gruppenalgebra einer endlichen Gruppe

Sei $G$ eine endliche Gruppe. Dann ist die Gruppenalgebra $CC[G]$ der Gruppe $G$ der Vektorraum der formalen Linearkombinationen der Elemente von $G$ über den komplexen Zahlen:

$
  sum_(g in G) a_g g in CC[G], a_g in CC\
  CC[G] = CC(G) "für endliche Gruppen"\
$

$CC[G]$ ist ein Ring mit dem assoziativen bilinearen Produkt:

$
  CC[G] times CC[G] -> CC[G]\
  (sum_(g in G) a_g g) (sum_(h in G) b_h h) = sum_(g, h in G) a_g b_h (g h)\
  = sum_(g in G) (sum_(h', h'' in G| h' h'' = g) a_h' b_h'') g\
$

Wenn der unterliegende Raum noch ein Vektorraum ist, und das Produkt kompatibel ist mit der Vektorraumstruktur, dann nennt man den Ring eine *$CC-$ Algebra*.

Sei nun $rho:G -> GL(V)$ eine Darstellung der Gruppe $G$ auf dem Vektorraum $V$. Wir erhalten eine Abbildung:

$
  rho: CC[G] -> End(V)\
  rho(sum_(g in G) a_g g) = sum_(g in G) a_g rho(g)\
$

Es gilt dann $rho(x y) = rho(x) rho(y)$. Also ist $rho$ ein Ringhomomorphismus.

Sei $rho_1, ..., rho_k$ eine Liste der inäquivalenten, irreduziblen Darstellungen von $G$ auf dem Vektorraum $V_1, ..., V_k$.

Die direkte Summe: 

$
  oadd_(j=1)^k End(V_j)\
  subset End(V_1 oadd ... oadd V_k)\
$

Das Endresultat kann man sich als diagonale Blockmatrix aus $f_j in End(V_j)$ vorstellen.

Dies ist wieder ein Ring:

$
  (f_1, ..., f_k) (g_1, ..., g_k) = (f_1 g_1, ..., f_k g_k)\
$

#theorem[Theorem][
  Die Abbildung von Vektorräumen (und Ringen):

  $
    phi: CC[G] -> oadd_(j=1)^k End(V_j) = R\
    phi(x): x |-> (rho_1(x), ..., rho_k(x))
  $

  Ist ein Isomorphismus.

  Die Gruppenalgebra ist also nichts anderes als die Algebra der Blockdiagonalmatrizen.
]

Beweis:

Wir zeigen, dass die Abbildung injektiv und surjektiv ist. Die Vektorräume müssen dann die gleiche Dimension haben.

$
  dim CC[G] = abs(G)\
  dim(R) = sum_(j=1)^k dim(rho_j)^2 = abs(G)
$

Es reicht zu zeigen, dass $phi$ injektiv ist:

Wähle Orthonronalbasis von $V_j$ für alle $j$ und Seite $(rho_(alpha, i j) (g))$ die Matrixelemente von $rho_alpha (g)$.

Sei für $x in CC[G]: phi(x) = 0$, also $rho_(alpha, i j) (x) = 0 forall alpha, i, j$. Daraus folgt $x = 0$, da die $rho_(alpha, i j)$ eine orthogonale Basis bilden von $CC[G]$.

$
  qed
$

Wir können die Blockdiagonalmatrizen nutzen, um die irreduziblen Darstellungen zu finden.

== Irreduzible Darstellungen von $S_n$

#definition[Definition][
  Ein Young-Schema ist ein Young-Diagramm, in dessen Kästchen die Zahlen $1, 2, ..., n$ eingetragen sind. Jede Zahl kommt genau einmal vor.

  $
    mat(1, 6, 5; 4, 2; 3)
  $
]


Für $lambda$ ein Young-Diagramm, sei $hat(lambda_"norm")$ das Schema, in das $1, 2, ..., n$ aufsteigend eingetragen sind, also in der Reihenfolge der Zeilen und Spalten.

$
  hat(lambda)_"norm" = mat(1, 2, 3; 4, 5; 6)
$

#definition[Definition][
  Für ein $lambda$ Young-Schema, sei $lambda^T$ das transponierte Young-Schema, also die Zeilen und Spalten vertauscht oder Spiegeling an der Hauptdiagonalen.

  $
    hat(lambda) = mat(1,2,3;4,5)\
    hat(lambda)^T = mat(1,4;2,5;3)\
  $
]

#definition[Definition][
  Sei $hat(lambda)$ ein Young-Schema mit n Kästchen.

  Sei $G_(hat(lambda)) subset S_n$ die Untergruppe der Permutationen, die aus Permutationen bestehen, die die Zahlen jeder Zeile von $hat(lambda)$ wieder auf sich selbst Abbilden.

  $
    hat(lambda) = mat(1, 2;3,4)\
    -> G_(hat(lambda)) = {id, (1 2) (3)(4), (1)(2 34), (12)(3 4)} subset S_4
  $

  Wir können das selbe für die Transponierte machen.

  Es sei Symmetrierer und Antisymmetrierer:

  $
    s_(hat(lambda)) = sum_(sigma in G_(hat(lambda)) sigma in CC[S_n]\
    a_(hat(lambda)) = sum_(sigma in G_(hat(lambda)^T) sgn(sigma) in CC[S_n]\
  $

  Falls wir nur $lambda$ haben:

  $
    s_lambda = s_(hat(lambda)_"norm"), a_lambda = a_(hat(lambda)_"norm")
  $
]

#definition[Definition][
  Zu jedem Young-Schema $lambda$ mit $n$ Kästchen definieren wir den invarianten Unterraum:

  $
    V_lambda = CC[S_n] s_lambda a_lambda = {x s_lambda a_lambda | x in CC[S_n]}\
  $

  und $rho_lambda$ sei die Einschränkung der Darstellung von $S_n$ auf $CC(S_n)$ durch Linksmultiplikation auf $V_lambda$:

  $
    rho_lambda = rho_(CC[G])|_V_lambda\
  $
]

#theorem[Satz][
  Die Darstellungen $rho_lambda$ sind irreduzibel und für $lambda != lambda'$ sind $rho_lambda, rho_lambda'$ inäquivalent. Wir haben also eine bijektive Abbildung von den Young-Schemata auf die irreduziblen Darstellungen von $S_n$.
]

Beispiel:

$
  lambda = mat(., ., ., ., .) "n Kästchen"\
  hat(lambda)_"norm" = mat(1, 2, 3, 4, ..., n)\
  G_lambda = G_(hat(lambda)_"norm") = S_n\
  G_(lambda^T)  = G_(hat(lambda)_"norm"^T) = {id}\
  => s_lambda = sum_(sigma in S_n) sigma\
  => a_lambda = 1
$

Es sei:

$
  g in S_n: g s_lambda = sum_(sigma in S_n) g sigma\
  = sum_(sigma in S_n) sigma = s_lambda\
  => forall x in CC[S_n]: x s_lambda prop s_lambda\
  => V_lambda = {c s_lambda | c in CC} "1-dimensional"
$

Dies nennt man die *triviale Darstellung* weil der Basisvektor invariant gelassen wird:

$
  rho_lambda(sigma) = id\
$

Beispiel:

$
  lambda = mat(.; .; .; .; .)\
  hat(lambda)_"norm" = mat(1; 2; ...; n)\
  G_lambda = {id}\
  G_(lambda^T) = S_n\
  => s_lambda = 1\
  => a_lambda = sum_(sigma in S_n) sgn(sigma) sigma\
  g in S_n: g a_lambda = sum_(sigma in S_n) sgn(g) (g sigma)\
  sigma |-> g^m1 sigma\
  => = sum_(sigma in S_n) sgn(g^m1 sigma) sigma = sgn(g) sum_(sigma in S_n) sgn(sigma) sigma\
  => V_lambda = {c a_lambda | c in CC} "1-dimensional"\
  => rho_lambda(sigma) = sgn(sigma)\
$

Also haben wir die *Vorzeichen-Darstellung*.

#lemma[Lemma][
  + $c_lambda = s_lambda a_lambda != 0$

  + $forall x in CC[S_n]: c_lambda times c_lambda prop c_lambda$

  + Falls $lambda > mu$, (das heisst $lambda_1>mu_1$ oder $lambda_1 = mu_1$ und $lambda_2 > mu_2$ oder so weiter):

    $
      lambda = mat(1, 2, 3, 4, 5; 6, 7, 8; 9, 10)>mat(1, 2, 3, 4, 5; 6, 7; 8, 9; 10) = mu\
    $

    Dann $forall x in CC[S_n]: c_lambda times c_mu = 0$
]

#lemma[Lemma][
  + Sei $A in mattyp(n, n) (CC)$ so, dass $forall X in mattyp(n, n) (CC): A X A prop A$.

    $=>$ der Rang der Matrix $<= 1$, also $forall u, v in CC^n: A = u v^*$

  + Sei $A$ Blockdiagonalmatrix mit Blockgrössen $d_1, ..., d_k$.

    Es gelte für jedes $X = diag(X_1, ..., X_k)$ gleicher Form:

    $
      A X A prop A\
    $

    $=>$ entweder $A = 0$ oder $exists! j: A_j != 0$ und Rang von $A_j = 1$.

    $=> A_j = u v^*$
]

Beweis Lemma:

+ $A = 0 =>$ Rang $= 0$.

  Für $A != 0$:

  $
    exists a, b in CC^n: A a != 0, b^* A = 0\
  $

  Sei $X = a b^*$:

  $
    A X A = (A a) (b^* A) = c A\
    = u c v^*\
    => A = 1/c c u v^* = u v^*\
  $

  Also Rang $= 1$.

+ OBdA Nehme an $A_1, A_2 != 0$:

  $
    X = mat(id, 0, ... ; 0, 0, ...; ..., ..., ...)\
    A X A = diag(A_1, 0, ..., 0) = c diag(A_1, A_2, ...) "Widerspruch!" \
  $

  Weil entweder muss $c=1$ für den ersten Block oder $c=0$ für den zweiten Block sein.

Beweis vom Satz:

Zu zeigen war $(rho_lambda, V_lambda)$ irreduzibel und inäquivalent.

Wir benutzen den Isomorphismus $phi: CC[S_n] -> oadd_(j=1)^k End(V_j)$, wobei $(rho_i, V_i)$ die irreduziblen Darstellungen von $S_n$ sind.

Wende $phi$ an:

$
  phi(c_lambda) phi(x) phi(c_lambda) prop phi(c_lambda) forall x in CC[S_n]\
  => A X A prop A\
$

Nach dem Lemma muss $A$ entweder $0$ sein oder es gibt genau einen Block $A_j != 0$ und Rang von $A_j = 1$, dann:

$
  phi(c_lambda) = (0, 0, ... , A_j, 0, ..., 0)\
$

Betrache $phi(V_lambda)$. Wähle Basen von $V_j$, sodass die Matrix von der Abbildung $A_j$ bezüglich dieser Basis die Form:

$
  K = mat(*, 0,0,  ...; *, 0,0, ...;*, 0,0, ...; *, 0, 0, ...)
$

$phi(V_lambda)$ hat dann die Form:

$
  diag(X_1, ...., X_n) diag(0, ...,0, K, 0, ..., 0)\
  X_j in End(V_j) iso mattyp(d_j, d_j) (CC)\
  => = diag(0, ..., 0, X_j 0, 0, ..., 0)\
  => phi(V_lambda) = {diag(0, ..., 0, (y K), 0, ..., 0) | y in CC}\
  => V_lambda iso V_j\
  => rho_lambda iso rho_j\
$

Um das zu zeigen, schauen wir uns ein Element der Gruppe an.

$
  phi(sigma) diag(0, ..., 0, (y K), 0, ..., 0)\
  = diag(0, ..., 0, rho_j(sigma) (y K), 0, ..., 0)\
$

Also $rho_j iso rho_lambda$. Da $rho_j$ irreduzibel ist, ist auch $rho_lambda$ irreduzibel. Wir haben also für jedes $lambda$ eine irreduzible Darstellung gefunden.

Wir müssen noch zeigen, dass die Darstellungen inäquivalent sind für $lambda != mu$.

Seien nun $lambda, mu$ zwei unterschiedliche Young-Schemata mit $n$ Kästchen. OBdA $lambda > mu$.

Nach dem Lemma gilt:

$
  forall x in CC[S_n]: c_lambda times c_mu = 0\
$

Falls $j(lambda) != j(mu)$, sind wir fertig.

Wir wollen aber einen Widerspruch finden für den Fall, dass $j(lambda) = j(mu)$:

$
  phi(c_lambda) = (0, ..., 0, A_j, 0, ..., 0)\
  phi(c_mu) = (0, ..., 0, B_j, 0, ..., 0)\
  => phi(c_lambda) phi(x) phi(c_mu) = (0, ..., 0, A_j X B_j, 0, ..., 0) = 0
$

Dies ist ein Widerspruch, da $A_j X B_j != 0$ für beliebiges $X$.

$
  => j(lambda) != j(mu)\
  qed
$

Nun haben wir eine bijektive Abbildung von den Young-Schemata auf Konjugationsklassen. Um die irreduziblen Darstellungen zu finden, müssen wir nur noch die Young-Schemata finden.

== Charakterformel von Frobenius

#definition[Definition][Frobenius-Formel][
  Sei $lambda$ ein Young-Schema mit $n$ Kästchen. 

  Sei $under(i) = (i_1, i_2, ..., i_k)$ eine Partition von $n$ und $c_(under(i))$ die entsprechende Konjugationsklasse von $S_n$.

  Dann gilt:

  $
    X_(rho_lambda) (C_(under(i))) = (Delta (x) product_k P_k^(i k) (x) )_(x^(lambda + rho))\
    x = (x_1, x_2, ..., x_n)
  $

  in Multiindexschreibweise:

  $
    Delta(x) = product_(1 <= i < j <= n) (x_i - x_j)\
  $

  ist die Vandermonde-Determinante, die die Symmetrie der Variablen $x_i$ beschreibt.

  $
    = det(mat(
      x_1^(n-1), x_1^(n-2), ..., x_1, 1;
      x_2^(n-1), x_2^(n-2), ..., x_2, 1;
      dots.v, dots.v, dots.down, dots.v, dots.v;
      x_n^(n-1), x_n^(n-2), ..., x_n, 1;
    ))\
    P_k (x) = x_1^k + x_2^k + ... + x_n^k\
    rho = (n-1, n-2, ..., 1, 0)\
    => x^(lambda + rho) = x_1^(lambda_1 + n - 1) x_2^(lambda_2 + n - 2) ... x_n^(lambda_n)\
    lambda = (lambda_1, lambda_2, ..., lambda_n) "Zeilenlängen des Young-Schemas"\
    (Q(x))_x^alpha = "Koeff. von" x^alpha\
  $

]

Uns interessiert eigentlich nur ein Spezialfall:

#definition[Definition][Haken][
  Für ein Young-Diagramm $lambda$ und $(i, j)$ ein Kästchen in $lambda$, $i$ als Zeile und $j$ als Spalte. Der *Haken* $H_(i, j)$ ist die Menge der Kästchen, die in der Zeile $i$ und Spalte $j$ liegen und alle Kästchen rechts und darunter liegen:

  Die Hakenlänge $h_(i, j)$ ist die Anzahl der Kästchen in $H_(i, j)$.
]

#corollary[Korollar][Hakenlängenformel][
  $
    dim(rho_lambda) = n!/(product_(i, j) h(i, j))\
  $

  Beispielhaft kann man die Hakenlängen in einem Young-Schema $lambda$ eintragen:

  $
    lambda = mat(7, 6, 3, 1; 5, 4, 1; 3, 2; 2, 1)
  $

  Dann ist $dim(rho_lambda) = 11!/(7 dot 6 dot 5 dot 4 dot 3^2 dot 2^2) = 1320$
]

== Recap

- Für die symmetrische Gruppe korrespondieren die Konjugationsklassen 1 zu 1 mit den Partitionen von $n$.
- Jede Korrespondiert zu der Konjugationsklasse der Permutationen, deren Zyklenschreibweise die Partition beschreibt.
- Die irreduziblen Darstellungen von $S_n$ sind 1 zu 1 korrespondierend mit den Partitionen von $n$.
- Die Konstruktion von irreduziblen Darstellungen von $S_n$ wird wahrscheinlich nicht geprüft werden.
- Hakenlängenformel behalten.
  





