#import "lib.typ": *
#show: frame-style(styles.boxy)




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
