#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Physics Cheatsheet",
  author: "Denis Titov",
  language: "ENG",
)


= Quantum

#section("Normalization", intro: [
  Ensure quantum state has unit probability. For superposition states, coefficients must satisfy normalization condition.
])[

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
]
#section("Measurement Probabilities of Operators", intro: [
  Calculate probability of measuring specific eigenvalues from quantum superposition state.
])[

  $
    Psi = 1/(sqrt(5)) (psi_(1, 0, 0) + 2 i dot psi_(2, 1, 1))\
  $

  Possible Operators:

  $
                             "Energy:" & hat(H) psi(n, l, m)   &          = E_(n) psi(n, l, m) \
           "Squared Angular Momentum:" & hat(L)^2 psi(n, l, m) & = hbar l (l + 1) psi(n, l, m) \
    "Z-component of Angular Momentum:" & hat(L)_z psi(n, l, m) &         = hbar m psi(n, l, m) \
  $

  The expectation value of an operator is the square of the absolute value of the eigenvalues times their components:

  $
    P(E_1) = abs(1/sqrt(5))^2 dot abs(1)^2 = 1/5 hspace P(E_2) = abs(1/sqrt(5))^2 dot abs(2 i)^2 = 4/5\
    sum P(E_i) = 1\
  $
]
#section("Time Evolution", intro: [
  Each eigenstate evolves with phase factor $e^(-i E t/hbar)$. Include magnetic field effects if present.
])[

  Start with state at $t=0$. *Each Eigenstate evolves independently* with phase factor *$e^(-i E t/hbar)$*. *Total Energy* of state must be used. If *Magnetic Field* is present, consider *Zeeman Effect*.

  $
    E' = E_n + Delta E_("Zee") = E_n + m mu_B B
  $

  The solution is then:

  $
    Psi(t=0) = c_1 psi_(1, 0, 0) + c_2 psi_(2, 1, 1)\
    => Psi(t) = c_1 psi_(1, 0, 0) e^(-i E_(1) t/hbar) + c_2 psi_(2, 1, 1) e^(-i (E_2 + (m=1) mu_B B) t/hbar)
  $
]
#section("Expectation Value", intro: [
  Calculate mean value of observable from quantum state. Two methods: weighted average or integral.
])[

  Normalized $Psi$. Method 1 if we already have the probabilities. The Expectation is just the weighted average:

  $
    avg(O) = sum_i P(O_i) dot O_i\
  $

  Method 2. We need this for position etc.:

  $
    avg(O) = integral Psi^* hat(O) Psi dd(V)\
    => avg(r) = integral_0^oo e dot P(r) dd(r)
  $

  Where $P$ is the radial probability density.
]
#section("Radial Probability density", intro: [
  Probability distribution of electron distance from nucleus. Most likely at Bohr radius $a_0$ for ground state.
])[

  Previous chapter but look at radius. "What is the probability of finding the electron at a distance $r$ from the nucleus?".

  $
    Psi = R dot Y\
    => P(r) dd(r) = (integral_0^(2 pi) integral_0^pi abs(R_(n l) (r))^2 abs(Y_l^m (theta, phi))^2 r^2 sin(theta) dd(theta) dd(phi)) dd(r)\ \
    => P(r) = abs(R_(n l) (r))^2 r^2\
    "For spherically symmetric wave functions:" P(r) = abs(psi)^2 4 pi r^2\
  $

  Example:

  $
    R_(1, 0) = 2/a_0^(3/2) e^(-r/a_0) hspace P(r) = 4 pi r^2 abs(R_(1, 0))^2 hspace "max" => dv(P(r), r) = 0\
  $

  In this case we get zero at $r = 0, a_0, oo$. $0$ and $oo$ are minima, $a_0$ is a maximum. The electron is most likely to be found at the Bohr radius $a_0$.
]
#section("Angular Momentum Raising/Lowering Operators", intro: [
  Ladder operators that shift magnetic quantum number $m$ by ±1. Useful for constructing angular momentum states.
])[

  Given $ket(l\, m)$ use Angular Momentum Lowering $hat(L)_-$ and Raising $hat(L)_+$ Operators:

  $
    hat(L)_- ket(l \, m) = hbar sqrt((l + m)(l - m + 1)) ket(l\, m - 1)\
    hat(L)_+ ket(l \, m) = hbar sqrt((l - m)(l + m + 1)) ket(l\, m + 1)\
  $

  You can construct operators like $hat(L)_x$ and $hat(L)_y$ from the those operators

  $
    hat(L)_x = (hat(L)_+ + hat(L)_-) / 2 hspace hat(L)_y = (hat(L)_+ - hat(L)_-) / (2i)\
    hat(L)^2 = hat(L)_+ hat(L)_- + hat(L)_z^2 - hbar hat(L)_z
  $

  Example:

  $
    hat(L)_- ket(1\, 1) = sqrt(2) hbar ket(1\, 0)\
  $
]
#section("Angular Momentum Operators and Eigenstates", intro: [
  Fundamental eigenvalue equations for orbital angular momentum operators.
])[

  $
    hat(L)^2 psi = hbar^2 l (l + 1) psi\
    hat(L)_z psi = hbar m psi\
  $
]
#section("Quantum Numbers", intro: [
  Four quantum numbers completely describe electron state in atom. Each set provides unique "address" for electrons.
])[

  *Principal (n):* Main energy level/shell
  $
    n = 1, 2, 3, ...
  $

  *Angular Momentum (l):* Orbital shape and angular momentum
  $
    l = 0, 1, 2, ..., n-1 hspace "where" l = 0("s"), 1("p"), 2("d"), 3("f")
  $

  *Magnetic ($m_l$):* Orbital orientation in space
  $
    m_l = -l, -l+1, ..., 0, ..., l-1, l
  $

  *Magnetic Spin ($m_s$):* Electron spin orientation
  $
    m_s = plus.minus 1/2 hspace "(spin up/down)"
  $

  *Example:* For $n=3$: $l$ can be $0, 1, 2$ (s, p, d orbitals)
]

#section("Particle Spin: Fermions and Bosons", intro: [
  Fundamental particle classification by intrinsic angular momentum determines quantum statistics.
])[

  *Fermions:* Half-integer spin $(1/2, 3/2, ...)$
  - Obey Pauli Exclusion Principle
  - No two identical fermions in same quantum state
  - Examples: electrons, protons, neutrons

  *Bosons:* Integer spin $(0, 1, 2, ...)$
  - No exclusion principle
  - Unlimited particles in same state
  - Examples: photons, mesons
  - Enable phenomena like lasers, Bose-Einstein condensates
]

#section("Zeeman Effect", intro: [
  Spectral line splitting in magnetic field. Energy shifts depend on $m_l$ and $m_s$ quantum numbers.
])[

  *Energy Shift:* External B-field shifts electron energy levels
  $
    Delta E = m_l mu_B B
  $
  where $mu_B$ is Bohr magneton.

  *Key Points:*
  - Orbital magnetic moment: $L=0 => mu_"orbital"=0$
  - Spin magnetic moment persists even for $L=0$ (s-orbitals)
  - Even s-states split due to electron spin ($m_s = plus.minus 1/2$)

  *Spectroscopy Application:*
  $
    "Number of spectral lines" = 2L + 1
  $

  *Example:* 25 spectral lines $=> 2L+1=25 => L=12$

]
#section("Volumetric Probability Density/Born Rule", intro: [
  Born rule: probability density = $|Psi|^2$. Uses spherical coordinates for 3D calculations.
])[

  Reference Spherical Integrals.

  *Born Rule:* The volumetric probability density is given by the square of the absolute value of the wave function:

  $
    P(r) = abs(Psi(r))^2 dd(V)\
    dd(V) = r^2 sin(theta) dd(r) dd(theta) dd(phi) hspace => dd(P) = abs(Psi(r))^2 sin(theta) r^2 dd(r) dd(theta) dd(phi)\
  $


]
#section("Spherical Harmonics solutions", intro: [
  Exact hydrogen atom wavefunctions: angular $Y_l^m$ and radial $R_(n l)$ parts. Key states for calculations.
])[

  Angular Functions:

  $
    Y_0^0 = sqrt(1/(4 pi)) hspace Y_1^(plus.minus 1) = sqrt(3/(8 pi)) e^(plus.minus i phi) sin(theta) hspace Y_1^0 = sqrt(3/(4 pi)) cos(theta)\
    Y_2^(plus.minus 2) = sqrt(15/(32 pi)) e^(plus.minus 2 i phi) sin^2(theta) hspace Y_2^0 = sqrt(5/(16 pi)) (3 cos^2(theta) - 1) hspace\
    Y_2^(plus.minus 1) = sqrt(15/(8 pi)) e^(plus.minus i phi) sin(theta) cos(theta)\
  $

  Radial Functions (depend on $n$ and $l$):

  $
    R_(1 0) (r) = 2 (1/a0)^(3/2) e^(-r/a0) hspace R_(2 0) (r) = 2(1/(2 a0))^(3/2) (1 - r/(2 a0)) e^(-r/(2 a0)) hspace \
    R_(2 1) (r) = 2/sqrt(3) (1/(2 a0))^(3/2) (r/(2 a0)) e^(-r/(2 a0))\
  $

  Combined with this pattern:

  $
    psi_(n l m) (r, theta, phi) = R_(n l) (r) Y_l^m (theta, phi)\
    = sqrt((2/(n a0))^3 (n-l-1)!/(2n(l + n)!)) exp(-r/(n a0)) ((2r)/(n a0))^(l) L_(n - l - 1)^(2l + 1) ((2r)/(n a0)) Y_l^m \
    psi_(1 0 0) = 1/sqrt(pi a0^3) e^(-r/a0) hspace psi_(2 0 0) = 1/(4 sqrt(2 pi a0^3)) (2 - r/a0) e^(-r/(2 a0))\
    psi_(2 1 0) = minus.plus 1/(4(sqrt(2 pi a0^3))) r/a0 e^(-r/(2 a0)) cos(theta) \
    psi_(2 1 plus.minus 1) = 1/(8(sqrt(pi a0^3))) (r/a0) e^(plus.minus i phi) e^(-r/(2 a0)) sin(theta)\
    psi_(3 0 0) = 1 / (81 sqrt(3 pi a0^3)) (27 - 18r/a0 + 2 r^2/a0^2) e^(-r/(3a0))
  $

]
#section("Spherical Integrals", intro: [
  Volume element in spherical coordinates. Separates radial and angular parts for calculations.
])[

  Spherical differential:

  $
    dd(V) = r^2 sin(theta) dd(r) dd(theta) dd(phi)\
    => integral_0^oo integral_0^pi integral_0^(2 pi) Psi^* (r, theta, phi) Psi(r, theta, phi) r^2 sin(theta) dd(phi) dd(theta) dd(r)\
    Psi = R(r) Y(theta, phi) hspace => integral_0^oo abs(R(r))^2 r^2 dd(r) integral_0^pi integral_0^(2 pi) abs(Y(theta, phi))^2 sin(theta) dd(phi) dd(theta)\
  $
]
#section("Operators", intro: [
  Quantum mechanical operators for observables. Position, momentum, energy, angular momentum.
])[

  *Basic Position and Momentum:*
  $
    hat(x) = x hspace hat(y) = y hspace hat(z) = z hspace hat(p)_x = -i hbar pdv(, x) hspace hat(p)_y = -i hbar pdv(, y) hspace hat(p)_z = -i hbar pdv(, z)
  $

  *Energy Operators:*
  $
    hat(H) = hat(T) + hat(V) = hat(p)^2/(2m) + V(x) = -hbar^2/(2m) nabla^2 + V(x) hspace hat(E) = i hbar pdv(, t)
  $

  *Angular Momentum Operators:*
  $
    hat(L) = hat(r) times hat(p) hspace hat(L)_x = hat(y) hat(p)_z - hat(z) hat(p)_y = -i hbar (y pdv(, z) - z pdv(, y))
  $
  $
    hat(L)_y = hat(z) hat(p)_x - hat(x) hat(p)_z = -i hbar (z pdv(, x) - x pdv(, z)) hspace hat(L)_z = hat(x) hat(p)_y - hat(y) hat(p)_x = -i hbar (x pdv(, y) - y pdv(, x))
  $

  *Spherical Coordinates:*
  $
    hat(L)^2 = -hbar^2 [1/(sin theta) pdv(, theta)(sin theta pdv(, theta)) + 1/(sin^2 theta) pdv(, phi, 2)]
  $
  $
    hat(L)_z = -i hbar pdv(, phi)
  $

  *Ladder Operators:*
  $
    hat(L)_+ = hat(L)_x + i hat(L)_y = hbar e^(i phi) (pdv(, theta) + i cot theta pdv(, phi))
  $
  $
    hat(L)_- = hat(L)_x - i hat(L)_y = hbar e^(-i phi) (-pdv(, theta) + i cot theta pdv(, phi))
  $

  *Spin Operators (Pauli matrices):*
  $
    hat(S)_x = hbar/2 sigma_x = hbar/2 mat(0, 1; 1, 0) hspace hat(S)_y = hbar/2 sigma_y = hbar/2 mat(0, -i; i, 0) hspace hat(S)_z = hbar/2 sigma_z = hbar/2 mat(1, 0; 0, -1)
  $

  *Operator Properties & Tricks:*

  - *Hermitian operators:* Real eigenvalues, $hat(A)^dagger = hat(A)$
  - *Unitary operators:* Preserve normalization, $hat(U)^dagger hat(U) = hat(I)$
  - *Projection operators:* $hat(P) = ket(psi) bra(psi)$, satisfy $hat(P)^2 = hat(P)$

  *Operator Algebra:*
  $
    [hat(A) + hat(B), hat(C)] = [hat(A), hat(C)] + [hat(B), hat(C)] hspace [hat(A), hat(B) + hat(C)] = [hat(A), hat(B)] + [hat(A), hat(C)]
  $
  $
    [hat(A) hat(B), hat(C)] = hat(A) [hat(B), hat(C)] + [hat(A), hat(C)] hat(B) hspace [hat(A), hat(B) hat(C)] = [hat(A), hat(B)] hat(C) + hat(B) [hat(A), hat(C)]
  $

  *Time Evolution Operator:*
  $
    hat(U)(t) = e^(-i hat(H) t/hbar) hspace Psi(t) = hat(U)(t) Psi(0)
  $

  *Translation and Rotation Operators:*
  $
    hat(T)(a) = e^(-i hat(p) a/hbar) hspace hat(R)(theta) = e^(-i hat(L) theta/hbar)
  $

  *Parity Operator:*
  $
    hat(Pi) psi(x) = psi(-x) hspace hat(Pi)^2 = hat(I) hspace "eigenvalues:" plus.minus 1
  $

  *Measurement Applications:*
  - Probability of outcome $a_n$: $P(a_n) = abs(braket(phi_n, psi))^2$
  - State after measurement: $ket(psi') = (hat(P)_n ket(psi))/(sqrt(P(a_n)))$
  - Expectation value: $avg(hat(A)) = braket(psi, hat(A) psi) = sum_n a_n P(a_n)$

  *Operator Tricks:*
  - Use ladder operators for efficient calculations: $hat(a)^dagger ket(n) = sqrt(n+1) ket(n+1)$
  - Baker-Campbell-Hausdorff: $e^hat(A) e^hat(B) = e^(hat(A) + hat(B) + 1/2[hat(A), hat(B)] + ...)$
  - For position/momentum: $e^(i hat(p) a/hbar) hat(x) e^(-i hat(p) a/hbar) = hat(x) + a$
  - Completeness: $sum_n ket(n) bra(n) = hat(I)$ (resolution of identity)

]
#section("Commutators", intro: [
  Essential commutation relations for position, momentum, angular momentum, and spin operators.
])[

  $
    &[A, B] = A B - B A\
    &[hat(p)/(2 m), hat(p)] = 0 hspace [hat(x), hat(p)] = i hbar hspace [hat(x), hat(p)_y] = [hat(x), hat(p)_z] = 0 hspace [hat(x), hat(p)_x] = [hat(y), hat(p)_y] = i hbar\
    & [hat(L)_x, hat(L)_y] = i hbar hat(L)_z hspace [hat(L)^2, hat(L)_x] = 0 hspace [hat(L)^2, hat(L)_plus.minus] = 0 hspace [hat(L)_z, hat(L)_plus.minus] = plus.minus hbar hat(L)_plus.minus\
    & [hat(S)_x, hat(S)_y] = i hbar hat(S)_z hspace [hat(S)^2, hat(S)_x] = 0 hspace [hat(L)^2, hat(S) dot hat(L)] = [hat(S)^2, hat(S) dot hat(L)] = 0\
  $

  $
    [hat(L)_z, hat(S) dot hat(L)] = i hbar (hat(S)_x hat(L)_y - hat(S)_y hat(L)_x) hspace [hat(S)_z, hat(S) dot hat(L)] = i hbar (hat(S)_y hat(L)_x - hat(S)_x hat(L)_y)\
  $
]
#section("de Broglie, Heisenberg & Photon Momentum", intro: [
  Fundamental quantum principles: matter wavelength, position-momentum uncertainty, and photon interactions.
])[

  *de Broglie wavelength* (matter waves):
  $
    lambda = h/p = h/(m v)
  $

  *Heisenberg uncertainty principle:*
  $
    Delta x Delta p >= hbar/2
  $

  Cannot simultaneously know exact position and momentum of a particle.

  *Photon momentum and beam deflection:*
  $
    "Single photon:" p = h/lambda = hbar k hspace "where" k = (2 pi)/lambda\
    "N photons absorbed:" Delta p = N hbar k = N h/lambda
  $

  *Applications:*
  - Electron diffraction shows matter waves (de Broglie confirmed)
  - Uncertainty principle limits measurement precision
  - Photon momentum transfer in radiation pressure, laser cooling

]
#section("Hydrogen Atom Fundamentals", intro: [
  Key constants and relationships for hydrogen: Bohr radius, fine structure, Zeeman effect, and virial theorem.
])[

  *Bohr radius* (fundamental length scale):
  $
    a_0 = (4 pi epsilon_0 hbar^2)/(m_e e^2) approx 0.529 times 10^(-10) "m"
  $

  *Fine structure constant* (dimensionless):
  $
    alpha = e^2/(4 pi epsilon_0 hbar c) approx 1/137
  $

  Key relationships:
  $
    alpha = v_1/c hspace "and" hspace a_0 = lambda_c/(2 pi alpha)
  $

  Where $v_1$ is electron speed in first Bohr orbit, $lambda_c = h/(m_e c)$ is Compton wavelength.

  *Energy levels with Zeeman effect:*
  $
    E = -R_E/n^2 + m_l mu_B B
  $

  Where $R_E = 13.6 "eV"$ (Rydberg energy), $n$ is principal quantum number, $m_l$ is magnetic quantum number.

  *Virial theorem* (for $V(r) prop 1/r$):
  $
    avg(V) = 2 avg(E) hspace "and" hspace avg(T) = -avg(E)
  $

  Total energy equals negative of kinetic energy.

]
#section("Wavefunction & Probability", intro: [
  Fundamental quantum description. Born rule connects wavefunction to measurable probabilities.
])[

  *Wavefunction:* $Psi(x, t)$ contains complete information about quantum system.

  *Born rule:* Probability density = $abs(Psi(x, t))^2$

  *Normalization condition:*
  $
    integral abs(Psi)^2 dd(x) = 1
  $

  *State expansion:* Any state can be written as:
  $
    Psi = sum_n c_n phi_n
  $

  Where $phi_n$ are basis states (e.g., energy eigenstates).

]
#section("Quantum Operators", intro: [
  Physical observables represented by mathematical operators. Position, momentum, energy operators.
])[

  *Key operators:*
  $
    hat(x) = x hspace hat(p) = -i hbar pdv(, x) hspace hat(E) = i hbar pdv(, t)
  $

  *Expectation value:*
  $
    avg(O) = integral Psi^* hat(O) Psi dd(x)
  $

  Average measurement outcome for observable $O$.

  *Eigenvalue equation:*
  $
    hat(O) psi = o psi
  $

  Where $o$ is eigenvalue, $psi$ is eigenstate.

]
#section("Quantum Commutators", intro: [
  Mathematical tool expressing uncertainty principle. Position-momentum incompatibility.
])[

  *Commutator definition:*
  $
    [hat(A), hat(B)] = hat(A) hat(B) - hat(B) hat(A)
  $

  *Canonical commutation relation:*
  $
    [hat(x), hat(p)] = i hbar
  $

  Foundation of uncertainty principle.

  *Commutator identities:*
  $
    [hat(A) hat(B), hat(C)] = hat(A) [hat(B), hat(C)] + [hat(A), hat(C)] hat(B)
  $

  *Jacobi identity:*
  $
    [hat(A), [hat(B), hat(C)]] + [hat(B), [hat(C), hat(A)]] + [hat(C), [hat(A), hat(B)]] = 0
  $

]
#section("Schrödinger Equation", intro: [
  Master equation of quantum mechanics. Governs wavefunction time evolution.
])[

  *Time-dependent form:*
  $
    i hbar pdv(Psi, t) = hat(H) Psi
  $

  *Time-independent form* (stationary states):
  $
    hat(H) psi = E psi
  $

  *Free particle solution:*
  $
    psi(x) = A e^(i k x) hspace "where" E = (hbar^2 k^2)/(2m)
  $

  *Infinite square well:*
  $
    psi_n(x) = sqrt(2/a) sin((n pi x)/a) hspace E_n = (n^2 pi^2 hbar^2)/(2 m a^2)
  $

  *Boundary conditions:* $psi$ and $dd(psi)/dd(x)$ must be continuous (unless $V = infinity$).

]
#section("Quantum Tunneling", intro: [
  Particle transmission through classically forbidden barriers. Exponential decay with barrier width.
])[

  *Setup:* Particle with energy $E$ encounters potential barrier of height $V_0$.

  *Scattering case* ($E > V_0$):
  $
    psi_("II")(x) = A cos(k x) + B sin(k x) hspace "where" k = sqrt((2m(E-V_0))/hbar^2)
  $

  *Tunneling case* ($E < V_0$):
  $
    psi_("II")(x) = A e^(-kappa x) + B e^(kappa x) hspace "where" kappa = sqrt((2m(V_0-E))/hbar^2)
  $

  *Transmission probability* (wide barrier):
  $
    T prop exp(-2 kappa a) = exp((-2a)/hbar sqrt(2m(V_0-E)))
  $

  Where $a$ is barrier width.

  *Key insight:* Quantum particles can penetrate classically forbidden regions - probability decreases exponentially with barrier thickness.

]
