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


Nun wollen wir die Darstellungen von $sl(2, CC)$ klassifizieren.

Basis von $sl(2, CC) = {X in mattyp(2, 2) (CC) | tr(X) = 0}$. Diese Basis kann jede 2x2 Matrix mit Spur $0$ darstellen.

$
  h = mat(1, 0; 0, -1), e = mat(0, 1; 0, 0), f = mat(0, 0; 1, 0)\
  [h, e] = 2 e\
  [h, f] = -2 f\
  [e, f] = h\
$

Sei $(tau, V)$ eine $CC$-lineare Darstellung von $sl(2, CC)$. Sei

$
  H = tau(h), E = tau(e), F = tau(f) in gl(V)\
$

Der kommutator muss unter $tau$ invariant sein:

$
  [H, E] = [tau(h), tau(e)] = tau([h, e]) = 2 tau(e) = 2 E\
  [H, F] = - 2 F\
  [E, F] = tau([e, f]) = tau(h) = H\
$

Umgekehrt: sind $H, E, F in gl(V)$ gegeben, sodass die Kommutatorrelationen gelten, so definiert die Definition von $H, E, F$ eine Darstellung $tau$ von $sl(2, CC)$ auf $V$.

Sei $(tau, V)$ eine irreduzible Darstellung von $sl(2, CC)$.

Wir schauen uns $H$ an. Es ist irgend eine komplexwertige 2x2 Matrix mit mindestens einem Eigenwert und Eigenvektor. Wir wählen den Eigenvektor $v_0$ mit dem grössten realen Eigenwert $lambda in CC$.

$
  H v_0 = lambda v_0, v_0 != 0\
$

#lemma[Lemma][
  + $
      E v_0 = 0\
    $

  + $
      v_k = F^k v_0\
      => H v_k = (lambda - 2 k) v_k\
      E v_k = k (lambda - k + 1) v_(k - 1)\
    $
]

Beweis:

+ $
  H (E v_0) = E H v_0 + 2 E v_0\
  = (2 + lambda) (E v_0)\
  Re(lambda + 2) = Re(lambda) + 2 > Re(lambda)\
$

  Nach Konstruktion ist $lambda + 2$ also kein Eigenwert. Da dann diese Geleichung gilt, ist $E v_0 = 0$.

+ Induktion:

  Verankerung $k = 0$: $E v_0 = 0$.

  Induktionsschritt $k -> k + 1$:

  (Der dritte Schritt fügt den Kommutator $-2 F$ hinzu weil wir die Reihenfolge vertauschen.)

  $
    H v_(k + 1) = H F v_k = F H v_k - 2F v_k\
    = (lambda - 2 k) v_(k + 1) - 2 F v_(k + 1)\
    = (lambda - 2 (k + 1)) v_(k + 1)\
    => E v_(k + 1) = E F v_k = F E v_k + H v_k\
    = k (lambda - k + 1) F v_(k - 1) + (lambda - 2 k) v_k\
    = k (lambda - k + 1) v_k + (lambda - 2 k) v_k\
    = k ((lambda - k + 1) + lambda - 2 k) v_k\
    = (k+1) (lambda - k) v_k\
    qed 
  $

Insbesondere ist $span(v_0, v_1, ...) != 0 subset V$ invariant unter $tau$.

Da $tau$ irreduzibel ist, muss $span(v_0, v_1, ...) = V$ sein, da $V$ oder $0$ die einzigen $tau$-invarianten Unterräume sind.

Wir haben aber unendlich viele $v_k$ gefunden, wir wissen aber dass $V$ endlichdimensional ist weil unsere Darstellung endlichdimensional ist. Das heisst, dass $v_k = 0$ für $k > n$ für ein $n in NN_0$. Wir können sehen, dass jedes $v_k != 0$ ein Eigenvektor zu einem seperaten Eigenwert ist. Das heisst, alle $v_k != 0$ sind linear unabhängig.

Sei $v_(n+1) = 0$ der erste Vektor, der $0$ ist. Die höheren Vektoren $v_k$ sind auch $0$. Wir haben also $n + 1$ Vektoren gefunden, die linear unabhängig sind. Das heisst, dass $dim_CC (V) = n + 1$ ist.

$
  v_(n + 1) = 0, v_n != 0\
  0 = E 0 = E v_(n + 1) = (n + 1) (lambda - n) v_n\
  => lambda = n\
$

Es gibt also für Dimension $n+1$ höchstens eine irreduzible Darstellung von $sl(2, CC)$.

#theorem[Satz][
  Sei $n = 0, 1, 2...$ und $v_0, v_1, ... v_n$ die Standardbasis von $CC^(n+1) = V_n$.

  Dann definieren die Abbildungsvorschriften mit

  $
    H v_k ) (n - 2k) v_k\
    E v_k = k (n + 1 - k) v_(k - 1)\
    F v_k = v_(k + 1), (v_(n + 1) = 0)\
  $

  und

  $
    H = tau(h), E = tau(e), F = tau(f)\
  $

  eine irreduzible Darstellung von $sl(2, CC)$ auf $V_n$.

  Jede $n+1$ dimensionale, irreduzible, $CC$-lineare Darstellung von $sl(2, CC)$ ist isomorph zu dieser Darstellung. $tau_n$
]

Beweis:

Wir müssen noch zeigen $tau_n$ die Kommutatorrelationen erfüllt.

$
  [H, F] v_k = H F v_k - F H v_k\
  = H v_(k + 1) - (n - 2 k) F v_k\
  ((n-2 k - 2) - (n - 2 k)) v_(k + 1)\
  = -2 v_(k+1) = (- 2 F) v_k\
  [H, E] v_k = ... = 2 E v_k\
  [E, F] v_k = E F v_k - F E v_k\
  = E v_(k+1) - F v_(k - 1) (k (n + 1 - k))\
  = ((k + 1) (n - k) - k (n + 1 - k)) v_k\
  = (n - 2 k) v_k = H v_k\
$

Wir zeigen auch, dass $tau_n$ irreduzibel ist.

Sei $W subset V_n$ ein $tau_n$-invarianter Unterraum.

$H|_W$ habe Eigenwert $mu$ mit Eigenvektor $w !=0 in W =>$ $w$ Eigenvektor von $H$ zum Eigenwert $mu$. Da alle Eigenwerte verschieden sein müssen, muss $mu$ in der Liste der vorherigen Eigenwerte $0, 1, ..., n$ sein und $w prop v_k$ für ein $k$.

Da $n + 1 - m != 0 forall m = 0, 1, ...$ kann man durch Anwenden von $E$ und $F$ aus $v_k$ alle $v_m$ gewinnen. $=> W = V_n$. Also irreduzibel.

$
  qed
$

Für jedes $n$ konstruieren wir also eine irreduzible Darstellung von $sl(2, CC)$ auf $V_n$ mit Dimension $n + 1$.

Bemerkung:

In der Physik nennt man die Operatoren $E, F$ Auf- und Absteigeoperatoren.

$H$ hat oft die Bedeutung der Energie bzw. dem Hamiltonoperator.

Sei $U_n$ der Raum der homogenen Polynome von grad $n$: 
$
  CC[z_1, z_2]_n = {sum_(j=0)^n a_j z_1^j z_2^(n-j)}\
$

Betrachte die Darstellung $rho_n: SL(2, CC) -> GL(U_n)$.

$
  rho_n(A in SL(2, CC)) = (p(z) -> p(A^m1 z))\
$

Wir wollen nun die Lie-Algebra $su(2)$ von $SL(2, CC)$ auf $U_n$ bilden.

#example[Beispiel][Lie-Algebra
  Wir wollen die zugehörige Darstellung 
  
  $
    rho_(n *): sl(2, CC) -> gl(U_n) in End(U_n)\
  $
  
  finden.

  $
    (rho_(n *) (h) p) (z_1, z_2) = dv(,t)|_(t=0) rho_n(exp(t h)) (z_1, z_2)\
    p in U_n\
    => = dv(,t)|_(t=0) p(exp(t h)^m1 mat(z_1; z_2)\
    = dv(,t)|_(t=0) p(exp(-t h) mat(z_1; z_2)) | h = mat(1, 0; 0, -1)\
    = dv(,t)|_(t=0) p(mat(e^-t z_1; e^t z_2))\
    "Kettenregel"\
    = pdv(p, z_1) (z_1, z_2) (-z_1) + pdv(p, z_2) (z_1, z_2) z_2\
    = -z_2 pdv(p, z_1) (z_1, z_2) + z_1 pdv(p, z_2) (z_1, z_2)\
    => rho_(n *) (h) = -z_1 pdv(,z_1) + z_2 pdv(,z_2) in End(U_n)\
  $

  Dann

  $
    (rho_(n *) (e) p) = dv(, t)|_(t=0) p(exp(-t e) mat(z_1; z_2))\
    e = mat(0, 1; 0, 0) => exp(-t e) = id - t e "nilpotent"\
    => = dv(,t)|_(t=0) p(mat(z_1 - t z_2; z_2))\
    = pdv(p, z_1) (-z_2)\
    => rho_(n *) (e) = -z_2 pdv(,z_1) in End(U_n)
  $

  Und auch

  $
    rho_(n *) (f) = ... = -z_1 pdv(,z_2) in End(U_n)\
  $
]


#lemma[Lemma][
  Die Darstellung von

  $
    rho_(n *): sl(2, CC) -> gl(U_n)\
  $

  ist äquivalent zur Darstellung $tau_n$ von vorher mit dem Isomorphismus

  $
    psi: V_n -> U_n\
    v_k |-> ((-1)^k)/(n-k)! z_1^k z_2^(n-k)\
  $
]

Beweis:

Wir müssen noch zeigen, dass $psi$ ein Isomorphismus ist.

$
  rho_(n *) (h) psi(v_m) = ((-1)^m)/(n-m)! rho_(n *) (h) (z_1^m z_2^(n-m))\
  = ((-1)^m)/(n-m)! (-m + n - m) z_1^m z_2^(n-m)\
  = ((-1)^m)/(n-m)! (n - 2m) z_1^m z_2^(n-m)\
  = psi ((n - 2m) v_m)\
  = psi (H v_m)\
  = psi (tau_n(h) v_m)\
$

Gleiches muss man nun für die anderen Basisvektoren $E, F$ zeigen.

$
  rho_(n *) (e) psi(v_m) = psi(tau_n (e) v_m) = E v_m\
  rho_(n *) (f) psi(v_m) = psi(tau_n (f) v_m) = F v_m\
  qed
$

Unitarität:

#lemma[Lemma][
  Betrachte wieder die Darstellung $tau_n: sl(2, CC) -> gl(V_n)$.

  $
    H v_m = (n - 2 m) v_m\
    E v_m = m (n + 1 - m) v_(m - 1)\
    F v_m = v_(m + 1)\
  $

  Betrachte

  $
    u_m = sqrt((n-m)!/m!) v_m\
    H u_m = (n - 2 m) u_m\
    E u_m = sqrt(m (n+1-m)) u_(m-1)\
    F u_(m-1) = sqrt(m (n+1-m)) u_m\
  $

  Beachte: $E^T = E^* = F$
  Bezüglich des Skalarprodukts für das $(u_0, ..., u_n)$ eine Orthonormalbasis ist, gilt

  $
    H^* = H, E^* = F, F^* = E\
  $
]

Wir definieren das Skalarprodukt auf $V_n$ sodass $u_0, ..., u_n$ Orthonormalbasis ist, also $(u_i, u_j) = delta_(i j)$.

$
  H^* = H, E^* = F, F^* = E\
  => forall A in sl(2, CC): tau_n (A)^* = tau_n (A^*)\
  => forall x in su(2) subset sl(2, CC): tau_n (x)^* = tau_n (x^*) = - tau_n (x)\
  => tau_n in u(V_n) iso u(n+1)\
  => "unitar" tau_n\
$

Für die entsprechende Darstellung der Gruppe $tilde(rho)_n$ gilt also:

$
  tilde(rho)_n (A in SU(2)) = tilde(rho)_n (exp(x)) = exp(tilde(rho)_(n *) (x))\
  = exp(tau_n (x) in u(V_n)) in U(V_n)\
  => rho_n "unitäre Darstellung" SU(2) "auf" V_n\
$

#theorem[Sart][
  Zu jedem $n = 0, 1, ...$ gibt es bis auf àquivalenz genau eine irreduzible, Darstellung $(rho_n, U_n)$ von $SU(2)$ der Dimension $n + 1$.

  Die explizite Konstruktion: $U_n = CC[z_1, z_2]_n$ mit $(rho(n) (A)) (z) = p(A^m1 z)$.

  $rho_n$ ist unitär bezüglich des Skalarproduktes, für das die Basis $(z_1^m z_2^(n-m))/(sqrt(m! (n-m)!))), m=0, ..., n$ eine Orthonormalbasis ist.
]

Beweis:

Alles gezeigt bis auf Normierungsfaktor.

Erinnerung: Isomorphismus $V_n -> U_n, v_m |-> (-1)^m/(m! (n-m)!) z_1^m z_2^(n-m)$.

èberträgt man das Skalarprodukt auf $V_n$ bezüglich dessen $U_m$ eine Orthonormalbasis auf $U_n$, so ist in $V_n$ die normierte Basis wie im Satz.


#remark[Bemerkung][
  Irreduzible Darstellungen von $SO(3)$

  Erinnerung $phi: SU(2) -> SO(3)$.

  $
    ker(phi) = {id, -id}\
  $

  Gegeben $rho: SO(3) -> GL(V)$

  Es folgt:

  $
    rho circ phi: SU(2) -> GL(V)\
  $

  ist eine Darstellung von $SU(2)$ auf $V$. $rho circ phi$ hat das gleiche Bild wie $rho$. Die invarianten Unterräume von $rho$ sind die gleichen wie die von $rho circ phi$.

  Das bedeutet $rho$ ist irreduzibel $<=> rho circ phi$ ist irreduzibel.

  Also falls $rho$ irreduzibel ist, so ist $rho circ phi$ isomorph zu einer Darstellung $rho_n$ mit $n = dim(rho - 1)$

  $
    (rho circ phi) (±id) = id_V\
  $

  aber

  $
    rho_n (-id) = (-id_V_n)^n = cases(id_V n "ungerade", id_V n "gerade")\
  $
  
  nur für gerade $n$ kann $rho_n iso rho circ phi$ gelten:

  Umgekernt sei $n$ gerade und betrachte $rho_n: SU(2) -> GL(V_n)$. Setze für $R in SO(3)$:

  $
    tilde(rho)_n (R) = rho_n (A) in GL(V_n)\
    "mit" A in phi^m1 (R = {± A}) "beliebig"\
  $

  Wegen $rho_n (-A) = rho_n ((-id) A) ) rho_n (-id) = rho_n (A)$ ist $tilde(rho)_n$ wohldefiniert.

  Ausserdem $tilde(rho)_n = rho_n$. Ausserdem ist $tilde(rho)_n$ ein Gruppenhomomorphismus.

  Somit ist $tilde(rho)_n$ eine Darstellung von $SO(3)$ auf $V_n$.
]

#theorem[Satz][
  Sei $rho:SO(3) -> GL(V)$ eine irreduzible Darstellung mit $dim(rho) = n + 1$.

  Dann gilt: $dim(rho)$ ungerade ($n$ gerade) und

  $
    rho iso rho_n\
  $
]




