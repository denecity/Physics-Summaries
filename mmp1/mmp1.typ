#import "@preview/physica:0.9.3": *
#import "@preview/frame-it:1.1.2": *
#import "@preview/big-todo:0.2.0": *

#let title_name = "Mathematische Methoden der Physik I"
#let author_name = "Denis Titov"

#set text(lang: "GER")

#set page(
  paper: "a4",
  header: [#author_name 
  #h(1fr)
  #title_name
  ],
  numbering: "1",
  columns:2,
)

#set par(justify: true)
#set heading(numbering: "1.1")
#set text(size: 8pt)
#show math.equation: set text(size: 9pt)



#let abstract(content) = {
  align(center)[
    #box(width: 80%)[
      #align(center)[
        #par(justify: false)[
          #content
        ]]]]}

#let title(content) = {
  align(center, text(17pt)[
  *#content*
])
}

#let author(content) = {
  align(center, text(12pt)[
  #content
])
}

#let (theorem, lemma, definition, corollary, example, remark, warning, proof) = frames(
  theorem: ("Satz", rgb("#EB8F8F")),            // softened ruby — important but readable
  lemma: ("Lemma", rgb("#F2B675")),          // soft amber-orange
  definition: ("Definition", rgb("#7EB6EF")),// lighter blue with good contrast
  corollary: ("Corollary", rgb("#C3A3EC")),  // muted lilac
  example: ("Example", rgb("#AAB5C2")),      // dusty steel blue
  remark: ("Remark", rgb("#E1E1E1")),        // very soft gray
  warning: ("Warning", rgb("#F4A8A8")),
  proof: ("Beweis", rgb("#AAB5C2")),      // mild coral-pink
)
#show: frame-style(styles.boxy)


#place(
  top + center,
  float: true,
  scope: "parent",
  clearance: 2em,
)[
  #title[#title_name]
  #author[#author_name]
  #abstract[Diese Vorlesung behandelt fortgeschrittene mathematische Methoden, die in der theoretischen Physik Anwendung finden. Schwerpunkte umfassen Maßtheorie, Fouriertransformationen und ihre Anwendungen in physikalischen Problemen.]
  #v(18pt)
]

#outline(depth: 2)

#pagebreak()

= Quickmath

== Eigenschaften

Die Eigenschaften einer Funktion die uns interessieren sind:

+ Stetigkeit
+ Integrierbarkeit $L^1$
+ Integrierbarkeit $L^2$
+ Glattheit $C^infinity$
+ Periodizität
+ Stetige Differenzierbarkeit $C^k$
+ Schwartzraum
+ Hilbertraum
+ Regularität
+ Konvergenz
+ Kompakter Träger
+ Beschränktheit
+ Beschränkte Variation
+ Rotationsinvarianz
+ Distribution
+ Harmonisch
+ Temperierte Distribution
+ Fundamentallösung
+ Greenfunktion



Diese Eigenschaften geben Ausschluss über die Form und Struktur der Fouriertransformation und Fourierreihen und vice versa. Die wichtigsten Implikationen und Zusammenhänge sind:


== Fourierreihen

- *Riemann-Lebesgue-Lemma*
  $f$ stetig, periodisch $=> f_n -> 0$ (Fourierkoeffizienten fallen gegen $0$)

- *Punktweise Konvergenz*
  $f$ stetig, periodisch $=>$ Fourierreihe konvergiert punktweise

- *Gleichmäßige Konvergenz (Dirichlet-Jordan)*
  $f$ stetig, periodisch, beschränkte Variation $=>$ Fourierreihe konvergiert gleichmäßig (Dirichlet-Jordan)

- *Stückweise $C^1$-Funktionen*
  $f$ stückweise $C^1$ $=>$ Fourierreihe konvergiert gleichmäßig auf Intervallen, wo $f$ stetig ist

- *Beschränkte Variation*
  $f$ beschränkte Variation $=>$ Fourierreihe konvergiert punktweise überall

- *Existenz der Fourierreihe*
  $f$ periodisch $=>$ Fourierreihe existiert (im Sinne von Distributionen)

== Fouriertransformation

- *Existenz der Fouriertransformation*
  $f in L^1$ $=>$ Fouriertransformation $hat(f)$ existiert, stetig und fällt gegen $0$

- *Fouriertransformation in $L^2$ (Plancherel)*
  $f in L^2 => hat(f) in L^2$, Plancherel-Formel gilt, Fouriertransformation unitär
  Plancherel-Formel: $norm(hat(f))^2 = norm(f)^2$


- *Abschätzung der Fourierkoeffizienten bei $C^k$*
  $f in C^k => |f_n| <= C/(abs(n)^k)$ (Fourierkoeffizienten fallen schnell ab)

- *Abschätzung der Fouriertransformation bei glatten Funktionen und kompaktem Träger*
  $f$ kompakter Träger, $C^k => hat(f)$ fällt schneller ab als jedes Polynom

- *Schwartzraum*
  $f$ Schwartzfunktion $=> hat(f)$ Schwartzfunktion (Fouriertransformation ist Automorphismus auf Schwartzraum)

- *Rotationsinvarianz*
  $f$ rotationsinvariant $=>$ Fouriertransformation ist auch rotationsinvariant


== Distributionen

- *Distributionen*
  $f$ Distribution $=>$ Fouriertransformation als Distribution definiert

- *Temperierte Distributionen*
  $f$ temperierte Distribution $=>$ Fouriertransformation wohldefiniert im Raum der temperierten Distributionen

- *Analytische Fortsetzbarkeit*
  $f$ kompakter Träger $=> hat(f)$ analytisch fortsetzbar

- *Harmonische Funktionen*
  $f$ harmonisch $=> f$ ist glatt (unendlich oft differenzierbar)

- *Ableitungen und Multiplikation*
  $f$ Distribution mit kompaktem Träger $=> hat(f)$ analytisch $=>$ Ableitungen und Multiplikation mit glatten Funktionen wohldefiniert

- *Fouriertransformation und Ableitung*
  $f$ Distribution $=>$ Ableitungen und Multiplikation mit glatten Funktionen wohldefiniert
  $\hat{f}'(k) = i k \hat{f}(k)$

- *Unschärferelation*
  $f$ und $hat(f)$ können nicht beide kompakten Träger haben (Paley-Wiener, Unschärferelation).

- *Dualität der Fouriertransformation*
  $f$ und $hat(f)$ sind dual zueinander, d.h. die Fouriertransformation ist eine bijektive Abbildung zwischen den Räumen der Funktionen und ihren Fouriertransformationen.




*Zusammenfassend*: Je regulärer und "besser" das Verhalten einer Funktion (z.B. Glattheit, schnelles Abfallen, kompakter Träger), desto besser das Verhalten ihrer Fouriertransformation (z.B. Glattheit, schnelles Abfallen, Regularität) und umgekehrt. Die Fouriertransformation bildet insbesondere den Schwartzraum auf sich selbst ab und ist unitär auf $L^2$.










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






















= Maßtheorie

Die Maßtheorie bildet ein fundamentales Werkzeug der Analysis und liefert die mathematische Grundlage für die Integration komplexer Funktionen. Im Rahmen der Physik ermöglicht sie die präzise Beschreibung von Wahrscheinlichkeitsverteilungen, Energiedichten und anderen messbaren Größen.

== Algebra von Mengen

#definition[Definition][Algebra von Mengen][
  Eine Algebra ist eine Menge von Mengen $cal(A)$ definiert auf einer urspünglichen Menge $X$, welche die folgenden Eigenschaften erfüllt:
  + $X in cal(A)$
  + $A, B in cal(A) => A union B in cal(A)$
  + $A, B in cal(A) => A inter B in cal(A)$
  + $A in cal(A) => A^C in cal(A)$
]

Im Kern lässt uns eine Algebra von Mengen grundlegende Operationen ausführen ohne die Menge zu verlassen.

== $sigma$-Algebra

#definition[Definition][$sigma$-Algebra][
  Sei $cal(F)$ eine $sigma$-Algebra auf der Menge $X$. $cal(F)$ enthält Teilmengen von $X$, wobei folgendes erfüllt sein muss:
  + $X in cal(F)$: Der gesamte Raum kann als messbare Menge betrachtet werden.
  + $A in cal(F) => A^C in cal(F)$: Wenn eine Menge messbar ist, ist auch ihr Komplement messbar.
  + $union_(n=1)^(infinity) A_n in cal(F)$: Eine $sigma$-Algebra ist auch unter abzählbar unendlichen Vereinigungen geschlossen.
  + $inter_(n=1)^(infinity) A_n in cal(F)$: Abgeleitet aus den De Morgan'schen Gesetzen.
]

Eine $sigma$-Algebra ist eine Menge von Mengen, welche uns erlaubt, eine robustere Definition von Integration einzuführen. Messbarkeit verlangt eine $sigma$-Algebra-Struktur, um Mengen eine Größe zuzuweisen.

#remark[
  Funktionen, welche auf einem Maßraum definiert sind, sind nur dann messbar, falls ihre Urbilder aus Borel-Mengen zu einer $sigma$-Algebra zugewiesen werden können.
]

== Borel $sigma$-Algebra

#definition[Definition][Borel $sigma$-Algebra][
  Die Borel $sigma$-Algebra $cal(B)(X)$ ist die kleinste $sigma$-Algebra, welche alle offenen Mengen von dem topologischen Raum $X$ (meist $RR$) enthält.
]

Sie lässt sich bilden aus:
+ Bilde alle offenen Mengen in $X$.
+ Füge alle abzählbaren Vereinigungen der offenen Mengen hinzu.
+ Füge alle abzählbaren Schnitte hinzu.
+ Füge alle Komplemente hinzu.
+ Wiederhole bis keine neuen Mengen gebildet werden können.

#theorem[Satz][
  Damit die Fouriertransformation angewendet werden kann, muss die Funktion messbar sein. Das Lebesgue-Maß erweitert die Borel $sigma$-Algebra um weitere Mengen (aber nicht alle Teilmengen von $RR$).
]

== Borel-Urbilder und Messbarkeit

#lemma[Lemma][Messbarkeit von Funktionen][
  Die Messbarkeit von Funktionen ist entscheidend für ihre Integration und damit für die Anwendung vieler physikalischer Konzepte:
  + Die *Fourier-Transformierte* $hat(f)(k) = integral_RR f(x) e^(-2 pi i k x) dd(x)$
  + Damit das Integral existiert, muss $f$ messbar sein.
  + Messbarkeit von $f$ bedeutet, dass die Mengen von $X$, für die $f(x)$ in eine beliebige *Borel-Menge* fällt, in der *$sigma$-Algebra* enthalten sein müssen.
]

=== Beispiel zur Messbarkeit

#example[
  Um die Messbarkeit von Funktionen zu veranschaulichen:
  + Sei $f: RR -> RR$ überall definiert.
  + Sei Borel-Menge $B = (-1, 1) subset RR$
  + Damit $f$ messbar ist, muss:
  $
  f^(-1)(B) = {x in RR | f(x) in (-1, 1)}
  $
  in der $sigma$-Algebra von $RR$ liegen.
]

#corollary[
  Die Maßtheorie bildet somit die Grundlage für die mathematisch rigorose Behandlung von Integralen und ist damit unverzichtbar für viele Anwendungen in der Physik, insbesondere für die im Folgenden behandelten Fouriermethoden.
]












= Fourierreihen

Saite:
$
pdv(u(t,x),t,2) = pdv(u(t,x),x,2)\
u(t,0) = u(t,pi) = 0\
u(t,x) = sin(k x) (a cos(k t) + b sin(k t))\
k = 1, 2, 3
$
Ist die allgemeine Lösung der Wellengleichung $=>$ Superpositionsprinzip

== Die Fourierreihe

Periode L>0. Ist eine Funktion $f(x), e in RR$ mit

$
f(x) = sum_(n=-infinity)^(infinity) f_n e^((2 pi i n x)/L), f_n in CC\
f(x+L) = f(x) forall x
$
Die Fourierreihe ist automatisch eine periodische Funktion. 


== Welche $f$ kann man so als Fourierreihe darstellen?

$
f(x) = f_0 + (f_1 e^((2 pi i n x) / L) + ...)
$
Dabei it $f_0$ konstant und der rest Sinuswellen. Das heisst bei Integration über gesamte Periode gehen alle Sinuswellen zu Null und nur $f_0$ bleibt übrig:
$
1/L integral_0^L e^((2 pi i n x)/L) dd(x) = cases(1 "if" n=0, 0 "if" n != 0) 
$

#theorem[Satz][
  Seien $f_n in CC$ so, dass $sum_(n=-infinity)^(infinity) abs(f_n) < infinity$, dann:
  + Die Fourierreihe $f(x) = sum_(n in ZZ) f_n e^((2 pi i x)/L)$ konvergiert absolut (weil exponential immer 1 und absolut von $f_n$ beschränkt) und gleichmässig gegen eine L-periodische, stetige Funktion.
  + Umgekehrt gilt:
    $
    f_n = 1/l integral_0^L f(x) e^(-(2 pi i n x)/L) dd(x)
    $
]

*Beweis gleichmässige Konvergenz:*
$
f_N(x) = sum_(n=-N)^N f_n e^((2 pi i n x)/L)\
sup_(x in RR)(abs(f(x) - f_N(x))) = sup_(x in RR)abs(sum_(abs(n)>N) f_n e^((2 pi i n x)/L))\
<= sup_(x in RR) sum_(abs(n)>N) abs(f_n e^((2 pi i n x)/L)) <= sum_(abs(n)>N) abs(f_n) -> 0, N -> infinity
$

*Beweis Fourierkoeffizient:*

Bei gleichmässiger Konvergenz kann man Grenzwerte und Integration vertauschen:
$
1/L integral_0^L f(x) e^(-(2 pi i n x)/L) dd(x)\
= sum_(n in ZZ) 1/L integral_0^L f_n e^((2 pi i n x)/L) e^(-(2 pi i n x)/L) dd(x)\
= sum_(n in ZZ) 1/L f_n integral_0^L e^(-(2 pi i (n-m) x)/L) dd(x) = f_m\
$
weil sich das integral für $n!=m$ auscancelt.

*Beispiel:*

$
f(x) = sum_(n in ZZ) 2^(-abs(n)) e^(i n x), x in RR\
f_n = 2^(-abs(n)\
sum_(n in ZZ) 2^(-abs(n)) = 3 < infinity
$

*Gegenbeispiel:*

Sägezahnfunktion:
$
f(x) = 1/2 - x (x <= x <= 1), "1-Periodisch"
$
Wenn $f = sum f_n e^((2 pi i n x)/L)$ und 
$
f_n = integral_0^1 e^(2 pi i n x) dd(x) = cases(0 "if" n=0, 1/(2 pi i n) "if" n != 0)
$
Die Koeffizienten fallen ab aber die Summe konvergiert nicht.

#theorem[Satz][Riemann-Lebesgue-Lemma][
   sei $f: RR -> CC$ L-Periodisch, Stetig
   $
   f_n = 1/L integral_0^L f(x) e^(-(2 pi i n x)/L) dd(X)
   $
   Dann gilt $abs(f_n) ->^(n-> infinity) 0$
]
Das liegt daran, dass wenn man die Funktion mit einer sehr schnell oszillierenden Funktion multipliziert, werden benachbarte punkte von einander subtrahiert (schnelle sozillation). Da die ursprüngliche Funktion stetig ist werden sehr ähnliche Werte subtrahiert:

*Beweis:*

$
forall a in RR:\
f_n = 1/L integral_a^(a+l) f(x) e^(-(2 pi i n x)/L) dd(x)
$
Die integrierte Funktion ist L-Periodisch. Daher kommt, egal was $a$ ist, das gleiche Ergebnis raus.
$
x = y + a => 1/L integral_0^L f(y+a) e^(-(2 pi i n y)/L) e^(-(2 pi i n a)/L) dd(y)\
$
zweiter exponentialterm ist eine phasenverschiebung bei
$
a = L/(2n)\
e^(-(2 pi i n a)/L) = -1\
=> f_n = - 1/L integral_0^L f(x + L/(2n)) e^(-(2 pi i n x)/L) dd(x)\
$
Nun haben wir zwei Ausdrücke für $f_n$. Damit diese gleich sind müssen sie sehr klein sein weil $f(x) - f(x + L/(2n)) approx 0$:
$
f_n = 1/2(f_n + f_n) = 1/(2 L) integral_0^L (f(x) -f(x + L/(2n)) e^(-(2 pi i n x)/L)) dd(x)\
$
$f$ ist stetig auf $[-L, 2L]$ (beschränkt, abgeschlossen) $=>$ gleichmässig stetig.\
Sei $epsilon >0 exists N in NN$ sodass $x in [0,L] => abs(f(x)-f(x + L/(2n))) < epsilon forall abs(n) >= N$.\
Also gilt für $abs(n) >= N$:
$
abs(f_n) <= 1/(2L) integral_0^1 epsilon dd(x) = epsilon/2
$
*Wenn n gross genug ist, ist der Fourierkoeffizient beliebig klein. Für stetige Funktionen fallen die Fourierkoeffizienten ab.*

#theorem[Satz][
  $f: RR -> CC$ L-Periodisch und $f in C^k(RR)$ also $f$ ist k-mal stetig differenzierbar. Dann gilt:
  $
  abs(n)^k abs(f_n) ->^(abs(n) -> infinity) 0\
  abs(f_n) <= C/(abs(n)^k)
  $
  Für glatte Funktionen fallen die Koeffizienten exponentiell ab.
]

*Beweis:*

Für $n != 0$:
$
e^(-(2 pi i n x)/L) = (-L/(2 pi i n))^k dv(, x, k) (e^(-(2 pi i n x)/L))\
=> f_n = 1/L (-L/(2 pi i n))^k integral_0^L f(x) dv(,x,k) (e^(-(2 pi i n x)/L)) dd(x)\
"Integration" = 1/L (1/(2 pi i n))^k integral_0^L f(x) (e^(-(2 pi i n x)/L)) dd(x)\
$
Die Randterme verschwinden, da $f$ und der Rest L-Periodisch sind.
$
= L^k/(2 pi i)^k 1/(n^k) (f^((k)))_n cases("n-the fourierkoeffizient", "von" f^((k)) "d.h. stetig")\
=> abs(n^k f_n) -> 0
$

#theorem[Satz][Umgekehrt][
  Wenn $abs(f_n) <= c/(abs(n)^(k+2)) forall n in ZZ$, dann ist $f(x) = sum f_n e^(-(2 pi i n x)/L)$ periodisch und $f in C^k(RR)$
]

== Wiederherstellung der Funktion

L-Periodische Funktion $f: RR -> CC$, Fourierkoeffizienten $f_n$. Kann man $f$ aus $f_n$ wiederherstellen?

Vielleicht:
$
f(x) = sum f_n e^((2 pi i n x)/L)
$
In vielen fällen funktioniert das aber nicht. Wir betrachten die *Partialsummen* um das zu überprüfen.

$
(S_N f)(x) = sum_(-N)^N f_n e^((2 pi i n x)/L)\
= sum_(-N)^N (1/L integral_0^L f(y) e^(-(2 pi i n y)/L) dd(y)) e^((2 pi i n x)/L)\
= 1/L integral_0^l f(y) sum_(-N)^N e^((2 pi i n (x-y)/L) dd(y)\
= 1/L integral_0^L f(y) D_N ((x-y)/L) dd(y)\
$
wobei 
$
D_N(t) = sum_(-N)^N e^(2 pi i n t)
$
*Dirichlet-Kern*. Sie sieht für hohe N wie eine Kastenfunktion aus. Wir integrieren also nur einen betrag wenn x und y nahe an einander sind.

$
(S_N f)(x) = 1/L integral_0^L f(y) D_N (x-y)/L dd(y)
$

== Eigenschaften vom Dirichletkern

#theorem[Satz][Eigenschaften vom Dirichletkern][
  $
  D_N(t) = D_N(t+1)\
  integral_0^1 D_N(t) dd(t) = 1\
  D_N(t) = cases(sin(pi(2N+1)t)/sin(pi t) "for" t in RR\\ZZ, 2N+1 "for" t in ZZ)
  $
]
*Beweis Integral:*
$
integral_0^1 D_N(t) dd(t) = 0"-ter Fourierkoeffizient"\
"Koeff von" D_N = 1
$
*Beweis Cases:*
$
D_N(t) = sum _(n=0)^(2N) e^(2 pi i (n-N)t) = e^(-2 pi i N t) sum e^(2 pi i t)^n\
= e^(-2 pi i N t) (e^(2 pi i t(2N+1))-1)/(e^(2 pi i t)-1)\
= (e^(2 pi i (N + 1/2) t) - e^(-2 pi i (N + 1/2) t))/(e^(pi i t) - e^(-pi i t)) = (2 i sin(2 pi (N + 1/2) t))/(2 pi sin(pi t))
$

#theorem[Satz][
  $
  f in C^1(RR) "L-Periodisch"\
  f_n = 1/L integral_0^1 f(x) e^(-(2 pi i n x)/L) dd(x)\
  => forall x in RR: f(x) = lim_(N -> infinity) (S_N f)(x) = lim_(N->infinity) sum_(n=-N)^N f_n e^((2 pi i n x)/L)
  $
  Also kann man jede einfach differenzierbare Funktion als Fourierreihe schreiben.
]

*Beweis:*

Wir gucken uns die Differenz an und hoffen wir finden ne Abschätzung $-> 0$.
$
(S_N f)(s) - f(x) = 1/L integral_0^L f(y) D_N (x-y)/L dd(y) -f(x)\
"Benutze:" 1/L integral_0^1 D_N (x-y)/L dd(y) approx 1\
= 1/L integral_0^L (f(y) - f(x)) D_N (x-y)/L dd(y)\
= 1/L integral_0^L (f(y)-f(x))/sin(pi (x-y)/L) sin(pi (2 N + 1)) (x-y)/L dd(y)\
F_x(y) = (f(y)-f(x))/sin(pi (x-y)/L)\
$
Dieser Grenzwert existiert und ist endlich. Dann ist $F_x:RR -> CC$ stetig (LHopital) und 2L-Periodisch.
$
(S_N f)(x) - f(x) = 1/L integral_0^L F_x(y) sin(pi (2 N + 1) (x-y)/L) dd(y)\
= 1/(2L) integral_0^(2L) F_x(y) sin(pi (2 N + 1) (x-y)/L) dd(y)\
...
$

*Interessante Funktionen:*

$
f(x) = 1/2 - x, 0 <= x <= 1
$
Der Satz kann nicht angewendet werden. Also obwohl wir die Fourierkoeffizienten ausrechnen können, wissen wir nicht ob die Fourierfunktion gegen diese Funktion konvergiert.

#lemma[Lemma][Beschränkte Variation][
  $f:[0,L]-> CC$ ist von beschränkter Variation, falls $forall V < infinity$ sodass $forall n in NN: 0 = x_0 < x_1 < x_n = L$ (Unterteilungen), die Sprünge der Funktion summiert kleiner als V:
  $
  sum_(i=0)^(n-1) abs(f(x_(i+1)) - f(x_i)) <= V
  $
]

*Beispiele:*

+ Jede differenzierbare Funktion ist von beschränkter Variation: $V=integral_0^L abs(f'(x)) dd(x)$
+ Jede stückweise stetig-differenzierbare Funktion, da die Stücke einzeln von beschränkter Variation sind.

#theorem[Satz][Dirichlet-Jordan Kriterium][
  Sei $f:RR -> CC$ L-Periodisch, von beschränkter Variation auf $[0,L]$.\
  Sei $(S_N f)(x) = sum_(n=-N)^(N) f_n e^((2 pi i n x)/L)$.\
  Dann:
  + $lim_(N->infinity) (S_N f)(x) = 1/2 (f(x-0) + f(x+0))$
    Wert am Grenzwert ist Durchschnitt von den Grenzwerten.
  + Ist $f$ an jedem Punkt eines abgeschlossenen Intervalls $I$ stetig, so gilt $(S_N f)(x)$ konvergiert gleichmässig zu $f(x)$ auf $I$
]

*Beispiel:* Sägezahnfunktion

$
f(x) = 1/2 - x, 0 <= x < 1, "L-Periodisch"\
(S_N f)(x) = cases(1/2-x "for" 0 < x < 1, 0 "for" x=0\, 1)\
$

Die Partialsummen sind glatt und können also die Sägezahnfuntion nicht richtig abbilden. Sie konvergieren also nicht gleichmässig., denn der Grenzwert von stetigen Funktionen kann nicht unstetig sein.

== Gibbs Phänomen

#theorem[Satz][Gibbs Phänomen][
  Konvergenz nahe einer Sprungstelle ist nicht gleichmässig. Das Gibbs Phänomen beschreibt wie sehr die Sprungstelle $x_0$ sich von der Partialsumme unterscheidet.
  $
  f(x_0 plus.minus 0) = c plus.minus h
  $
  $c$ ist dabei der durchschnitt der beiden Seiten und h die entfernung zu den beidseitigen Grenzwerden. So erreicht $(S_N f)$ nahe $x_0$ die werte $c plus.minus 1.18 h$ (*für alle Fälle*). D.h. die Sprunghöhe von Partialsummen ist $approx 2 dot 1.18 h$.
]

==== Beweis

Sei Sägezahnfunktion. 
$
f_n = cases(1/(2 pi i n)/2\,n != 0, 0\, n=0)\
g_N(x)=(S_N f)(x) - f(x) \
= sum_(n=-N; n != 0)^N = 1/(2 pi i n) e^(2 pi i n x) - (1/2 - x), 0 <= x < 1\
$
Maximum von $g_N(x)$ für kleine $x>0$.
$
g'_N(x) = sum e^(2 pi i n x) + 1 = sum_(-N)^N e^(2 pi i n x)\
= D_N(x) = sin(pi(2N+1)x)/sin(pi x)\
$

Erste positive Nullstelle von $D_N(x)$:
$
x_0 = 1/(2N + 1)
$

D.h. das maximum wir immer näher an die Sprungstelle der Funktion gehen.

$
g_N(x_0) = g_N(0+) + integral_0^x_0 g_N'(x) dd(x)\
= (0-1/2) + integral_0^(1/(2N+1)) sin(pi(2N+1)x)/sin(pi x) dd(x)\
x = y/(2N+1)\
= -1/2 + integral_0^1 sin(pi y)/sin((pi y)/(2N+1)) 1/(2N+1) dd(y)\
= -1/2 + integral_0^1 sin(pi y)/(pi y) ((pi y)/(2N+1))/sin((pi y)/(2N+1)) dd(y) \
$
Der zweite Faktor geht zu 1 weil für kleine Zahlen $x/sin(x) approx x/x = 1$.
$
= -1/2 integral_0^1 sin(pi y)/(pi y) dd(y) approx 0.0895
$
Daher die 9% $=>$ 18% beidseitig. Also erreicht die Partialsumme für $N -> infinity$ den Wert $(S_N f)(x_0) = f(x_0) + 0.0895 = 0.5 + 0.0895$. Der Sprung ist also $1 + 2 dot 0.0895 approx 1.18$.

==  Satz von Fejer

#theorem[Satz][Satz von Fejer][
  Sei $f in C^0(RR)$, L-Periodisch.
  $
  (sigma_N f)(x) = 1/N sum_(n=0)^(N-1) (S_N f)(x)\
  = 1/N sum_(n=0)^(N-1) sum_(m = -n)^(n) f_m e^((2 pi i n x)/L)
  $
  Dann konvergiert $sigma_N f(x) -> f(x)$ gleichmässig.

  *Korollar:*
  Sei $f in c^0(RR)$, L-Periodisch. Dann gibt es ein *trigonometrisches Polynom* 
  $
  g(x) = "endliche Fourierreihe" \
  "(Linearkombination von endlich vielen" e^((2 pi i n x)/L)")"
  $
  sodass $abs(f(x) - g(x)) < epsilon forall x in RR$. Das bedeutet, dass man eine beliebige stetige Funktion gleichmässig durch trigonometrische Funktion approximieren können.
]

==== Beweis

Für grosse $N$ gilt $abs(f(x) - (sigma_N f)(x)) < epsilon forall x in RR$. Setzen wir $g = sigma_N f$.

== Fourierreihen von reelwertigen Funktionen

$f:RR -> RR$, L-Periodisch.
$
macron(f_n) = 1/L integral_0^L f(x) e^(-(2 pi i n x)/L) dd(x)\
=> f_n = f_(-n)\
=> sum_(n in ZZ) f_n e^((2 pi n x)/L) "reel"
$

So kann man an den Fourierkoeffizienten ablesen ob eine Funktion reelwertig ist. Dann kann man die Funktion anstatt mit Exponentialen mit trigonometrischen Funktionen ausdrücken.

$
f_n = 1/2 (a_n - i b_n), a_n, b_n in RR\
f_(-n) = 1/2 (a_n + i b_n)\
f(x) = 1/2 a_0 + sum_(n=1)^(infinity) 1/2 (a_n - i b_n)(cos((s pi n x)/L) + i sin((2 pi n x)/L))\
+ sum_(n=1)^(infinity) 1/2 (a_n - i b_n)(cos((s pi n x)/L) - i sin((2 pi n x)/L))\
= 1/2 a_0 + sum_(n=1)^(infinity) a_n cos((2 pi n x)/L) + b_n sin((2 pi n x)/L) = f(x)\
a_n = f_n + f_(-n) = 2/L integral_0^L f(x) cos((2 pi n x)/L) dd(x)\
b_n = 2/L integral_0^L f(x) sin((2 pi n x)/L) dd(x)
$

=== Konvergenzen und Implikationen review
 
$
abs(f_n) <= c/(1+abs(n))^(k+2) => f in C^k\
f in C^k => abs(f_n) <= c/(1+abs(n))^k
$

== Poissonsche Summenformel

#theorem[Satz][
  Sei $f:RR -> CC exists c$ sodass
  $
  abs(f(x)), abs(f^(x)) <= c/(1 + abs(x)^2) forall x in RR
  $

  Sei
  
  $
  hat(f)(k) = integral_(-infinity)^(infinity) f(x) e^(i x k) dd(x)\
  => sum_(n in ZZ) f/(n L) = sum_(n in ZZ) 1/L hat(f)((2 pi n)/L)
  $
]

=== Beispiel

$
f(x) = e^(-abs(x))\
=> sum_(n=-infinity)^(infinity) 1/(1+n^2) = pi (e^(2 pi) + 1)/(e^(2 pi) -1)
$

#lemma[Lemma][
  $
  g(x) = sum_(n in ZZ) f(x + n L)\
  $
  Dann ist g stetig differenzierbar und L-Periodisch.
]

=== Beweis

Zeige gleichmässige Konvergenz der Reihe für z.B. $x in [0, L]$. Für die Summe über $n in ZZ, abs(n)> N$:
$
sum_(n in ZZ, abs(n)>N) abs(f(x + n L)) <= sum_(abs(N) > N) c/(1+abs(x + n L)^2)\
abs(x + n L ) >= (abs(n)-1) <= sum_(j >=N) c/(1 + (j L)^2)\
<= (2 c)/L^2 sum_(j=N)^(infinity) 1/j^2 ->^(N->infinity) 0\
$

Gleichmässige Konvergenz von: $sum_(n in ZZ) f'(x + n L)$ erfüllt die gleiche Abschätzung.

Wenn man eine Folge von funktionen haben, welche gleichmässig gegen eine Grenzfunktion U konvergieren und die Ableitungen gegen $V$, dann ist $U$ stetig differentierbar. Auch $U'_n -> V$. Die Summe der $f$'s selbst ($f$) ist dann selber stettig differentierbar.

Wir wissen also:
$
g(x) = sum_(n in ZZ) g_n e^((2 pi i n x)/L)\
g_n = 1/L integral_0^L g(x) e^(-(2 pi i n)/L) dd(x)\
= sum_(k in ZZ) 1/L integral_0^1 f(x + k L ) e^(-(2 pi i n x)/L) dd(x)\
y = x + k L\
= sum_(k in ZZ) 1/L integral_(k L)^((k +1) L) f(y) e^(-(2 pi i n y)/L) dd(y)\
= 1/L integral_(-infinity)^(infinity) f(y) e^(-(2 pi i n y)/L) dd(y)\
=1/L hat(f)((2 pi n)/L)
=> g_n = 1/L hat(f)((2 pi n)/L)\
"Schlussfolgerung:"\
sum_(n in ZZ) f(x + n l) = g(x) = sum g_n e^((2 pi i n x)/L) = sum_(n in ZZ) 1/L hat(f)((2 pi n)/L) e^((2 pi i n x)/L)
$

Der Beweis folgt aus $x=0$.

== Wärmeleitung auf Ring

Ring parametrisiert mit $x in RR\/L ZZ$, Umfang $L$. Temperatur $u(t,x), t>= 0, x in RR \/ L ZZ$ also $u(t,x)$ L-Periodisch in $x in RR$.

== Wärmeleitungsgleichung (WLG)

$
pdv(u,t)(t, x) = D pdv(u, x, 2)(t,x)\
D > 0 "Konstante Temperaturleitfähigkeit"
$

$x,t$ reskalieren: $L=2 pi, D = 1$

Anfangsbedingung: $u(0,x) = f(x)$

$
"Zu lösen:" cases(pdv(u,t)(t, x) = D pdv(u, x, 2)(t,x)\, t>= 0, u(0,x) = f(x), x in RR \/ 2 pi ZZ)
$

#theorem[Satz][
  Sei $f in C^2(RR\/2 pi ZZ)$. Dann hat das AWP (Anfangswertproblem) eine eindeutige Lösung $u(t,x)$:
  + $u in C^0([0, infinity) crossproduct RR\/ 2 pi ZZ) inter C^(infinity)((0, infinity) crossproduct RR\/ 2 pi ZZ)$. Das heisst $u(x,t)$ ist am Anfang stetig und bei $t>0$ unendlich oft stetig differenzierbar.
  + $u(t,x) ->^(t->infinity) 1/(2 pi) integral_0^(2 pi) f(y) dd(y)$  konvergiert gleichmässig.
  + $u(t,x) = sum_(n in ZZ) f_n e^(-n^2 t) e^(i n x)$
]
 
=== Beweis

+ Eindeutigkeit. Was ist $u$?§

Angenommen, wir haben Lösung $u$. Für $t>=0$ ist dann $u(t, dot) in C^1 (RR\/2 pi ZZ)$. Da $C^1$ kann ich die Funktion als Fourier ausdrücken:
$
u(x,t) = sum_(n in ZZ) u_n (t) e^(i n x)\
u_n (t) = 1/(2 pi) integral_0^(2 pi) u(t,x) e^(-i n x) dd(x)
$
Was erfüllen diese Koeffizienten?
+ $u_n (0) = 1/(2 pi) integral_0^(2 pi) f(x) e^(-i n x) dd(x) = f_n$
+ Ausserdem 
  $
1/(2 pi) integral_0^(2 pi) u(t,x) e^(-i n x) dd(x) ->^(t arrow.br 0) 1/(2 pi) integral_0^(2 pi) u(0, x) e^(-i n x) dd(x)
$
  $=> u_n (t)$ ist stetig an $t=0$.
+ Selbes argument gibt stetigkeit für alle $t_0>= 0$

  Am ende wird $u_n$ eine einfache Differentialgleichung erfüllen:

+ $u_n in c^(infinity)((o, infinity))$
  Wir zeigen $C^1$:
  $
  (u_n (t + h) - u_n (t))/h = 1/(2 pi) integral_0^(2 pi) (u_n (t + h) - u_n (t))/h e^(-i n x) dd(x)\
  "Integrand": ->^(h->0) pdv(u,t) (t,x) "gleichmässig"\
  ->^(h->0) 1/(2 pi) integral_0^(2 pi) pdv(u,t) (t,x) e^(-i n x) dd(x) "stetig in" t>0\
  => pdv(u_n,t) = u'_n (t) = (pdv(u,t))_n
  $

Nun mit der Wärmeleitgleichung:
$
u'_n(t) = (pdv(u,t) (t, dot))_n = (pdv(u, x,2)(t, dot))_n
$
Der Fourierkoeffizent der Ableitung einer Funktion: $(dv(f,x))_n = i n f_n$. Wenn man die Fourierkoeffizienten einer Funktion weiss, kann man die Koeffizienten der Ableitung durch Multiplikation bestimmen.
$
... = 1/(2 pi) integral_0^(2 pi) u(t,x) dv(,x,2) (e^(-i n x)) dd(x)\
= -n^2 u_n(t)
$

Also impliziert die Partielle WLG ein System aus einfachen DV:
$
u'_n (t) = -n^2 u_n(t)\
u_n (0) = f_n
$
*Entkoppelt!*

Diese DV's sind *Eindeutig* lösbar: 
$

u(t,x) = sum_(n in ZZ) u_n (t) e^(i n x) = sum_(n in ZZ) f_n e^(-n^2 t) e^(i n x), t >= 0\
u_n (t) = e^(-n^2 t) f_n
$

Wir sind also in der Lage die Wärmefunktion durch ihre Fourierkoeffizienten darzustellen. Nun müssen wir noch zeigen, dass wir diese Gleichung aus lösen können.

Behauptung: Diese beiden Gleichungen definieren eine Lösung des AWP der Klasse $C^0([0,infinity) crossproduct RR\/ 2 pi ZZ) inter C^infinity (...)$.

Warum sollte die Verteilung aber *sofort* glatt werden? Je regulärer die Funktion ist, desto schneller fallen die Fourierkoeffizienten ab (in dem Fall fallen die Koeffizienten mit $e^(-n^2 t)$ ab).

+ $u$ ist wohldefiniert:
  $
  abs(u_n (t)) = abs(f_n) e^(-n^2 t) <= abs(f_n) <= C/(1+n^2)
  $
  Letzter Schritt kommt aus $f in C^2$
  $
  => sum_(n in ZZ) C/(1 + n^2) < infinity
  $
  Also ist $x |-> u(t,x)$ stetig.

+ Anfangsdatum:
  $
  u(0,x) = sum_(n in ZZ) u_n(0) e^(i n x) = sum_(n in ZZ) f_n e^(i n x) = f(x)
  $

+ Löst Differentialgleichung in $t>0$:
  $
  t>0: abs(u_n (t)) = abs(f_n) e^(-n^2 t) <= C_(k,t)/(1+abs(n)^(k+2))\
  => u(t, dot) in C^k (RR\/ 2 pi ZZ) forall k in NN_0
  $
  Das heisst die Funktion ist glatt in $t$.
  $
  pdv(u,x,2)(t,x) = sum_(k in ZZ) u_n (t) dv(,x,2) e^(i n x)\
  = sum_(n in ZZ)  u_n (t) (-n^2) e^(i n x)
  = sum_(n in ZZ) u'_n (t) e^(i n x)
  $

  $
  "Using:" pdv(u,x) (t,x) =  sum u_n (t) dv(,x) e^(i n x)\
  => g_n (x) = sum_(abs(j) <= n) u_j (t) e^(i j x) ->^("gl.") u(t,x)\
  g'_n (x) = sum_(abs(j) <= n) u_j (t) dv(,x) e^(i j x) = sum_(abs(j) <= n) i j u_j (t) e^(i j x)\
  "Aber:" sum_(j in ZZ) abs(j u_j (t)) < infinity\
  => "konvergiert" g'_n "gleichmässig gegen:" \
  h(x) = sum_(j in ZZ) i j u_j (t) e^(i j x)\
  => pdv(u,x) = h
  $

  Nun müssen wir noch zeigen dass die räumliche und zeitliche Ableitung mit unserer Lösung übereinstimmt (Wärmeleitgleichung). Es soll gelten: $pdv(u,x) = sum u_n' (t) e^(i n x)$.

  Für (neues) $h$ die Differenzquotienten berechnen und gucken, dass dieser konvergiert: $lim_(h arrow.br 0) (u(t+h, x) - u(t,x))/h = sum_(n in ZZ) u'_n (t) e^(i n x)$.

=== Lösung

$
u(t,x) = sum_(n in ZZ) f_n e^(-n^2 t) e^(i n x) = 1/(2 pi) integral_0^(2 pi) f(y) K(t,x-y) dd(y)\
K(t,x) = sum(n in Z) e^(-n^2 t) e^(i n x) bold("Jacobi-Theta-Funktion")
$

Dies ist eine Faltung mit $K$. $K$ definiert eine stetige Ausbreitung eines Impulses mit Periode.

== Satz: Impulsfuktion $K$

#theorem[Satz][
  Für $t > 0 => K(t,x) > 0$. 
  
   Dann $f(x)>= 0 forall x => u(x,t) >= 0 forall t >= 0, x$ 
]

==== Beweis

Poisson:
$
2 pi sum_(n in ZZ) h(x+2 pi n) = sum_(n in ZZ) hat(h) (n) e^(i n x)\
$

Wir wollen $h(x)$ finden, sodass $hat(h) (n) = e^(-n^2 t)$.














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
  $
    norm(phi - phi_j)_m ->^(j -> infinity) 0 forall m
  $.

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
    = integral_(RR^(n-1)) integral_(RR) pdv(, x_n) phi(x) e^(-i _n dot x_n) dd(x_n) e^(-i x_1 k_1 + ... +  x_(n-1) k_(n-1)) dd(x_1) ... dd(x_(n-1))\
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
  = (2 pi)^(-n) integral_(RR^n)  integral_(RR^n) overline((phi) (k)) phi(x) e^(i k dot x) dd(x) dd(k)\
  = (2 pi)^(-n) integral_(RR^n)  integral_(RR^n) overline(hat(phi) (k)) hat(phi) (k) dd(k) dd(x)\
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
    => hat(g) (k) =  integral_0^(infinity) g(r) G_n(abs(k) r) r^(n-1) dd(r)\
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
    u(t,x) = 1/(4 pi) [pdv(, t) (1/(c^2 t) integral_(abs(k) = c t)  f(x+y) dd(Omega(y)))\
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
    hat(u) (t,k) =  integral_(RR^n) u(t,x) e^(-i k dot x) dd(x)\
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
    => cal(F)^(-1)  (f g) = cal(F)^(-1) f * cal(F)^(-1) g\
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
  partial_t K_t(x) = (4 pi)^(-n/2)  (-n/2) t^(-n/2-1) e^(-abs(x)^2/(4 t))\
  + (4 pi)^(-n/2) t^(-n/2) (-abs(x)^2/(4 t^2)) e^(-abs(x)^2/(4 t))\
  => partial_t^j partial_x^alpha K_t(x) "fällt immernoch exp. schnell ab."
$

Mit Vertauschen der Ableitungen und dem Leibniz-Integralregel folgt:
$
  pdv(u, t) (t,x) = integral_(RR^n) (pdv(, t) K_t(x-y)) f(y) dd(y)\
  pdv(u,t) (t,x)  - Delta_x u(t,x)\
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
  =  integral_(abs(z)> delta) (4 pi t)^(-n/2) e^(-abs(z)^2/(4 t)) dd(z)\
  z = sqrt(t) w\
  = (4 pi)^(-n/2) integral_(abs(w)> delta/sqrt(t)) e^(-abs(w)^2/(4)) dd(w) ->^(t->0) 0\
$ 

Da beide Terme zu null gehen. ist die gleichmässige Konvergenz bewiesen.
















= Orthogonale Systeme

Motivation:

Wollen Wellengleichung auf einer Saite $[0, L]$ lösen:
$
  1/c^2 pdv(, t, 2) u(t,x) - pdv(, x, 2) u(t,x) = 0\
  u(t,o) = u(t, L) = 0 forall t\
  u(0, x) = v(x)\
  partial_t u(0, x) = w(x)\
  => v(0) = w(0) = v(L) = w(L) = 0\
$ 

#example[Problem][Gespannte Saite][
Versuchen wir es mit Separation der Variablen: Wir suchen also Lösngen der Form $u(t,x) = f(t) g(x)$. Dann wird die Wellengleichung:

$
  1/c^2 f''(t) g(x) - f(t) g''(x) = 0\
  g(0) = g(L) = 0\
  1/c^2 f''(t)/f(t) = g''(x)/g(x) = -lambda "Konstant"\
  => f''(t) = -c^2 lambda f(t)\
  => g''(x) = -lambda g(x)\
$
]

Lösung für $g(x)$:

$
  g(x) = a cos(sqrt(lambda) x) + b sin(sqrt(lambda) x)\
  g(0) = 0 => a = 0\
  g(L) = 0 => sqrt(L) = k pi, k in NN\
  "Def" lambda_k = (k pi/L)^2\
  g_k(x) = b sin(k pi x/L)\

$

Interpretation: $lambda_k$ sind Eigenwerte und $g_k$ sind Eigenfunktionen des Eigenwertproblems $g'' = - lambda g, g(0) = g(L) = 0$.

Lösung:
$
  f(t) = a cos(c sqrt(lambda_k) t) + b sin(c sqrt(lambda_k) t)\
  => f(t) g_k(x) "löst Wellengleichung"\
$

Wellengleichung ist linear und homogen. Wir können also die Lösungen addieren (Superposition):

$
  u(t,x) = sum_(k=1)^(infinity) (a_k cos(omega_k t) + b_k sin(omega_k t)) sin(omega_k/c x)\
  omega_k = c sqrt(lambda_k) = (k pi c)/L\
$

Das ist auch eine Lösung falls $a_k, b_k$ schnell genug abfallen, sodass $u in C^2$ (sodass wie verifizieren können).

Wie müssen wir nun $a_k, b_k$ wählen, sodass $u(0,x) = v(x), partial_t u(0,x) = w(x)$.

$
  v(x) = sum_(k=1)^(infinity) a_k sin((k pi x)/L)\
  w(x) = sum_(k=1)^(infinity) b_k omega_k sin((k pi x)/L)\
$

Solche $a_k, b_k$ existieren, wenn $v,w in C^1$

$
  a_k = 2/L integral_(0)^(L) v(x) sin((k pi x)/L) dd(x)\
  b_k = 2/(L omega_k) integral_(0)^(L) w(x) sin((k pi x)/L) dd(x)\
$

Eigenfunktionen $g_k$ sind orthogonal zueinander und vollständig. Das heisst, dass wir $v,w$ als Linearkombinationen der Eigenfunktionen schreiben können mit Eigenwerten: 
$
  lambda_k = ((k pi )/L)^2
$

Mit Anfangsbedingungen:

$
  a_k = 2/L integral_(0)^(L) v(x) sin((k pi x)/L) dd(x)\
b_k = 2/(L omega_k) integral_(0)^(L) w(x) sin((k pi x)/L) dd(x)\
$

#proof[Beweis][Jedes  Linearkombination][
  $
    v = sum_(k=1)^(infinity) a_k v_k\
    a_k = (v_k, v)
    (v- sum_(k=1)^(infinity) a_k v_k, v_j)\
    = (v, v_k) - sum_(j=1)^(infinity) overline((v_k, v)) delta_k_j = 0\

  $
]

Dies lässt sich auch mit unserer Lösung machen. $V$ muss also ein Raum von Funktionen $g:[0, L] -> CC$ mit $g(0) = g(L) = 0$, z.B. $V = {g in C^2([0, L]): g(0) = g(L) = 0}$ mit Skalarprodukt:

#definition[Definition][$L^2$ Skalarprodukt][
  $
    (u, v) = integral_(0)^(L) overline(u(x)) v(x) dd(x)\
    dim_CC V = infinity\
  $

]

Operator:

$
  A:V -> V\
  A g = g''\
$

Wir zeigen nun, dass $A$ selbstadjungiert und symmetrisch ist:

$
  u, v  in V\
  => (A u, v) = integral_(0)^(L) overline(u''(x)) A v(x) dd(x)\
  = evaluated(overline(u'(x)) v(x))_0^L - integral_(0)^(L) overline(u'(x)) v'(x) dd(x)\
  = 0 + evaluated(overline(u(x)) v'(x))_0^L + integral_0^L overline(u(x)) v''(x) dd(x) = (u, A v)\
$

Wenn wir aus der Linearen Algebra extrapolieren, würden wir erwarten, dass jede Funktion aus dem Raum mit einer Linearkombination aus den Eigenfunktionen dargestellt werden kann. In diesem Fall ist dies sogar der Fall aber nicht immer so. 

== $CC$-Vektorraum $V$ mit Skalarprodukt

+
  $
    V = CC^n\
    (f,g) = sum_(j=1)^n overline(f_j) g_j\
  $
+
  $
    V = cal(S) (RR^n)\
    (f,g) = integral_(RR^n) overline(f(x)) g(x) dd(x)\
  $
  Konvergiert das Integral?
  $
    exists C < infinity "sodass" abs(f(x)) <= C/(1 + abs(x)^m)\
    => abs(overline(f(x))) g(x) <= C/(1 + abs(x)^(n+1))^2 => "Integrabel"\
  $

+ 
  $
    V = L^2(RR^n)\
    (f,g) = integral_(RR^n) overline(f(x)) g(x) dd(x)\
  $
  Integral konvergiert weil:
  $
    abs(overline(f(x)) g(x)) <= 1/2 (abs(f(x))^2 + abs(g(x))^2)\
    => integral_(RR^n) abs(overline(f(x)) g(x)) dd(x) <= 1/2 integral_(RR^n) abs(f(x))^2 dd(x) < infinity\
  $

  Als Bemerkung können wir $L^2$ Caunchy Folgen betrachen: Falls $f_j, g_j$ Cauchy, dann ist auch $(f_j, g_j)$ Cauchy in $CC$. Dann sind die Grenzwerte auch im Raum $V$ enthalten. Das heisst, dass $V$ auch vollständig under Skalarprodukt ist.
+
  $
    V = l^2 = l^2(NN) =\
    {a = (a_n)_(n in NN): a_n in CC, sum_(n=1)^(infinity) abs(a_n)^2 < infinity}\
    (a,b) = sum_(n=1)^(infinity) overline(a_n) b_n\
    abs(overline(a_n) b_n) <= 1/2 (abs(a_n)^2 + abs(b_n)^2) "konvergiert"\
  $
Alle seperablen, vollständigen Räume sind Isomorph zu $l^2$.

#theorem[Satz][Norm][
  $
    norm(f) = sqrt((f,f)) "ist eine Norm"\
    norm(lambda f) = abs(lambda) norm(f)\
    norm(f) >= 0\
    norm(f) = 0 <=> f = 0\
    norm(f+g) <= norm(f) + norm(g)\
  $
  Der letzte Punkt lässt sich mit der Chauchy-Schwarz-Ungleichung zeigen.
]

#lemma[Lemma][Cauchy-Schwarz][
  $
    f,g in V\
    => abs((f,g)) <= norm(f) norm(g)\
    "\""="\"" "falls linear abhängig"\
  $

]

#definition[Definition][Orthogonalität][
  $
    (phi_j)_(j in I), I = {1,2,...,n}, NN, ZZ\
    "orthogonal" <=> (phi_j, phi_k) = delta_k_j\
    "orthonormal" <=> += (phi_j, phi_j) = 1 forall j\
    "vollständig" <=> forall phi in V: phi= 0 <=> (phi_j, phi) = 0 forall j in I
  $
]

#theorem[Satz][
  $
    V = CC"¨-Vektorraum", dim_CC V = infinity\
    (phi_j)_(j in NN) "orthonormal"\
    => norm(phi_1 + ... + phi_n) = norm(phi_1) + ... + norm(phi_n)\
    (phi_j)_(j in NN) "ON." => sum_(j=1)^(infinity) abs((phi_j, phi))^2 <= norm(phi)^2\
    (phi_j)_(j in NN) "ON." => lambda in CC^n, lambda = (lambda_j)_(j in NN)\
    |-> norm(phi - sum_(j=1)^(n) lambda_j phi_j)^2\
    "minimum an" lambda_j = (phi_j, phi) "für" phi approx sum_(j=1)^n lambda_j phi_j\
  $
  Diese drei Eigenschaften sind: Satz von Pythoagoras für Vektoren, Satz von Bessel und beste Approximation. Die beste Approximation wird klar wenn man sich eine Projektion der gegebenen Funktion auf den Raum der Eigenfunktionen vorstellt.
  Die Norm der Differenz ist minimal, wenn die Projektion auf den Raum der Eigenfunktionen gleich der Funktion ist.
]

== Hilbertraum

#definition[Definition][Hilbertraum][
  $(V, (dot, dot))$ heisst Hilbertraum, falls jede Cauchyfolge in $V$ konvergiert. D.h. dass $(V, d)$ vollständig.

  + $V = CC^n$ Hilbertraum mit Skalarprodukt $(dot, dot)$\

  + $V = C^0(RR\/ZZ)$, Skalarprodukt ist *nicht* vollständig. Es gibt Chauchy-Folgen welche zu Funktionen ausserhalb des Raumes konvergieren. Also kein Hilbertraum.\

  Wir können zeigen, dass jeder Hilbertraum isomorph zu $l^2$ ist. 
]

#theorem[Satz][
  $
    l^2 = {a = (a_n)_(n in NN): sum_(n=1)^(infinity) abs(a_n)^2 < infinity}\
    (a,b) = sum_(n=1)^(infinity) overline(a_n) b_n\
  $
  Ist ein Hilbertraum.
]

Beweis:

$
  norm(a_((j)) - a_((k)))^2 = sum_(n=1)^(infinity) abs(a_((j),n) - a_((k),n))^2 -> 0\
$

Wir müssen jetzt rausfinden, zu was diese Folge konvergiert.

$
  forall n: abs(a_((j),n) - a_((k),n))^2 -> 0\
$

Wir können zeigen, dass der Grenzwert $lim_(j->infinity) a_((j), n) = a_n$ existiert und auch, dass $a_((j))-> a$

Dann $sum_(n=1)^infinity abs(a_n)^2 $ konvergiert $<= C, a in l^2$

Sei $"span"{phi_1, ..., phi_n}$. Dann ist die beste Approximation von $phi$ die Projektion auf den Raum $"span"{phi_1, ..., phi_n}$:

$
  psi = sum_(j=1)^(n) (phi_j, phi) phi_j\
$

Mit einem Hilbertraum $V$ (vollständig, ON System $phi_i$). Dann $phi in V => phi = lim_(n-> infinity) sum_(j=1)^n (phi_i, phi_j) phi_j$

#lemma[Lemma][][
  $
    f_n -> f\
    (f_n, g) -> (f,g)\
    norm(f_n) -> norm(f)\
  $
]

Beweis:

$
  abs((f_n, g)) - (f,g) = abs((f_n - f, g))\
  "Cauchy-Schwartz:" <= norm(f_n - f) norm(g)->_(n->infinity) 0\
$

$
  abs(norm(f_n) - norm(f)) <= norm(f_n - f) -> 0\
$

== Eigenschaften von Hilberträumen
#theorem[Satz][
  Sei $H$ ein Hilbertraum
  $
    (phi_j) "ist vollständig"\
    <=>\
    forall phi in H: phi = sum_(j=1)^(infinity) (phi_j, phi) phi_j\
    <=>\
    forall phi in H: norm(phi)^2 = sum_(j=1)^(infinity) abs((phi_j, phi))^2\
  $
  Das heisst, dass die Norm der Funktion gleich der Norm der Projektion ist. Das ist auch die beste Approximation. Dies sind Grenzwerte der Linearkombinationen.
]

Beweis:

$
  s_N = sum_(j=1)^(N) (phi_j, phi) phi_j\
  m > n: norm(s_M - s_N)^2 = norm(sum_(j=n+1)^(m) (phi_j, phi) phi_j)^2\
  = sum_(j=n+1)^(m) abs((phi_j, phi))^2 <= sum_(j=n+1)^(infinity) abs((phi_j, phi))^2 -> 0\
  "Wegen Besselsche Ungleichung:"\
  sum abs((phi_j, phi))^2 < norm(phi)^2\
$

Also bilden die Abbildungen eine Cauchy Folge und bilden daher einen Grenzwert in $H$.

$
  s = lim_(N->infinity) s_N\
  (s-phi, phi_k) = (s, phi_k) - (phi, phi_k)\
  = lim_(N->infinity) (s_N, phi_k) - (phi, phi_k) = ...= 0
$

Die zweite Gleichheit:

$
  norm(phi)^2 = norm(sum_(j=1)^(infinity) (phi_j, phi) phi_j)^2 = lim_(N->infinity) norm(sum_(j=1)^(N) (phi_j, phi) phi_j)^2\
  = lim_(N->infinity) sum_(j=1)^(N) abs((phi_j, phi))^2 = sum_(j=1)^infinity abs((phi_j, phi))^2\
$

3 zu 1:
Sei $phi in H "mit" (phi_j, phi) = 0 forall phi_j$:
$
  norm(phi)^2 = sum_(j=1)^(infinity) abs((phi_j, phi))^2 = 0\
  => phi = 0\
$

#definition[Definition][
  + Ein vollständiges orthonormiertes System von $H$ heisst (vollständige) Northonormalbasis.
  + $H$ ist separabel, falls $H$ eine *abzählbare* Orthonormalbasis hat. (Das sind fast alle relevanten Hilberträume)
]

#theorem[Satz][Isomorphie zu $l^2$][
  Sei $H$ ein separabler Hilbertraum mit einer ON-Basis $(phi_j)_(j in NN)$.
  Dann ist $H$ isomorph zu $l^2$.
  $
    Phi: l^2 -> H\
    a = (a_n)_(n in NN) |-> sum_(n=1)^(infinity) a_n phi_n\
    "ist isometrischer Isomorphismus"\

  $
  Isomormphismus heisst $Phi$ linear und bijektiv: erhält das Skalarprodukt und Norm.
  
  $
    (Phi(a), Phi(b))_H = (a,b)_(l^2)\
  $

  Die explizite Inverse:

  $
    Phi^(-1): H -> l^2\
    phi |-> (phi, phi_1), (phi, phi_2), ...\
  $
]

Beweis:

$Phi$ ist wohldefiniert:

$
  H "ein Hilbertraum"\
  norm(S_N - S_M)^2 = norm(sum_(n=M+1)^(N)) (a_n,  phi_n)^2 = sum_(n=M+1)^N abs(a_n)^2\
  <= sum_(n=M+1)^(infinity) abs(a_n)^2 -> 0\
$

Dann auch linear.

$Phi$ erhält das Skalarprodukt, also isometrie:

Wir benutzen die Stetigkeit des Skalarprodukts.
$
  (Phi(a), Phi(b))_H = lim_(N->infinity) lim_(M->infinity) (sum_(j=1)^(N) a_j phi_j, sum_(k=1)^(M) b_k phi_k)\
  = lim_(N->infinity) lim_(M->infinity) sum_(j=1)^(N) sum_(k=1)^(M) overline(a_j) b_k (phi_j, phi_k)\
  "Kroneker Delta:"\
  = lim_(N->infinity) sum_(j=1)^N overline(a_j) b_j = (a, b)_(l^2)\
$

Inverse:

$
  Phi^(-1) dot Phi (phi) = Phi ((phi_j, phi)_(j in NN)) = sum_(j=1)^infinity (phi_j, phi) phi_j = phi\
  Phi^(-1) dot Phi (a) = Phi^(-1) (sum_(j=1)^(infinity) a_j phi_j)\
  = ( (phi_n, sum_(j=1)^(infinity) a_j phi_j)_(n in NN) ) = (a_n)_(n in NN)\
$

== Explizite Hilberträume

+ $CC^n$ seperable Hilberträume.

+ $l^2$ seperabler Hilbertraum.

+ $L^2(RR^n)$ seperabler Hilbertraum mit Skalarprodukt $(f,g)_(l^2) = integral_(RR^n) overline(f(x)) g(x) dd(x)$.

== $L^2$ ist Seperabel

== Hamilton Operator

Wir werden Orthonormalbasis finden als Set von Eigenvektoren von selbstadjungiertem Operator *Hamilton Operator* $H$.

In der Quantenmechanik sind Energieeigenzustände Eigenvektoren des Hamilton Operators.

$
  H = p^2/(2 m) + V(x)\
  H = - hbar^2/(2 m) pdv(, x, 2) + 1/2 omega^2 x^2\
$

Alle Naturkonstanten zu 1:

$
  H = -1/2 dv(, x, 2) + 1/2 x^2\
  H: cal(S) (RR^n) -> cal(S) (RR^n)\
  phi |-> -1/2 dv(, x, 2) phi + 1/2 x^2 phi\
$

Grundzustand ist die Eigenfunktion $psi_0$ mit dem niedrigsten Eigenwert und $norm(phi_0) = 1$. Wir werden sehen $psi_0 = Pi^(-1/4) e^(-x^2/2), E_0 = 1/2$

Angeregte Zustände sind die Eigenfunktionen $psi_n$ mit dem Eigenwert $E_n = n + 1/2$.


Wir schreiben 
$
  H = A\* A + 1/2\
  A = 1/sqrt(2) (x + dv(, x))\
$

#lemma[Lemma][Operatoren $A$ und $A\*$][
  $
    phi in cal(s) (RR^n), H phi = E phi\
  $
  + $H A\* phi = (E + 1) A\* phi$.

    $A\* phi$ ist eine Eigenfunktion mit Eigenwert $E+1$

  + $H A phi = (E-1) A phi$.

    $A phi$ ist eine Eigenfunktion mit Eigenwert $E-1$.

  + Für $phi != 0: E >= 1/2$, mit Gleichheit für $A phi = 0$.

  $
    A = 1/sqrt(2) (x + dv(, x))\
    A^* = 1/sqrt(2) (x - dv(, x))\
  $
]

Beweis:

Wir verwenden die Tatsachen über $A, A\*$:

+ $(A phi, psi) = (phi, A\* psi)$

  Also sind $A, A\*$ adjungiert zueinander:

  $
    (A phi, phi) = integral_(RR) 1/sqrt(2) (phi', phi) psi dd(x)\
    = evaluated(1/sqrt(2) phi psi)_(-infinity)^infinity - integral_RR 1/sqrt(2) overline(phi) psi' dd(x) + 1/sqrt(2) integral overline(phi) psi dd(x)\
    = (phi, A\* psi)
  $

+ $[A, A\*] = II$

Bemerke: $phi != 0 "mit" A phi = 0$ Ist ein Eigenvektor mir $E = 1/2$.
$
  A phi = 1/sqrt(2) (phi' + x phi) = 0\
  phi_0 = e^(-x^2/2)\
$

Nun werden wir basierend darauf, weitere Eigenvektoren finden. 

$A^*$ nennt man Aufsteigeoperator, $A$ Absteigeoperator.

Angeregte Zustände:

$
  phi_n = (A^*)^n phi_0\
  => H phi_n = (n + 1/2) phi_n\
  => E_n = n + 1/2\
$

Haben wir damit alle Eigenfunktionen im Schwartzraum gefunden? Ja, denn $A^*$ ist ein Isomorphismus auf dem Raum der Eigenfunktionen. Das heisst, dass wir alle Eigenfunktionen finden können, indem wir $A^*$ auf die Grundzustände anwenden.

Beweis:

$
  "Sei" phi in cal(S) (RR), H phi = E phi\
  E >= 1/2\
  H A^n phi = (E-n) phi\
  => exists E_n < 1/2 => A^n phi = 0\
$

Schreiben $A^n phi = 0$.
$
  A (A^(n-1) phi)\
  => A^n phi = C_(n-1) phi_0 "für" C_(n-1) in CC\
  A^(n-1) phi_(n-1) = n! phi_0\
  => A^(n-1) (phi - C_(n-1)/n! phi_(n-1)) = 0\
$

Dies können wir induktiv fortsetzen zu:

$
  phi = sum_(n=0)^(infinity) C_n/n! phi_n\
$

Wir haben somit gezeigt, dass alle Eigenfunktionen im Schwartzraum enthalten sind.

#theorem[Satz][
  $
    psi_n (x) = (n!)^(-1/2) (pi^(-1/4)) phi_n (x)\
    => H  psi_n = E_n psi_n\
    => norm(psi_n)_(L^2) = 1\
    => (psi_n)_(n in NN) "ist ON Familie"\
    => "Jede EF" in cal(S) (RR) "ist Vielfaches von" psi_n
  $

  Bemerkung: Hermitepolynome:

  $
    H_n (x) = (-1)^n e^(x^2) dv(, x, n) e^(-x^2)\
  $
  Dann
  $
    phi_n (x) = 2^(-n/2) e^(-x^2/2) H_n (x)\
    => psi_n = (n !)^(-1/2) pi^(-1/4) 2^(-n/2) e^(-x^2/2) H_n (x)\
    H_0(x) = 1, H_1(x) = 2 x, H_2(x) = 4 x^2 - 2
  $
]

#theorem[Satz][Eigenfunktionen sind orthonormal in $L^2 (RR)$][
  $(psi_n)_(n in NN_0)$ bilden ein vollständiges ON System in $L^2 (RR)$.
]

Fällt $g$ schneller ab als jedes Exponential $e^(-C abs(x))$, dann ist $hat(g)$ *holomorph*.

#theorem[Satz][Holomorphe Fouriertransformation][
  Sei $g$ holomorph in $RR^n$ und $hat(g)$ die Fouriertransformation von $g$.
  Dann ist $hat(g)$ holomorph in $CC^n$.
]

$
  overline(partial_k) (e^(-i x dot k)) = 0\
  overline(partial_k) integral f(x) e^(-x^2/2) e^(-i x dot k) dd(x)\
  = integral f(x) e^(-x^2/2) overline(partial_k) e^(-i x dot k) dd(x) = 0\
  => hat(g) "holomorph"\
$

Für holomorphe Funktionen gilt dann:

$
  hat(g) (k) = sum_(n=0)^(infinity) (1/n!) (dv(, k, n) hat(g) (0)) k^n = 0 forall k in CC\
$

Die Besonderheit von holomorphen Funktionen ist, dass die Funktion komplett bestimmbar ist sobald man alle Ableitungen an einem Punkt kennt. Das heisst, dass die Taylorreihe konvergiert und die Funktion vollständig bestimmt.

Die Fouriertransformation von $g(x) = f(x) e^(-x^2/2)$ ist $hat(g) = 0$ Das führt dazu, dass $g = 0$ wegen Plancherel ($g in L^2 => norm(g)_(L^2) = norm(hat(g))_(L^2) (2 pi)^(1/n)$). Dann $f = 0$.

#lemma[Lemma][
  Es existiert keine Funktion $0 != f in cal(S) (RR)$, sodass $f in C_C^infinity (RR)$ *und* $hat(f) in C_C^(infinity) (RR)$. Das ist eine Art von Unschärferelation. Das heisst, dass wir nicht gleichzeitig eine Funktion und ihre Fouriertransformation lokalisiert haben können.
]

Beweis:

$
  f in C_C^infinity (RR) => hat(f) (k), k in CC "holomorph"\
  "Wenn" hat(f) (k) 0 forall abs(k) >= R > 0\
  => hat(f) = 0
$

Weil man eine analytische Fortsetzung bei einem weit entfernten Punkt machen kann und den Wert 0 erhält. Das heisst, dass die Funktion $f$ auch 0 ist. Das ist ein Widerspruch.

== Fourierreihen im Hilbertraum $L^2([0, 1])$

#lemma[Lemma][Plancherel/Parseval][
  Sei $f in L^2([0, 1])$ eine Funktion mit Fourierreihe:
  $
    f(x) = sum_(n=- infinity)^(infinity) f_n e^(2 pi i n x)\
    "mit" sum_(n=-infinity)^(infinity) abs(f_n) < infinity\
    => integral_(0)^(1) abs(f(x))^2 dd(x) = sum_(n=-infinity)^(infinity) abs(f_n)^2\
  $
]


$
  => norm((f_n)_(n in ZZ))_(l^2) = norm(f)_(L^2([0,1])) = (integral_(0)^(1) abs(f(x))^2 dd(x))^(1/2)\
$

#definition[Definition][
  $L^2([0,1])$ ist die Vervollständigung von $C^(infinity) ([0, 1])$ in Bezug auf $norm(dot)_(L^2 ([0,1]))$.
  $
    = {L^2 -"Cauchy Folgen" (f_j)_(j in NN): f_j in C^(infinity) ([0, 1]),\
     norm(f_j - f_k)_(L^2([0,1])) -> 0\}
  $

  Vollständig und mit Skalarprodukt:
  $
    norm(f)_(L^2) = lim_(j->infinity) norm(f_j - f_k)_(L^2([0,1]))\
    (f,g)_(L^2) = integral_(0)^(1) overline(f(x)) g(x) dd(x) = lim_(j->infinity) (f_j, g_j)
  $
  Per Konstruktion ist $L^2$ ein Hilbertraum.
]

#theorem[Satz][
  $
      phi_n (x) = e^(2 pi i n x)\
      phi_n in L^2([0,1])\
      "orthonormal"
  $
  Dann ist $(phi_n)_(n in ZZ)$ eine vollständige ON-Basis von $L^2([0,1]$.
  Weil dann jede Funktion im Raum ein gleichmässiger Grenzwert ist.
]

Beweis:

Ist $f in C^1 (RR\/ZZ)$, so gilt $f = sum (f, phi_n) phi_n$ gleichmässige Konvergenz.

$
  f in L^2([0,1]) "Grenzwert Cauchy von" L^1\
  "Verbesserung" f = L^2 - lim(f_j)_(j -> infinity) f_j\
  f_j = evaluated(tilde(f_j))_([0,1]), tilde(f_j) in C^infinity "1-periodisch"\
$

Sei $g in C^infinity, norm(g-f)_(L^2) < epsilon$.

Wir schneiden $g$ nahe 0, 1 auf 0 ab. Die FUnktion $h(0) = 0 = h(1)$. Dann $norm(h-g)_(L^2) < epsilon$.

Beweis: 

Sei $f in L^2([0,1])$- $(f, phi_n) = 0 forall n in ZZ$.

Zu zeigen: Das impliziert $f=0$. Klar, wenn $f in C^(infinity) (RR\/ZZ)$.

Sei $f_j in C^infinity$ mit $f = L^2-lim f_j$.

Jedes $f_j = sum f_(j,n) phi_n, f_(j,n) = (f_j, phi_n)$. 

+ $f_j$ ist Cauchy in $L^2 ([0,1])$. Dann sind alle Koeffizienten $f_(j,n)$ Cauchy in $l^2$. $norm(f_j - f_j)^2_(l^2) = sum abs(f_(j, n) -f_(l, n))^2 = 0$. Das heisst die Fourierkoeffizienten müssen auch gegen die Koeffizienten der Ursprungsfunktion konvergieren. 

+ $lim f_(j,n) = lim (f_j, phi_n)$. Da das Skalarprodukt auch konvergiert $=(f, phi_n) = 0$.

Die Folgenelemente konvergieren gegen Null. Also konvergiert $(f_j, n)_(n in ZZ) -> (0)_(n in ZZ)$ in $l^2(ZZ)$.

$
  => f_j -> 0\
  "weil" norm(f_j)_(L^2) = norm( (f_j, n)_(n in ZZ))_(l^2) -> 0\
  "Auch" f_j -> f "in" L^2([0,1])\
  "Also" f= 0
$

Recap: Das Verschwinden der Fourierkoeffizienten für schöne Funktionen. Falls wir eine hässliche Funktion haben zu der schöne Funktionen konvergieren, konvergiert die Fourierreihe auch gehen Null. Das heisst, dass die Fourierreihe auch gegen die Nullfunktion konvergiert. Das ist eine Art von Unschärferelation. Wir können nicht gleichzeitig eine Funktion und ihre Fourierreihe lokalisiert haben.

#corollary[Korollar][Konvergenz][
  $
    f in L^2([0,1])\
    f_n = (f, phi_n)\
    => f = sum_(n=-infinity)^(infinity) f_n phi_n\
    "Konvergenz in" L^2([0,1])\
    "Plancherel" norm(f)_(L^2)^2 = sum_(n=-infinity)^(infinity) abs(f_n)^2\
  $
  $L^2$ ist also der allgemeinste Raum, in dem die Fourierreihe konvergiert und Plancherel gilt.
  Falls wir beliebige Fourierkoeffizienten haben, die konvergieren, dann konvergiert die Fourierreihe auch gegen die Funktion. Die Funktion ist dann auch im Raum $L^2$ enthalten. 

  *Sind die Fourierkoeffizienten absolut summierbar, dann konvergiert die Fourierreihe gegen eine stetige Funktion.*
  *Sind die Fourierkoeffizienten quadratisch summierbar, dann konvergiert die Fourierreihe gegen eine Funktion in* $L^2$.

  Plancherel gibt uns eine Verlustlose Transformation zwischen den Räumen $L^2$ und $l^2$ und der Funktion und ihren Fourierkoeffizienten.
]

== Orthogonale Polynome

- Die Hermitepolynome $H_n (x)$ erfüllen:
  $
    integral_(RR) H_n (x) e^(-x^2/2) H_m (x) e^(-x^2/2) dd(x) = C delta_n_m\
  $
  Also orthogonal bezüglich dem Skalarprodukt 
  $
    integral_RR overline(H_n (x)) H_m (x) e^(-x^2) dd(x)
  $

Allgemeiner:

Intervall $I subset RR$, Funktion $rho:I -> (0, infinity)$, sodass:
$
  integral_I abs(x^n) rho(x) dd(x) < infinity\
  I = RR, rho(x) = e^(-x^2)\
$

- $(I, rho)$ bestimmen eindeutige Familien von orthogonalen Polynomen $p_0, p_1, ...$ mit

- $p_n (x)$ Polynom von Grad mit Leitkoeffizient 1\

- $p_n$ orthogonal zu $p_m$ für $n != m$

Man kann diese Polynome auch explizit konstruieren indem man Gram-Schmidt anwendet auf $m_n(x) = x^n$

$
  p_0 = m_0 = 1\
  p_n = m_n - sum_(j=0)^(n-1) (m_n, p_j)/(p_j, p_j) p_j\
$

Beispiel:

$
  (I, rho) = (RR, e^(-x^2)) => p_n (x) = 2^(-n) H_n(x)\
  H_n(x) = (-1)^n e^(x^2) dv(, x, n) e^(-x^2)\
$

Es stellt sich herraus, dass man häufig an Differentialgleichungen interssiert ist und man bei der Lösung auf bestimmte Klassen von Funktionen kommt. Diese Funktionen sind oft orthogonal und bilden eine Basis des Lösungsraumes.

Beispiel:

$
  (I, rho) = ([-1, 1], 1)\
  => p_n (x) = x^n + ... "mit" integral_(-1)^(1) p_n (x) p_m (x) dd(x) = 0\
  => p_0 = 1, p_1 = x, ...\
$

Das sind die *Legendrepolynome* bis auf normalisierung. Die beste Approximation einer Funktion auf dem Intervall $[-1, 1]$ ist die Projektion auf den (endlichen) Raum der Legendrepolynome. 

#theorem[Satz][Rodrigues Formel][
  Sei $P_l (x) = 1/(2^l l!) dv(, x, l) (1-x^2)^l$. Dan gilt:
  - $P_l (x)$ ist ein Polynom vom Grad $l$. $P_l (1) = 1$.
  - $
      integral_(-1)^(1) P_l (x) P_(l') (x) dd(x) = 2/(2 l + 1) delta_(l,l')\
    $
]

#theorem[Satz][
  $
    dv(, x) ( (x^2 - 1) dv(, x) P_l) = l(l + 1) P_l\
  $
  Die Legendrepolynome sind Lösungen der Legendre-Differentialgleichung. Diese Differentialgleichung ist eine *Sturm-Liouville-Gleichung*.
]

Beweis:

+ $P_l (x)$ ist die l-te Ableitung von Polynom (2l)-ten Grades.

+ OBdA $ l' < l$. 
  $
    (P_l, P_(l')) = ... = 0\
  $

+ $l' = l$.
  $
    (P_l, P_l) = ... = 2/(2 l + 1) "Normalisierungsfaktor"\
  $

Insbesondere $q(x)$ Polynom Grad $<= l-1$. Dann $integral_(-1)^1 P_l (x) q(x) dd(x) = 0$. *Das Legendrepolynom ist also orthogonal zu jedem Polynom kleineren Grades.*

#theorem[Satz][
  + Der Operator $L u = dv(, x) ( (x^2 - 1) dv(, x))$ bildet $"Poly"_(<= N) -> "Poly"_(<= N)$. Er ist selbstadjungiert bezüglich $(f,g) = integral_(-1)^1 overline(f(x)) g(x) dd(x)$.
  + Es gilt $L P_l = l(l+1) P_l$. $P_l$ ist also eine orthogonale Basis der Polynome $"Poly"_(<= N)$.
  + $(sqrt((2l + 1)/ 2) P_l)_(l in NN_0)$ ist eine vollständige Orthonormalbasis vom Raum $L^2 ([-1, 1])$.
]

Beweis:

+ $
    u, v "Poly Grad" <= N\
    (L u, v) = integral_(-1)^(1) dv(, x) ( (x^2 - 1) dv(,x) overline(u) (x)) v(x) dd(x)\
    = evaluated((x^2 - 1) dv(, x) overline(u) (x) v(x))_(-1)^(1) - integral_(-1)^1 (x^2 - 1) dv(, x) overline(u) (x) dv(, x) v(x) dd(x)\
    = ... = (u, L v)\
  $

+ $
    L P_l = sum_(j=0)^(l) (P_j, L P_l)/(P_j, P_j) P_j\
    = sum_(j=0)^(l) (L P_j, P_l)/(P_j, P_j) P_j\
    = (L P_l, P_l)/(P_l, P_l) P_l\
    = lambda in RR dot P_l\
    "Betrachten Leitkoeffizienten:"\
    P_l (x) = a_l x^l + ...\
    L P_l = dv(,x) ( (x^2 - 1) dv(, x) (a_l x^l + ...))\
    = dv(,x) ( (x^2 - 1) (l a_l x^(l-1) + ...))\
    = (l + 1) l a_l +  ...\
    => lambda = l(l + 1)\
    => (L P_l, P_l)/(P_l, P_l) = l(l + 1)\
  $

Für den dritten Teil wird benutzt, dass Polynome dicht sind.

== Kugelfunktionen

Treten auf bei Problemen in $RR^3$, in denen Rotationssymetrie eine Rolle spielt.

$
  laplace psi = 0\
  psi_(partial B_R(0)) = psi_0\
  "Polarkoordinaten" r >= 0, theta, phi\
  arrow(x) = r vec(r cos(phi) sin(theta), r sin(phi) sin(theta), r cos(theta))\
$

Es gilt:

$
  laplace = sum_(j=1)^(3) pdv(, x_j, 2) = pdv(, r, 2) + 1/r pdv(,r) + 1/r^2 laplace_(SS^2)\
  laplace_(SS^2) = 1/sin(theta) pdv(, theta) (sin(theta) pdv(, theta)) + 1/sin^2(theta) pdv(, phi, 2)\
  "Sphärischer Laplace Operator"
$

Um $laplace u = 0$ zu lösen, bietet es sich an, Variablen zu seperieren. Wir setzen $psi(r, theta, phi) = U(r) Y(theta, phi)$.

$
  => (U'' + 2/r U') Y + 1/r^2 U laplace_{SS^2} Y = 0\
  => r^2 (U'' + 2/r U')/(U) + (laplace_{SS^2} Y)/(Y) = 0\
$

Es müssen also beide nicht-konstant sein. Sei Separationskonstante $lambda$:

$
  => U'' + 2/r U' =  lambda r^(-2) U\
  => laplace_{SS^2} Y = - lambda Y\
  "Ansatz:" U(r) = r^l\
  -> l(l-1) r^(l-2) + 2 l r^(l-2) = lambda r^(l-2)\
  => lambda = l(l + 1)\
  l "Lösung" => -l-1 "Lösung"\
  => U(r) = a r^l + b r^(-l-1)\
$

Wir wollen aber, dass die Lösungen am Ursprung regulär bleiben. Dafür muss gelten (bei $l>=0, u(r) = a r^l, l in NN_0$). WIr wollen zeigen:

#theorem[Satz][
  Für jedes $l in NN_0$ gibt existiert ein $(2l + 1)$-dim Raum $cal(H)_l$ von Funktionen auf $SS^2$, welche die Eigenwertgleichung erfüllen mit $lambda = l(1+1)$.

  Ist $Y_(l, m), m = -l, ..., l$ eine Orthonormalbasis von $cal(H)_l$, dann ist $Y_(l, m)$ die Kugelfunktion vom Grad $l$ und Ordnung $m$. Diese sind die Lösungen der Eigenwertgleichung.
]

Beispiel:

$
  l = 0, lambda = 0, Y_(0, 0) = 1, laplace_{SS^2} 1 = 0\
  L = 1, lambda = 2, Y_3(theta, phi) =  cos(theta)\
  u(r,theta, phi) = U(r) Y_3(theta, phi) = r cos(theta) = arrow(r)_3\
$

= Distributionen (verallgemeinerte Funktionen)

== Beispiel: Punktladung

Beispiel:

Sei Ladungsdichte $rho(x), x in RR^3$. Dies erzeugt ein elektrostatisches Potential $laplace u = -4 pi rho$. Das ist eine partielle Differentialgleichung in $RR^3$. Dies lässt sich explizit lösen mit:

$
  u(x) = integral_(RR^3) rho(y)/(abs(x-y)) dd(y)
$

Eine Punktladung muss dann mit einer delta-Distribution beschrieben werden. Das ist eine Distribution, die nicht lokalisiert ist. Wir können sie aber trotzdem als Funktion betrachten, wenn wir sie mit einer Testfunktion zusammenfassen.

$
  rho(x) = 0, x != 0\
  "Gesamtladung" Q = integral_(RR^3) rho(x) dd(x)\
$

Falls $rho$ stätig wäre, wäre das nicht möglich. Wir wollen aber:

$
  rho(x) = e delta(x)
$.

Wir behaupten also, dass:
$
  u(x) = e/abs(x)\
$

das Integral löst.

$
  x != 0 => laplace u(x) = 0\
  integral_(RR^3) laplace u(x) dd(x) = e\
  =integral_(RR^3) div grad e/abs(x) dd(x) = integral_(abs(x) <= R) div grad e/abs(x) dd(x)\
  = integral_(abs(x) = R) grad (e/abs(x)) x/abs(x) dd(Omega(x))\
  = integral_(abs(x) = R) sum_(j=1)^(3) (e x_j)/abs(x)^3 x_j/(abs(x)) dd(Omega(x))\
  = - integral_(abs(x) = R) (e abs(x)^2)/abs(x)^4 dd(Omega(x))\
  = - e/R^2 4 pi R^2\
  = -4 pi e\
$

== Beispiel: Wärmeleitgleichung

Sei $f =$ Anfangsbedingung. Lösung der Wärmeleitgleichung:

$
  u(t,x) = integral_(RR^3) K_t(x-y) f(y) dd(y)\
  K_t(x) = (4 pi t)^(-n/2) e^(-abs(x)^2/(4 t))\
$

$K_t$ ist dann eine Glockenkurve die immer schmaler wird. Ist $f$ hübsch, dann $=> u(t,x) ->_(t->0 f(x))$ gleichmässig. Im Extremum ist die Kurve überall Null, ausser am Urspring, wo sie unendlich ist. Dann:

#definition[Definition][Distributionen][
$
  integral K_t(x-y) f(y) dd(y) ->_(t->0) integral delta(x-y) f(y) dd(y) = f(x)\
  integral K_t(z) dd(z) = 1
$

  Distributionen haben keine Werte an Punkten. Sie könnenaber gegen geeignete *Testfunktionen* integriert werden. 

  Eine *temperierte Distribution* ist eine stetige und linear Abbildung 
  $
    omega: cal(S) (RR^n) -> CC\
    phi |-> <omega, phi> = omega[phi] = integral_(RR^n) omega (x) phi(x) dd(x)\
  $

  + $
      <omega, phi+ lambda psi> = <omega, phi> + lambda <omega, psi>\
    $

  + $
      "Falls" phi_j -> phi, "dann" <omega, phi_j> -> <omega, phi>\
    $
  
  + Der Raum der temperierten Distributionen ist $cal(S)' (RR^n)$.

    Das heisst konvergenz im Schwartzsinne:
    $
      norm(phi_j - phi)_m ->_(j->infinity) 0\
      norm(phi)_m = sup_(abs(alpha), abs(beta) <= m, x in RR^n) abs(x^alpha partial^beta phi(x))\
    $

  Delta Distribution:

  $
    delta in cal(S)' (RR^n)\
    <delta, phi> = integral delta(x) phi(x) dd(x) = phi(0)\
  $

  Distributionen kann man sich also vorstellen als eine Box in die man Funktionen reinpackt und eine Zahl rausbekommt.

  Temperierte Distributionen sind Distributionen auf dem Raum der Testfunktionen, welche Schwartzfunktionen sind. 

]

#lemma[Lemma][
  Sei $omega: cal(S) -> CC$ linear. Dann ist $omega$ stettig $<=> exists C, m$ sodass $abs(<omega\, phi>) <= C norm(phi)_m$.

  Beispiel Deltafunktion:

  $
    omega = delta, C = 1, m = 0\
  $
]


Beweis $<=$:

Ist $phi_j -> phi$, so gilt 
$
  abs(<omega\, phi_j> - <omega\,phi>) = abs(<omega\, phi_j - phi>)\
  <= C norm(phi_j - phi)_m -> 0\
   
$

Beispiel:

$
  f in L^1 (RR^n)\
  => phi in cal(S) |-> integral f(x) phi(x) dd(x) in CC\
$

eine temperierte Distribution. Linearität offensichtlich. Zeige stetigkeit.

$
  abs(integral f(x) phi(x) dd(x)) <= integral abs(f(x)) abs(phi(x)) dd(x)\
  <= norm(phi)_0 integral abs(f(x)) dd(x) = C norm(phi)_0 < infinity\

$

#definition[Definition][Reguläre Distributionen][
  Sei $f in cal(s) (RR^n)$.

  $omega_f$ ist die reguläre Distribution, die $f$ zugeordnet ist.
  $
    omega_f in cal(S)' (RR^n)\
    omega |-> integral f(x) phi(x) dd(x)\
  $

  Man identifiziert $omega_f$ mit $f$. $f$ als Distribution.

  Der Raum $cal(S)'$ ist ein Vektorraum. $<omega_1 + omega_2, phi> = <omega_1, phi> + <omega_2, phi>$.
]

Zu zeigen: $f,g in cal(S)$. Falls $omega_f = omega_g => f = g$.

$
  <omega_f - omega_g, overline(f) - overline(g)> = integral (f(x) - g(x)) overline(f(x) - g(x)) dd(x)\
  = integral abs(f(x) - g(x))^2 dd(x) = 0\
  <=> f(x) - g(x) = 0\
$

== Konvergenz von Distributionen

#definition[Definition][
  Eine Folge $(omega_n)_(n in NN)$ von (temperierten) Distributionen konvergiert gegen eine Distribution $omega$ genau dann, wenn für alle Testfunktionen $phi$ gilt:

  $
    <omega_n, phi> ->_(n->infinity) <omega, phi>\
  $

  Wir schreiben $omega_n ->^(cal(S)) omega$

  Jede temperierte Distribution ist ein Grenzwert von Schwartzfunktionen. 
]

#theorem[Satz][
  Sei $f in L^1 (RR^n)$, mit

  $
    integral f(x) dd(x) = 1\
  $

  Wir setzen $f_j (x) = j^n f(j x), j in NN$. Diese Funktion wir immer schmaler und höher. $f_j in L^1$, $integral f_j (x) dd(x) = 1$. Behauptung:

  $
    f_j ->^(cal(S)) delta\
  $
]

Beispiel:

$
  f(x) = (4 pi)^(-n/2) e^(-abs(x)^2/4)\
  j = 1/sqrt(t) => f_j (x) = j^n f(j x) = (4 pi t)^(-n/2) e^(-abs(x)^2/(4 t)) = K_t (x)\
$

Des Satz sagt, dass wenn $j -> infinity: f_j (x) ->_(cal(S)') delta$.

Beweis: Für $f in cal(S) (RR^n)$. Für den rest der Funktionen mache ein Approximationsargument.

$
  phi in cal(S) (RR^n)\
  <f_j, phi> = integral j^n f(j x) phi(x) dd(x)\
  = integral j^n f(j x) phi(0) dd(x) + integral j^n f(j x) (phi(x) - phi(0)) dd(x)\
  "I:" = phi(0) integral f(z) dd(z) = phi(0)\
  "II:" <= abs(integral j^n abs(f(j x)) abs(phi(x) - phi(0)) dd(x))\
  abs(phi(x) - phi(0)) <= sup abs(grad(phi(y))) abs(x)\
  = C abs(x) < infinity\
  => <= integral C integral j^n abs(f(j x)) abs(x) dd(x)\
  x = z/j\
  => C/j integral abs(z) abs(f(z)) dd(z) ->_(j->infinity) 0\
$

Also $<f_j, phi> -> phi(0)$, was genau der begriff der Distributionen ist.

== Operationen auf Distributionen

=== Translationen um einen Vektor $a in RR^n$:

$
  f: RR^n -> CC\
  => (T_a, f) (x) = f(x-a)\
$
Die Abbildung $f in cal(S), f |-> T_a f in cal(S)$ ist linear und stetig. Wir möchten den Begriff ver Verschiebung auf Distributionen ausdehnen.
$
  f in cal(S) (RR^n), phi in cal(S) (RR^n)\
  => <T_a f, phi> = integral f(x-a) phi(x) dd(x)\
  = integral f(x) phi(x+a) dd(x) = <f, phi(x+a)>\
$
Die rechte seite ergibt sinn, auch wenn $f in cal(S)'$ eine Distribution ist.

#definition[Definition][Translationen][
  $
    f in cal(S)', a in RR^n => T_a f in cal(S)'\
  $
  ist definiert als folgende Abbildung:
  $
    <T_a f, phi> = <f, T_(-a) phi>\
  $
  Bemerkung:
  Linearität ist klar. Stetigkeit folgt aus der Stetigkeit der Translationen $T_a$.
]

Beispiel: $delta_a = T_a delta$

$
  <delta_a, phi> = <delta, T_(-a) phi>\
  =  (T_(-a) phi)(0) = phi(a)\
  delta_a (x) = delta(x-a)\
  -> integral delta(x-a) phi(x) dd(x) = phi(a)\
$

=== Lineare Variablensubstitution

$
  A in "GL"(n, RR)\
  (U_A f) (x) = f(A^(-1) x)\ 
$

Für $f, phi in cal(S)$:

$
  <U_A f, phi> = integral f(A^(-1) x) phi(x) dd(x)\
  =^(x=A z) integral f(z) phi(A z) abs(det(A)) dd(z)\
  = <f, abs(det(A)) U_A^(-1) phi>\
$

#definition[Definition][Lineare Variablensubstitution][
  $
    f in cal(S)' => U_A f in cal(S)'\
    <U_A f, phi> = <f, abs(det(A)) U_(A^(-1)) phi>\
  $
]

Bemerkung:

$
  phi |-> abs(det(A)) U_(A^(-1)) phi\
$
ist linear und stetig $=> cal(S)$.

Beispiel:

$
  <U_A delta(x), phi> = <delta, abs(det(A)) U_(A^(-1)) phi>\
  = abs(det(A)) phi(0)\
  => U_A delta(x) = abs(det(A)) delta\
  delta(A^(-1) x) = abs(det(A)) delta(x)\
$

Beispiel: Vorsichtig sein!
$
  A = 1/2 "auf" RR^n\
  delta(2x) = 2^(-n) delta(x)\
$

=== Multiplikation mit Glatten Funktionen

$
  g in cal(S) (RR^n) "oder" g "Polynom"\
  f in cal(S) (RR^n), phi in cal(S) (RR^n)\
  iprod(f g, phi) = integral f(x) g(x) phi(x) dd(x)\
  = iprod(f, g phi) in cal(S) (RR^n)\
$


#definition[Definition][Multiplikation mit Glatten Funktionen][
  $
    f in cal(S)' (RR^n), g in cal(S)' (RR^n)\
    phi |-> iprod(f, g phi)\
  $
]

Beispiel:

$
  iprod(g delta, phi) = iprod(delta, g phi)\
  = (g phi) (0) = g(0) phi(0) = iprod(g(0) delta, phi)\
  => g(x) delta(x) = g('0) delta(x)\
$

=== Ableitungen

$
  f in cal(S) (RR^n), phi in cal(S) (RR^n)\
  iprod(partial^n f, phi) = integral (partial^n f) (x) phi(x) dd(x)\
  "partielle Integration" = (-1)^n integral f(x) (partial^n phi) (x) dd(x)\
$

Wenn $f$ eine Distribution ist, dann kann ich die $alpha$-te Ableitung definieren als:

$
  <partial^alpha f, phi> = (-1)^abs(alpha) <f, partial^alpha phi>\
$

#definition[Definition][Ableitungen][
  Sei $f in cal(S)' (RR^n)$ und $alpha$ ein Multiindex. Dann ist die Ableitung $partial^alpha f$ definiert durch:
  $
    <partial^alpha f, phi> = (-1)^abs(alpha) <f, partial^alpha phi>\
  $
]

Man kann also Ableiten so viel wie man will...

Beispiel Heaviside-Funktion:
$
  Theta(x) = cases(1 "for" x>=0, 0 "for" x < 0)\
$

$Theta$ definiert eine Distribution mittels:

$
  iprod(Theta, phi) = integral_(0)^(infinity) phi(x) dd(x), phi in cal(S) (RR)\
$

Die Ableitung ist dann:

$
  phi in cal(S)\
  iprod(Theta', phi) = - iprod(Theta, phi')\
  = - integral_(0)^(infinity) phi'(x) dd(x)\
  = evaluated(phi(x))_(0)^(infinity)  = phi(0) = iprod(delta, phi)\
  => Theta' = delta\
$

$
  Theta(x_1) in cal(S)' (RR^n)\
  pdv(, x_2) omega = 0\
  pdv(, x_1) omega = delta(x_1)\
  "weil" iprod(delta(x), phi) = integral_(RR^(n-1)) phi(0, x_2,...) dd(x_2, ...)\
$

Beispiel:
$
  iprod(partial^alpha delta, phi) = (-1)^abs(alpha) (partial^alpha phi) (0)\
$

Beispiel Warnung!

$
  g(x) delta'(x) != g(0) delta'(x)\
  "sondern" g(x) delta'(x) = g(0) delta'(x) - g'(0) delta(x)\
$

Beispiel:

$
  laplace 1/(abs(x)) = -4 pi delta(x) "in" RR^3\
$

== Fouriertransformation

Wir können temperierte Distributionen fouriertransformieren.

#definition[Definition][
  Sei $f in cal(S)' (RR^n)$ und $phi in cal(S) (RR^n)$.
  Dann ist die Fouriertransformation von $f$ definiert durch:
  $
    hat(f) = cal(F) f in cal(S)' (RR^n)\
    = iprod(hat(f), phi) = iprod(f, hat(phi))\
    "und für" caron(f) = cal(F)^(-1) f
  $
]

Begründung:

$
  f in cal(S) (RR^n)\
  iprod(hat(f), phi) = integral.double e^(-i x k) f(x) dd(x) phi(x) dd(k)\
  = integral.double f(x) e^(-i x k) phi(k) dd(x) dd(k)\
  = integral f(x) hat(phi)(x) dd(x) = iprod(f, hat(phi))\
$

Beispiel:

$
  iprod(hat(delta), phi) = iprod(delta, hat(phi)) = hat(phi) (0) = integral phi(x) dd(x) = iprod(1, phi)\
  => hat(delta) = 1\
  integral delta(x) e^(-i x k) dd(x) = e^(0) = 1\
$

Was passiert aber wenn wir $1$ Fouriertransformieren?

$
  iprod(hat(1), phi) = integral 1 e^(-i x k) dd(x) = ???\
  = iprod(1, hat(phi)) = integral hat(phi)(x) dd(x) = integral e^(i x dot k) hat(phi) (k) dd(k)\
  = (2 pi)^n (cal(F)^(-1) hat(phi))(x) = (2 pi)^n iprod(delta, phi)\
  => hat(1) = (2 pi)^n delta\
$

#theorem[Satz][
  $
    cal(F), cal(F)^(-1): cal(S)' (RR^n) -> cal(S)' (RR^n)\
  $
  sind bijektive und inverse Abbildungen.
]

Beweis:

$
  omega in cal(S) (RR^n)\
  iprod(cal(F) cal(F)^(-1) omega, phi) = iprod(omega, cal(F) cal(F)^(-1) phi) = iprod(omega, phi)\
  => cal(F) cal(F)^(-1) omega = omega\
  => cal(F)^(-1) cal(F) omega = omega\
$

Beispiel:

$
  cal(F) (pdv(, k_j)omega) = i x_j cal(F) omega\
  omega in cal(S)' (RR^n)
$

== Faltung von Distributionen

Beispiel:

$
  K_t (x) = (4 pi t)^(-n/2) e^(-abs(x)^2/(4 t))\
  (K_t * f)(x) -> f(x) "für gute" f\
  "aber" K_t -> delta "dann"\
  => K_t * f -> delta * f = f
$

Wir wollen falten mit einer Funktion $g in cal(S)$. $f, phi in cal(S)$.

$
  iprod(g * f, phi) = integral.double g(x-y) f(y) dd(y) phi(x) dd(x)\
  = integral f(y) (integral g(x-y) phi(x) dd(x)) dd(y)\
  =integral f(y) (integral tilde(g) (y-x) phi(x) dd(x)) dd(y)\
  tilde(g) (z) = g(-z)\
  => = iprod(g, tilde(g) * phi)\ 
$

Was auch wahr ist:

$
  tilde(g) * phi in cal(S) (RR^n)\
$

#definition[Definition][Faltung][
  Sei $f, g in cal(S)' (RR^n)$ und $phi in cal(S) (RR^n)$.
  Dann ist die Faltung $f * g$ definiert durch:
  $
    <f * g, phi> = iprod(f, tilde(g) * phi)\
  $
  wobei $tilde(g) (z) = g(-z)$.\
  Ausserdem $g * f = f * g in cal(S)' (RR^n)$.
]

Damit kann man dann zeigen:

$
  omega_n ->^(cal(S)') omega, f in cal(S)\
  f * omega_n ->^(cal(S)') f * omega\
$

Konkteter Fall:

$
  omega_n = K_t\
  omega_n -> delta
  f * K_t -> f * delta\
$

Beispiel:

$
  "Behauptung" f * delta = f\
  "Physiker:" integral f(x -y) delta(y) dd(y)= f(x)\
  "Mathematiker:" "nehme" phi in cal(S)\
  iprod(f * delta, phi) = iprod(delta, tilde(f) * phi)\
  = (tilde(f) * phi)(0) = integral tilde(f) (0 - y) phi(y) dd(y)\
  = integral f(y) phi(y) dd(y) = iprod(f, phi)\
$

Übliche Rechenregeln von Falungen gelten auch für Distributionen.

== Poissongleichung

$
  laplace u = -4 pi rho in RR^3\
  laplace u = f in cal(S) (RR^3)\
  => u = cal(S)' (RR^3) "s.d" iprod(laplace u, phi) = iprod(f, phi)\
  = iprod(u, laplace phi)\
$
 
Wir werden später sehen, dass die lösende Distribution selbst eine glatte Funktion ist. Wir können also die Faltung benutzen um die Lösung zu finden. 

Wir nehmen an $f in cal(S)'$ z.B. $f = delta$.

#definition[Definition][Fundamentallösung][
  Sei $P = sum_(abs(a) <= m) a_alpha partial^alpha, a_alpha in CC$ mit konstanten Koeffizienten (z.B. $P = laplace$). Dann heisst $E in cal(S)' (RR^n)$ *Funcamentallösung* falls $P E = delta$.

  Nutzen:

  Wenn wir eine Fundamentallösung haben, können wir die Lösung (von z.B. der Poissongleichung) finden, durch Faltung mit der Fundamentallösung.
  $
    f in cal(S) (RR^n)\
    u = E * f in cal(S)' (RR^n)\
    P u = sum a_alpha partial^alpha (E * f)\
    = (sum a_alpha partial^alpha E) * f\
    = (P E) * f = delta * f = f\
    => P u = f\
  $
]

Wir wollen lösen: $laplace E = delta$. Also $laplace E = 0$ für $x != 0$.

Wir erinnern uns: $delta (R^(-1) x = abs(det(R)) delta (x)$. Aber falls $R$ Rotationsmatrix $= delta$. Laplaceoperator ist rotationsinvariant. Der Ansatz ist also, in Polarkoordinaten zu arbeiten.

$
  E = psi (abs(x)), x!=0\
  "Wollen" laplace psi(abs(x)) = 0 "für" x != 0\
$
Polarkoordinaten:
$
  laplace = pdv(, r, 2) + (n-1)/r pdv(, r) + 1/r^2 laplace_{SS^2}\
  -> psi''(r) + (n-1)/r psi' (r) = 0, r>0\
$

Lösung: (nicht-triviale)
$
  psi(r) = cases(c_n e^(-n+2) "for" n >= 3, c_2 log r "for" n = 2)\
$

Wir haben gute chancen, dass diese Lösung tatsächlich singulär ist.

#lemma[Lemma][E als Distribution][
  $
    iprod(E, phi) = integral psi(abs(x)) phi(x) dd(x)
  $
  definiert eine temperierte Distribution ($E in cal(S)' (RR^n)$).
]



Beweis:

$
  abs(integral psi(abs(x)) phi(x) dd(x))\
  = abs(integral psi(abs(x)) (1+x^2))^(-2) (1+x^2)^2 psi(x) dd(x) < infinity\
$

Also ist die Vorschrift eine temperierte Distribution.

Ziel: $laplace E = (dot) delta$

#theorem[Satz][Greensche Identität][
  Sei $D$ ein beschränktes, glatt berandetes Gebiet. Für uns ein Annulus. $D = {epsilon <= abs(x) <= R}$

  $
    u, v = C^2 "auf" D union partial D\
    => integral_D (u laplace v - u laplace v) dd(x)\
    = integral_(partial D) pdv(u, n) v - pdv(v, n) u dd(Omega(x))\
    "wobei" n(x) = "äussere Normale"\
    pdv(u, n) = n(x) dot grad u(x)\
  $
]

Beweis: (mit Divergenzsatz)

$
  integral_D sum_(j=1)^(n) pdv(, x_j) (pdv(, x_j) u v - u  pdv(, x_j) v) dd(x) = grad dot X\
  = integral_(partial D) X dot n(x) dd(Omega(x))\
  = integral_(partial D) sum_(j=1)^(n) n_j(x) (pdv(, x_j) u v - u  pdv(, x_j) v) dd(Omega(x))\
  = integral_(partial D) pdv(u, n) v - pdv(v, n) u dd(Omega(x))\
$

Volle Rechnung:

$
  phi in cal(S) (RR^n)\
  iprod(laplace E, phi) = iprod(E, laplace phi)\
  = integral psi(abs(x)) laplace phi(x) dd(x)\
  = lim_(epsilon->0, R-> infinity) (integral_(epsilon<= abs(x) <= R) psi(abs(x)) laplace phi(x) dd(x) - integral_(epsilon <= abs(x) <= R) laplace psi(abs(x)) phi(x) dd(x))\
  = lim_(epsilon->0, R-> infinity) integral_(partial D) psi(abs(x)) pdv(phi, n) (x) - pdv(psi, n) (x) phi(x) dd(Omega(x))\
  phi "fällt schnell ab, wenn" R-> infinity\
  => = lim_(epsilon->0) integral_(abs(x) = epsilon) psi(abs(x)) pdv(phi, n) (x) - pdv(psi, n) (x) phi(x) dd(Omega(x))\
$

+ Term:
  $
    psi(abs(x)) = c_n epsilon^(-n+2)\
    pdv(phi, n) (x) <= norm(phi)_1\
    => abs(integral_(abs(x) = epsilon) psi(abs(x)) pdv(phi, n) (x) dd(Omega(x))) <= abs(c_n) epsilon^(-n+2) norm(phi)_1 "Area"(abs(x) = epsilon)\
    = O(epsilon) ->^(epsilon->0) 0\
  $
+ Term:
  $
    pdv(psi, n) (abs(x)) = sum (-x_j/(abs(x))) pdv(, x_j) (c_n abs(x)^(-n+2))\
    = tilde(c_n) abs(x)^(-n+1), -tilde(c_n) = (-n + 2) c_n
    \
    => = integral_(abs(x) = epsilon) tilde(c_n) abs(x)^(-n+1) phi(x) dd(Omega(x))\
    phi(0) + (phi(x) - phi(0))\
    => = phi(0) integral_(abs(x) = epsilon) tilde(c_n) abs(x)^(-n+1) + O(epsilon) integral_(abs(x) = epsilon) tilde(c_n) abs(x)^(-n+1) dd(Omega(x))\
    ->^(epsilon->0) phi(0) tilde(c_n) "Area"(SS^(n-2))\
  $

#theorem[Satz][
  $
    E = cases(
      (Gamma(n/2)/(2 pi^(n/2) (n-2))) abs(x)^(2-n) "for" n >= 3,
      (1/(2 pi)) log abs(x) "for" n = 2
    )
  $
  Ist eine Fundamentallösung des Laplaceoperators in $RR^n$.
  $=> laplace E = delta$ in $cal(S)' (RR^n)$.
]

Beispiel (n=3):

$
  E = -1/(4 pi (abs(x)))
$

Falls $f in cal(S) (RR^n)$ dann:

$
  (E * f)(x) = -integral_(RR^3) f(y)/(4 pi abs(x-y)) dd(y)\
$

== Konstanten

Im Rahmen einer Distribution definieren wir eine konstante Distribution folgendermassen:

$
  iprod(1, phi) = integral 1 phi(x) dd(x)\
  => 1 in cal(S)' (RR)\
  iprod(dv(, x) 1, phi) = iprod(1, dv(, x) phi)\
  = -integral phi'(x) dd(x) 9 evaluated(- phi)_infinity^infinity = 0 = iprod(0, phi)\
  "weil" phi in cal(S) (RR)\
$

== Ableitung von Delta

$
  cal(F) delta' = cal(F)(dv(, x) delta) = i k cal(F) delta = i k\
  iprod(cal(F) delta', phi) = iprod(delta', cal(F) phi) = - iprod(delta, (cal(F) phi)) = -dv(,x) (cal(F) phi) (k) |_(k=0)\
  = integral e^(-i x k) i x phi(x) dd(x)|_(k=0)\
  = iprod(i x, phi)\  
$

== Differentialgleichung

Wenn wir eine Fundamentallösung haben, können wir darauf eine Fouriertransformation ausführen.

$
  cal(F)(P_u) ( k) = P(k) cal(F) u (k)\
  P(k) = sum a_alpha (i k)^(alpha)\
  => P E = delta "äquivalent" P(k) hat(E)(k) = hat(delta) (k) = 1\
$

Bemerkung:

Wenn $E in cal(S)' => hat(E) in cal(S)'$. Deshalb dürfen $hat(E)$ mit Polynomen $P(k)$ multiplizieren.

$
  => P(k) hat(E)(k) in cal(S)'\
$

Das Ziel ist also die Bestimmung von Fundamentallösungen durch Lösungen von $ P(k) hat(E) (k) = 1$ nach $hat(E) in cal(S)'$. Diese können wir dann zurücktransformieren und bekommen die Fundamentallösung $E = cal(F)^(-1) hat(E)$.

Beispiel:

$
  P = 1/i dv(,x), n=1\
  => E = i Theta\
  P(k) = k\
  "suchen" hat(E) in cal(S)' "mit" k hat(E) (k)= 1\
  => hat(E) (k) = 1/k "funktioniert leider nicht (zu singulär)"\
  "Für allgemeine Testfunktionen konvergiert nicht" integral phi(k)/k dd(k) -> infinity\
$

Strategie: Finden Lösung als Grenzwert von Lösungen von regularisierten Gleichungen:

== Regularisierung von $1/k$

Möglichkeit 1:

Setze für 
$
epsilon >0: iprod(u_epsilon , phi) = integral_(abs(k) > epsilon) phi(k)/k dd(k)
$
Dies ist wohldefiniert also Distribution.
$
  => u_epsilon in cal(S)' (RR)\
$

#lemma[Lemma][
  Sei $u_epsilon$ wie oben definiert. Dann konvergiert es in $cal(S)'$ gegen eine temperierte Distribution (principal value):
  $
    "p.v." 1/k in cal(S)' (RR)\
  $
]

Beweis:

$
  phi in cal(S) (RR)\
  iprod(u_epsilon, phi) = integral_(-infinity)^(- epsilon) phi(k)/k dd(k) + integral_(epsilon)^(infinity) phi(k)/k dd(k)\
  =integral_(epsilon)^(infinity) (phi(k) - phi(-k))/k dd(k)\
  "Mittelwertsatz" abs(phi(k) - phi(-k)) <= sup abs(grad(phi)) 2 abs(k)\
  => exists lim_(epsilon->0) iprod(u_epsilon, phi)\
  = integral_(0)^(infinity) (phi(k) - phi(-k))/k dd(k)\
$

Zu zeigen:

$
  iprod("p.v" 1/k, phi) = integral_(0)^(infinity) (phi(k) - phi(-k))/k dd(k)\
$

definiert eine temperierte Distribution.

$
  abs( integral_(0)^(infinity) (phi(k) - phi(-k))/k dd(k))\
  <= abs( integral_(0)^(1) 1/k abs(phi(k) - phi(-k)) dd(k)) + integral_1^(infinity) 1/k (abs(phi (k)) + abs(phi(-k))) dd(k)\
  <= integral_0^1 2 norm(phi)_1 dd(k) + integral_1^(infinity) 1/k^2 (k abs(phi(k)) + k abs(phi(-k))) dd(k)\
  <= C norm(phi)_1 + 2 norm(phi)_1 
$

Somit ist die Vorschrift eine temperierte Distribution.

Verbleibt:

+ $k dot "p.v. 1/k" = 1$?
+ $cal(F)^(-1) ("p.v." 1/k)$=

$
  iprod(k dot "p.v." 1/k, phi) = iprod("p.v." 1/k, k phi)\
  = integral_(0)^(infinity) (k phi(k) - (-k) phi(-k))/k dd(k)\
  = integral_(0)^(infinity) (phi(k) + phi(-k)) dd(k)\
  = integral_(-infinity)^(infinity) phi(k) dd(k)\
  = iprod(1, phi)\ 
$

2:

$
  cal(F)^(-1) ("p.v." 1/k) = i 1/2 sgn(k) = i(theta -1/2) 
$

Möglichkeit 2:

$
  (k + i epsilon) u_epsilon = 1\
  => u_epsilon (k) = 1/(k + i epsilon), epsilon > 0\
  => u_epsilon in cal(S)' (RR)\
$

#lemma[Lemma][Plemelj Formel][
  Sei $u_epsilon$ wie oben definiert. Dann konvergiert es in $cal(S)'$ gegen eine temperierte Distribution $1/(l + i 0) in cal(S)'$:
  $
    1/(k plus.minus i 0) = "p.v." 1/k minus.plus i pi delta in cal(S)' (RR)\
  $
]

Beweis:

$
  1/(k plus.minus i epsilon) = (k minus.plus i epsilon)/(k^2 + epsilon^2)\
  = k/(k^2 epsilon^2) minus.plus i epsilon/(k^2 epsilon^2)\
  => f(k) = 1/pi 1/(k^2 + 1)\
  integral_(-infinity)^(infinity) f(k) dd(k) = 1\
  f_j (k) = j f(j k) -> delta(k)\
  j=1/epsilon. 1/epsilon f(k/epsilon) = 1/pi epsilon^(-1)/((k/epsilon)^2 + 1)\
  = 1/pi epsilon/(k^2 + epsilon^2)\
  "Auch" => "Differenz:" integral k/(k^2 + epsilon^2) phi(k) dd(k)\
  = integral_0^(infinity) k/(k^2 epsilon^2) (phi(k) - phi(-k)) dd(k)\
  "und" integral_0^(infinity) (phi(k) - phi(-k))/k dd(k)\
  => abs("Differenz") = abs(integral_0^(infinity) (k/(k^2 + epsilon^2) - 1/k) (phi(k) - phi(-k)) dd(k)) ->^("z.z.") 0\
  <= integral_0^1 abs(k/(k^2 + epsilon^2)-1/k) 2 k norm(phi)_1 dd(k) + integral_1^infinity abs(k/(k^2 + epsilon^2)-1/k) 2 norm(phi)_0 dd(k)\
  1: abs(k/(k^2 + epsilon^2)-1/k) k\
  = epsilon^2/(k^2 + epsilon^2) ->_(epsilon->0) 0\
  2: abs(k/(k^2 + epsilon^2)-1/k) = 1/k epsilon^2/(k^2 + epsilon^2) <= 1/k^3 epsilon^2 ->^(epsilon ->0) 0
$

Weiter gilt:

$
  k 1/(k plus.minus i 0) = 1 in cal(S)'
$

Also haben wir $1/k$ als Distribution definiert.

$
  cal(F)^(-1) (1/(k - i o)) = i Theta\
  cal(F)^(-1) (1/(k + i o)) = i (Theta-1)\
$

Beweis:

$
  cal(F) Theta =?\
  Theta(x) = lim_(epsilon->0) e^(-epsilon x) Theta(x)\
$

Es gilt:

$
  e^(-epsilon x) Theta(x) ->_(epsilon -> 0)^(cal(S)') Theta(x) in cal(S)'\
$

$
  => cal(F) e^(-epsilon x) Theta(x) ->_(epsilon -> 0)^(cal(S)') cal(F) Theta(x)\
  => iprod(Theta, cal(S) phi) = iprod(cal(F) Theta, phi)\
  => cal(F) (e^(-epsilon x) Theta(x)) = integral_0^(infinity) e^(- i x k) e^(-epsilon x) dd(x)\
  = integral_0^(infinity) e^-(epsilon + i k)x dd(x)\
  = 1/(epsilon + i k) = (-i)/(k - i epsilon)\
  => cal(F) Theta = lim (-i)/(k - i epsilon) = -i 1/(k - i 0)
$

Welche Fundamentallösung will man?

$
  P = dv(,x) -> Theta,  Theta-1, Theta+C...
$

Wir wollen Lösen:

$
  P u = f => u' = f => u(x) = c + integral_(-infinity)^x f(x') dd(x')\
  u = f * E\
  => E = Theta + c -> u(x) = integral f(y) E(x-y) dd(y)\
  = integral f(y) (Theta(x-y) + c) dd(y)\
  = c integral_(infinity)^infinity f(y) dd(y) = integral_(-infinity)^infinity f(y) Theta(x-y) dd(y)\
  = c integral f(y) dd(y) + integral_(-infinity)^x f(y) dd(y)\
  (c=0) => u_0(x) = integral_(-infinity)^x f(y) dd(y)\
  (c=-1) => u_(-1) (x) = - integral_x^(infinity) f(y) dd(y)\

$

Wir sehen also, dass verschiedene Fundamentallösungen uns verschiedene Lösung der Gleichung produzieren.


Beispiel:

$
  P = -dv(,x,2) + mu^2\
  P(k) = -(i k)^2 mu^2 = k^2 + mu^2\
  1/(k^2 mu^2) in cal(S)'\
  E = cal(F)^(-1) 1/(k^2 + mu^2) (x)\
  = 1/(2 pi) integral (e^(i k x))/(k^2 mu^2) dd(k)\
  "Residuensatz"\
  x > 0 => E (x) = 1/(2 pi) 2 pi i Res_(k = i mu) (e^(i k x)/(k^2 mu^2) = 1/(2 mu) e^(-mu x)\
  x < 0 => E (x) = 1/(2 mu) e^(mu x)\
  => E(x) = 1/(2 mu) e^(-mu abs(x))\
$

Beispiel:

$
  P = -laplace "in" RR^3\
  P(k) = abs(k)^2\
  E = cal(F)^(-1) (1/abs(k)^2)
$

In $n=3$ ist $1/abs(k)^2 in cal(S)' (RR^3)$.

$
  cal(F)^(-1) (1/abs(k)^2) = lim cal(F)^(-1) ((e^(-epsilon abs(k)^2))/(abs(k)^2))\
  "Polarkoordinaten..."\
  ... = 1/(2 pi)^2 1/abs(x) 2 arctan(abs(x)/epsilon)\
  = 1/(4 pi abs(x)) 
$

Zusammenfassend: Die Fouriertransformation von $Theta -> e^(-epsilon x) Theta(x)$ konvergiert gegen $cal(F) Theta$. Das ist eine Regularisierung.


== $cal(F)$ auf $cal(S)'$ vs Integral

$
  u in cal(S) (RR^n) -> omega_u in cal(S)' (RR^n)\
  "entweder" hat(omega_u) in cal(S)' (RR^n)\
  "oder" hat(u)(xi), xi in RR^n\
  => phi in cal(S) (RR^n)\
  => iprod(hat(omega_u), phi) = iprod(omega_u, hat(phi))\
  = integral u(x) hat(phi)(x) dd(x)\
  = integral.double u(x) phi(xi) e^(-i x xi) dd(xi) dd(x)\
  = integral hat(u)(xi) phi(xi) dd(xi)\
  = iprod(omega_(hat(u)), phi)\
  => hat(omega_u) = omega_(hat(u))\
$

Allgemeiner:

$
  u in L^1 (RR^n) -> omega_u in cal(S)' (RR^n)\
  => iprod(omega_u, phi) = integral u(x) phi(x) dd(x)\
  "dann" hat(u) (xi), hat(u) in C^0 (RR^n), abs(hat(u)) -> 0\
  -> iprod(omega_(hat(u)), phi) = integral hat(u) (xi) phi(xi) dd(xi) < infinity\
$

Man kann also beide Operationen vertauschen:

$
  hat(omega_u) = omega_(hat(u))\
  forall phi in cal(S) (RR^n): integral u(x) hat(phi)(x) dd(x) = integral hat(u)(xi) phi(xi) dd(xi)\
$

Dann gilt:

+ $
    norm(u_j - u)_(L^1) -> 0\
  $

+ $
    sup_(epsilon in RR^n) abs(hat(u_j)(xi) - hat(u)(xi)) -> 0\
$

$
  integral u(x) hat(phi)(x) dd(x) - integral u_j (x) hat(phi)(x) dd(x) <= integral abs(u_j (x) - u(x)) abs(hat(phi)(x)) dd(x)\
  <= norm(u_j - u)_(L^1) norm(hat(phi))_0 -> 0\
  "und auch" integral hat(u) (xi) phi(xi) dd(xi) - integral hat(u_j) (xi) phi(xi) dd(xi)\
  <= integral abs(hat(u_j) (xi) - hat(u) (xi)) abs(phi(xi)) dd(xi) <= sup(abs(hat(u_j) (xi) - hat(u) (xi))) integral abs(phi(xi)) dd(xi) - 0\
  =>lim_(j -> infinity) integral u_j(x) hat(phi)(x) dd(x) = integral u(x) hat(phi)(x) dd(x) -> integral hat(u)(xi) phi(xi) dd(xi)\
$

Beispiel:

$
  u(x) = e^(-epsilon x) Theta(x) in L^1\
  => cal(F) omega_u(x) = omega_(hat(u))(xi) = integral e^(-i x xi) e^(-epsilon x) Theta(x) dd(x)\
$

== Retardierte Fundamentallösung vom Wellenoperator $square$

$
  square = pdv(, t, 2) - laplace\
$

$
  P = - pdv(, x_0, 2) + pdv(, x_1, 2) + pdv(, x_2, 2) + pdv(, x_3, 2)\
$

Dafür wollen wir eine Fundamentallösung finden.

$
  P E = delta -> P (k) hat(E) (k) = 1\
  P (k) = k_0^2 - k_1^2 - k_2^2 - k_3^2\
  = k_0^2 - abs(arrow(k)^2)\
$

Am Lichtkegel verschwindet $hat(P) (k) = 0$. Also müssen wir Regularisieren wenn wir dadurch teilen möchten.

Also $1/(P(k))$ durch Regularisierung:

$
  u_epsilon (k) = ((k_0 - i epsilon)^2 - abs(arrow(k)^2))^(-1)\
  = (k_0^2 - epsilon^2 - abs(arrow(k)^2) - 2 i epsilon k_0))^(-1)\
  "falls" 2 i epsilon k_0 = 0 => k_0 = 0 => k_0^2 - epsilon^2 - abs(arrow(k)^2) <= - epsilon^2\
  => u_epsilon "beschränkte" => u_epsilon in cal(S)' (RR^4)\ 
$

Dann können wir den Grenzwert bilden:

$
  exists lim_(epsilon -> 0) u_epsilon (k) = hat(E) (k)\
$

Da $u_epsilon$ nicht integrierbar ist, brauchen wir einen weiteren konvergenzerzeugenden Faktor:

$
  E_(epsilon,  epsilon') = (2 pi)^(-4) integral (e^(- epsilon abs(arrow(k))^2 e^(i arrow(k) dot arrow(x) e^(i k_0 x_0)))/((k_0 - i epsilon)^2 - abs(arrow(k))^2) dd(k)\
$

Werten zuerst $k_0$ Integral aus:

$
  integral_RR e^(-i k_0 x_0)/((k_0 - i epsilon)^2 - abs(arrow(k))^2) dd(k_0)\

$

Für $x_0 > 0$ schliessen wir die Kontur in oberer Halbebene. Pol bei $k_0 = plus.minus abs(arrow(k)) + i epsilon$

Für x_0 < 0 schliessen wir die Kontur in unterer Halbebene. Kein Pol, deswegen $=0$.

$
  => E_(epsilon, epsilon') = cases((2 pi)^(-4) 2 pi i integral e^(- epsilon' abs(arrow(k))^2) e^(i arrow(k) dot arrow(x))  e^(- epsilon x_0)\
   dot (- (e^(i abs(arrow(k) x_0) - e^(-i abs(arrow(k)) x_0)))/(2 i abs(arrow(k)))) dd(k) "for" x_0 > 0, 0 "for" x_0 < 0)\
  = ... = (e^(- epsilon x_0))/(4 pi abs(arrow(x)) )(delta_(epsilon')(x_0 - abs(x)) + delta_(epsilon')(x_0 + abs(x))\
  delta_(epsilon') (y) = (e pi epsilon')^(-1/2) e^(-y^2/(4 epsilon')) ->^(epsilon', epsilon -> 0) 1/(4 pi abs(arrow(x))) delta(x_0 - abs(x))\
  = E 
$

$E$ ist genau die retardierte Fundamentallösung des Wellenoperators.

#theorem[Satz][Lösung des Wellenoperators][
  $
    square u = f in cal(S) (RR^4)\
    u = E * f\
    u(x_0, arrow(x)) = integral_(RR^3) 1/(4 pi abs(arrow(x - x'))) f(x_0 - abs(arrow(x - x')), arrow(x')) dd(x')\ 
  $
  Falls $f=0$ für $t < t_0 => u = 0$ für $t < t_0$
]

= Harmonische Funktionen und das Dirichletproblem

$
  u: D subset RR^n -> CC "harmonisch falls"\
  laplace u(x) = 0 "in" D\
$

Beispiel:

$
  u(x) = x_1\
  u(r, theta, phi) = r^l Y_(l, m) (theta, phi)\
  u(x_1, x_2) = Re v(x_1 + i x_2), v(z) "holomorph"\
$

== Randwertproblem

$D$ glatt berandet. 

Beispiel: $D 0 B_R (0) subset RR^n$.

#definition[Definition][
  Dirichletproblem][
  Sei $D$ ein beschränktes, glatt berandetes Gebiet. Dann heisst $u$ eine Lösung des Dirichletproblems für die harmonische Funktion $u$ in $D$ mit Randwert $f$ auf $partial D$ falls:
  $
    laplace u (x) = 0 "in" D\
    u(x) = f(x) "auf" partial D\
    f = "Randspannung"\
    u = "Potential"\ 
  $
  
]

#definition[Definition][
  Neumannproblem][
  Sei $D$ ein beschränktes, glatt berandetes Gebiet. Dann heisst $u$ eine Lösung des Neumannproblems für die harmonische Funktion $u$ in $D$ mit Randwert $f$ auf $partial D$ falls:
  $
    laplace u (x) = 0 "in" D\
    pdv(u, n) (x) = f(x) "auf" partial D\
    f = "Randspannung"\
    u = "Potential"\
  $
]

#theorem[Satz][Existenz, Eindeutigkeit und Lösung][
  $
    "Sei" u_1, u_2 "Lösungen mit" f\
    => u_1 = u_2\ 
    => 0 <= integral_D abs(laplace u)^2 dd(x) = integral_D sum_(j=1)^(n) (pdv(, x_j) u(x))^2 dd(x)\
    = integral_D sum_(j=1)^(n) pdv(, x_j) (u pdv(, x_j) u) - u pdv(, x_j, 2) u dd(x)\
    "Divegenzsatz"\
    = integral_(partial D) sum u pdv(, x_j) u dot n_j(x) dd(Omega(x)) "Zweiter Term = 0"\
    = 0
    => integral_D abs(laplace u)^2 dd(x) = 0 => laplace u = 0 => u = "konst" = 0\
  $
]

#theorem[Satz][
  $D$ beschränkt, glatt beranded, $f$ stetig auf $partial D$, existiert eine eindeutige Lösung $u$ des Dirichletproblems für $f$ in $D$.
  $
    u in C^2 (D) inter C^0 (overline(D))\
  $
]

Wie erhält man $u$ aus $f$? Beispielhalft für $D = B_R (0)$

Fundamentallösung von $laplace: laplace E = delta$:

$
  E(x) = cases(c_n abs(x)^(-n+2) "for" n >= 3, c_2 log abs(x) "for" n = 2)\
  => u(x) = integral E(x-y) laplace u(y) dd(y)\
  = E * laplace u = laplace(E * u) = laplace E * u = delta * u = u\ 
$


#lemma[Lemma][
  Sei $u in C^2 (overline(D))$. Dann $forall x in D$:
  $
    u(x) = integral_D E(x-y) laplace u(y) dd(y) - integral_(partial D) E(x-y) pdv(u, n) (y)\
    - pdv(E, n) (x-y) u(y) dd(Omega(y))\ 
  $
]

Beweis:

$
  integral_D E(x-y) laplace u (y) dd(y) = lim integral_(D\\B_epsilon (x)) E(x-y) laplace u(y) dd(y)\
  = lim integral_(partial(D\\B_epsilon (x)))) E(x-y) pdv(u, n) (y) - pdv(E, n) (x-y) u(y) dd(Omega(y))\
  = ... "Green"\
   => u(x) = integral_D E(x-y) laplace u(y) dd(y) - integral_(partial D) E(x-y) pdv(u, n) (y)\
    - pdv(E, n) (x-y) u(y) dd(Omega(y))\
$

Man kommt auf den Ansatz mit einem Lagrangefunktional:

$
  L[u] = 1/2 integral_D (abs(grad u)^2 dd(x)\
  dv(, epsilon) L [u + epsilon v] |_(epsilon = 0) = dv(, epsilon)|_(epsilon = 0) 1/2 integral_D (...) dd(x)\
  = integral_D (grad u dot grad v) dd(x)\
  = - integral_D v laplace u dd(x)\
  u = "krit. Punkte" => laplace u = 0 "auf" D, u|_(partial D) = f "auf" partial D\
$

In dieser Formulierung brauchen wir aber noch die Normalenableitung. Um diese Information nicht zu brauchen, ersetzen wir $E$ durch eine Funktion $G(y,x)$, sodass 

$
  laplace_x G = delta_y\
  G = 0 forall x in partial D\
$

#definition[Definition][Greenfunktion][
  Sei $D$ offen, glatt beranded. Eine glatte Funktion $G(y,x)$ auf $overline(D) crossproduct overline(D)\\{x=y}$ heisst Greensche Funktion für $D$ falls:
  $
    G(y,x) = E(x-y) + v(y,x)\
    "wobei" laplace_x v(y,x) = 0, v "glatt auf" D\
    G(y,x) = 0 "für" x in partial D, y in D\
  $
  Diese Funktion ist eindeutig bis auf eine konstante Funktion $C(y)$, die nur von $y$ abhängt.
]

#theorem[Satz][Existenz und Eindeutigkeit][
  Ist $G$ einer Greensche Funktion, dann gilt für $u$ mit $laplace u = 0 in D$ folgendes:

  $
    u(x) = integral_(partial D) pdv(G, n_y) (y,x) f(y) dd(Omega(y))\
  $
]   


== Greensche Funktion für den Ball $D = B_R (0)$

$
  n>= 3\
  G(y,x) = E(x-y)\
  - "harmonisch für" x in D "und Randwerte" = E(x-y)\
$

Trick (Method of Images):

Inversion an der Sphäre $partial B_R (0)$:

$
  "Für" y in D : y* = R^2 y/abs(y)^2\
  y** = y\
  abs(x)/(abs(y)) = abs(x-y*)/abs(y - x*)\
$

Behauptung:

$
  G(y,x) = E(x-y) - (abs(y)/R)^(-n+2) E(x-y*)\
$

ist die Greensche Funktion für $D = B_R (0)$.

Beweis:

+ $
    y in D => y* in.not D\
    laplace_x E(x-y*) = 0 forall x in D\
    => v(y,x) = -(abs(y)/R)^(-n+2) E(x-y*) "harmonisch" forall x in D\
  $

+ $
    abs(x-y)^(-n+2) - (abs(y)/R)^(-n+2) abs(x-y*)^(-n+2) = 0??\
    abs(x-y) = abs(y)/R abs(x-y*) = abs(y)/abs(x) abs(x-y*) = abs(x*-y)
  $

Mit dieser Formel folgt:

#theorem[Satz][Poisson-Formel für $n>=2$][
  Sei $D = B_R (0)$, $f$ stetig auf $partial D$, dann ist $u$ die Lösung des Dirichletproblems für $f$ in $D$ gegeben durch:
  $
    u(x) = integral_(abs(y) = R) H(y,x) f(y) dd(Omega(y))\
    H(y,x) = pdv(G, n_y) (y,x)|_(abs(y) = R) = 1/(omega_n R) (R^2 - abs(x)^2)/(abs(x-y)^n)\
    omega_n = "oberfläche von" SS^(n-1)\
  $
] 

#theorem[Satz][Mittelwertprinzip][
  Sei $u$ harmonisch auf offener Menge $D$. Sei $B_R (x_0) subset D$ ekne Kugel. Dann gilt:
  $
    u(x_0) = 1/(omega_n R^n) integral_(B_R (x_0)) u(y) dd(y)\
    omega_n = "oberfläche von" SS^(n-1)\
  $
  Der Wert am Mittelpunkt einer Kugel ist der Mittelwert der Werte auf der Kugeloberfläche.
]

#theorem[Satz][Maximumprinzip][
  Sei $u$ harmonisch auf offenem zusammenhängendem Gebiet $D$. Dann gilt:
  $
    u(x) <= max_(partial D) u(y) "für" x in D\
    u(x) >= min_(partial D) u(y) "für" x in D\
  $
]


