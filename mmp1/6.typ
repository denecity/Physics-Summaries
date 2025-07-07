#import "lib.typ": *
#show: frame-style(styles.boxy)




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


