#import "../../../lib/lib.typ": *
#show: frame-style(styles.boxy)


= Fouriertransformation

#theorem[Satz][Fouriertransformation][
  Sei $f: RR^n -> CC$ integrierbar ($integral_(RR^n) abs(f(x)) dd(x) < infinity$), dann ist die Fouriertransformation von $f$:
  $
    (cal(F) f) (k) = hat(f) (k) = integral_(RR^n) f(x) e^(-i x dot k) dd(x)\
    f(x) = (2 pi)^(-n) integral_(RR^n) hat(f) e^(i k dot x) dd(k)\
    k in RR^n, x dot k "Skalarprodukt"\
    hat(f): RR^n -> CC
  $

  Wie kann man nun die originale Funktion mit der Fourierfunktion wiederherstellen? Wir werden zeigen, dass für geeignete Funktionen $f$ gilt:

  $
    f(x) = (cal(F)^(-1) hat(f)) (x)\
    "wobei" g: RR^n -> CC, g = g(k)\
    (cal(F)^(-1) g) (x) = caron(g) (x)\
    := (2 pi)^(-n) integral_(RR^n) g(k) e^(i k dot x) dd(k)\
    => caron(hat(f))= f
  $

  Fouriertransformation kann uns auch dabei helfen, *partielle Differentialgleichungen* zu lösen:

  $
    cal(F) (pdv(f, x_j)) (k) = i k_j (cal(F) f) (k)\
    (pdv(u, x))_n = i n u_n
  $
]
== Beispiel

+ $
    n = 1, f(x) = e^(-x^2/2) => hat(f) (k) = sqrt(2 pi) e^(-k^2/2)\
    hat(f) (k) = integral_(-infinity)^(infinity) e^(-x^2/2) e^(- i x k) dd(x)\
    dv(, k) hat(f) (k) = integral_(-infinity)^(infinity) e^(-x^2/2) dv(, k) (e^(-i k x) dd(x)\
    = evaluated(i e^(-x^2/2) e^(i k x))_(- infinity)^(infinity) - i integral_(-infinity)^(infinity) e^(-x^2/2) dv(, x) (e^(-i x k)) dd(x)\
    = -k integral_(-infinity)^(infinity) e(-x^2/2) e^(i k x) dd(x) = -k hat(f) (k)\
    => hat(f)' (k) = -k hat(f) (k)\
    hat(f) (k) = hat(f) (0) e^(-k^2/2)\
    hat(f) (0) = integral_(-infinity)^(infinity) e^(-x^2/2) dd(x) = sqrt(2 pi)\
    => hat(f) (k) = sqrt(2 pi) e^(-k^2/2)\
  $
  Die Transformation einer gausschen Glockenkurve ist wieder eine Glockenkurve.

+ $
    f(x) = e^(-alpha x^2) => hat(f) (k) = sqrt(pi/alpha) e^(-k^2/(4 alpha))\
  $

+ $
    n in NN, f(x) = e^(abs(x)^2/2)\
    hat(f) (k) = integral_(-infinity)^(infinity) e^(abs(x)^2/2) e^(-i k x) dd(x)\
    = integral_(-infinity)^infinity dd(x_1) ... integral_(-infinity)^(infinity) dd(x_n) e^(abs(x_1)^2/2) ... e^(abs(x_n)^2/2) e^(-i k_1 x_1) ... e^(-i k_n x_n)\
    = sqrt(2 pi)^n/2 e^(abs(k)^2/2)\
  $

+ $
    f(x) = cases(1\, abs(x) <= 1, 0\, abs(x) > 1)\
    "Integiertbar aber nicht glatt"\
    hat(f) (k) = integral_(-1)^(1) e^(-i k x) dd(x) = 2 sin(k)/k = 2 sinc(k)\
  $
  In diesem Fall ist die inverse der Fouriertransformation nicht die ursprüngliche Funktion, da $integral_(-infinity)^(infinity) abs(2 sinc(k)) dd(k) = infinity$. Die Funktion ist also nicht integrierbar.

+ $
    f(x) = e^(-alpha abs(x))\
    hat(f) (k) = 2 alpha/(alpha^2 + k^2)\
  $

*Beobachtung*:

$f$ regulär $=> hat(f)$ fällt schnell ab. $f$ fällt schnell ab $=> hat(f)$ regulär. Weil:
$
  hat(f) (k) = integral_(-infinity)^(infinity) f(x) e^(-i k x) dd(x)\
  dv(, k, N) hat(f) (k) = integral_(-infinity)^(infinity) f(x) e^(-i x k) dot (-i x)^N dd(x)\
$

Also je schneller $f$ abfällt, desto mehr ableitungen von $hat(f)$ kann ich nehmen.

$
  abs(f(x)) <= C/(1 + abs(x)^(k+2)) => hat(f) in C^k(RR)\
$

== Schwartzraum

#theorem[Satz][Schwartzraum][
  Eigenschaften der Funktionen im Raum: regulär, schnell abfallend.

  Notation:
  $
    alpha in NN_0^n \
    alpha=(alpha_1, ..., alpha_n)\
    abs(alpha) = sum_(j=1)^n alpha_j\
    alpha! = alpha_1! ... alpha_n!\
    partial^alpha = partial^(alpha_1)/(partial x_1^(alpha_1)) ... partial^(alpha_n)/(partial x_n^(alpha_n)) = partial_1^(alpha_1) ... partial_n^(alpha_n)\
    x^(alpha) = x_1^(alpha_1) ... x_n^(alpha_1)\
  $

  Der Schwartzraum $S(RR^n)$ ist der Raum der Funktionen, die schneller abfallen als jede Polynomfunktion. Die Funktionen sind also unendlich oft differenzierbar und die Ableitungen fallen schneller ab als jede Polynomfunktion.

  $
    Omega subset.eq RR^n "offen"\
    C^0(Omega) = {f: Omega -> CC, f "stetig"}\
    C^k(Omega) = {f: Omega -> CC, partial^alpha f "stetig" forall abs(alpha) <= k}\
    C^(infinity)(Omega) = {f: Omega -> CC, f in C^k forall k in NN_0^n}\
  $
]

#definition[Definition][Schwartzraum und Schwartznorm][
  Sei $phi in C^(infinity)(RR^n)$ und $m in NN_0$.
  Dann ist die Norm von $phi$ definiert als:
  $
    norm(phi)_m = sup_(x in RR^n, abs(alpha), abs(beta) <= m) abs(x^alpha partial^alpha partial^beta phi(x))\
  $

  Der Schwartzraum ist definiert als:
  $
    cal(S) (RR^n) = {phi in C^(infinity)(RR^n), norm(phi)_m < infinity forall m in NN_0}\
  $
  $phi$ ist also eine Funktion, die unendlich oft differenzierbar ist und deren Ableitungen schneller abfallen als jede Polynomfunktion. Die Norm ist also eine Art Mass für die "Schnelligkeit" des Abfalls der Funktion.
]

=== Beispiele

+
  $
    phi(x) = e^(-x^2/2) in cal(RR^n)\
    x^alpha partial^alpha (e^(-x^2/2)) = P_(alpha beta) (x) e^(-x^2/2)\
    "wobei" P_(alpha beta) (x) = "Polynom von Grad" abs(alpha) + abs(beta)\
    "dann" sup_(x in RR^n) abs(P_(alpha beta) (x) e^(-abs(x)^2/2)) < infinity "weil Exponential vs Poly"\
  $

+
  $
    phi(x) in C_c^(infinity)(RR^n) => phi(x) in cal(S) (RR^n)\
    <=> phi in C^(infinity)(RR^n) exists R < infinity, "sodass"\
    phi(x) = 0 forall abs(x) >= R\
  $

+ Gegenbeispiel
  $
    phi(x) = e^(-alpha abs(x)) in.not cal(S) (RR^n) "weil nicht diffbar."\
  $

+ $
    phi(x) = 1 in.not cal(S) (RR^n) "weil nicht schnell abfallend."\
    norm(phi)_m = infinity, "weil" sup_(x in RR^n) abs(x_j) = infinity
  $

#lemma[Lemma][
  $
    phi: RR^n -> CC "liegt in" cal(S) (RR^n)\
    <=> forall beta in NN_0^n, m in NN_0^n exists C "sodass"\
    abs(partial^beta phi(x)) <= C/(1 + abs(x)^(m))\
  $

  Also ist $phi$ regulär und fällt schneller ab als jede Polynomfunktion.
]

=== Beweis

$
  phi in cal(S) (RR^n)\
  => phi in C^(infinity)(RR^n)\
  => phi in C^k(RR^n) forall k in NN_0^n\
  => abs(partial^beta phi(x)) <= C/(1 + abs(x)^(2))^m forall beta in NN_0^n, m in NN_0^n
$

=== Definition: Sinnvoller Konvergenzbegriff

+ Eine Folge von $phi_1, phi_2, ... in cal(S) (RR^n)$ konvergiert gegen $phi in cal(S) (RR^n)$, falls
  $ norm(phi - phi_j)_m ->^(j -> infinity) 0 forall m $.

  Wir schreiben dann $phi_j ->^(cal(S)) phi$.

+ Eine Abbildung $F: cal(S) (RR^n) -> cal(S) (RR^n)$ ist stetig, wenn:
  $
    phi_j ->^(cal(S)) phi => F(phi_j) ->^(cal(S)) F(phi)
  $

  Das heisst, dass die Konvergenz im Schwartzraum erhalten bleibt.

*Beispiel:*

$
  phi_j (x) = e^(-(1 + 1/j)abs(x)^2) ->^(cal(S)) e^(-abs(x)^2)\
  phi_j (x) = 1/j e^(-abs(x)^2) ->^(cal(S)) 0\
$

== Fouriertransformation im Schwartzraum

#theorem[Satz][
  + Sei $f in cal(S) (RR^n)$. Dann ist die Fouriertransformation und die inverse Fouriertransformation von $f$ wieder im Schwartzraum:
  $
    hat(f), caron(f) in cal(S) (RR^n)
  $

  + Die Abbildung $cal(F): cal(S) (RR^n) -> cal(S) (RR^n)$ ist linear, stetig und bijektiv, mit Inversen:

  $
    cal(F)^(-1): cal(S) (RR^n) -> cal(S) (RR^n)
  $
]

#lemma[Lemma][
  $phi in cal(S) (RR^n)$.

  Dann $x_j phi, partial_j phi in cal(S) (RR^n)$ mit:

  + $hat(partial_j phi) (k)$
    $= i k_j hat(phi) (k)$

  + $hat(x_j phi) (k)$
    $= i partial_(k_j) hat(phi) (k)$

  + $caron(partial_j phi) (x)$
    $= -i x_j caron(phi) (x)$

  + $caron(k_j phi) (x)$
    $= -i partial_(j) caron(phi) (x)$
]

*Bemerkung:*

$
  integral_(RR^n) abs(phi(x) e^(-i k dot x)) dd(x) <= C integral_(RR^n) 1/(1 + abs(x)^(m+1)) dd(x) < infinity
$

=== Beweis

+ $
    (partial_n phi)^hat (k) = integral_(RR^n) partial_n phi(x) e^(-i k dot x) dd(x)\
    = integral_(RR^(n-1)) integral_(RR) pdv(, x_n) phi(x) e^(-i_n dot x_n) dd(x_n) e^(-i x_1 k_1 + ... + x_(n-1) k_(n-1)) dd(x_1) ... dd(x_(n-1))\
    = i k_n integral_(RR^n) phi(x) e^(-i k dot x) dd(x) = i k_n hat(phi) (k)
  $

=== Lemma: Fouriertransformation erhält den Schwartzraum

#lemma[Lemma][
  $
    phi in cal(S) (RR^n) => hat(phi), caron(phi) in cal(S) (RR^n)
  $
  Die Abbildung $cal(F): phi |-> hat(phi)$ ist stetig.

  Kurzgesagt: Die Fouriertransformation erhält den Schwartzraum.
]

Wir haben bislang nur gezeigt, dass die Fouriertransformation von Funktionen im Schwartzraum gültig ist. Nun überprüfen wir wie sich allgemeinere Funktionen ausserhalb des Schwarzraumers verhalten.

== Satz: Plancherel-Formel

#theorem[Satz][Plancherel-Formel][
  Sei $phi in cal(S) (RR^n)$. Dann gilt:
  $
    norm(phi)_(L^2(RR^n)) := sqrt(integral_(RR^n) abs(phi(x))^2 dd(x)) = (2 pi)^(n/2) norm(hat(phi))_(L^2(RR^n))
  $

  Die Idee ist also, dass eine Funktion durch Schwartzfunktionen mit der $L^2$ Norm approximiert werden kann. Diese Schwartzfunktionen bilden eine Cauchyfolge. Plancherel zeigt uns nun, dass die Cauchyfolge der Fouriertransformierten dann auch gegen die Fouriertransformierte der Funktion konvergiert. Somit existiert eine Funktion $hat(phi) in L^2(RR^n)$, welche die Fouriertransformation von $phi in L^2(RR^n)$ ist.
]

=== Beweis

$
  phi(x) = (2 pi)^(-n) integral_(RR^n) hat(phi) (k) e^(i k dot x) dd(k)\
  => integral_(RR^n) abs(phi(x))^2 dd(x) = integral_(RR^n) phi(x) overline(phi(x)) dd(x)\
  = integral_(RR^n) phi(x) overline((2 pi)^(-n) integral_(RR^n) hat(phi) (k) e^(i k dot x) dd(k)) dd(x)\
  = (2 pi)^(-n) integral_(RR^n) integral_(RR^n) overline((phi) (k)) phi(x) e^(i k dot x) dd(x) dd(k)\
  = (2 pi)^(-n) integral_(RR^n) integral_(RR^n) overline(hat(phi) (k)) hat(phi) (k) dd(k) dd(x)\
  = (2 pi)^(-n) integral_(RR^n) abs(hat(phi) (k))^2 dd(k)
$

=== Beispiel

$
  phi(x) = e^(-abs(x))\
  phi_j (x) = e^(-(x^2 - 1/j)^(1/2)) in cal(S)\
  lim^(L^2)_(j-> infinity) phi_j(x) = phi(x)\
$

$
  phi(x)= 1/(1+x^2) = lim^(L^2)_(j-> infinity) phi_j (x)\
  phi_j (x) = 1/(1 + x^2) e^(-x^2/j) in cal(S)\
$

Der Beweis der Bemerkung basiert auf Grenzwerten von Cauchyfolgen. Wir können den Schwartzraum mit der $L^2$ Norm Vervollständigen.

== Vervollständigungen

Eine beispielhafte Vervollständigung von $(QQ, abs(dot)) -> RR$. Dies geschieht über Äquivalenzklassen von Grenzwerten von Cauchy-Folgen, welche die reelen Zahlen bilden.

Gleichermassen:
$
  L^2(RR^n) := "Vervollständigung von" (cal(S) (RR^n), norm(dot)_(L^2))\
  = {(phi_i)_(i in NN): phi_i in cal(S) (RR^n), norm(phi_i - phi_j)_(L^2) -> 0}\/~\
  (phi_i)_(i in NN) ~ (psi_i)_(i in NN) :<=> norm(phi_i - psi_i)_(L^2) -> 0\
$

#definition[Definition][L2][
  $
    L^2(RR^n) = {phi: RR^n -> CC, integral_(RR^n) abs(phi(x))^2 dd(x) < infinity}
  $

  Dazu muss die funktion Messbar sein unter dem Lebesgue-Mass/Lebesque-Integral. Elemente von $L^2(RR^n)$ sind dann "fast" überall definierte Funktionen $RR^n -> CC$ (bis auf eine Menge von Lebesgue-Mass 0).

  Man kann auch sagen: $cal(S)(RR^n) subset L^2(RR^n)$.
]

== Satz: Fouriertransformation im $L^2$-Raum

#theorem[Satz][Fouriertransformation im $L^2$-Raum][
  $
    cal(F): L^2(RR^n) -> L^2(RR^n)\
    cal(F) phi = hat(phi)
  $
  Die Fouriertransformation ist also eine bijektive Abbildung von $L^2(RR^n)$ auf $L^2(RR^n)$.

  Dies liegt daran, dass die Fouriertransformation eine unitäre Abbildung ist. Das bedeutet, dass die Normen der Funktionen erhalten bleiben. Ausserdem wissen wir, dass die Fouriertransformation unitär auf Schwartzfunktionen ist. Da die Schwartzfunktionen dicht in $L^2(RR^n)$ liegen, ist die Fouriertransformation auch auf $L^2(RR^n)$ unitär (Cauchy-Folgen).
]

== Satz: Riemann-Lebesgue-Lemma

#theorem[Satz][Riemann-Lebesgue-Lemma][
  $
    phi in L^1(RR^n)\
    => hat(phi) in C^0(RR^n) "und" hat(phi) ->^(abs(k) -> infinity) 0
  $

  Also falls $phi$ integrierbar ist, dann ist die Fouriertransformation von $phi$ stetig und fällt gegen 0.
]

=== Satz

#theorem[Satz][
  $
    f in C_c^m(RR^n)\
    "d.h." f in C^m(RR^n) "und" f "hat kompakten Träger"\
    <=> exists R>0 "sodass" f(x) = 0 forall abs(x) >= R\
    => exists C < infinity "sodass" abs(hat(f) (k)) <= C/(1 + abs(k)^m)\
  $
  Das heisst, falls $f$ eine Funktion mit kompaktem Träger ist, dann fällt die Fouriertransformation schneller ab als jede Polynomfunktion.
]

== Fouriertransformation rotationsinvarianter Funktionen

#definition[Definition][Rotationsinvarianz][
  $
    f: RR^n -> CC "heisst rotationsinvariant"\
    <=> f(R x) = f(x) forall x in RR^n, R in O(n)\
    O(n) = {R in RR^(n x n): R^T R = I, det(R) = 1}
  $
]

#lemma[Lemma][
  $
    f: RR^n -> CC "rotationsinvariant"\
    <=> f(x) = g(abs(x)), g[0, infinity] -> CC\
  $
]

== Polarkoordinaten

Weil wir mit n Dimensionen rechnen, definieren wir Polarkoordinaten wie folgt:

+ Integrale über Sphären
  $
    SS^(n-1) = {x in RR^n: abs(x) = 1} subset RR^n "Einheitskugel"\
    integral_(SS^(n-1)) f(y) dd(R(y))\
    =integral_(abs(y) <= 1, y in RR^(n-1)) (f(y, sqrt(1 - abs(y)^2)))\
    + f(y, -sqrt(1 - abs(y)^2)) (dd(y)_1 ... dd(y)_(n-1))/sqrt(1 - abs(y)^2)
  $

  Einfacher gesagt, wir integrieren über die Einheitskugel.

  Das Integral ist unabhängig von der parametrisierung der Kugel.

+ Rotationsinvarianz des Integrals über $SS^(n-1$.

  $
    f: RR^n -> CC "rotationsinvariant"\
    => integral_(SS^(n-1)) f(R y) dd(Omega (x)) = integral_(SS^(n-1)) f(y) dd(Omega (y))
  $

  Das Integral über die Einheitskugel ist also unabhängig von der Rotation.

+ Integration über $RR^n$ in Polarkoordinaten

  $
    integral_(RR^n) f(x) dd(x) = integral_(0)^(infinity) integral_(SS^(n-1)) f(r y) r^(n-1) dd(Omega (y)) dd(r)\
  $

  Das Integral über $RR^n$ ist also das Integral über die Einheitskugel multipliziert mit dem Radius. Dabei wurde $x = r omega$ verwendet.

==== Beispiel: Flächeninhalt von $SS^(n-1)$

$
  abs(SS^(n-1)) = integral_(SS^(n-1)) 1 dd(Omega (y)) = (2 pi^(n/2))/Gamma(n/2)\
  = cases((2 pi^k)/(k-1)! "für" n = 2k, (2^(2k-1) pi^k k!)/(2k)! "für" n = 2k+1)\
  "wobei" Gamma(s) = integral_(0)^(infinity) e^(-t) t^(s) dd(t)/t
$

== Satz: Fouriertransformation rotationsinvarianter Funktionen

#theorem[Satz][
  $
    g:RR^n -> CC "rotationsinvariant"\
    integral abs(g(x)) dd(x) < infinity\
    => hat(g) (k) "rotationsinvariant"\
  $

  $
    g(x) = g(abs(x)) "rotationsinvariant"\
    => hat(g) (k) = integral_0^(infinity) g(r) integral_(SS^(n-1)) e^(-i r omega dot k) dd(Omega (omega)) r^(n-1) dd(r)\
  $
]

#lemma[Lemma][
  $
    g(x) = g(abs(x)) "rotationsinvariant"\
    => hat(g) (k) = integral_0^(infinity) g(r) G_n(abs(k) r) r^(n-1) dd(r)\
    G_n(rho) = integral_(SS^(n-1)) e^(-i rho dot e_1 omega) dd(Omega (omega))\
  $
]

#lemma[Lemma][
  $
    G_n(rho) "ist holomorph"
  $
  Dies zeigt sich nach Anwendung der Cauchy-Riemannschen Differentialgleichungen.
]

#lemma[Lemma][
  $
    G_n''(rho) + (n-1)/rho G_n'(rho) + G_n(rho) = 0
  $
]

#definition[Definition][Besselfunktionen][
  Besselfunktionen der Ordning $alpha$ ist durch die Potenzreihe definiert:
  $
    alpha in CC\
    cal(J)_alpha (z) = sum_(m=0)^(infinity) (-1)^m/(m! Gamma(m + alpha + 1)) (z/2)^(2m + alpha)
  $
  Sie erfüllen die Bessel-Differentialgelichung:
  $
    cal(J)''_alpha (z) + 1/z cal(J)'_alpha (z) + (1 - alpha^2/z^2) cal(J)_alpha (z) = 0\
  $
]

#theorem[Satz][
  $
    G_n(rho) = 2 pi^(n/2) rho^(1-n/2) cal(J)_(n/2 - 1) (rho)
  $
]

Für $n=3$ löst die Besselfunktion elektromagnetische Wellengleichungen.

Für $R>0$ gilt:

$
  integral_(abs(x) = R, x in RR^3) e^(i k dot x) dd(x)\
  "mit" x = R y\
  = integral_(SS^2) e^(i R y dot k) R^2 dd(Omega (y))\
  = 4 pi R^2 (sin(R abs(k)))/(R abs(k))\
  "mit" R = c t\
  => (2 pi)^(-3) integral_(RR^3) hat(g) (k) (sin(c t abs(k)))/(c t abs(k)) e^(-i k dot x) dd(k)\
  = (2 pi)^(-3) integral_(RR^3) hat(g) (k) t/(4 pi (c t)^2) (integral_(abs(x)=c t) e^(i y dot k) dd(Omega(y))) e^(-i k dot x) dd(k)\
$

Nach der Ausführung des k-Integrals erhalten wir:

$
  = integral_(abs(k) = c t) g(x+y) dd(Omega(y)) 1/(4 pi (c t)^2)\
  = partial_t ( (2 pi)^(-3) integral_(RR^3) hat(f) (k) (sin(c t abs(k)))/(c abs(k)) e^(i k dot x) dd(k) )
$

#theorem[Satz][Kitchhoff Formel][
  $
    u(t,x) = 1/(4 pi) [pdv(, t) (1/(c^2 t) integral_(abs(k) = c t) f(x+y) dd(Omega(y)))\
      + 1/(c^2 t) integral_(abs(k) = c t) g(x+y) dd(Omega(y))]
  $
]

Beobachtungen:

+ $u(t,x)$ hängt nur von $f ,g$ ab an den Stellen $y in RR^3$ mit  $abs(y - x) = c t$. Das bedeutet, dass die Welle sich nur und genau mit Lichtgeschwindigkeit ausbreitet.
+ *Starkes Huygens-Prinzip*: Angenommen $f(x) = 0 = g(x) "für" abs(x)>= R$, dann $u(t,x) = 0$, wenn $abs(abs(x) - c t) >= R$. Die Welle breitet sich nur entlang der Kugelwellenfronten aus. In drei Dimensionen gilt, dass die Wellen nur auf einer Kugelschale existieren.

Für $n=1$ gibt es eine elegante Methode:

#definition[Definition][
  $
    f, g: RR^2 -> RR\
    (1/c^2 pdv(, t, 2) - pdv(, x_1, 2)) - pdv(, x_2, 2)) u(t,x_1, x_2) = 0\
    u(0, dot) = f, partial_t u(0, dot) = g\
  $
  Wir führen eine dritte Variable ein.
  $
    F(x_1, x_2, x_3) = f(x_1, x_2)\
    G(x_1, x_2, x_3) = g(x_1, x_2)\
  $
  Wir lösen die Gleichung in $RR^3$ mit Anfangsdaten $F,G$.
  $
    U(t,x_1, x_2, x_3) = u(t,x_1, x_2)\
    U = integral_(abs(y) = c t) G(x_1+y_1, x_2+y_2, x_3+y_3) dd(Omega(y))\
    = integral_(abs(y) = c t) g(x_1+y_1, x_2+y_2) dd(Omega(y))\
  $
  Wir setzen $u(t,x_1,x_2) = U(t, x_1, x_2, 0)$. Dann ist:
  $
    0 = (1/c^2 pdv(, t, 2) - pdv(, x_1, 2) - pdv(, x_2, 2)) u(t,x_1,x_2,0)\
  $
  *Explizite Formel:*
  $
    integral(abs(y) = c t, y in RR^3) g(x_1+y_1, x_2+y_2) dd(Omega(y))\
    (y_1, y_2) |-> (y_1, y_2, plus.minus sqrt(c^2 t^2 - y_1^2 - y_2^2))\
    abs((y_1, y_2)) = c t\
    "Danach:"\
    = integral_(abs(y) <= c t, y in RR^2) g(x_1+y_1, x_2+y_2) (2 c t)/sqrt(c^2 t^2 - y_1^2 - y_2^2) dd(y_1, y_2)\
  $
]

#theorem[Satz][Wellengleichung in 2D][
  Wellengleichung in $RR^2$ mit Anfangsbedingungen $f,g$:
  $
    u(t,x) = 1/(2 pi c) [pdv(, t) integral_(abs(y) <= c t) f(x+y) dd(y)/(sqrt(c^2 t^2 - abs(y)^2))\
      + integral_(abs(y) <= c t) g(x+y) dd(y)/(sqrt(c^2 t^2 - abs(y)^2))]\
  $

  + Endliche Ausbreitungsgeschwindigkeit.
  + Starkes Huygens-Prinzip gilt nicht mehr (in 2D).
]

== Wärmeleitungsgleichung in $RR^n$

#theorem[Satz][Wärmeleitungsgleichung in $RR^n$][
  $
    pdv(, t) u(t,x) - (1/c^2) sum_(j=1)^n pdv(, x_j, 2) u(t,x) = 0\
    = partial_t u(t,x) - Delta_t u(t,x) = 0\
    u(0,x) = f(x)\
  $
  Wir machen das *formal* mit Fouriertransformation:
  $
    hat(u) (t,k) = integral_(RR^n) u(t,x) e^(-i k dot x) dd(x)\
    pdv(hat(u), t) (t,k) = integral_(RR^n) pdv(u, t) e^(-i k dot x) dd(x)\
    = integral_(RR^n) (Delta_x u(t,x)) e^(-i k dot x) dd(x)\
    = integral_(RR^n) u(t,x) (-abs(k)^2) e^(-i k dot x) dd(x)\
    = -abs(k)^2 hat(u) (t,k)\
    "Anfangsbed:" hat(u) (0,k) = hat(f) (k)\
    "Lösung:" hat(u) (t,k) = hat(f) (k) e^(-abs(k)^2 t)\
  $
  Weil die Fourierfunktion sehr schnell abfällt, können wir folgern, dass die Lösung der Wärmeleitgleichung sehr glatt sein wird. Nun für die inverse Fouriertransformation:
  $
    hat(u) (t, k) = hat(K_t) (k) hat(f) (k)\
    hat(K_t) (k) = e^(-abs(k)^2 t)\
  $
  *Faltung:* $cal(F) (f * g) (k) = cal(F) f(k) cal(F) g(k)$. Faltung definiert als: $(f * g) (x) = integral_(RR^n) f(y) g(x-y) dd(y)$.
  $
    => cal(F) (caron(f) * caron(g)) = f g\
    => cal(F)^(-1) (f g) = cal(F)^(-1) f * cal(F)^(-1) g\
    "Dann im Problem:" u(t,x) = (K_t * f)(x)\
    = integral_(RR^n) K_t(x-y) f(y) dd(y)\
    "wobei:" K_t (z) = (4 pi t)^(-n/2) e^(-abs(z)^2/(4 t))\
  $
  Dabei wird $K_t$ als *Wärmeleitungskern* (Heat-Kernel) bezeichnet. Die Lösung der Wärmeleitungsgleichung ist also eine Faltung mit dem Wärmeleitungskern $K_t$. Der Wärmeleitungskern ist eine *stetige Ausbreitung eines Impulses mit Periode*.
]

#theorem[Satz][
  Sei $f: RR^n -> RR$ gleichmässig stetig. Für $t>0$:
  $
    u(t,x) = integral_(RR^n) K_t(x-y) f(y) dd(y)\
  $
  + $u in C^(infinity)crossproduct RR^n$
  + $pdv(u, t) - Delta_t u = 0$
  + $u(t,x) ->^(t -> 0) f(x)$ gleichmässig

  Bemerkung: Unendliche Ausbreitungsgeschwindigkeit weil der Wärmeleitungskern $K_t$ nicht kompakt ist. Die Wärmeleitungsgleichung hat also kein starkes Huygens-Prinzip. Das heisst auch, dass die Wärmeleutgleichung keine global-genaue beschreibung von physikalischer Wärmeleitung ist.
]

=== Beweis

Schritt 1: $u$ ist glatt.

$
  K_t(x) = (4 pi t)^(-n/2) e^(-abs(x)^2/(4 t))\
$
fällt exponentiall schnell ab für jedes $t>0$. Diese Funktionen sind integrierbar. Wir brauchen:
$
  partial_t^j partial_x^alpha K_t(x) = t^(-n/2j-abs(alpha)) dot P_(j alpha) (t,x) e^(-abs(x)^2/(4 t))\
$
Aus Induktion mit $j, alpha=0$ lässt sich herleiten:

$
  partial_t K_t(x) = (4 pi)^(-n/2) (-n/2) t^(-n/2-1) e^(-abs(x)^2/(4 t))\
  + (4 pi)^(-n/2) t^(-n/2) (-abs(x)^2/(4 t^2)) e^(-abs(x)^2/(4 t))\
  => partial_t^j partial_x^alpha K_t(x) "fällt immernoch exp. schnell ab."
$

Mit Vertauschen der Ableitungen und dem Leibniz-Integralregel folgt:
$
  pdv(u, t) (t,x) = integral_(RR^n) (pdv(, t) K_t(x-y)) f(y) dd(y)\
  pdv(u, t) (t,x) - Delta_x u(t,x)\
  = integral_(RR^n) [(pdv(, t) - Delta_x) K-T] (x-y) f(y) dd(y) = 0\
$

=== Beweis $u(t, dot) -> f$ gleichmässig

$
  epsilon > 0\
  f in C^0(RR^n) "gleichmässig"\
  u(t,x) - f(x) = integral_(RR^n) K_t(x-y) f(y) dd(y) - integral_(RR^n) K_t(x-y) (f(x)) dd(y)\
  = integral_(RR^n) K_t(x-y) (f(y) - f(x)) dd(y)\
  abs(u(t,x) - f(x)) <= integral_(RR^n) K_t(x-y) abs(f(y) - f(x)) dd(y)\
  = integral_(y in RR^n, abs(y-x) < delta) K_t(x-y) abs(f(y) - f(x)) dd(y)\
  + integral_(y in RR^n, abs(y-x) >= delta) K_t(x-y) abs(f(y) - f(x)) dd(y)\
  <= epsilon integral_(y in RR^n) K_t(x-y) dd(y) + 2 M integral_(abs(z)> delta) K_t(z) dd(z)\
  = epsilon + 2 M integral_(abs(z)> delta) K_t(z) dd(z)\
  "Zu zeigen:" lim^(t -> 0) integral_(abs(z)> delta) K_t(z) dd(z) = 0\
  = integral_(abs(z)> delta) (4 pi t)^(-n/2) e^(-abs(z)^2/(4 t)) dd(z)\
  z = sqrt(t) w\
  = (4 pi)^(-n/2) integral_(abs(w)> delta/sqrt(t)) e^(-abs(w)^2/(4)) dd(w) ->^(t->0) 0\
$

Da beide Terme zu null gehen. ist die gleichmässige Konvergenz bewiesen.



