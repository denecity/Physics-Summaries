#import "lib.typ": *
#show: frame-style(styles.boxy)

= Darstellungen von Lie-Gruppen

== Definition

#definition[Definition][
  Eine komplexe oder reele Darstellung einer Matrix-Lie Gruppe $G$ auf einem endlichdimensionalen reelen oder komplexen Vektorraum $V, V!=0$ ist ein stetiger Gruppenhomomorphismus $rho: G -> GL(V)$.

  Die Dimension von $rho$ ist $dim(V)$.

  Stetig heisst: alle Matrixabbildungen $rho_(i j) (g)$ sind stetig in $g in G$

  Für uns: Alle komplexen, endlich dimensionalen Darstellungen.
]

== Beispiele

#theorem[Satz][Darstellung von $U(1) iso SO(2)$][
  Diese Gruppen sind kompakt. Das heisst, jede Darstellung ist vollständig reduzibel.

  Wenn wir die Darstellung also klassifizieren wollen, müssen wir nur die irreduziblen Darstellungen klassifizieren.

  Sie sind auch abelsch, also ist jede irreduzible Darstellung ist im komplexen eindimensional.

  Für jedes 
  $
    n in ZZ:rho_n: U_1 -> GL(CC) = CC \\ {0}\
    z |-> z^n\
  $
  ist eine Darstellung von $U(1)$. Jede irreduzible Darstellung von $U(1)$ ist isomorph zu $rho_n$ für ein $n in ZZ$.
]

Beweis:

$
  rho_n "stetig"\
  "Gruppenhom" (z w)^n = z^n w^n\
$

Jetzt müssen wir noch zeigen, dass jede irreduzible Darstellung von dieser Form ist.

Sei $rho: U(1) -> GL(CC)$ eine 1-dimensionale Darstellung von $U(1)$.

$
  t in RR |-> rho(e^(i t))\
$

ist eine Einparametergruppe (Beweis unten).

$
  => exists rho(e^(i t)) = e^(t w), w in CC forall t in RR\
  rho(e^(2 pi i)) = 1 = e^(2 pi w)\
  => 2 pi w in w pi i ZZ\
  => w in i ZZ\
  => rho(z) = rho(e^(i phi)) = e^(i n phi) = rho_n (z)
  => rho iso rho_n\
  qed
$

#theorem[Satz][Darstellung von $SU(2)$][
  $forall n $ existiert eine irreduzible Darstellung $rho_n: SU(2) -> GL(V_n)$ mit $dim(V_n) = n + 1$. Jede irreduzible Darstellung von $SU(2)$ ist isomorph zu $rho_n$ für ein $n in NN_0$.

  Es gibt also genau eine irreduzible Darstellung mit Dimension $1, 2, 3, ...$.
]

Sei $V_n = CC[z_1, z_2]_n = {sum_(j=0)^n a_j z_1^j z_2^(n-j)| a_0, ..., a_n i in CC}$.

Behauptung: 

$
  rho_n: SU(2) -> GL(V_n)\
  A |-> ( f(z) |-> f(A^m1 z))
$

Bemerkung:

Es gilt, dass

$
  rho_n(-A) = (-1)^n rho_n (A)\
$

Also definiert $rho_n$ genau für gerade $n$ eine Darstellung von $SU(3)$.

== Darstellungen von Lie Algebren

#lemma[Lemma][
  Sei $rho: G -> GL(V)$ eine Darstellung der Matrix Lie Gruppe $G$. Dann bildet $rho$ Einparametergruppen auf Einparametergruppen ab.
]

Beweis:

Sei $t |-> Phi_t in GG$ eine Einparametergruppe (Gruppenhom $RR-> G$ stetig, diffbar).

Sei $psi_t = rho(phi_t) in GL(V)$.

Das komische daran ist, dass $rho$ nur stetig ist und dennoch $psi$ stetig diffbar in $t$ ist. Es reicht, dass $psi_t$ nur bei $t=0$ difbar ist.

$
  dv(psi_t, t) = lim_(n -> oo) (psi_(t + h) - psi_t)/h\
  = psi_t lim_(h -> 0) (psi_h - psi_0)/h = psi_t A\
$

Man verwendet den folgenden Trick:

Sei für $t$ klein genug ($t < t_0$): $a_t = log(psi_t), a_0 = 0$.

Für $n = 1, 2, ...$, $t$ klein ($n t < t_0$).

$
  exp(a_n t) = psi_(n t) = (psi_t)^n = exp(n a_t) | log\
  => a_(n t) = n a_t\
$

Für rationale Zahlen $r = p/q$ und $epsilon$ klein genug.

$
  q a_(epsilon p/q) = q p a_(epsilon 1/q) = p a_epsilon\
  => a_(r epsilon) = r a_epsilon\
$

Also gilt die Gleichung auch für rationale Zahlen. Da rationale Zahlen dicht in den reellen Zahlen sind, gilt die Gleichung auch für alle $t in RR$.

Sei $a = epsilon^m1 a epsilon => a_(r epsilon) = r epsilon a$ für alle $r in QQ$ klein genug.

Beide Seiten sind stetig und $QQ$ ist dicht in $RR$, also $a_t = t a$ für alle $t in RR$ klein genug.

Das heisst:

$
  psi_t = exp(t a)
$

Also $psi_t$ diffbar.


#lemma[Lemma][
  Sei $rho: G -> GL(V)$ eine Darstellung und $X in Lie(g)$.

  Dann ist $rho(exp(t X))$ eine Einparametergruppe in $GL(V)$.

  Sei $rho_*(x) = dv(,t)|_(t=0) rho(exp(t X)) in Lie(GL(V)) = gl(V)$

  $rho_*: Lie(G) -> Lie(GL(V))$

  + $rho(exp(t X)) = exp(t rho_* (X)) forall t in RR, X in Lie(G)$

  + $rho_* (lambda X + mu Y) = lambda rho_* (X) + mu rho_* (Y)$

  + $rho_* ([X, Y]) = [rho_* (X), rho_* (Y)]$

  Die letzten beiden Eigenschaften bestimmen: $rho_*$ ist ein Lie-Algebra Homomorphismus.
]

=== Recap

$
  rho: G -> GL(V) "Darstellung"\
  rho_*: Lie(G) -> gl(V) = Lie(GL(V)) "Lie-Algebra Homomorphismus"\
  X in Lie(G) = mattyp(n, n)\
  rho_* (X) = dv(,t)|_(t=0) rho(exp(t X)) in CC^oo "Abbildung von Lie-Algebra auf Lie-Algebra"\
  = D rho|_id "Ableitung"
$

Die Darstellung hat ein Bild vom Tangentialraum an der Identität $Lie(G)$ von $G$ auf den Tangentialraum an der Identität von $GL(V)$, also auf $gl(V)$.

$
  phi: G -> H "Gruppenhomomorphismus, stetig"\
  phi_* = D phi|_id: Lie(G) -> Lie(H) "Abbildung von Lie-Algebren"\
$

#definition[Definition][
  Sei $G$ eine Lie-Algebra über $RR$ oder $CC$.

  Eine $RR$-lineare oder $CC$-lineare Darstellung von $g$ auf einem Vektorraum $V != {0}$ eine $RR$ bzw. $CC$-lineare Abbildung

  $
    tau: g -> gl(V)\
  $ 

  sodass 

  $
    [tau(X), tau(Y)] = tau([X, Y])\
    <=> tau "Lie-Algebra Homomorphismus" g -> gl(V)\
  $

  + $U subset V$ ist *$g$-invariant*, falls
  
    $
      tau(X) U subset U forall X in g\
    $

  + $tau$ *irreduzibel* falls die einzigen Unterräume $U = 0, V$ sind.

  + $tau$ *vollständig reduzibel* falls $V$ eine direkte Summe ($oadd$) von $g$-invarianten Unterräumen $U_1, ..., U_n$ ist. 
]

#theorem[Satz][
  Sei $rho:G -> GL(V)$ eine Darstellung der Matrix-Lie-Gruppe $G$. Dann ist $rho_*$ eine Darstellung der $(RR-)$ Lie Algebra $Lie(G)$ auf $gl(V)$.

  Die Einschränkung von $rho$ auf $G_0 subset G$ (Zusammenhangskomponente der Identität) ist durch $tau_*$ eindeutig bestimmt, wobei $tau_*$ eine Darstellung der Lie-Algebra $Lie(G_0)$ auf $gl(V)$ ist.
]

Beweis:

Zu zeigen: Der Teil mit der Einschränkung. Bewiesen durch Formel:

Sei $g in G_0$ gegeben. Wir können $g$ schreiben als Produkt von Bildern der Exponentialabbildung (7.4.3).

$
  g = exp(X_1) ... exp(X_n), X_1, ..., X_n in Lie(G)\
$

Also gilt:

$
  rho(g) = rho(exp(X_1)) ... rho(exp(X_n))\
  = exp(rho_* (X_1)) ... exp(rho_* (X_n))\
  qed
$

Das bedeutet, dass bei der Bildung einer Lie-Algebra aus einer Gruppe keine Information verloren geht, da die Lie-Algebra $Lie(G)$ die Lie-Algebra $Lie(G_0)$ enthält.

#theorem[Satz][
  Sei $rho: G -> GL(V)$ wie oben eine Darstellung der Matrix-Lie-Gruppe $G$ und zusätzlich $G$ zusammenhängend.

  Dann ist $rho$ genau dann irreduzibel bzw. vollständig reduzibel, wenn $rho_*$ irreduzibel bzw. vollständig reduzibel ist.
]

Beweis:

Wir müssen prüfen, ob die invarianten Unterräume von $rho_*$ die gleichen sind wie die von $rho$.

Zu zeigen: $W subset V$ invariant $rho <=> W subset V$ invariant $rho_*$.

+ $=>$ Sei $w in W, X in Lie(G)$:

  $
    rho_* (X) w = dv(,t)|_(t=0) rho(exp(t X)) w in W\
  $

+ $<=$ Sei $g in G => $Zusammenhängend:$ exists X_1, ... X_2$

  $
    g = exp(X_1) ... exp(X_n), w in W\
    rho(g) w = rho(exp(X_1)) ... rho(exp(X_n)) w\
    = exp(rho_* (X_1)) ... exp(rho_* (X_n)) w in W "induktiv"\
    qed
  $

Beispiele:

+ Triviale Lie-Algebra ($V = CC$):

  $
    tau (X) = 0 forall X in Lie(G)\
  $

+ Adjungierte Darstellung ($V = g = Lie(G)$):

  $
    "Sei" Ad: G -> GL(g)\
    Ad(g) X = g X g^m1 forall in Lie(G)\
  $

  adjungierte Darstellung von $G$ auf $g$.

  Die adjungierte Darstellung von $g$ auf $g$ ist

  $
    ad = Ad_*: g -> gl(g), ad(X) Y = [X, Y] \
  $

Für jede Darstellung einer Lie-Gruppe bekommen wir eine Darstellung der Lie-Algebra.


== Irreduzible Darstellungen von $SU(2)$

Unser Ziel ist es, alle endlich dimensionalen Darstellungen zu klassifizieren.

Dies erreichen wir, indem wir die irreduziblen Darstellungen klassifizieren, da jede Darstellung eine direkte Summe von irreduziblen Darstellungen ist.

Elemente von $SU(2)$ sind complexe 2x2 Matrizen, aber $Lie(SU(2))$ ist eine reelle Lie-Algebra. Man darf also, obwohl die Matrix komplexe Einträge hat, diese nicht mit komplexen Zahlen multiplizieren.

Die definierende Eigenschaft war $X^* = -X$. Dies funktioniert aber nicht mehr mit $(i X)^* = + i X$

Wir schauen uns nun an, wass passiert wenn wie die Lie-Algebra von $SU(2)$ mit komplexen Zahlen multiplizieren.

#lemma[Lemma][$SL(2)$][
  + Jede Matrix $Z in sl(n, CC) = {mattyp(n, n) (CC), tr(X) = 0}$ kann man eindeutig schreiben als:

    $
      Z = X + i Y, X, Y in su(n)\
    $

    $sl(n)$ ist also die komplexifizierte Lie-Algebra von $su(n)$.

  + Sei $tau$ eine Darstellung von $su(n)$ auf $V subset CC^m$.
  
    Dann $tau: su(n) -> gl(V)$. Dies ist aber erstmal nur eine $RR$ lineare Abbildung.

    Dann ist

    $
      tau_CC: sl(n, CC) -> gl(V)\
      tau_CC(X + i Y) = tau(X) + i tau(Y)\
    $

    eine $CC$ lineare Darstellung von $sl(n, CC)$ auf $V$, die auf $su(n) subset sl(n, CC)$ mit $tau$ übereinstimmt.

    + $tau$ ist vollständig reduzibel oder irreduzibel <=> $tau_CC$ ist vollständig reduzibel oder irreduzibel.
]

Beweis:

+ $
    X = 1/2 (Z - Z^*)\
    Y = 1/(2 i) (Z + Z^*)\
  $

+ $tau_CC$ ist $CC$ linear: klar

  $
    [tau_CC(Z_1), tau_CC(Z_2)] = [tau(X_1) + i tau(Y_1), tau(X_2) + i tau(Y_2)]\
    = ... = tau_CC([Z_1, Z_2])\
  $



