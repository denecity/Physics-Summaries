#import "lib.typ": *
#show: frame-style(styles.boxy)

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