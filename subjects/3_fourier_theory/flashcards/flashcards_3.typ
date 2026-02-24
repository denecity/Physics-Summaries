#import "../../../lib/setup_flashcards.typ": flashcard, flashcard-setup, render-flashcards
#import "../../../lib/lib.typ": *

#show: flashcard-setup(
  card-width: 9cm,
  card-height: 5.5cm,
  margin: 0cm,
  show-cut-lines: true,
  topic: "Fourier",
)

#let white = rgb("#ffffff") // Fourier Series

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f: RR-> CC$ eine 1-periodische stetig diffbare function, deren fouriercoeffs erfüllen $abs(f_n) <= 1/(1+n^2)$. Konvergiert die fourierreihe von $f$ gleichmässig
  ],
  answer: [
    Ja, 
    
    da die fouriercoeffs schneller als $1/n$ konvergieren, konvergiert die fourierreihe von $f$ gleichmässig.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Welche der folgenden Aussagen ist richtig:

    + Ist $f in L^2(RR)$, so ist $hat(f)$ stetig.
    + Ist $f in L^1(RR) inter L^2(RR)$, so ist $hat(f)$ stetig mit $integral abs(hat(f))^2 dd(k) < oo$
    + Ist $f in L^1(RR)$, so ist $integral abs(hat(f)) dd(k) < oo$
  ],
  answer: [
    2: Kombination aus Riemann-Lebesgue-Lemma (stetigkeit) und Plancherel-Theorem ($L^2$-Norm Erhaltung).
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f:RR -> RR$ eine reele, gerade, $2 pi$ periodische function, Welche aussage über die Fourierkoeffizienten von $f$ ist richtig?

    + alle $f_n$ reell
    + $f_n= 0$ für alle ungeraden $n$
    + $f_(n) = overline(f_n)$
    + $f_n = f_(-n)$
  ],
  answer: [
    2: Gegenbeispiel: $f(x) = 2 cos(x)$
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Betrachte Wärmeleitgleichung $u_t = u_(x x)$ auf dem Ring $x in RR\/2 pi ZZ$. Das anfangsdatum $f in cal(C)^2 (RR\/2 pi ZZ)$ erfülle $integral_0^(2pi) f(x) dd(x) = 1$. Gilt dann auch $integral_0^(2pi) u(x,t) dd(x) = 1$ für alle $t > 0$?
  ],
  answer: [
    Ja, 
    
    da die Wärmeleitgleichung die Gesamtenergie (Integral) erhält. Das integral berechnet den 0-ten Fourierkoeffizienten, welcher konstant bleibt.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Wir betrachten Wellengleichung $u_(t t) - u_(x x)- u_(y y) - u_(z z) = 0$ auf $1+3$ Dimensionen. Angenommen die anfangsdaten $u(0, ax)$ und $u_t(0, ax)$ sind undabhängig von $x,y$. Ist dann auch die Lösung $u(t, ax)$ unabhängig von $x,y$?
  ],
  answer: [
    Ja, 
    
    denn die Wellengleichung erhält die Symmetrie der Anfangsdaten. Wenn die Anfangsdaten unabhängig von $x$ und $y$ sind, dann bleibt die Lösung auch unabhängig von $x$ und $y$ für alle Zeiten.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für welche $f(x)$ besitzt die Wärmeleitgleichung auf dem Ring $x in RR\/2 pi ZZ$, welche $u(0,x) = f(x)$ erfüllt, KEINE stetige Lösung $u(t,x)$ für alle $t in RR$?

    + $f(x) = x(2 pi - x)$ für $x in [0, 2 pi)$ fortgesetzt periodisch
    + $f(x) = cos(x)$

  ],
  answer: [
    1: Die Funktion ist nicht glatt an $x = 0, 2pi$. Nun ist aber $u(0, x)$ die Lösung zum zeitpunkt $t = 0$, der Wärmeleitgleichung mit stetigen Anfangsbedingungen $u(-1, x)$. Lösungen der Wellengleichung sind aber unmittelbar nach $t = 0$ glatt.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Wir schreiben $Psi_n in cal(S) (RR), n in NN_0$, für die normierten Hermitefunktionen, also $(Psi_n, Psi_n) = 1$, wobei $(f, g) = integral overline(f) g dd(x)$. Welche der folgenden Aussagen ist richtig?

    + Ist $f in L^2 (RR)$, so gilt $sum_(n=0)^oo abs((f, Psi_n)) < oo$
    + Ist $f in cal(S) (RR)$, so existiert ein $k$, sodass $(f, Psi_n) = 0$ für alle $n > k$
    + Ist $f in L^2 (RR)$, so gilt $sum_(n=0)^oo abs((f, Psi_n))^2 < oo$
  ],
  answer: [
    3: Nach Plancherel-Theorem gilt $sum_(n=0)^oo abs((f, Psi_n))^2 = (f, f) < oo$ für alle $f in L^2(RR)$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Welche der folgenden Funktionen ist KEINE Fundamentallösung von $dv(, x)$:

    + $Theta(x)$ (Heaviside-Funktion)
    + $-Theta(x) +2025$
    + $-Theta(-x)$
  ],
  answer: [
    2: Weil die ableitung von $-Theta(x) + 2025$ gleich $-delta(x)$ ist, also nicht die gewünschte Fundamentallösung.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Es seien $P_l (x), l in NN_0, x in [-1, 1]$, die Legendre-Polynome. Welche Aussage ist FALSCH?

    + $integral_m1^1 P_5 (x) dd(x) = 0$
    + $integral_m1^1 P_10 (x) P_5^2 (x) dd(x) = 0$
    + $integral_m1^1 P_2025 (x) x^2024 dd(x) = 0$
  ],
  answer: [
    2: Die Legendre-Polynome von Grad bis $l$ bilden eine Orthonormalbasis von $L^2([-1, 1])$. Das Polynom $P_5^2$ hat Grad 10, also ist $P_10$ nicht orthogonal zu $P_5^2$. 
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $sum_(n in ZZ) c_n e^(i n x)$ die Fourierreihe der $2 pi$-periodischen Funktion $f(x) = (sin x + sin 3x)^2$. Gilt: $c_n = c_(-n)$ für alle $n in ZZ$?
  ],
  answer: [
    Wahr

    Reasoning: $f$ is real and even, so Fourier coefficients satisfy $c_n = c_-n$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $sum_(n in ZZ) c_n e^(i n x)$ die Fourierreihe der $2 pi$-periodischen Funktion $f(x) = (sin x + sin 3x)^2$. Gilt: $c_n = 0$ für alle $n < 0$.
  ],
  answer: [
    Falsch
    
    a real even function has symmetric coefficients; negative indices are not all zero.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $sum_(n in ZZ) c_n e^(i n x)$ die Fourierreihe der $2 pi$-periodischen Funktion $f(x) = (sin x + sin 3x)^2$. Gilt: $c_n = 0$ für alle auÃŸer endlich viele $n in ZZ$.
  ],
  answer: [
    Wahr

    $(sin x + sin 3x)^2$ is a trigonometric polynomial, so only finitely many $c_n$ are nonzero.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $sum_(n in ZZ) c_n e^(i n x)$ die Fourierreihe der $2 pi$-periodischen Funktion $f(x) = (sin x + sin 3x)^2$. Gilt: $c_0 = 0$.
  ],
  answer: [
    Falsch
    
    $f(x) >= 0$ and not identically zero, so the average $(c_0)$ is $> 0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für die Kugelfunktionen $Y_(ell m)(theta, phi)$ gilt: $Y_(ell 0)(theta, phi)$ ist unabhängig von $phi$.
  ],
  answer: [
    Wahr

    Reasoning: $m = 0$ spherical harmonics are independent of phi by definition.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für die Kugelfunktionen $Y_(ell m)(theta, phi)$ gilt: $Delta_(S^2) Y_(ell ell)(theta, phi) = 0$ für alle $ell >= 0$?
  ],
  answer: [
    Falsch

    $Delta_(S 2) Y_(l m) = -l(l+1) Y_(l m)$, so it is zero only for $l = 0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für die Kugelfunktionen $Y_(ell m)(theta, phi)$ gilt: $integral_(S^2) Y_(ell m)(theta, phi) sin theta dd(theta) dd(phi) = 0$ für alle $ell >= 1$ und alle $m in { -ell, dots, ell }$?
  ],
  answer: [
    Wahr

    $Y_(l m)$ is orthogonal to constants for $l >= 1$, so the integral over $S^2$ is $0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für die Kugelfunktionen $Y_(ell m)(theta, phi)$ gilt: $r^ell Y_(ell m)(theta, phi)$ ist (in Kugelkoordinaten) der Ausdruck eines Polynoms $P_(ell m)(x, y, z)$?
  ],
  answer: [
    Wahr

    $r^l Y_{l m}$ is a homogeneous harmonic polynomial in $x, y, z$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für die Dirac-Distribution $delta in S'(RR)$ und ihre Ableitungen gilt: $x^3 delta''(x) = 0$?
  ],
  answer: [
    Wahr

    Multiplication by $x^3$ kills distributions supported at $0$ of order $<= 2$, so $x^3 delta'' = 0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für die Dirac-Distribution $delta in S'(RR)$ und ihre Ableitungen gilt: $3 delta(3x + 1) = delta(x + 1/3)$?
  ],
  answer: [
    Wahr

    Scaling rule: $delta(a x + b) = 1/|a| delta(x + b/a)$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für die Dirac-Distribution $delta in S'(RR)$ und ihre Ableitungen gilt: $x delta'(x) + delta(x) = 0$?
  ],
  answer: [
    Wahr

    Identity $x delta' = -delta$ gives $x delta' + delta = 0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für die Dirac-Distribution $delta in S'(RR)$ und ihre Ableitungen gilt: Es gibt keine Distribution $F in S'(RR)$ so dass $F' = delta$?
  ],
  answer: [
    Falsch

    Heaviside $H$ satisfies $H' = delta$, so such $F$ exists.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für alle $f in L^1(RR^n)$ gilt: $hat(f)$ ist stetig?
  ],
  answer: [
    Wahr

    Fourier transform maps $L^1$ to bounded continuous functions (Riemann-Lebesgue).
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für alle $f in L^1(RR^n)$ gilt: $hat(f)$ ist $2 pi$-periodisch?
  ],
  answer: [
    Falsch

    Fourier transform on $RR^n$ is not periodic in general.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für alle $f in L^1(RR^n)$ gilt: $lim_(|k| -> oo) hat(f)(k) = oo$.
  ],
  answer: [
    Falsch

    Riemann-Lebesgue gives $hat(f)(k) -> 0$, not infinity.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für alle $f in L^1(RR^n)$ gilt: $integral_(RR^n) f(x) dd(x) = lim_(R -> oo) integral_(|x| <= R) f(x) dd(x)$.
  ],
  answer: [
    Wahr

    For $f in L^1$ the improper integral equals the limit over balls.
  ],
)



#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Fuer alle Loesungen $u in C^2(RR_(>=0) times RR^3)$ der Wellengleichung $c^2 u_(t t) - u_(x x) - u_(y y) - u_(z z) = 0$ mit $c > 0$ gilt: Falls $u(0, x) = 0$ und $u_t(0, x) = 0$ fuer alle $x in RR^3$, dann ist $u(t, x) = 0$ fuer alle $t >= 0$ und $x in RR^3$.
  ],
  answer: [
    Wahr

    Uniqueness of the wave equation Cauchy problem gives $u = 0$ for zero data.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Fuer alle Loesungen $u in C^2(RR_(>=0) times RR^3)$ der Wellengleichung $c^2 u_(t t) - u_(x x) - u_(y y) - u_(z z) = 0$ mit $c > 0$ gilt: Falls $u(t, x, y, 0) = 0$ und $u_t(t, x, y, 0) = 0$ fuer alle $(t, x, y) in RR_(>=0) times RR^2$, dann ist $u(t, x, y, z) = 0$ fuer alle $(t, x, y, z) in RR_(>=0) times RR^3$.
  ],
  answer: [
    Falsch

    Vanishing on a plane is not enough for uniqueness; nontrivial solutions exist.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Fuer alle Loesungen $u in C^2(RR_(>=0) times RR^3)$ der Wellengleichung $c^2 u_(t t) - u_(x x) - u_(y y) - u_(z z) = 0$ mit $c > 0$ gilt: Ist $u(0, x) = 0$ und $u_t(0, x) = 0$ fuer $|x| >= 1$, so ist $u(t, x) = 0$ fuer $t >= 0$ und $|x| >= 1 + c t$.
  ],
  answer: [
    Wahr

    Finite speed of propagation prevents influence outside $|x| >= 1 + c t$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Fuer alle Loesungen $u in C^2(RR_(>=0) times RR^3)$ der Wellengleichung $c^2 u_(t t) - u_(x x) - u_(y y) - u_(z z) = 0$ mit $c > 0$ gilt: Ist $u(0, x) = 0$ und $u_t(0, x) = 0$ fuer $|x| <= 1$, so ist $u(t, x) = 0$ fuer $t >= 0$ und $|x| <= 1 - c t$.
  ],
  answer: [
    Wahr

    Domain of dependence gives vanishing inside the backward cone $|x| <= 1 - c t$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Fuer alle $f in L^2(RR)$ gilt: Ist $f$ stetig differenzierbar, so ist auch die Fouriertransformierte $hat(f)$ stetig differenzierbar.
  ],
  answer: [
    Falsch

    $C^1$ and $L^2$ do not imply $x f in L^1$, so $hat(f)$ need not be $C^1$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Ist $(f_n)$ eine Folge in $L^2(RR)$ mit $lim_(n -> oo) ||f_n - f||_2 = 0$, so ist $lim_(n -> oo) ||hat(f_n) - hat(f)||_2 = 0$.
  ],
  answer: [
    Wahr

    Fourier transform is unitary on $L^2$ (Plancherel).
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Ist $(f_n)$ eine Folge in $L^2(RR)$ so dass $lim_(n -> oo) f_n(x) -> 0$ (punktweise), so ist $lim_(n -> oo) ||f_n||_2 = 0$.
  ],
  answer: [
    Falsch

    Pointwise convergence to $0$ does not imply $L^2$ norm goes to $0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Fuer alle $f in L^2(RR)$ gilt: $|f(x)|$ faellt exponentiell ab fuer $x -> +-oo$.
  ],
  answer: [
    Falsch

    $L^2$ functions can have slow decay; exponential decay is not required.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f$ die Distribution $phi |-> f[phi] = integral_-oo^oo |x| phi(x) dd(x)$. Aussage: $f in S'(RR)$.
  ],
  answer: [
    Wahr

    $|x|$ has at most polynomial growth, so it defines a tempered distribution.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f$ die Distribution $phi |-> f[phi] = integral_-oo^oo |x| phi(x) dd(x)$. Aussage: $f''[phi] = 0$ fuer alle $phi in S(RR)$.
  ],
  answer: [
    Falsch

    $(|x|)'' = 2 delta$, so it is not $0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f$ die Distribution $phi |-> f[phi] = integral_-oo^oo |x| phi(x) dd(x)$. Aussage: $f'[phi] = 0$ falls $phi(0) = 0$.
  ],
  answer: [
    Falsch

    $f'$ is $sgn(x)$ as a distribution, which does not vanish when $phi(0) = 0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f$ die Distribution $phi |-> f[phi] = integral_-oo^oo |x| phi(x) dd(x)$. Aussage: $f[phi''] = 2 phi(0)$ fuer alle $phi in S(RR)$.
  ],
  answer: [
    Wahr

    Distribution identity $(|x|)'' = 2 delta$ gives $f[phi''] = 2 phi(0)$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Jedes Polynom $P(x) = a_0 + a_1 x + dots + a_n x^n$ von Grad $n$ mit reellen Koeffizienten ist eine Linearkombination der Legendre-Polynome $P_1(x), dots, P_n(x)$.
  ],
  answer: [
    Wahr

    ${P_0,...,P_n}$ spans all polynomials of degree $<= n$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    $integral_-1^1 P_5(x) x^3 dd(x) = 0$.
  ],
  answer: [
    Wahr

    $x^3$ is a combination of $P_1$ and $P_3$, so it is orthogonal to $P_5$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    $integral_-1^1 P_5(x)^2 P_11(x) dd(x) = 0$.
  ],
  answer: [
    Wahr

    $P_11$ is odd and $P_5^2$ is even, so the integrand is odd and integral $0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    $integral_-1^1 P_5(x)^2 P_11(x)^2 dd(x) = 0$.
  ],
  answer: [
    Falsch

    $P_5^2$ and $P_11^2$ are nonnegative even functions, so the integral is $> 0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f: RR -> CC$, $f(x) = x^2019 e^(-x^4)$. Gilt: Die Fouriertransformation von $f$ ist stetig.
  ],
  answer: [
    Wahr

    $f in L^1$ implies $hat(f)$ is continuous.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f: RR -> CC$, $f(x) = x^2019 e^(-x^4)$. Gilt: Die Fouriertransformation von $f$ ist im Schwartzraum, $hat(f) in S(RR)$.
  ],
  answer: [
    Falsch

    An $L^1$ function need not have a Schwartz Fourier transform.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Fuer alle temperierten Distributionen $omega in S'(RR)$ gilt: Die Fouriertransformation $hat(omega) in S'(RR)$ existiert.
  ],
  answer: [
    Wahr

    The Fourier transform extends continuously to $S'(R)$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Fuer alle temperierten Distributionen $omega in S'(RR)$ gilt: Die Abbildung $S(RR) -> RR$, $phi |-> omega[e^(-x) phi(x)]$, ist wieder eine temperierte Distribution.
  ],
  answer: [
    Falsch

    Multiplication by $e^(-x)$ is not a Schwartz multiplier and can break temperateness.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Fuer $k = 1, 2, dots$ sei $delta_k = k delta(x - k) in S'(RR)$. Gilt: Die Folge $(delta_k)$ konvergiert in $S'(RR)$ gegen $0$.
  ],
  answer: [
    Wahr

    For phi in $S, k phi(k) -> 0$ faster than any power, so $delta_k -> 0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Fuer $k = 1, 2, dots$ sei $delta_k = k delta(x - k) in S'(RR)$. Gilt: Die Folge $(delta_k)$ konvergiert in $S'(RR)$ nicht.
  ],
  answer: [
    Falsch

    This contradicts the previous convergence to $0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $omega_n = (pi/4) (2 n + 1)$ und $phi_n(x) := sin(omega_n x)$. Gilt: Die $phi_n$, $n = 0, 1, 2, dots$, bilden eine Orthonormalbasis von $L^2([0, 2])$.
  ],
  answer: [
    Falsch

    $sin(omega_n x)$ is not normalized to unit norm, so the system is not orthonormal.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $omega_n = (pi/4) (2 n + 1)$ und $phi_n(x) := sin(omega_n x)$. Gilt: Fuer $f in C^oo([0, 2])$ fallen die Koeffizienten $a_n = integral_0^2 f(x) phi_n(x) dd(x)$ der Entwicklung $f(x) = sum_(n >= 0) a_n phi_n(x)$ schneller ab als jedes Polynom.
  ],
  answer: [
    Falsch

    $C^oo$ on $[0,2]$ alone does not guarantee superpolynomial decay for these coefficients.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $u: D -> RR$ harmonisch auf einem Gebiet $D subset RR^3$ und $|u(x)| < 5$ fuer alle $x in D$. Gilt: Sei $D = RR^3$. Dann ist $u$ konstant.
  ],
  answer: [
    Wahr

    Bounded harmonic on $RR^3$ is constant by Liouville.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $u: D -> RR$ harmonisch auf einem Gebiet $D subset RR^3$ und $|u(x)| < 5$ fuer alle $x in D$. Gilt: Sei $D = { x in RR^3 | ||x|| > 1/1000 }$. Dann ist $u$ konstant.
  ],
  answer: [
    Falsch

    Bounded harmonic on an exterior domain need not be constant.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $u: D -> RR$ harmonisch auf einem Gebiet $D subset RR^3$ und $|u(x)| < 5$ fuer alle $x in D$. Gilt: Sei $D = (-1, 1) times RR^2$. Dann ist $partial_(x_2) u = 0$ auf $D$.
  ],
  answer: [
    Falsch

    Bounded harmonic does not force a partial derivative to vanish.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $u: D -> RR$ harmonisch auf einem Gebiet $D subset RR^3$ und $|u(x)| < 5$ fuer alle $x in D$. Gilt: Sei $D = (-1, 1) times RR^2$. Dann gilt $|partial_(x_2) u(x_1, x_2, x_3)| < 1 / (16 (1 - |x_1|))$ fuer alle $x in D$.
  ],
  answer: [
    Wahr

    Interior gradient estimates for harmonic functions give such a bound in a slab.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Fuer $n = 0, 1, 2, dots$ sei $P_n(x) = 1/(1 - x) d^n/dx^n ((1 - x) (1 - x^2)^n)$. Gilt: Die $P_n$ sind orthogonal bzgl. des Skalarproduktes $<f, g> = integral_-1^1 f(x) overline(g(x)) dd(x)$.
  ],
  answer: [
    Falsch

    These are Jacobi polynomials orthogonal with weight $(1 - x)$, not with weight $1$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Fuer $n = 0, 1, 2, dots$ sei $P_n(x) = 1/(1 - x) d^n/dx^n ((1 - x) (1 - x^2)^n)$. Gilt: Die $P_n$ sind orthogonal bzgl. des Skalarproduktes $<f, g> = integral_-1^1 f(x) overline(g(x)) (1 - x) dd(x)$.
  ],
  answer: [
    Wahr

    By construction they are orthogonal with weight $(1 - x)$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Definiere $p(x_1, x_2, x_3, dots, x_10) = x_1^3 x_2 - 3 x_1 x_2 x_3^2$ auf $RR^10$. Sei $q = p|_(S^9)$. Gilt: $Delta_(S^9) q = -lambda q$ mit $lambda = 48$.
  ],
  answer: [
    Wahr

    $p$ is homogeneous harmonic of degree $4$, so eigenvalue is $4(4+8)=48$ on $S^9$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Definiere $p(x_1, x_2, x_3, dots, x_10) = x_1^3 x_2 - 3 x_1 x_2 x_3^2$ auf $RR^10$. Sei $q = p|_(S^9)$. Gilt: $Delta_(S^9) q = -lambda q$ mit $lambda = 20$.
  ],
  answer: [
    Falsch

    Same eigenvalue is $48$, not $20$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f(x) = 1/(ceil(|x|))^2$ fuer $x != 0$ und $f(0) = 0$, wobei $ceil(x) = min{ k in ZZ | k >= x }$. Gilt: Die Fouriertransformierte $hat(f)$ ist stetig und beschraenkt.
  ],
  answer: [
    Wahr

    $f in L^1$ implies $hat(f)$ is bounded and continuous.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f(x) = 1/(ceil(|x|))^2$ fuer $x != 0$ und $f(0) = 0$, wobei $ceil(x) = min{ k in ZZ | k >= x }$. Gilt: $k^2 hat(f)(k) -> 0$ fuer $k -> oo$.
  ],
  answer: [
    Falsch

    This decay is too strong; $L^1$ does not imply $k^2 hat(f)(k) -> 0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Betrachte den Raum der glatten Funktionen mit kompaktem Traeger $C_0^oo(RR)$. Gilt: $C_0^oo(RR)$ ist ein Hilbertraum bezueglich des Skalarproduktes $<f, g> = integral_(RR) f(x) g(x) dd(x)$.
  ],
  answer: [
    Falsch

    $C_0^oo$ is not complete in $L^2$, so it is not a Hilbert space.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Betrachte den Raum der glatten Funktionen mit kompaktem Traeger $C_0^oo(RR)$. Gilt: $S(RR) subset C_0^oo(RR)$.
  ],
  answer: [
    Falsch

    Schwartz functions are not compactly supported unless zero.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Die Funktion $f(x)$ sei definiert durch die Fourierreihe $f(x) = sum_(k in ZZ) 1/(k^4 + k^2 + 1) e^(i k x)$. Gilt: $f(x)$ ist zweimal stetig differenzierbar.
  ],
  answer: [
    Wahr

    $k^2 f_k$ is summable, so the Fourier series is $C^2$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Die Funktion $f(x)$ sei definiert durch die Fourierreihe $f(x) = sum_(k in ZZ) 1/(k^4 + k^2 + 1) e^(i k x)$. Gilt: $integral_0^(2 pi) |f(x)|^2 dd(x) <= 2 pi + pi^3/3$.
  ],
  answer: [
    Wahr

    Parseval gives $L^2$ norm controlled by sum $|f_k|^2$; inequality holds.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f(x, t)$ eine (in $x$) $2 pi$-periodische Loesung des Anfangswertproblems auf $RR x RR_(>=0)$: $Delta f = partial_t f$, $f(x, 0) = 5 + sin(2 x)$. Gilt: $4 <= f(x, t) <= 6$ fuer alle $t >= 0$ und alle $x in [0, 2 pi]$.
  ],
  answer: [
    Wahr

    Maximum principle for the heat equation preserves bounds of initial data.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f(x, t)$ eine (in $x$) $2 pi$-periodische Loesung des Anfangswertproblems auf $RR x RR_(>=0)$: $Delta f = partial_t f$, $f(x, 0) = 5 + sin(2 x)$. Gilt: Die Loesung ist $pi$-periodisch in $x$ fuer alle $t in RR_(>=0)$.
  ],
  answer: [
    Wahr

    The initial data has period pi and the PDE preserves periods.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Gilt: Fuer jedes $f in L^2(RR)$ gibt es ein $N in NN$ und $c_0, dots, c_N$, sodass fast ueberall gilt $f(x) = sum_(j=0)^N c_j h_j(x)$, wobei $h_j$ die Hermite-Funktionen sind.
  ],
  answer: [
    Falsch

    General $L^2$ functions require infinite Hermite expansions.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Gilt: Die Hermite-Funktionen $h_j$ sind Eigenfunktionen der Fouriertransformation.
  ],
  answer: [
    Wahr

    Hermite functions are eigenfunctions of the Fourier transform (up to phase).
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f(x) = e^(-x^2/4)$. Gilt: Die Fouriertransformierte $hat(f)$ hat eine holomorphe Fortsetzung auf der gesamten komplexen Ebene.
  ],
  answer: [
    Wahr

    Fourier transform of a Gaussian is a Gaussian and extends to an entire function.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f(x) = e^(-x^2/4)$. Gilt: Der Realteil von $hat(f)$ verschwindet.
  ],
  answer: [
    Falsch

    $hat(f)$ is real and positive, so its real part does not vanish.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Seien $lambda in RR$ mit $lambda > 0$ und $a in RR$. Gilt: Die Abbildung $U: S(RR) -> S(RR)$, $(U f)(x) = f'(lambda x + a)$, ist stetig.
  ],
  answer: [
    Wahr

    Differentiation and affine change of variables act continuously on S.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Für $n = 1, 2, dots$ sei $omega_n in S'(RR)$ definiert durch $omega_n[f] = f(1/n) - f(0)/n$. Gilt: Dann konvergiert die Folge $(omega_n)$ in $S'(RR)$.
  ],
  answer: [
    Wahr

    $f(1/n) -> f(0)$, so $omega_n -> delta in S'$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Gilt: $x delta' = 0$ in $S'(RR)$.
  ],
  answer: [
    Falsch

    $x delta' = -delta$, so it is not $0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f in C^oo(RR) inter L^1(RR)$, d.h. $f$ ist glatt und $integral_-oo^oo |f(x)| dd(x) < oo$. Dann gilt:

    + $integral_-oo^oo |f(x)|^2 dd(x) < oo$

    + $lim_(x -> oo) |f(x)| = 0$

    + $lim_(n -> oo) integral_n^(n+1) |f(x)| dd(x) = 0$

    + $lim_(n -> oo) integral_-n^n |f(x)| dd(x) = 0$
  ],
  answer: [
    3: Aus $integral_RR |f| < oo$ folgt, dass die Tail-Integrale $integral_N^oo |f| -> 0$. Da $integral_n^(n+1) |f| <= integral_n^oo |f|$, muss $integral_n^(n+1) |f| -> 0$ gelten. (1) ist i.A. falsch (L^1 =>/ L^2). (2) ist i.A. falsch, da L^1-Funktionen nicht punktweise gegen 0 konvergieren muessen. (4) konvergiert gegen $integral_RR |f|$, nicht gegen 0.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $omega = (1 + x) delta'$ in $S'(RR)$, wobei $delta$ die Dirac-Distribution ist. Dann gilt:

    + $omega = delta$

    + $omega = delta'$

    + $omega = delta' + delta$

    + $omega = delta' - delta$
  ],
  answer: [
    4: Als Distribution wirkt $(1 + x) delta'$ durch $((1 + x) delta')[phi] = delta'[(1 + x) phi] = -d/dx((1 + x) phi)|_(x=0) = -(phi(0) + phi'(0))$. Dagegen gilt $(delta' - delta)[phi] = -phi'(0) - phi(0)$, also identisch.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Welche der folgenden Abbildungen $omega: S(RR) -> CC$ ist eine temperierte Distribution, $omega in S'(RR)$?

    + $omega[phi] = integral_-oo^oo e^(|x|) phi(x) dd(x)$

    + $omega[phi] = sum_(k=-2021)^(2021) phi(k)$

    + $omega[phi] = (phi(0))^2$

    + $omega[phi] = |phi(10)|$
  ],
  answer: [
    2: (2) ist eine endliche Summe von Auswertungen $phi |-> phi(k)$, also eine endliche Linearkombination von Dirac-Distributionen und damit linear und stetig auf $S(RR)$. (1) scheitert i.A. an Integrabilitaet/Temperiertheit wegen superpolynomiellen Wachstums $e^(|x|)$. (3) ist nicht linear. (4) ist wegen Betrag nicht linear.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Welche der folgenden Funktionen $f$ ist im Schwartzraum, $f in S(RR)$?

    + $f(x) = 1$

    + $f(x) = e^(-|x|)$

    + $f(x) = e^(x^2 + x(1 - x^3))$

    + $f(x) = 1/(1 + x^2)$
  ],
  answer: [
    3: $S(RR)$ verlangt glatte Funktionen, deren Ableitungen schneller als jede Potenz abfallen. (1) faellt nicht ab. (2) ist nicht glatt bei $x = 0$ (Knick durch $|x|$). (4) faellt nur polynomial ab. Bei (3) ist der Exponent $x^2 + x(1 - x^3) = x^2 + x - x^4$, also dominiert $-x^4$ fuer $|x| -> oo$; damit ist $f$ glatt und faellt superpolynomiell ab, ebenso alle Ableitungen.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f: RR/ZZ -> CC$ stetig und die Fourierkoeffizienten erfuellen $|f_n| <= 1/(1 + n^2)$. Welche Aussage koennen Sie ueber $f$ NICHT treffen?

    + $f$ ist stetig differenzierbar.

    + Die Fourierreihe von $f$ konvergiert gleichmaessig.

    + Die Fourierreihe von $f$ konvergiert punktweise gegen $f$.

    + Für jede stetige Funktion $g: RR/ZZ -> CC$ mit Fourierkoeffizienten $g_n = f_n$ (fuer alle $n$) gilt $f = g$.
  ],
  answer: [
    1: Aus $sum_n |f_n| <= sum_n 1/(1 + n^2) < oo$ folgt absolute Konvergenz der Fourierreihe und damit gleichmaessige Konvergenz, also (2). Gleichmaessige Konvergenz impliziert punktweise Konvergenz, also (3). Die Fourierkoeffizienten bestimmen eine stetige Funktion eindeutig, daher (4). Fuer stetige Differenzierbarkeit braeuchte man typischerweise staerkeren Abfall, z.B. $sum |n f_n| < oo$ bzw. $|f_n| = O(1/|n|^(1+epsilon))$; $|f_n| ~ 1/n^2$ reicht nicht automatisch ohne Zusatzannahmen.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f: RR -> CC$ gegeben durch $f(x) = e^(-|x|)$, und sei $hat(f): RR -> CC$ ihre Fouriertransformation. Dann gilt:

    + Die Fouriertransformation $hat(f)$ ist glatt.

    + Die Fouriertransformation $hat(f)$ ist nicht beschraenkt.

    + Es existiert ein $C > 0$ so dass fuer alle $k in RR$ gilt $|hat(f)(k)| <= C e^(-|k|)$.

    + Die Fouriertransformation $hat(f)$ ist keine messbare Funktion.
  ],
  answer: [
    1: Obwohl $f$ bei $x = 0$ nicht glatt ist, liegt $f in L^1(RR)$ und hat für jedes $m >= 0$ die Momentbedingung $x^m f(x) in L^1$. Dann gilt $hat(f) in C^oo$ mit $hat(f)^(m)(k) = integral (-i x)^m f(x) e^(-i k x) dd(x)$. (2) ist falsch, da $hat(f)$ fuer $f in L^1$ stets beschraenkt ist. (3) ist ein viel staerkerer exponentieller Abfall, der hier nicht folgt. (4) ist falsch, da $hat(f)$ als stetige Funktion messbar ist.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Seien $h_n in S(RR)$ die orthonormierten Hermitefunktionen. Sei $(f, g) = integral_RR f(x) overline(g(x)) dd(x)$ das Skalarprodukt auf $L^2(RR)$. Fuer alle Funktionen $f: RR -> CC$ gilt:

    + Wenn $f in L^2(RR)$, dann gilt $sum_(n in ZZ) |(f, h_n)| < oo$.

    + Wenn $f in L^2(RR)$, dann gilt $sum_(n in ZZ) |(f, h_n)|^2 < oo$.

    + Wenn $f in L^2(RR)$, dann gilt fuer alle $x in RR$: $lim_(N -> oo) sum_(|n| <= N) (f, h_n) h_n(x) = f(x)$.

    + Wenn $f in S(RR)$, dann existiert ein $k > 0$ so dass $(f, h_n) = 0$ fuer alle $n > k$.
  ],
  answer: [
    2: ${h_n}$ ist eine Orthonormalbasis von $L^2(RR)$. Daher gilt Bessel/Parseval: $sum_n |(f, h_n)|^2 <= ||f||_2^2 < oo$, also (2). (1) ist i.A. zu stark (Quadratsummierbar =>/ absolut summierbar). (3) gilt i.A. nur im $L^2$-Sinn, nicht punktweise fuer alle $x$. (4) ist falsch: Schwartz-Funktionen haben typischerweise unendlich viele nichtverschwindende Hermite-Koeffizienten.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $u = u(x): RR^3 -> CC$ glatt und harmonisch, also $Delta u = 0$. Dann gilt:

    + Wenn fuer alle $x in RR^3$ gilt $|u(x)| <= e^(x_1^2)$, dann ist $u$ konstant.

    + Wenn fuer alle $x in RR^3$ gilt $u(x) <= 1 + x_1^2$, dann ist $u$ konstant.

    + Wenn $|partial_(x_1) u| + |partial_(x_2) u| + |partial_(x_3) u|$ beschraenkt ist, dann ist $u$ konstant.

    + Wenn $|partial_(x_1) u| + |partial_(x_2) u| + |partial_(x_3) u|$ beschraenkt ist, dann ist $partial_(x_j) u$ konstant fuer $j = 1, 2, 3$.
  ],
  answer: [
    4: Ableitungen harmonischer Funktionen sind wieder harmonisch. Sind $partial_(x_j) u$ beschraenkt (was aus der Summen-Beschraenktheit folgt), dann liefert Liouville: jede beschraenkte harmonische Funktion auf $RR^3$ ist konstant. Also ist jedes $partial_(x_j) u$ konstant und (4) gilt. (3) waere staerker ("u konstant") und folgt i.A. nicht: lineare harmonische Funktionen wie $u(x) = x_1$ haben beschraenkten Gradienten, sind aber nicht konstant. (1) und (2) erlauben unbeschraenktes Wachstum und sind kein Liouville-Fall.
  ],
)
#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f in C^oo(RR) inter L^1(RR)$, d.h. $f$ ist glatt und $integral_-oo^oo |f(x)| dd(x) < oo$. Dann gilt:

    + $integral_-oo^oo |f(x)|^2 dd(x) < oo$

    + $lim_(x -> oo) |f(x)| = 0$

    + $lim_(n -> oo) integral_n^(n+1) |f(x)| dd(x) = 0$

    + $lim_(n -> oo) integral_-n^n |f(x)| dd(x) = 0$
  ],
  answer: [
    3: Aus $integral_RR |f| < oo$ folgt, dass die Tail-Integrale $integral_N^oo |f| -> 0$. Da $integral_n^(n+1) |f| <= integral_n^oo |f|$, muss $integral_n^(n+1) |f| -> 0$ gelten. (1) ist i.A. falsch (L^1 =>/ L^2). (2) ist i.A. falsch, da L^1-Funktionen nicht punktweise gegen 0 konvergieren muessen. (4) konvergiert gegen $integral_RR |f|$, nicht gegen 0.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $omega = (1 + x) delta'$ in $S'(RR)$, wobei $delta$ die Dirac-Distribution ist. Dann gilt:

    + $omega = delta$

    + $omega = delta'$

    + $omega = delta' + delta$

    + $omega = delta' - delta$
  ],
  answer: [
    4: Als Distribution wirkt $(1 + x) delta'$ durch $((1 + x) delta')[phi] = delta'[(1 + x) phi] = -d/dx((1 + x) phi)|_(x=0) = -(phi(0) + phi'(0))$. Dagegen gilt $(delta' - delta)[phi] = -phi'(0) - phi(0)$, also identisch.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Welche der folgenden Abbildungen $omega: S(RR) -> CC$ ist eine temperierte Distribution, $omega in S'(RR)$?

    + $omega[phi] = integral_-oo^oo e^(|x|) phi(x) dd(x)$

    + $omega[phi] = sum_(k=-2021)^(2021) phi(k)$

    + $omega[phi] = (phi(0))^2$

    + $omega[phi] = |phi(10)|$
  ],
  answer: [
    2: (2) ist eine endliche Summe von Auswertungen $phi |-> phi(k)$, also eine endliche Linearkombination von Dirac-Distributionen und damit linear und stetig auf $S(RR)$. (1) scheitert i.A. an Integrabilitaet/Temperiertheit wegen superpolynomiellen Wachstums $e^(|x|)$. (3) ist nicht linear. (4) ist wegen Betrag nicht linear.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Welche der folgenden Funktionen $f$ ist im Schwartzraum, $f in S(RR)$?

    + $f(x) = 1$

    + $f(x) = e^(-|x|)$

    + $f(x) = e^(x^2 + x(1 - x^3))$

    + $f(x) = 1/(1 + x^2)$
  ],
  answer: [
    3: $S(RR)$ verlangt glatte Funktionen, deren Ableitungen schneller als jede Potenz abfallen. (1) faellt nicht ab. (2) ist nicht glatt bei $x = 0$ (Knick durch $|x|$). (4) faellt nur polynomial ab. Bei (3) ist der Exponent $x^2 + x(1 - x^3) = x^2 + x - x^4$, also dominiert $-x^4$ fuer $|x| -> oo$; damit ist $f$ glatt und faellt superpolynomiell ab, ebenso alle Ableitungen.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f: RR/ZZ -> CC$ stetig und die Fourierkoeffizienten erfuellen $|f_n| <= 1/(1 + n^2)$. Welche Aussage koennen Sie ueber $f$ NICHT treffen?

    + $f$ ist stetig differenzierbar.

    + Die Fourierreihe von $f$ konvergiert gleichmaessig.

    + Die Fourierreihe von $f$ konvergiert punktweise gegen $f$.

    + Fuer jede stetige Funktion $g: RR/ZZ -> CC$ mit Fourierkoeffizienten $g_n = f_n$ (fuer alle $n$) gilt $f = g$.
  ],
  answer: [
    1: Aus $sum_n |f_n| <= sum_n 1/(1 + n^2) < oo$ folgt absolute Konvergenz der Fourierreihe und damit gleichmaessige Konvergenz, also (2). Gleichmaessige Konvergenz impliziert punktweise Konvergenz, also (3). Die Fourierkoeffizienten bestimmen eine stetige Funktion eindeutig, daher (4). Fuer stetige Differenzierbarkeit braeuchte man typischerweise staerkeren Abfall, z.B. $sum |n f_n| < oo$ bzw. $|f_n| = O(1/|n|^(1+epsilon))$; $|f_n| ~ 1/n^2$ reicht nicht automatisch ohne Zusatzannahmen.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f: RR -> CC$ gegeben durch $f(x) = e^(-|x|)$, und sei $hat(f): RR -> CC$ ihre Fouriertransformation. Dann gilt:

    + Die Fouriertransformation $hat(f)$ ist glatt.

    + Die Fouriertransformation $hat(f)$ ist nicht beschraenkt.

    + Es existiert ein $C > 0$ so dass fuer alle $k in RR$ gilt $|hat(f)(k)| <= C e^(-|k|)$.

    + Die Fouriertransformation $hat(f)$ ist keine messbare Funktion.
  ],
  answer: [
    1: Obwohl $f$ bei $x = 0$ nicht glatt ist, liegt $f in L^1(RR)$ und hat fuer jedes $m >= 0$ die Momentbedingung $x^m f(x) in L^1$. Dann gilt $hat(f) in C^oo$ mit $hat(f)^(m)(k) = integral (-i x)^m f(x) e^(-i k x) dd(x)$. (2) ist falsch, da $hat(f)$ fuer $f in L^1$ stets beschraenkt ist. (3) ist ein viel staerkerer exponentieller Abfall, der hier nicht folgt. (4) ist falsch, da $hat(f)$ als stetige Funktion messbar ist.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Seien $h_n in S(RR)$ die orthonormierten Hermitefunktionen. Sei $(f, g) = integral_RR f(x) overline(g(x)) dd(x)$ das Skalarprodukt auf $L^2(RR)$. Fuer alle Funktionen $f: RR -> CC$ gilt:

    + Wenn $f in L^2(RR)$, dann gilt $sum_(n in ZZ) |(f, h_n)| < oo$.

    + Wenn $f in L^2(RR)$, dann gilt $sum_(n in ZZ) |(f, h_n)|^2 < oo$.

    + Wenn $f in L^2(RR)$, dann gilt fuer alle $x in RR$: $lim_(N -> oo) sum_(|n| <= N) (f, h_n) h_n(x) = f(x)$.

    + Wenn $f in S(RR)$, dann existiert ein $k > 0$ so dass $(f, h_n) = 0$ fuer alle $n > k$.
  ],
  answer: [
    2: ${h_n}$ ist eine Orthonormalbasis von $L^2(RR)$. Daher gilt Bessel/Parseval: $sum_n |(f, h_n)|^2 <= ||f||_2^2 < oo$, also (2). (1) ist i.A. zu stark (Quadratsummierbar =>/ absolut summierbar). (3) gilt i.A. nur im $L^2$-Sinn, nicht punktweise fuer alle $x$. (4) ist falsch: Schwartz-Funktionen haben typischerweise unendlich viele nichtverschwindende Hermite-Koeffizienten.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $u = u(x): RR^3 -> CC$ glatt und harmonisch, also $Delta u = 0$. Dann gilt:

    + Wenn fuer alle $x in RR^3$ gilt $|u(x)| <= e^(x_1^2)$, dann ist $u$ konstant.

    + Wenn fuer alle $x in RR^3$ gilt $u(x) <= 1 + x_1^2$, dann ist $u$ konstant.

    + Wenn $|partial_(x_1) u| + |partial_(x_2) u| + |partial_(x_3) u|$ beschraenkt ist, dann ist $u$ konstant.

    + Wenn $|partial_(x_1) u| + |partial_(x_2) u| + |partial_(x_3) u|$ beschraenkt ist, dann ist $partial_(x_j) u$ konstant fuer $j = 1, 2, 3$.
  ],
  answer: [
    4: Ableitungen harmonischer Funktionen sind wieder harmonisch. Sind $partial_(x_j) u$ beschraenkt (was aus der Summen-Beschraenktheit folgt), dann liefert Liouville: jede beschraenkte harmonische Funktion auf $RR^3$ ist konstant. Also ist jedes $partial_(x_j) u$ konstant und (4) gilt. (3) waere staerker ("u konstant") und folgt i.A. nicht: lineare harmonische Funktionen wie $u(x) = x_1$ haben beschraenkten Gradienten, sind aber nicht konstant. (1) und (2) erlauben unbeschraenktes Wachstum und sind kein Liouville-Fall.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Es sei $f: RR -> CC$ eine $2 pi$-periodische Funktion, deren Fourierkoeffizienten die Ungleichung $|f_n| <= 1/(1 + |n|)$ erfuellen. Konvergiert die Fourierreihe von $f$ punktweise gegen $f$?
  ],
  answer: [
    Nein. Ein Gegenbeispiel ist die Saegezahnfunktion $f(x) = x mod 2 pi$. Diese hat Fourierkoeffizienten $f_n = (2 pi i n)^(-1) e^(-2 pi i n)$ fuer $n != 0$, also $|f_n| ~ 1/|n|$, aber die Fourierreihe konvergiert nicht ueberall punktweise gegen $f$ (Sprungstelle/Gibbs-Phaenomen).
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Wir betrachten die Funktion einer Veraenderlichen $f(x) = sin(x) |x|$ fuer $|x| <= 1$ und $f(x) = 0$ fuer $|x| > 1$. Welche Aussage ueber die Fouriertransformation $hat(f)(k)$ ist falsch?

    + $hat(f)$ ist beschraenkt.

    + $hat(f)$ ist stetig.

    + $hat(f)$ liegt in $L^1(RR)$.

    + $hat(f)$ liegt in $L^2(RR)$.
  ],
  answer: [
    3: $f$ ist beschraenkt und hat kompakten Traeger, also $f in L^1(RR)$. Damit ist $hat(f)$ beschraenkt und stetig (Riemann-Lebesgue). Zudem ist $f in L^2(RR)$, also $hat(f) in L^2(RR)$ (Plancherel). Uebrig bleibt 3 als falsche Aussage; $hat(f)(k)$ faellt wegen des Sprungs von $f$ bei $\pm 1$ wie $1/k$ ab und ist nicht integrierbar.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Welche der folgenden Funktionen $f$ liegt in $S(RR)$?

    + Die Fouriertransformation von $g(x) = x^2024 e^(-x^2025)$.

    + Die Fouriertransformation von $g(x) = x^2025 e^(-x^2024)$.

    + Die Funktion $f(x) = 1 - x^2$ fuer $|x| <= 1$ und $f(x) = 0$ fuer $|x| > 1$.
  ],
  answer: [
    2: In 2 ist $g$ "Polynom x Schwartz-Funktion" (denn $e^(-x^2024)$ ist Schwartz), und die Fouriertransformation bildet Schwartz-Funktionen auf Schwartz-Funktionen ab. Daher liegt die Fouriertransformierte in $S(RR)$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $f in C^oo(RR^3)$ mit kompaktem Traeger, $u: RR x RR^3 -> RR$ die Loesung der Wellengleichung $1/c^2 partial_t^2 u - Delta u = 0$ mit Anfangsbedingungen $u(0, x) = f(x)$, $partial_t u(0, x) = 0$. Welche Aussage ist immer richtig?

    + $u$ hat kompakten Traeger in $(t, x)$.

    + Gilt $f(x_0) = 0$, so ist $u(t, x) = 0$ fuer alle $(t, x)$ mit $t > 0$ und $|x - x_0| = c t$.

    + Fuer alle $x in RR^3$ ist $lim_(t -> oo) u(t, x) = 0$.

    + $partial_t u(t, x) = 0$ fuer alle $t, x$.
  ],
  answer: [
    3: $u(t, x)$ laesst sich durch ein Mittelwert-Integral ueber $f$ auf der Sphaere mit Mittelpunkt $x$ und Radius $c t$ ausdruecken. Fuer festes $x$ und grosses $t$ liegt diese Sphaere weitgehend im Bereich, wo $f = 0$ (wegen kompaktem Traeger), also verschwindet der Beitrag und $u(t, x) -> 0$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Sei $H$ ein Hilbertraum. Es sei $(phi_n)_(n in NN)$, $phi_n in H$, ein orthogonales System in $H$. Welche Aussage ist falsch?

    + Falls $sum_(n=1)^oo ||phi_n|| < oo$, dann konvergiert die Reihe $sum_(n=1)^oo phi_n$ in $H$.

    + Falls $sum_(n=1)^oo ||phi_n||^2 < oo$, dann konvergiert die Reihe $sum_(n=1)^oo phi_n$ in $H$.

    + Falls $sum_(n=1)^oo ||phi_n||^3 < oo$, dann konvergiert die Reihe $sum_(n=1)^oo phi_n$ in $H$.
  ],
  answer: [
    3: Füer orthogonale Reihen gilt: $sum phi_n$ konvergiert in $H$ genau dann, wenn $sum ||phi_n||^2 < oo$. Damit ist (B) richtig. 1 impliziert 2. 3 ist falsch; Beispiel: $H = l^2(NN)$, $phi_n = n^(-0.4) e_n$ liefert $sum ||phi_n||^3 < oo$, aber $sum ||phi_n||^2 = sum n^(-0.8) = oo$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Welche der folgenden Abbildungen $phi |-> <omega, phi>$ ($phi in S(RR)$) definiert eine temperierte Distribution?

    + $<omega, phi> = |phi(0)|$.

    + $<omega, phi> = integral_-oo^oo e^x phi(x) dd(x)$.

    + $<omega, phi> = sum_(k=1)^oo k^2 phi(k)$.
  ],
  answer: [
    3: Weil 1 ist nicht linear (wegen Betrag). 2 ist nicht stetig auf $S(RR)$, da das Integral fuer Funktionen, die nicht schneller als $e^(-x)$ abfallen, keine passende Schaetzung liefert. 3 ist linear, und wegen des schnellen Abfalls von $phi in S$ ist $sum k^2 phi(k)$ absolut konvergent; zudem ist die Abbildung stetig bzgl. Schwartz-Seminormen.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Welche Distribution ist gleich $(1 + x) delta'(x)$?

    + $delta'(x)$.

    + $delta'(x) + delta(x)$.

    + $delta'(x) - delta(x)$.
  ],
  answer: [
    3: Man nutzt $<x delta', phi> = <delta', x phi> = -<delta, (x phi)'> = -(x phi)'(0) = -phi(0) = <-delta, phi>$. Also $x delta' = -delta$ und damit $(1 + x) delta' = delta' - delta$.
  ],
)

#flashcard(
  title: "Multiple Choice",
  color: white,
  question: [
    Der Hauptwert von $1/x$ ist die Distribution $P V(1/x) in S'(RR)$, definiert durch $<P V(1/x), phi> = lim_(epsilon -> 0) integral_(|x| > epsilon) phi(x)/x dd(x)$. Welche Distribution ist gleich $x^2 d/dx P V(1/x)$?

    + $-1 - delta(x)$.

    + $-1$.

    + $-1 + delta(x)$.
  ],
  answer: [
    2: Für $x != 0$ gilt formal $x^2 (1/x)' = x^2 (-x^-2) = -1$. Im Distributionensinn: $<x^2 d/dx P V(1/x), phi> = -<P V(1/x), (x^2 phi)'> = -lim_(epsilon -> 0) integral_(|x| > epsilon) (x phi'(x) + 2 phi(x)) dd(x) = <-1, phi>$. Kein $delta$-Term.
  ],
)

#render-flashcards()
