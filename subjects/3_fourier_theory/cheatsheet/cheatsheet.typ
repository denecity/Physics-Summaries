#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Fourier Analysis Cheatsheet",
  author: "Denis Titov",
  language: "GER",
)

#show: frame-style(styles.boxy)

= Maßtheorie

#definition[Algebra von Mengen][
  Algebra $cal(A)$ auf Menge $X$:
  + $X in cal(A)$
  + $A, B in cal(A) => A union B, A inter B in cal(A)$
  + $A in cal(A) => A^C in cal(A)$
]

#definition[$sigma$-Algebra][
  $sigma$-Algebra: Algebra die abgeschlossen unter abzählbaren Vereinigungen ist
]

#definition[Maß][
  Maß $mu: cal(A) -> [0, infinity]$:
  + $mu(emptyset) = 0$
  + $sigma$-Additivität: $mu(union.big_(i=1)^infinity A_i) = sum_(i=1)^infinity mu(A_i)$ für disjunkte $A_i$
]

= Fourierreihen

#definition[Fourierreihe][
  Für $f in L^2([0, 2pi])$:
  $f(x) = sum_(n=-infinity)^infinity c_n e^(i n x)$

  Koeffizienten: $c_n = 1/(2pi) integral_0^(2pi) f(x) e^(-i n x) dd(x)$
]

#theorem[Parseval][
  $1/(2pi) integral_0^(2pi) |f(x)|^2 dd(x) = sum_(n=-infinity)^infinity |c_n|^2$
]

= Fouriertransformation

#definition[Fouriertransformation][
  $(cal(F) f)(k) = hat(f)(k) = integral_(RR^n) f(x) e^(-i x dot k) dd(x)$

  Inverse: $f(x) = 1/((2pi)^n) integral_(RR^n) hat(f)(k) e^(i x dot k) dd(k)$
]

#theorem[Eigenschaften][
  + Linearität: $cal(F)(a f + b g) = a cal(F) f + b cal(F) g$
  + Verschiebung: $cal(F)(f(x - a))(k) = e^(-i a dot k) hat(f)(k)$
  + Ableitung: $cal(F)(pdv(f, x_j))(k) = i k_j hat(f)(k)$
  + Faltung: $cal(F)(f * g) = hat(f) dot hat(g)$
]

#theorem[Plancherel][
  $integral_(RR^n) |f(x)|^2 dd(x) = 1/((2pi)^n) integral_(RR^n) |hat(f)(k)|^2 dd(k)$
]

= Orthogonale Systeme

#definition[Orthogonales System][
  System ${phi_n}$ orthogonal in $L^2([a,b])$ wenn:
  $angle.l phi_n, phi_m angle.r = integral_a^b phi_n(x) overline(phi_m(x)) dd(x) = 0$ für $n != m$
]

#definition[Vollständigkeit][
  System vollständig wenn: $angle.l f, phi_n angle.r = 0$ für alle $n => f = 0$
]

#theorem[Sturm-Liouville][
  Problem: $-(p(x) y')' + q(x) y = lambda w(x) y$

  Eigenfunktionen bilden vollständiges orthogonales System
]

= Distributionen

#definition[Distribution][
  Linear-funktional $T: cal(D) -> CC$ auf Testfunktionen

  Stetig: $phi_n -> 0 => T(phi_n) -> 0$
]

#definition[Delta-Distribution][
  $delta(x): angle.l delta, phi angle.r = phi(0)$

  Eigenschaften:
  + $delta(a x) = 1/|a| delta(x)$
  + $delta'(x) phi(x) = -phi'(0)$
]

#definition[Fouriertransformation von Distributionen][
  $angle.l hat(T), phi angle.r = angle.l T, hat(phi) angle.r$

  Beispiele:
  + $hat(delta)(k) = 1$
  + $hat(1)(k) = 2pi delta(k)$
]

= Harmonische Funktionen

#definition[Harmonische Funktion][
  $u: D subset RR^n -> RR$ harmonisch wenn $Delta u = 0$
]

#theorem[Mittelwerteigenschaft][
  $u$ harmonisch $<=> u(x) = 1/|B_r(x)| integral_(B_r(x)) u(y) dd(y)$
]

#theorem[Maximumprinzip][
  Harmonische Funktion auf beschränktem Gebiet nimmt Maximum auf dem Rand an
]

#theorem[Dirichlet-Problem][
  $cases(Delta u = 0 "in" Omega, u = g "auf" partial Omega)$

  Lösung existiert und ist eindeutig für beschränkte Gebiete
]

= Wichtige Formeln

#theorem[Green'sche Formeln][
  $integral_Omega (u Delta v + nabla u dot nabla v) dd(x) = integral_(partial Omega) u pdv(v, bold(n)) dd(S)$

  $integral_Omega (u Delta v - v Delta u) dd(x) = integral_(partial Omega) (u pdv(v, bold(n)) - v pdv(u, bold(n))) dd(S)$
]

#theorem[Poisson-Kern][
  Lösung Dirichlet-Problem in Kugel:
  $u(r, theta) = integral_0^(2pi) (1-r^2)/(1-2r cos(theta-phi)+r^2) g(phi) dd(phi)$
]
