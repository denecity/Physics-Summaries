#import "lib.typ": *
#show: frame-style(styles.boxy)

= Repititionswoche

== Räume
$
  f in L^1(RR^n)\
  => lim_(abs(k) -> 0) hat(f)(k) = 0 ": weil Riemann-Lebesgue"\
  arrow.r.double.not f in L^2(RR^n)\
  arrow.r.double.not abs(hat(f) (k)) <= abs(hat(f) (0)) forall k in RR^n\
  arrow.r.double.not lim_(abs(x) -> infinity) f(x) = 0\
$

$
  L^1(RR^n) = {(phi_i)_(i in NN), phi_i in cal(S)(RR^n): lim_(i -> infinity) norm(phi_i - phi_j)_(L^1) -> 0}\
  "mit Äquivalenzklassen."\
$
Für jede $L^1$ Funktion gibt es eine Folge von Schwartzfunktionen $phi_i in cal(S) (RR^n)$, welche gegen die Funktion konvergiert. Dann:

$
  integral_(RR^n) f(x) dd(x) = lim_(i -> infinity) integral_(RR^n) phi_i(x) dd(x)\
$

== Glattheit

$
  f(x) = cases(sin(e^(x^2024))sqrt(abs(x)) &"for" abs(x) <= 1, 0 &"for" abs(x) >1)\
  => hat(f) "beschränkt"\
  => hat(f) "stetig"\
  arrow.r.double.not hat(f) in cal(S) (RR)\
  => hat(f) in L^2(RR)
$

Falls $f in L^2 => hat(f) in L^2$. Da die Funktion beschränkt ist, muss das Integral endlich sein und daher $f in L^2$.

Falls $f in L^1 => hat(f)$ stetig und fällt gegen null ab.

== Schwartzraum

Welche Funktionen liegen im Schwartzraum?
$
  arrow.r.double.not f(x) = cases(1-x^2 &"for" abs(x) <= 1, 0 &"for" abs(x) > 1)\
  => "Fouriertransformation von" g(x) = x^1991 e^(-x^2024)\
  arrow.r.double.not "FT von" g(x) = x^2024 e^(-x^1991)\
  => "FT von jeder glatten Funktion, kompakte Träger"\
$

Fie Fouriertransformation einer Schwartzfunktion ist auch im Schwartzraum. Die Fragen die man überlegen muss: Fällt die Funktion und ihre Ableitungen schnell genug ab (schneller als jedes Polynom), und ist die Funtkion glatt? 

Exponentialfunktionen mit ungeraden Potenzen gehen ins Unendliche im Minusbereich.

Kompakter Träger heisst auch dass die Funktion (weil glatt) auch schnell genug abfällt.

== Periodische Funktionen

Sei $f:RR -> RR$ Reel, $2 pi$-periodisch und $f(-x) = f(x)$. Was gilt für die Fourierkoeffizienten?

$
  => forall f_n in RR\
  arrow.r.double.not f_n = 0 "für" n "ungerade"\
  => f_(-n) = overline(f_n)\
  => f_n = f_(-n)
$

Beweis:
$
  f_n = 1/(2 pi) integral_0^(2 pi) f(x) e^(-i n x) dd(x)\
  overline(f_n) = 1/(2 pi) integral_0^(2 pi) f(x) e^(i n x) dd(x) = f_(-n)\
  = 1/(2 pi) integral_0^(2 pi) f(-x) e^(i n (-x)) dd(x)\
  = 1/(2 pi) integral_0^(2 pi) f(x) e^(-i n x) dd(x) = f_n\
  => f_(-n) = f_n = overline(f_n)\
$

Für 2. setze $f(x) = cos(x) => f_1 = f_(-1) = 1/2 != 0$

== Gibbs Phänomen

Sei $f:RR -> RR$ $2 pi$-periodische Fortsetzung der Funktion $x in (-pi, pi], x |-> x^2/2$. Konvergiert die Fourierreihe gleichmässig gegen $f$?

*Ja*, denn die Funktion ist stetig und stückweise stetig differenzierbar. 

Wir erinnern uns: Falls $f: RR -> CC$ $L$-Periodisch und von beschränkter Variation, dann konvergieren die Partialsummen $S_N f$ für alle $x$ an den Mittelwert der Grenzwerte $f(x-0)$ und $f(x+0)$ und die Konvergenz ist gleichmässig auf jedem abgeschlossenen Intervall $[a, b]$, für welches gilt: $f$ ist stetig an jedem Punkt in $[a, b]$.

Wichtige Beispiele: stückweise $C^1$ Funktionen.

$
  f: [0, l] -> CC "stückweise" C^1\
  <=> exists : x_0 = 0 < x_1 < ... < x_n = l\
  f_0 in C^1([x_0, x_1]), ... , f_n in C^1([x_(x-1), x_n])\
$

Beschränkte Variation:

$
f: [0, l] -> CC "von beschränkter Variation"\
  <=> exists V < infinity\
  forall n in NN: 0 = x_0 < x_1 < ... < x_n = l\
  sum_(i=0)^(n-1) abs(f(x_(i+1)) - f(x_i)) <= V\
$

Gilt auch für stückweise stetig-differenzierbare Funktionen.

== Wellengleichung

$
  (1/c^2 pdv(, t,2) - Delta) u(t,x) = 0\
  u(0,x) = f(x)\
  partial_t u(0, x) = 0\
  u(t,x) = 1/(4 pi c^2) pdv(, t) (1/t integral_(y in RR^3, abs(y-x) = c t) f(y) dd(Omega(y)))
$

Die Integration passiert also nur um den Rand der Kugel. Das heisst, das Einzige, was das Resultat beeinflusst, sind Werte welche nach dem Huygens-Prinzip determiniert sind.

Hat $u$ einen kompakten Träger, dann würde die Welle nach endlicher Zeit verschwinden.



== Besselfunktionen und rotationsinvariante Funktionen

Die Besselfunktionen kommen aus der Betrachung von rotationsinvarianten Funktionen und ihren Fouriertransformationen.

$
  f: RR^n -> CC "rotationsinvariant"\
  => f(R x) = f(x), R in O(n)\
$

Nehmen wir einen Ball um $x$ mit Radius $abs(x)$, dann ist eine rotationsinvariante Funktion auf dem Ball konstant. Dann:

$
  f(x) = g(abs(x))\
  g(r) = f(r, 0, ..., 0)
  hat(f) = integral_(RR^n) e^(-i x k) g(abs(x)) dd(x)\
  = integral_0^infinity g(r) integral_(SS^(n-1)) e^(-i r omega dot k) dd(Omega(omega)) r^(n-1) dd(r)
$

Das mittlere Integral hat eine feste Funktion (Maurus):

$
  G_n (rho) = (2 pi)^(n/2) rho^(1-n/2) J_((n/2)-1)(rho)\
  J_alpha (rho) "Besselfunktion Ordnung" alpha\
  = sum_(m=0)^(infinity) ((-1)^m/(m!  dot Gamma(m+alpha+1)) (rho/2)^(2m + alpha)\ 
  J_alpha "erfüllt die Besselsche Differentialgleichung:"\
  J''_alpha (rho) + 
  1/rho J'_alpha (rho) + (1 - alpha^2/rho^2) J_alpha (rho) = 0\
$

Diese Gleichung trifft z.B. bei der Wellengleichung einer kreisförmigen Membran auf. Die Besselfunktionen sind also Lösungen der Wellengleichung in Zylinderkoordinaten.


== Hilbertraum

Sei $V$ Hilbertraum (vollständig, Skalarprodukt, normiert).\

Sei $(phi_n)_(n in NN), phi_n in V$ orthogonal.

$
  => "Falls" sum_(n=1)^(infinity) norm(phi_n) < infinity\
  "dann konvergiert Reihe" sum_(n=1)^(infinity) phi_n "in" V\
  => "Falls" sum_(n=1)^(infinity) norm(phi_n)^2 < infinity\
  "dann konvergiert Reihe" sum_(n=1)^(infinity) phi_n "in" V\
  arrow.r.double.not "Falls" sum_(n=1)^(infinity) norm(phi_n)^3\
  "dann konvergiert Reihe" sum_(n=1)^(infinity) phi_n "in" V\
  arrow.r.double.not "Ist" (phi_n)_(n in NN) "orthonormal"\
  "dann konvergiert" phi_n - phi_(n+1) "wenn" n -> infinity\
$

 

== Hermitefunktionen

Sei $psi_n in cal(S) (RR)$ orthonormierten Hermitefuntkionen. Sei $(f, g) = integral_(-infinity)^(infinity) f(x) g(x) dd(x)$

$
  => "ist" f in L^2(RR) => sum_n abs((f, psi_n))^2 < infinity\
  arrow.r.double.not "ist" f in L^2 (RR) => sum_n abs((f, psi_n)) < infinity\
  arrow.r.double.not "ist" f in cal(S) (RR) => exists k "s.d." (f, psi_n) = 0 "für" n >= k
 $

 Im allgemeinen für Hilberträume  $H = L^2 (RR)$, dann $norm(f)^2 = sum abs((f, psi_n))^2$



== Distributionen

Welche der folgenden Abbildungen $phi |-> <omega, phi>, phi in cal(S) (RR^n) $ definiert eine temperierte Distrubution?

$
  arrow.r.double.not <omega, phi> = abs(phi(0))\
  => <omega, phi> = sum_(k=0)^(infinity) k^(-2) phi(k)\
  => <omega, phi> = sum_(k=0)^(infinity) k^(2) phi(k)\
  arrow.r.double.not <omega, phi> = integral_(-infinity)^(infinity) e^x phi(x) dd(x)\
  arrow.r.double.not <omega, phi> = lim_(epsilon -> 0) integral_(abs(x) > epsilon) abs(x)^(-1) phi(x) dd(x)\
$

+ Die erste ist keine temperierte Distribution, weil sie *nicht linear* ist.\

+ Die zweite ist eine temperierte Distribution, weil sie linear ist. Dann kann man den Output durch eine Schwartznorm abschätzen: $<= sum_(k=1)^infinity k^(-2) sup_(x in RR) abs(phi(x))$. Diese Summe konvergiert zu $pi^2/6 norm(phi)_0$. Also auch stetig.

+ Dieses Argument funktioniert hier nicht. Es ist trotzdem eine temperierte Distribution. Abschätzung: $ <= (norm(phi)_4)/(1+abs(k))^4$ (4 arbiträr) konvergiert.

+ Die vierte ist keine temperierte Distribution. Man nimmt $phi(x) = e^((-1/2)(x^2+1)^(1/2)))$. Dann konvergiert das Integral nicht.

+ Die fünfte ist keine temperierte Distribution, weil das Integral von $1/x$ divergiert.


== Fouriertransformation von Delta

Was ist die Fouriertransformation von $delta' in cal(S)' (RR^n)$

$
  arrow.r.double.not 1\
  arrow.r.double.not k\
  arrow.r.double.not 0\
  => i k\
$

== Fundamentallösung

Welche der folgenden Funktionen sind Fundamentallösungen von $dv(,x)$?

$
  => Theta(x) "(Heaviside Function"\
  => Theta(x) - 1
  => -Theta(-x)
  arrow.r.double.not 1 -Theta(x)
$

In diesem fall suchen wir alle funktionen für die gilt: $dv(, x) E = delta$.

$
  dv(,x) (Theta + c) = delta\
  dv(,x) (1 - Theta) = -delta\
$


