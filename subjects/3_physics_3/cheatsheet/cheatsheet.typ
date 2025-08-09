#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Physics Cheatsheet",
  author: "Denis Titov",
  language: "ENG",
)

= Quantum Mechanics

== Problems

=== Normalization

$
  Psi = c_1 psi_(1, 0, 0) + c_2 psi_(2, 1, 1) hspace t= 0\
$

Normalization condition: 

$
  integral abs(Psi)^2 dd(V) = 1
$

Eigenfunctions are orthonormal, so

$
  integral psi_(n, l, m) psi_(n', l', m') dd(V) = delta\
  => abs(C)^2 (abs(c_1)^2 + abs(c_2)^2) = 1 => C = 1/sqrt(abs(c_1)^2 + abs(c_2)^2)\
  =>Psi_("norm") = C (c_1 psi_(1, 0, 0) + c_2 psi_(2, 1, 1))\
$

=== Measurement Propabilities of Operators

$
  Psi = 1/(sqrt(5)) (psi_(1, 0, 0) + 2 i dot psi_(2, 1, 1))\
$

Possible Operators:

$
  "Energy:" &hat(H) psi(n, l, m) &= E_(n) psi(n, l, m)\
  "Squared Angular Momentum:" &hat(L)^2 psi(n, l, m) &= hbar l (l + 1) psi(n, l, m)\
  "Z-component of Angular Momentum:" &hat(L)_z psi(n, l, m) &= hbar m psi(n, l, m)\
$

The expectation value of an operator is the square of the absolute value of the eigenvalues times their components:

$
  P(E_1) = abs(1/sqrt(5))^2 dot abs(1)^2 = 1/5 hspace P(E_2) = abs(1/sqrt(5))^2 dot abs(2 i)^2 = 4/5\
  sum P(E_i) = 1\
$

=== Time Evolution

Start with state at $t=0$. *Each Eigenstate evolves independently* with phase factor *$e^(-i E t/hbar)$*. *Total Energy* of state must be used. If *Magnetic Field* is present, consider *Zeeman Effect*.

$
  E' = E_n + Delta E_("Zee") = E_n + m mu_B B
$

The solution is then:

$
  Psi(t=0) = c_1 psi_(1, 0, 0) + c_2 psi_(2, 1, 1)\
  => Psi(t) = c_1 psi_(1, 0, 0) e^(-i E_(1) t/hbar) + c_2 psi_(2, 1, 1) e^(-i (E_2 + (m=1) mu_B B) t/hbar)
$

=== Expectation Value 

Normalized $Psi$. Method 1 if we already have the propabilities. The Expectation is just the weighted average:

$
  avg(O) = sum_i P(O_i) dot O_i\
$

Method 2. We need this for position etc.:

$
  avg(O) = integral Psi^* hat(O) Psi dd(V)\
  => avg(r) = integral_0^oo e dot P(r) dd(r)
$

Where $P$ is the radial probability density.

=== Radial Propability density

Previous chapter but look at radius. "What is the propability of finding the electron at a distance $r$ from the nucleus?".

$
  Psi = R dot Y\
  => P(r) dd(r) = (integral_0^(2 pi) integral_0^pi abs(R_(n l) (r))^2 abs(Y_l einst^m (theta, phi))^2 r^2 sin(theta) dd(theta) dd(phi)) dd(r)\ 
  => P(r) = abs(R_(n l) (r))^2 r^2\
  "For spherically symmetric wave functions:" P(r) = abs(psi)^2 4 pi r^2\
$

Example:

$
  R_(1, 0) = 2/e_0^(3/2) e^(-r/e_0) hspace P(r) = 4 pi r^2 abs(R_(1, 0))^2  hspace "max" => dv(P(r), r) = 0\
$

In this case we get zero at $r = 0, a_0, oo$. $0$ and $oo$ are minima, $a_0$ is a maximum. The electron is most likely to be found at the Bohr radius $a_0$.

=== Angular Momentum Raising/Lowering Operators

Given $ket(l\, m)$ use Angular Momentum Lowering $hat(L)_-$ and Raising $hat(L)_+$ Operators:

$
  hat(L)_- ket(l \, m) = hbar sqrt((l + m)(l - m + 1)) ket(l\, m - 1)\
  hat(L)_+ ket(l\, m) = hbar sqrt((l - m)(l + m + 1)) ket(l\, m + 1)\
$

You can construct operators like $hat(L)_z$ from the those operators

$
  hat(L)_z = (hat(L)_+ + hat(L)_-) / 2\
  hat(L)^2 = hat(L)_+ hat(L)_- + hat(L)_z^2 + hbar/2 (hat(L)_+ + hat(L)_-)
$

Example:

$
  hat(L)_- ket(1\, 1) = sqrt(2) hbar ket(1\, 0)\
$

=== Angular Momentum Operators and Eigenstates

$
  hat(L)^2 psi = hbar^2 l (l + 1) psi\
  hat(L)_z psi = hbar m psi\
$


== Tools

=== Zeeman Effect

Spectral lines and Energies split with magnetic field.

$
  Delta H_"Zee" = (e^- B)/(2 m_e) L_z hspace "EV:" Delta E = (e^- B)/(2 m_e) (m hbar) = (e^- B)/(2 m_e) B m = mu_B B m
$

=== Volumetric Probability Density/Born Rule

Reference Sperical Integrals.

*Born Rule:* The volumetric probability density is given by the square of the absolute value of the wave function:

$
  P(r) = abs(Psi(r))^2 dd(V)\
  dd(V) = r^2 sin(theta) dd(r) dd(theta) dd(phi) hspace => dd(P) = abs(Psi(r))^2 sin(theta) r^2 dd(r) dd(theta) dd(phi)\
$



=== Spherical Harmonics solutions

Angular Functions:

$
  Y_0^0 = sqrt(1/(4 pi)) hspace  Y_1^(plus.minus 1) = sqrt(3/(8 pi)) e^(plus.minus i phi) sin(theta) hspace  Y_1^0 = sqrt(3/(4 pi)) cos(theta)\
  Y_2^(plus.minus 2) = sqrt(15/(32 pi)) e^(plus.minus 2 i phi) sin^2(theta) hspace  Y_2^0 = sqrt(5/(12 pi)) (3 cos^2(theta) - 1) hspace\
  Y_2^(plus.minus 1) = sqrt(15/(32 pi)) e^(plus.minus i phi) sin(theta) cos(theta)\
$

Radial Functions (depend on $n$ and $l$):

$
  R_(1 0) (r) = 2 (1/a0)^(3/2) e^(-r/a0) hspace  R_(2 0) (r) = 2(1/(2 a0))^(3/2) (1 - r/(2 a0)) e^(-r/(2 a0)) hspace \
  R_(2 1) (r) = 2/sqrt(3) (1/(2 a0))^(2/3) (r/(2 a0)) e^(-r/(2 a0))\
$

Combined with this pattern:

$
  psi_(n l m) (r, theta, phi) = R_(n l) (r) Y_l^m (theta, phi)\
  = sqrt((2/(n a0))^3 (n-l-1)!/(2n(l + n)!)) exp(-r/(n a0)) ((2r)/(n a0))^(l) L_(n - l - 1)^(2l + 1) ((2r)/(n a0))   Y_l^m \
  psi_(1 0 0)  = 1/sqrt(pi a0^3) e^(-r/a0) hspace psi_(2 0 0) = 1/(4 sqrt(2 pi a0^3)) (2 - r/a0) e^(-r/(2 a0))\
  psi_(2 1 0) = minus.plus 1/(4(sqrt(2 pi a0^3))) r/a0 e^(-r/(2 a0)) cos(theta) \
  psi_(2 1 plus.minus 1) = 1/(8(sqrt( pi a0^3))) (r/a0) e^(plus.minus i phi) e^(-r/(2 a0)) sin(theta)\
  psi_(3 0 0) = 1 / (81 sqrt(3 pi a0^3)) (27 - 18r/a0 + 2 r^2/a0^2) e^(-r/(3a0))
$


=== Spherical Integrals

Sperical differential:

$
  dd(V) = r^2 sin(theta) dd(r) dd(theta) dd(phi)\
  => integral_0^oo integral_0^pi integral_0^(2 pi) Psi^* (r, theta, phi) Psi(r, theta, phi) r^2 sin(theta) dd(phi) dd(theta) dd(r)\
  Psi = R(r) Y(theta, phi) hspace => integral_0^oo abs(R(r))^2 r^2 dd(r) integral_0^pi integral_0^(2 pi) abs(Y(theta, phi))^2 sin(theta) dd(phi) dd(theta)\
$

=== Operators



=== Commutators

$
  &[A, B] = A B - B A\
  &[hat(p)/(2 m), hat(p)] = 0 hspace && [hat(x), hat(p)] = i hbar hspace &&[hat(x), hat(p)_y] = [hat(x), hat(p)_z] = 0 hspace && [hat(x), hat(p)_x] = [hat(y), hat(p)_y] = i hbar\
  & [hat(L)_x, hat(L)_y] = i hbar hat(L)_z hspace &&[hat(L)^2, hat(L)_x] = 0 hspace &&[hat(L)^2, hat(L)_plus.minus] = 0 hspace &&[hat(L)_z, hat(L)_plus.minus] = plus.minus hbar hat(L)_plus.minus\
  & [hat(S)_x, hat(S)_y] = i hbar hat(S)_z hspace &&[hat(S)^2, hat(S)_x] = 0 hspace &&[hat(L)^2, hat(S) dot hat(L)] = [hat(S)^2, hat(S) dot hat(L)] = 0\
$

$
  [hat(L)_z, hat(S) dot hat(L)] = i hbar (hat(S)_x hat(L)_y - hat(S)_y hat(L)_x) hspace  [hat(S)_z, hat(S) dot hat(L)] = i hbar (hat(S)_y hat(L)_x - hat(S)_x hat(L)_y)\

$

= Statistical Mechanics

== Problems

=== Partition Function

System of $N$ particles with temperature $T$. They can be $ket(upar)$ or spin down $ket(doar)$. Lets find the thermodynamic properties with the partition function $Z$ and the Boltzmann factor 

$
  "Boltz" = exp(-E_s/(k_B T)) hspace beta = 1/(k_B T) \
  Z = sum_("states" s) exp(-E_s/(k_B T)) = sum exp(- beta E_s)\
$

Single Particle:

$
  Z_1 = exp(-beta E_(upar)) + exp(-beta E_(doar)) = 2 cosh(beta epsilon) hspace E_doar = epsilon = - epsilon_upar\
$

=== Average Energy

$
  avg(E) = - pdv(, beta) ln(Z) hspace avg(E_1) = - pdv(, beta) ln(exp(-beta epsilon) + exp(beta epsilon))\
  dv(, x) ln(u) = 1/u dv(u, x) => - epsilon ((exp(beta epsilon) - exp(-beta epsilon))/(exp(beta epsilon) + exp(-beta epsilon))) = -epsilon tanh(beta epsilon)\
$

This gives us the average energy of a single particle in the system depending on $beta(T)$.

=== Total Partition Function

For a system composed of $N$ subsystems, that are distuînguishable and non-interacting, the total partition function is the product of the individual partition functions:

$
  Z_N = Z_1 dot Z_2 dot ... dot Z_N = (Z_1)^N => Z_N = (2 cosh(beta epsilon))^N
$

=== Total Heat Capacity

At constsant volume $V$:

$
  avg(E_N) = N avg(E_1) hspace C_V = pdv(avg(E_N), T) = pdv(avg(E_N), beta) pdv(beta, T)
$

= Wave Properties and Grating

== Tools

=== Wave Equations

$
  nabla^2 E = 1/c^2 pdv(E, t,2)
$

Planar Waves:

$
  E(r, t) = E_0 exp(i (k dot r - omega t)) = E_0 cos(k dot r - omega t) + i E_0 sin(k dot r - omega t)\
$

Spherical Waves:

$
  E(r, t) = E_0/r exp(i(k dot r - omega t)) = E_0/r cos(k dot r - omega t) + i E_0/r sin(k dot r - omega t)\
$

=== Aperture solution/Frauenhofer

We assume monochromatic plane wave incident on the aperture. We will find amplitude $U$ and intensity $I$. We define the aperture function:

$
  f(x, y) = delta => U(r_x, r_y) prop cal(F) (f(x, y)) = integral integral f(x, y) exp(-i 2 pi (r_x x + r_y y)) dd(x) dd(y)\
  r_x= x'/(lambda L), r_y = y'/(lambda L)\
$

$x'$ on distant screen, $L$ is distance aperture to screen. 

$
  I prop abs(U)^2
$

These solutions are additive, so we can define some solutions for base shapes.

For a rectangle with height $a$ and width $b$:

$
  U_(a, b) (r_x, r_y) = integral_(-a/2)^(a/2) exp(2 pi i r_x x) dd(x) integral_(-b/2)^(b/2) exp(2 pi i r_y y) dd(y)\
  = a b sinc(pi r_x a) sinc(pi r_y b)\
$




