#import "../../../lib/lib.typ": *
#show: frame-style(styles.boxy)

= Die Drehgruppe und die Lorentzgruppe

In diesem Kapitel geht es um die Gruppen $O(3), SO(3), O(1, 3)$

#definition[Definition][Orthogonale und Lorentz-Gruppen][
  $
      O(3) & = {A in RR^(3 times 3) | A^T A = id}                           \
     SO(3) & = {A in O(3) | det(A) = 1}                                     \
    O(1,3) & = {A in RR^(4 times 4) | A^T eta A = eta}                      \
     IO(3) & = {A in O(3)\| A "ist Isometrie des Eukl. Raumes"} \
  $
  wobei $eta = "diag"(-1, 1, 1, 1)$ die Minkowski-Metrik ist.
]

== Isometrien des Euklidischen Raumens

Der Euklidische Abstand $x, y in RR^3$ ist:

$
  d(x,y) = sqrt((x-y, x-y))\
$

Eine Isometrie des Euklidischen Raumes ist eine bojektive Abbildungen

$
  f: RR^3 -> RR^3\
$

so dass

$
  d(f(x), f(y)) = d(x,y) forall x,y in RR^3\
$

#theorem[Satz][
  Sei $f$ eine Isometrie des Euklidischen Raumes. Dann exisitieren eine Matrix $R in O(3), b in RR^3$, so dass $forall x in RR^3, f(x) = R x + b$, also $f in IO(3)$
]

== $SO(3)$ und $O(3)$

Drehungen und Spiegelungen von dem 3-dimensionalen Raum.

Sei $P in O(3)$ die Spiegelung $P=-id$, also $P x = -x$.

$=>$ Jede Matrix in $O(3)$ hat $det(plus.minus 1)$ und ist also von der Form:

$
  R in SO(3) "oder" P R, R in SO(3)\
$

Jede Matrix in $SO(3)$ hat die Form:

$
  O R_3 (theta) O^m1\
  O in SO(3), R_3 (theta) = mat(cos(theta), -sin(theta), 0; sin(theta), cos(theta), 0; 0, 0, 1)\
$

Also eine Drehung um die $z\/3$-Achse um den Winkel $theta$.

Was also passiert is, dass $O$ das System für die richtige Drehung entlang $z$ ausrichtet, $R_3$ die Drehung entlang $z$ macht und $O^m1$ das System wieder zurückdreht.

Wir definieren:

$
  O e_3 = n\
  O R_3 (theta) O^m1 = R (n, theta)\
$

#lemma[Lemma][
  Sei $O in SO(3), n = O e_3$

  $
    R(n, theta) x = O R_3 (theta) O^m1 x\
    = (x dot n) n + (x- (x dot n) n) cos(theta) + n cross x sin(theta)\
  $

  Dies gilt für jede beliebige Wahl von $O$.

  Dies ist die Formel für die Drehung eines Vektors $x$ um den Winkel $theta$ um die Achse $n$.
]

Beispiel:

$
  x = mat(1; 0; 1)\
  n = mat(0; 0; 1)\
  theta = pi
$

falls alles richtig geht, bekommen wir $mat(-1; 0; 1)$

$
  (mat(1; 0; 1) dot mat(0; 0; 1)) mat(0; 0; 1) + (mat(1; 0; 1) \- (mat(1; 0; 1) dot mat(0; 0; 1)) mat(0; 0; 1)) cos(pi)\
   + mat(0; 0; 1) cross mat(1; 0; 1) sin(pi)\
  = mat(0; 0; 1) + (mat(1; 0; 1) - mat(0; 0; 1))(-1) + mat(0; 0; 1) cross mat(1; 0; 1) dot 0\
  = mat(0; 0; 1) - (mat(1; 0; 1) - mat(0; 0; 1))\
  = mat(0; 0; 1) - mat(1; 0; 0)\
  = mat(-1; 0; 1)
$

Beweis:

$
  O = id, n=e_3\
  R_3 (theta) x = mat(0; 0; x_3) + mat(x_1; x_2; 0) cos(theta) + mat(- x_2; x_1; 0) sin(theta)\
  = mat(x_1 cos(theta) - x_2 sin(theta); x_2 cos(theta) + x_1 sin(theta); x_3)\
  = R_3 (theta) x\
$

Allgemeine $O$. Wir machen eine Substitution:

$
  y = O^m1 x, x = O(y), O^m1 n = e_3, O e_3 cross O y\
  R_3 (theta) O y = (O y dot n) n + (O y - n (O y dot n) ) cos(theta)\
   + n cross O y sin(theta) | O y dot O z = y z\
  = (y dot e_3)O e_3 + O (y-e_3 (y dot e_3)) cos(theta) + O (e_3 cross y) sin(theta)\
  <=> R_3 (theta)y = (y dot e_3) e_3 + (y-e_3 (y dot e_3)) cos(theta) + (e_3 cross y) sin(theta)\
  qed
$

#lemma[Lemma][
  + $
      R(n, theta) = R(-n, -theta) = R(n -theta)^m1\
    $

  + $
      forall tilde(O) in SO(3):\
      tilde(O) R(n, theta) = R(tilde(O) n, theta) tilde(O)\
      <=> tilde(O) R(n, theta) tilde(O)^m1 = R(tilde(O) n, theta)\
    $
]

Beweis:

+ Ist klar.

+ $
    O e_3 = n\
    tilde(O) R(n, theta) tilde(O)^m1 = tilde(O) O R_3 (theta) O^m1 tilde(O)^m1\
    =(tilde(O) O) R_3 (theta) (tilde(O) O)^m1\
    = R(tilde(O) O e_3, theta)\
    = R(tilde(O) n, theta)\
    qed
  $

== Eulerwinkel

#theorem[Satz][
  Jede Matrix $A in SO(3)$ kann als Produkt von drei Drehungen um die Achsen $x, y, z$ dargestellt werden:

  $
    A = R_3 (phi) R_1 (theta) R_3 (psi)\
  $

  wobei $phi in [0, 2 pi[, theta in [0, pi], psi in [0, 2 pi[$ und $R_i$ die Drehung um die Achse $i$ um den Winkel $phi, theta, psi$ ist.

  Eulerwinkel ist meinst relativ unpraktisch aber es hat viele Anwendungen in der Technik. Zum Beispiel in der Robotik oder der Positionierung von Flugzeugen (Pitch, Yaw, Roll).

  Wir haben die Variante *Kardanwinkel*:

  $
    A = R_1 (phi) R_2 (theta) R_1 (psi)\
  $

  Wir haben die Variante *Drehung um mitgeführte Achsen* (Flugzeug):

  $
    tilde(R) = R(R_3("Yaw" e_2, "Pitch") R_3("Yaw")
    R(tilde(R) e_1, "Roll")\
    = tilde(R) R(e_1, "Roll") = R_3("Yaw") R_2 ("Pitch") R_1("Roll")
  $
]

== Homomorphismus $SU(2) -> SO(3)$

#lemma[Lemma][
  Jede Matrix $A in SU(2)$ hat folgende Form:

  $
    A = mat(alpha, beta; -over(beta), over(alpha))\
    alpha, beta in CC: abs(alpha)^2 + abs(beta)^2 = 1\
  $

  Also ist $SU(2) iso S^3$ (3-Sphäre) als Mannigfaltigkeit.
]

Beweis:

$
  A = mat(alpha, beta; gamma, delta) in SU(2)\
  det(A) = 1 = alpha delta - beta gamma\
  A^m1 = 1/det(A) mat(delta, -beta; -gamma, alpha)\
  = mat(delta, -beta; -gamma, alpha) = A^*\
  A^* = over(A)^T = mat(over(alpha), over(gamma); over(beta), over(delta))\
  => delta = over(alpha), gamma = - over(beta)\
  => 1 = abs(alpha)^2 + abs(beta)^2\
$

#definition[Definition][Hermiteische Matrizen][
  Sei $H_0$ der Raum der hermiteschen spurfreien Matrizen:

  $
    H_0 = {A in mattyp(2, 2) (CC) | A^* = A, tr(A) = 0}
    \
    = {mat(z, x + i y; x - i y, -z) | z, x, y in RR} iso RR^3
  $

  Für
  $
    X, Y in H_0\
    (X, Y) = 1/2 tr(X Y)\
  $

  Dies ist ein Skalarprodukt auf $H_0$.

  $
    1/2 tr((mat(z, x + i y; x - i y, -z) mat(z', x' + i y'; x' - i y', -z')))\
    = z z' + x x' + y y') "standardskalarprodukt"\
  $

  Also ist $(H_0m (-,-)) iso (RR^3, (-,-))$

  Für $A in SU(2)$ definieren wir:

  $
    Phi(A): H_0 -> H_0\
    Phi(A) X = A X A^* = A X A^m1 in H_0\
  $

  Dies ist wieder Spurfrei.
]

#lemma[Lemma][
  + $
      Phi(A B) = Phi(A) Phi(B)\
    $

  + $
      (Phi(A) X, Phi(A) Y) = (X, Y)\
    $
]

Beweis:

+ $
    Phi(A B) X = A B X B^* A^* = Phi(A) Phi(B) X\
  $

+ $
    (Phi(A) X , Phi(A) Y) = tr(A X A^* A Y A^*)\
    = tr(X, Y)
  $

Also ist $Phi$ ein Gruppenhomomorphismus von $SU(2)$ auf die orthogonalen Abbildungen von $H_0$.

#definition[Definition][Pauli Matrizen][
  Wir haben eine Orthonormalbasis von $H_0$:

  $
    sigma_1 = mat(0, 1; 1, 0),\
    sigma_2 = mat(0, -i; i, 0),\
    sigma_3 = mat(1, 0; 0, -1)\
  $

  so dass die Abbildung

  $
    RR^3 -> H_0\
    x |-> hat(x) = x_1 sigma_1 + x_2 sigma_2 + x_3 sigma_3\
    = mat(x_3, x_1 + i x_2; x_1 - i x_2, -x_3)
  $

  ein Isomorphismus ist, welcher die Skalarprodukte erhält.

  Wir bezeichnen mit $Phi(A)$ die Matrix von $Phi(A) in End(H_0)$ bezüglich der Orthonormalbasis $sigma_1, sigma_2, sigma_3$.

  $
    => Phi: SU(2) -> O(3) in Hom
  $

  Es gilt: $A hat(x) A^* = hat(Phi(A) X), A in SU(2)$.

  Da $SU(2) iso S^3$ und $S^3$ zusammenhängen ist und $Phi$ stetig, ist es leicht zu beweisen, dass $det(Phi(A)) = +1$

  Somit ist $Phi: SU(2) -> SO(3)$ ein Gruppenhomomorphismus.
]

#theorem[Satz][
  $Phi: SU(2) -> SO(3)$ ist surjektiv und $ker(Phi) = Phi^m1 {id} = {plus.minus id}$
]

Beweis:

+ $
    ker(Phi) = {A in SU(2) | A X A^* = X forall X in H_0}\
    A = mat(alpha, beta; -over(beta), over(alpha))\
    X = mat(1, 0; 0, -1)\
    mat(alpha, beta; -over(beta), over(alpha)) mat(1, 0; 0, -1) mat(over(alpha), -beta; over(beta), alpha) = A X A^* = X\
    = mat(alpha, beta, - over(beta), over(alpha)) mat(over(alpha), -beta; - over(beta), - alpha)\
    = mat(alpha over(alpha) + beta over(beta), -2 alpha beta; -2 over(beta) over(alpha), abs(beta)^2 + abs(alpha)^2)\
    = mat(1, 0; 0, -1)\
    <=> abs(alpha)^2 + abs(beta)^2 = 1, alpha beta = 0\
    => beta = 0, abs(alpha) = 1\
  $

  Dies Funktioniert für jede Paulimatirx. Es folgt:

  $
    => A = plus.minus id
    => ker(Phi) = {plus.minus id}\
  $

+ Eulerwinkel $=>$ Es reicht zu zeugen, dass $R_1(theta), R_3(theta) in im(Phi)$.

  $
    Phi mat(cos theta/2, -i sin theta/2; -i sin theta/2, cos -theta/2) = R_1 (theta)\
    Phi mat(e^(-i theta/2), 0; 0, e^(i theta/2)) = R_3 (theta) = R_3 (theta)\
    qed
  $

Bemerkung:

Es gilt allgemein:

$
  Phi(id cos(theta/2) - i hat(n) sin(theta/2)) = R(n, theta)\
$

== Minkovski-Raum

#definition[Definition][Minkovski-Raum][
  Der Minkowski-Raum (Raumzeit) ist der Raum $RR^4$ mit der symmetrischen Bilinearform

  $
    (x, y) = x^0 y^0 - x^1 y^1 - x^2 y^2 - x^3 y^3\
    = x^T diag(1, -1, -1, -1) y\
  $

  $x in RR^4$ heisst:

  - Zeitartig falls $(x, x) > 0$

  - Raumartig falls $(x, x) < 0$

  - Lichtartig falls $(x, x) = 0$

  Die Menge der lichtartigen Vektoren heisst *Lichtkegel*.

  In der Physik: $x^0 = c t$, $x^1, x^2, x^3$ Raum.
]

== Die Lorentzgruppe

#definition[Definition][Lorentzgruppe][
  Die Lorentzgruppe $O(1,3)$ ist die Gruppe der Matrizen

  $
    O(1, 3) = {A in in GL(4, RR), (A x, A y) = (x, y) forall x, y in RR^4}\
    = {A in GL(4, RR) | A^T g A = g}\
    g = mat(1, 0, 0, 0; 0, -1, 0, 0; 0, 0, -1, 0; 0, 0, 0, -1) \
  $

  Wir gucken uns die eigenschaften an:

  $
    det(A^T g A) => det(A) in {plus.minus 1}\
  $

  Die Lorentzgruppe zerfällt also in mindestens zwei disjunkte Teile:
]

#definition[Definition][Basis der Lorentzgruppe][
  Sei eine Basis $b_0, b_1, b_2, b_3$ von $RR^4$ heisst *orthonormiert*, falls

  $
    (b_i, b_j) = g_(i j)\
  $
]

#theorem[Satz][
  Sind $(b_i), (b'_i)$ orthonormierte Basen, si gibt es genau ein $A$ welches die Basis $(b_i)$ auf die Basis $(b'_i)$ abbildet, so dass $A^T g A = g$ und $b'_j = A b_j$.
]

Beweis:

+ Einduetigkeit ist klar durch Werte auf Basis eindeutig bestimmt.

+ Existenz:

  Sei $A$ die durch $b'_j = A b_j$ definierte lineare Abbildung. Es gilt zu zeigen $forall x, y in RR^4: (A x. A y) = (x,y)$.

  Sei $x = sum_j x_j b_j, y = sum_j y_j b_j$.

  $
    (A x, A y) = (sum_i x_i A b_i, sum_j y_j A b_j)\
    = sum_(i j) = x_i y_j (A b_i, A b_j)\
    = sum_(i j) x_i y_j (b'_i, b'_j)\
    = sum_(i j) x_i y_j g_(i j)\
    = (x, y)\
    qed
  $

Bemerkung:

$
  b = "Standardbasis"\
$

Dann gilt:

$
  b'_i = A b_i "Spalten von" A\
$

Diese sind eine orthonormierte Basis von $RR^4$ genau dann wenn $A in O(1, 3)$.

== Beispiele

+ Orthogonale Transformationen:

  $
    mat(1, 0; 0, R)\
    R in O(3)\
    O(3) subset O(1, 3) "ist Untergruppe"\
  $

+ Lorentzboost in 3-Richtung mit Rapidität $chi$:

  $
    L(chi) = mat(cosh(chi), 0, 0, sinh(chi); 0, 1, 0, 0; 0, 0, 1, 0; sinh(chi), 0, 0, cosh(chi))\
    L in O(1, 3)\
    L(chi_1) L(chi_2) = L(chi_1 + chi_2)\
    L(chi)^m1 = L(-chi)\
  $

  Physikalisch: Übergang in ein in 3-Rightung bewegtes Bezugssystem mit Geschwindigkeit $v = tanh(chi), cosh(chi) = 1/sqrt(1-v^2/c^2), sinh(chi) = v/c / sqrt(1-v^2/c^2)$.

+ Raumspiegelung:
  $
    P = mat(-1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, -1) = g in O(1, 3)\
    P^T = P, P^2 = id
  $

+ Zeitumkehrung:

  $
    T = -P = mat(-1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1) in O(1,3)\
    T^2 = id\
    T^T = T, T^2 = id\
    T P = P T = -id
  $

#lemma[Lemma][
  Sei $A in O(1, 3)$:

  $
    A^T = P A^m1 P = T A^m1 T\
    A^m1 = P A^T P = T A^T T\
  $

  Also

  $
    A = mat(lambda, tilde(v); v, B)\
    => A^m1 = mat(lambda, -v^T; -tilde(v)^T, B^T)\
  $
]

#corollary[Korollar][
  Sei $A in O(1, 3) => A^T in O(1, 3)$

  $A$ ist genau dann in $O(1,3)$ wenn die Zeilen eine Orthonormalbasis bilden.
]

Sei
$
  O_+ (1, 3) = {A in O(1,3)| A_(0 0) > 0} subset O(1,3)\
$

Elemente von $O_T (1,3)$ nennt man orthochrone (zeitrichtungserhaltende) Lorentztranformation.

#theorem[Satz][
  Sei $Z_+ = {x in RR^4| (x, x)>0 "und" x^0 >0}$.
  Dann gilt:

  $
    O_+ (1, 3) = {A in O(1, 3)| A Z_+ subset Z_+}\
  $

  Insbesondere ist $O_+ (1, 3) subset O(1, 3)$ eine Untergruppe.
]

Beweis:

"$supset$": Sei $A in O_+(1,3)$ und $x in Z_+$, d.h. $(x,x) > 0$ und $x^0 > 0$.

Da $A in O(1,3)$: $(A x, A x) = (x, x) > 0$, also ist $A x$ zeitartig.

Sei $A x = (y^0, y^1, y^2, y^3)^T$. Wir müssen zeigen: $y^0 > 0$.

Betrachte $e_0 = (1, 0, 0, 0)^T in Z_+$. Dann ist $A e_0 = (A_(0 0), A_(1 0), A_(2 0), A_(3 0))^T$.

Da $(A e_0, A e_0) = (e_0, e_0) = 1$ und $A_(0 0) > 0$ (nach Voraussetzung), folgt:
$A_(0 0)^2 - A_(1 0)^2 - A_(2 0)^2 - A_(3 0)^2 = 1$

Also $A_(0 0) = sqrt(1 + A_(1 0)^2 + A_(2 0)^2 + A_(3 0)^2) >= 1$.

Für beliebiges $x in Z_+$ mit $x^0 > 0$: Da $x = x^0 e_0 + sum_(i=1)^3 x^i e_i$ und $(x,x) > 0$, folgt $(x^0)^2 > sum_(i=1)^3 (x^i)^2$.

$(A x)^0 = A_(0 0) x^0 + sum_(i=1)^3 A_(0 i) x^i$

Da $A_(0 0) >= 1 > 0$ und durch Kontinuitätsargument folgt $(A x)^0 > 0$.

"$subset$": Sei $A in O(1,3)$ mit $A Z_+ subset Z_+$.

Dann $A e_0 in Z_+$, also $(A e_0)^0 = A_(0 0) > 0$.

Also ist $O_+(1,3)$ abgeschlossen unter Multiplikation und Inversion, somit eine Untergruppe.

#definition[Definition][Orthochrone spezielle Lorentzgruppe][
  $
    SO_+ (1, 3) = {A in O(1, 3)| det(A) = +1, A_(0 0) > 0}\
  $
]

#theorem[Satz][
  jede Lorentztransformation liegt in genau einer der 4 Teilmengen:

  #table(
    columns: 4,
    stroke: 0.5pt,
    align: center,
    [*Gruppe*], [*$det(A)$*], [*$A_(0 0)$*], [*Menge*],
    [$SO_+ (1,3)$], [$+1$], [$> 0$], [$SO_+ (1, 3)$],
    [$O_+ (1,3) \\ SO_+ (1,3)$], [$-1$], [$> 0$], [${P A | A in SO_+ (1, 3)}$],
    [$SO_- (1,3)$], [$+1$], [$< 0$], [${T A | A in SO_+ (1, 3)}$],
    [$O_- (1,3) \\ SO_- (1,3)$], [$-1$], [$< 0$], [$P T A | A in SO_+ (1, 3)$]
  )

  Dies sind auch die 4 Zusammenhangskomponenten der Lorentzgruppe $O(1,3)$.
]

#lemma[Lemma][
  Jedes $A in SO_+ (1, 3)$ ist von der Form:

  $
    A = R_1 L(chi) R_2\
    R_1, R_2 in SO(3), chi in RR
  $
]

Beweis:

Sei $A in SO_+ (1, 3)$.

$
  A = mat(a^0, *; aa, *)\
$

Sei $R_1 in SO(3)$ eine Drehung, welche den Vektor $aa$ auf die $z$-Achse abbildet: $R_1^m1 aa = mat(0; 0; abs(aa))$

$
  => R^m1_1 A = mat(a^0, *; R^m1_1 aa, *) = mat(a^0, *; 0, *; 0, *; abs(aa), *)\
$

Sei $chi in RR$ so gewählt, so dass $a^0 = cosh(chi), abs(aa) = sinh(chi)$.
$
  => L(chi) R^m1_1 A = mat(1, 0; 0, R)\
$

Aus der definierenden Gleichung ist in $SO_+ (1, 3 subset O(1,3))$.

$
  => R^T R = id, "also" R in O(1,3)\
  det(R) = 1, "also" R in SO(3)\
$

Setze $R_2 = R$.

$
  => L(-chi) R^m1_1 A = R_2 <=> R_1 L(chi) R_2 = A\
$

#corollary[Korollar][
  $SO_+ (1,3)$ ist zusammenhängend.

  Die Zerlegung von $O(1,3)$ im Satz ist die Zerlegung in Zusammenhangskomponenten.
]

Beweis:

Wir suchen die stetigen Abbildungen $gamma: [0, 1] -> SO_+ (1, 3)$

$
  gamma(0) = id, gamma(1) = A\
  A = R_1 L(chi) R_2\
$

Die jeweiligen Komponenten sind stetig verbindbar mit $id$.

$
  qed
$

== Isomorphismus $SL(2, CC)\/{±1} -> SO_+ (1, 3)$

Sei $H$ der Raum der hermiteschen $mattyp(2, 2)$, also alle Matrizen der Form:

$
  hat(a) = mat(x^0 + x^3, x^1 - i x^2; x^1 + i x^2, x^0 - x^3) = x^0 id + sum_(j=1)^3 x^j sigma_j = sum_j x^j sigma_j\
  x = mat(x^0; x^1; x^2; x^3) in RR^4\
  sigma_j = "Pauli-Matrizen"\
$

Jeder Vektor in $RR^4$ kann eindeutig zu einer Matrix in $H$ zugeordnet werden. $H iso RR^4$ mit $x |-> hat(x)$.

Wir müssen nun das Minkowski-Skalarprodukt auf $H$ definieren:

#lemma[Lemma][
  $
    forall x in RR^4: (x, x) = det(hat(x))\
  $

  Dies gilt auch für beliebige $x, y in RR^4$.
]

Beweis:

$
  (x, y) = det(hat(x) hat(y)) = (x^0 y^0 - x^1 y^1 - x^2 y^2 - x^3 y^3)
$

$
  det(hat(x)) = (x^0)^2 - (x^1)^2 - (x^2)^2 - (x^3)^2 = (x, x)
$

Beachte: aus $(x, x)$ läst sich durch Polarisation das Skalarprodukt $(x, y)$ rekonstruieren.

$
  (x,y) = 1/2 dv(, lambda_1)|_(lambda_2 = 0) dv(, lambda_2)|_(lambda_1 = 0) (lambda_1 x + lambda_2 y, lambda_1 x + lambda_2 y)\
$

Für $A in SL(2, CC)$ definieren wir die Abbildung:

$
  H-> H\
  X |-> A X A^* 
$

Sei $Phi(A): RR^4 -> RR^4$ die entsprechende Abbildung:

$
  A hat(x) A^* = hat(Phi(A) x)\
$

Es ist:

$
  det(A hat(x) A^*) = det(A) det(hat(x)) det(A^*) = det(hat(x))\
  =det(hat(Phi(A) x)) = (Phi(A) x, Phi(A) x)\
$

$=> Phi(A) in O(1, 3) => Phi: SL(2, CC) -> O(1, 3)$.

Beispiel:

$
  A = W_Theta = mat(e^Theta, 0; 0, e^(-Theta)) in SL(2, CC)\
  W_Theta hat(x) W_Theta^* = mat(e^Theta, 0; 0, e^(-Theta)) mat(x^0 + x^3, x^1 - i x^2; x^1 + i x^2, x^0 - x^3) mat(e^(Theta), 0; 0, e^(-Theta))\
  = mat(e^(2 Theta) (x^0 + x^3), x^1 - i x^2; x^1 + i x^2, e^(-2 Theta) (x^0 - x^3))\
  = hat(mat(cosh(2 Theta), 0, 0, sinh(2 Theta); 0, 1, 0, 0; 0, 0, 1, 0; sinh(2 Theta), 0, 0, cosh(2 Theta))) mat(x^0; x^1; x^2; x^3) => L(2 Theta)\ 
$

#theorem[Satz][
  $
    forall S in SL(2, CC): Phi(S) in SO_+ (1, 3)\
  $

  Die Abbildung $Phi: SL(2, CC) -> SO_+ (1, 3)$ ist ein surjektiver Gruppenhomomorphismus mit $ker(Phi) = {±id}$.

  Also induziert $Phi$ einen Isomorphismus:

  $
    SL(2, CC) / {±1} -> SO_+ (1, 3)\
  $

  Die Einschränkung von $Phi$ auf $SU(2) subset SL(2, CC)$ ist der bekannte Gruppenhomomorphismus $Phi: SU(2) -> SO(3)$, welcher die Drehungen im 3-dimensionalen Raum beschreibt. 
]

Beweis:

+ Einschränkung ist bekannter Homomorphismus:

  $
    SU(2) -> SO(3)\
    A |-> mat(H iso RR^3 -> H_0 iso RR^3; x |-> A X a^m1)\
    A X A^* = A X A^*, A in SU(2)\
  $

+ Es ist ein Gruppenhomomorphismus

  Sei $A, B in SL(2, CC), X in H$.

  $
    (A B) X (A B)^* = A B X B^* A^* = A (B X B^*) A^* = Phi(A) Phi(B) X\
    => Phi(A B) = Phi(A) Phi(B)
  $

+ Nimmt Werte an in $SO_+ (1, 3)$

  Es reicht zu zeigen, dass $SL (2, CC)$ zusammenhängen ist, da $id$ auf $SO_+ (1, 3)$ abgebildet wird.

  Da $Phi$ stetig, ist dann automatisch das Bild von $Phi$ enthalten in der Zusammenhangskomponente von $id in O(1, 3)$ also in $SO_+ (1, 3)$.

  Sei $A in SL(2, CC)$:

  $
    A = D mat(a, b; 0, a^m1) D^m1 "Jordan-Form"\
    a in CC, b in CC, D in GL(2, CC)\
  $

  Wähle eine stetige Kurve $t |-> a_t$, welche nicht durch $0$ geht und $a_0 = 1$, $a_1 = a$.

  Die Kurve $t |-> A_t = D mat(a_t, t b; 0, a_t^m1) D^m1$ ist ebenfalls stetig und verbindet $id$ mit $A$.

+ Ist surjektiv

  Jedes $A in SO_+ (1, 3)$ ist von der Form:

  $
    A = R_1 L(chi) R_2\
  $

  $SO(3)$ liegt im Bild von $Phi$ wegen 1.

  $
    L(chi) = Phi(W_(chi/2))
  $

  ist auch im Bild von $Phi => A in im(Phi)$ wegen 2.

+ Kern ist $±1$

  $
    Phi(A) = id <=> A hat(x) A^* = hat(x) forall hat(x) in H\
  $

  Wähle $x = (1, 0, 0, 0)$. $hat(x) = id$.

  $
    => A A^* = id\
  $

  Wegen 1. und der Rechnung für den Bekannten Homomorphismus $SU(2) -> SO(3)$ folgt, dass $A in {±id}$.

  Es ist leicht zu zeigen, dass $±id$ im Kern von $Phi$ liegt.

  $
    qed
  $


== Bemerkung

+ Gegeben ein Element von $O(3), SO(3)$ oder der Lorentzgruppe:

  + Wie kann man sie aufschreiben

  + Was sind die Zusammenhangskomponenten

  + Zweifache Überlagerungen