#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Elektrodynamik Cheatsheet",
  author: "Denis Titov",
  language: "GER",
)

ALWAYS CHECK IF GAUSS OR SI UNITS

IF THE EXAM IS IN GAUSS UNITS, SET $c = e0 = m0 = "etc." = 1$

= Electrostatics

#section("Electrostatics Maxwell")[
  $
    nabla dot E = rho/e0 hspace nabla cross E = 0
  $
]

#section("Colombs Law (Brute Force)")[
  $
    E(r) = 1/(4pi e0) q/abs(r - r')^2 hat(r) hspace E(r) = 1/(4pi e0) integral_V rho(r')/(abs(r - r')^3) (r - r') dd(r', 3)\
    aF(ax) = q aE
  $

  *Recipe and Example (Finite Rod $dd(z'), 2L, lambda$):*
  + Identify $dd(q) = rho(r') dd(V')$ #hfill $dd(q) = lambda dd(z')$
  + Separation Vector $R = r - r'$ #hfill $R = x hat(x) - z' hat(z), abs(R) = sqrt(x^2 + z'^2)$
  + Infinitessimal Field $dd(E)$ from $dd(q)$ #hfill $dd(E) = integral_(-L)^L 1/(4 pi e0) 1/abs(R)^3 R dd(q)$
  + Integrate! #hfill $E(x) = 1/(4 pi e0) (2 L lambda)/(s sqrt(x^2 + L^2)) hat(x)$
]

#section("Electric Potential (Lazy Method)")[
  $
    Phi(x) = sum 1/(4 pi e0) q_i/abs(x - x_i) hspace Phi(x) = integral_V 1/(4 pi e0) rho(y)/abs(x - y) dd(y, 3) hspace aE = - nabla Phi
  $

  *Recipe and Example (Finite Rod $dd(z'), 2L, lambda$):*
  + Infinitessimal Potential $dd(Phi) = lambda dd(z')$ #hfill $dd(Phi) = 1/(4 pi e0) lambda/(sqrt(x^2 - y^2)) dd(y)$
  + Integrate! #hfill $Phi(x) = integral_(-L)^L 1/(4 pi e0) (lambda)/(sqrt(x^2 + y^2)) dd(y) = lambda/(4 pi e0) ln((L + sqrt(x^2 + L^2))/(-L + sqrt(x^2 + L^2)))$\
  + Get the Field $E = - nabla Phi$ #hfill $E(x) = - nabla Phi = - pdv(Phi, x) hat(x)$

  *Gauge Freedom*: #hfill $Phi' = Phi + C$

  *Dipole Moment*: #hfill $p = integral_V x rho(x) dd(x, 3)$

  *Dipole Approximation*: #hfill $Phi(x) approx 1/(4 pi e0) ((q_1 + q_2)/abs(x) + (x dot (q_1 x_1 + q_2 x_2))/abs(x)^3)$
]

#section("Gauss Law")[
  *When high symmetry present, use Gauss' Law:*

  $
    integral_V nabla dot bold(E) dd(bold(x), 3) = integral.cont_(partial V) hat(bold(n)) dot bold(E) dd(bold(x), 2) = Q_"enc"/epsilon_0
  $
  
  *Key insight:* Choose Gaussian surface where $bold(E)$ is constant and parallel/perpendicular to surface.
  

  $
    nabla dot bold(r)/abs(bold(r))^3 = 4 pi delta^((3)) (bold(r))
  $
]


#section("Near and Far Field Approximations")[
  *Far Field* $(r >> L)$: Shape doesn't matter, acts like point charge.

  $
    bold(E) = 1/(4 pi epsilon_0) (Q_"total")/r^2 hat(bold(r)) quad "where" Q_"total" = integral_V rho dd(V)
  $
  
  *Near Field* $(r << L)$: Shape matters, boundary effects negligible.

  $
    "Infinite line": bold(E) = lambda/(2 pi epsilon_0 r) hat(bold(r))_perp\
    "Infinite plane": bold(E) = sigma/(2 epsilon_0) hat(bold(n))
  $
  
  *Multipole expansion* (far field):
  $
    Phi(bold(r)) = 1/(4 pi epsilon_0) sum_(l=0)^infinity sum_(m=-l)^l (q_(l m))/r^(l+1) Y_l^m (theta, phi)
  $
  where $q_(0 0) = Q_"total"$ (monopole), $q_(1 m)$ related to dipole moment, etc.
]

#section("Electrostatic Energy")[
  *Energy to assemble charges* from $r = infinity$:

  $
    W = 1/2 sum_(i=1)^N q_i Phi(bold(r)_i) = 1/8 pi epsilon_0 sum_(i != j) (q_i q_j)/abs(bold(r)_i - bold(r)_j)
  $

  
  *Continuous distribution:*
  $
    W = 1/2 integral_V rho(bold(r)) Phi(bold(r)) dd(bold(r), 3) = epsilon_0/2 integral_"all space" abs(bold(E))^2 dd(bold(r), 3)
  $
  
  *Energy density:* $u = epsilon_0/2 abs(bold(E))^2$
  
  *Work to move charge:* $W = integral bold(F) dot dd(bold(l)) = q integral bold(E) dot dd(bold(l)) = q(Phi_"final" - Phi_"initial")$
  
  *Forces on conductors:*
  - *Maxwell stress:* Force per unit area = $epsilon_0/2 E_perp^2 hat(bold(n))$ (outward)
  - *Energy method:* $bold(F) = -nabla W$ where $W$ is electrostatic energy
]

#section("Standard Setups and Solutions")[
  *Basic configurations:*
  - *Infinite line charge* $lambda$ #hfill $bold(E) = lambda/(2 pi epsilon_0 r) hat(bold(r))_perp$, $Phi = -lambda/(2 pi epsilon_0) ln(r)$
  - *Infinite plane charge* $sigma$ #hfill $bold(E) = sigma/(2 epsilon_0) hat(bold(n))$, $Phi = -sigma/(2 epsilon_0) z$
  - *Point charge* $q$ #hfill $bold(E) = q/(4 pi epsilon_0 r^2) hat(bold(r))$, $Phi = q/(4 pi epsilon_0 r)$
  
  *Spheres:*
  - *Uniformly charged sphere* $(Q, R)$:
    - Outside $(r > R)$: $bold(E) = Q/(4 pi epsilon_0 r^2) hat(bold(r))$, $Phi = Q/(4 pi epsilon_0 r)$
    - Inside $(r < R)$: $bold(E) = (Q r)/(4 pi epsilon_0 R^3) hat(bold(r))$, $Phi = Q/(4 pi epsilon_0 R) (3/2 - r^2/(2R^2))$
  - *Conducting sphere* at potential $V_0$: $Q = 4 pi epsilon_0 R V_0$
  
  *Charge distributions:*
  - *Point charge:* $rho(bold(r)) = q delta^((3))(bold(r) - bold(r)_0)$
  - *Electric dipole:* $rho(bold(r)) = -bold(p) dot nabla delta^((3))(bold(r))$
    - *Potential:* $Phi = bold(p) dot hat(bold(r))/(4 pi epsilon_0 r^2)$
    - *Field:* $bold(E) = 1/(4 pi epsilon_0 r^3) [3(bold(p) dot hat(bold(r))) hat(bold(r)) - bold(p)]$ (far field)
  
  *Self-energies:*
  - *Uniformly charged sphere:* $W = 3/5 Q^2/(4 pi epsilon_0 R)$
  - *Point dipole:* $W = -bold(p) dot bold(E)_"ext"$ (interaction energy)
]

= Boundary Value Problems

#section("Poisson Equation")[

  $
    bold(E) = - nabla Phi => nabla dot bold(E) = -nabla^2 Phi = rho/epsilon_0\
    "Poisson Eq.": nabla^2 Phi = - rho/epsilon_0\
    "Laplace Eq.": nabla^2 Phi = 0 quad "where" rho = 0
  $
  
  *Physical interpretation:*
  - $rho > 0$: $nabla^2 Phi < 0$ ⟹ *Local maximum* in potential
  - $rho < 0$: $nabla^2 Phi > 0$ ⟹ *Local minimum* in potential
  - $rho = 0$: $nabla^2 Phi = 0$ ⟹ *No local extrema* (harmonic function)
  
  *Laplace operator:* $nabla^2 = laplace = nabla dot nabla (dot)$ (divergence of gradient)
]

#section("Green's Functions")[
  *Green's function* $G(bold(x),bold(y))$ is the potential at point $bold(x)$ due to a unit point charge at point $bold(y)$, respecting boundary conditions.
  
  *General solution:*
  $
    Phi(bold(x)) = 1/(4 pi epsilon_0) integral_V G(bold(y), bold(x)) rho(bold(y)) dd(bold(y), 3) - 1/(4 pi) integral.cont_(partial V) [Phi(bold(y)) pdv(G, n) - G(bold(y), bold(x)) pdv(Phi, n)] dd(bold(y), 2)
  $
  
  *Properties:* $G(bold(x), bold(y)) = G(bold(y), bold(x))$ (reciprocity)

  *Greens Identity*: #hfill $integral_V (Phi nabla^2 G - G nabla^2 Phi) dd(x, 3) = integral.cont_(partial V) (Phi nabla G - G nabla Phi) dot dd(S)$

  This Formula implies the one above.

  *Defining Property:* #hfill $nabla^2_x G(x, x') = -(delta^((3))(x - x'))/(e0)$ 
]

#section("Boundary Value Problems")[
  *Goal:* Find solution to Poisson equation $nabla^2 Phi = - rho/epsilon_0$ inside volume $V$ that satisfies boundary conditions on $partial V$.

  *Uniqueness Theorem* says that for every $rho$ inside a volume, there is only one solution $Phi$ that matches the boundary conditions.

  - *Dirichlet Problem:* $Phi = omega(bold(x))$ on $partial V$
    $
      G_D(bold(x), bold(y)) = 0 quad forall bold(y) in partial V\
      Phi(bold(x)) = 1/(4 pi epsilon_0) integral_V G_D(bold(y),bold(x)) rho(bold(y)) dd(bold(y), 3) - 1/(4 pi) integral.cont_(partial V) omega(bold(y)) pdv(G_D, n) dd(bold(y), 2)
    $

  - *Neumann Problem:* 
    $
      bold(E)_perp = - pdv(Phi, n) = nu(bold(x)) "on" partial V hspace pdv(Phi, n) = - E_perp = - sigma/e0
    $

    A Neumann problem specifies the normal component of the electric field. This is often used when the potential is not known but the *flux through the boundary* is specified or the *charge density* is given.
    
    *Compatibility condition:* $integral.cont_(partial V) nu(bold(y)) dd(bold(y), 2) = -1/epsilon_0 integral_V rho(bold(y)) dd(bold(y), 3)$
    
    $
      hat(bold(n)) dot nabla_bold(y) G_N(bold(x), bold(y)) = -F(bold(y)) quad "where" integral.cont_(partial V) F(bold(y)) dd(bold(y), 2) = 1\
      Phi(bold(x)) = 1/(4 pi epsilon_0) integral_V G_N(bold(x), bold(y)) rho(bold(y)) dd(bold(y), 3) - integral.cont_(partial V) G_N(bold(x), bold(y)) nu(bold(y)) dd(bold(y), 2) + C
    $
]

#section("Method of Images")[
  *Idea:* Replace conductor boundaries with fictitious image charges that produce the same boundary conditions.
  
  *Recipe and Examples:*
  + *Identify boundaries* #hfill Grounded conducting plane at $z = 0$
  + *Remove conductor, place images* #hfill $bold(r)_"image" = (x, y, -z), q_"image" = -q$
  + *Apply Coulomb's law* #hfill $Phi(bold(r)) = q/(4 pi e0) [1/abs(bold(r) - bold(r)_"source") - 1/abs(bold(r) - bold(r)_"image")]$

  *Point charge and grounded sphere:*
  - Charge $q$ at distance $d$ from center of sphere (radius $R$)
  - *Image charge:* $q_"image" = -q R/d$ at position $bold(r)_"image" = R^2/d hat(bold(r))_"source"$
  - *Image location:* $r_"image" = R^2/d$ (inside sphere)
  
  *Force on original charge:* $F = -q^2 R/(4 pi epsilon_0 d^2 (d^2 - R^2))$ (attractive toward sphere)
]

#section("Separation of Variables")[
  *When to use:* Geometry allows factorization but image charges are too complicated. 

  *Recipe and Example (Rectangular Box $rho=0$ inside):*
  + Assume Seperable #hfill $Phi(x, y, z) = X(x) Y(y) Z(z)$
  + Separate #hfill $X_(x x)/X + Y_(y y)/Y + Z_(z z)/Z = 0$
  + Terms Constant #hfill $X_(x x)/X = - lambda^2$, $Y_(y y)/Y = - mu^2$, $Z_(z z)/Z = lambda^2 + mu^2$
  + Apply Boundary #hfill $Phi(0) = Phi(a) = 0 => sin((n pi x)/a)$
  + General Solution #hfill $Phi(ax) = sum A_(n m l) sin((n pi x)/a) sin((m pi y)/b) sin((l pi z)/c)$
  + Apply final Boundary Conditions to find $A_(n m l)$ 
]

= Spherical Coordinates

#section("Spherical Coordinates")[
  $
    r = sqrt(x^2 + y^2 + z^2) hspace ax = mat(r sin theta cos phi; r sin theta cos phi; r cos theta)\
    theta = arccos(z/r) hspace phi = arctan(y/x) + pi Theta(-x) "sign"(y)\
    nabla^2 = (pdv(, r))^2 + 2/r pdv(, r) + 1/r^2 (pdv(, theta))^2 + 1/(r^2 sin^2(theta)) (pdv(, phi))^2\
    nabla = pdv(,r) hat(r)  1/r pdv(, theta) hat(theta) + 1/(r sin theta) pdv(, phi) hat(phi)\
    nabla dot = 1/r^2 pdv(, r) (r^2 pdv(, r)) + 1/(r^2 sin theta) pdv(, theta) (sin theta pdv(, theta)) + 1/(r^2 sin^2(theta)) pdv(, phi, 2)\
    Phi(r, theta, phi) = sum_(l, m) Q_(l m)/(4 pi e0) 1/((2 l + 1) r^(l+1)) Y_l^m (theta, phi)\
    nabla^2 Phi = 1/r^2 pdv(,r)(r^2 pdv(Phi, r) ) + 1/(r^2 sin theta) pdv(, theta)(sin theta pdv(Phi, theta)) + 1/(r^2 sin^2(theta))(pdv(Phi, phi, 2)) = 0
  $
]

#section("Separation of Variable")[
  $
    Phi = R(r) Y(theta, phi) hspace dv(, r) (r^2 dv(R, r)) - l(l + 1) R = 0hspace l "Separation constant"\ \
    1/(sin theta) pdv(, theta) (sin theta pdv(Y, theta)) + 1/(sin^2theta) (pdv(Y, phi, 2)) + l(l + 1) Y = 0\ 
  $
  *Solutions Radial Part:*
  $
    R(r) = A r^l + B r^(-(l+1)) hspace Y(theta, phi) = C Y_l^m (theta, phi)
  $
  One is nice at infinity, the other at zero. Pick the one that fits your boundary conditions.

  *Solutions Angular Part:*
  $
    "Legendre Polys": P_l (x) = 1/(2^l l!) dv(, x, l) (x^2 - 1)^l hspace P_l^m (x) =  (-1)^m (l - m)!/(l + m)! P_l (x)\
    P_l^(-m) = (-1)^m (l - m)!/(l + m)! P_l^m hspace Y_l^m (theta, phi) = sqrt((2 l + 1)/(4 pi) (l - m)!/(l + m)!) P_l^m (cos theta) e^(i m phi)\
    Phi = sum_(l=0)^infinity sum_(m=-l)^l (A_(l m) r^l + B_(l m) r^(-(l+1))) Y_l^m (theta, phi)
  $
  Then apply boundary conditions to find coefficients $A_(l m)$ and $B_(l m)$ (often one of them is zero). Use the fact, that $Y_l^m$ are orthogonal.
]

#section("Multipole Expansion")[
  *Multipole expansion* is a way to express the potential of a charge distribution in spherical coordinates.
  
  *Monopole term:* $Q = integral_V rho dd(V) hspace Phi = Q/(4 pi e0 r)$ (total charge)
  
  *Dipole term:* $bold(p) = integral_V bold(r) rho dd(V) hspace Phi = p/(4 pi e0 r^2) hat(r)$ (dipole moment)
  
  *Quadrupole term:* $bold(Q) = integral_V (3 bold(r) bold(r)^T - r^2 id) rho dd(V) prop 1/r^3$ (quadrupole moment)
  
  *General form:*
  $
    Phi(bold(r)) = 1/(4 pi epsilon_0) [Q/r + bold(p) dot hat(bold(r))/r^2 + bold(Q) : hat(bold(r)) hat(bold(r))/r^3 + ...]
  $
]

= Magnetostatics

#section("Magnetostatics Maxwell")[
  $
    nabla dot B = 0 hspace nabla cross B = mu_0 J + mu_0 epsilon_0 pdv(E, t) hspace nabla dot E = rho/epsilon_0 hspace nabla cross E = - pdv(B, t)\
    nabla dot J = 0 hspace aF = integral_V aJ dot B dd(V)\
  $
]

#section("Current Density")[
  *Current density* $J$ is the current per unit area:
  $
    dv(Q, t) = aJ dot dd(arrow(s)) hspace => aJ = rho av\

  $
]

#section("Biot-Savart Law")[
  *Magnetic field* $B$ at point $bold(r)$ due to current $I$ in wire segment $dd(bold(l))$ and straight wire:
  $
    bold(B)(bold(r)) = mu_0/(4 pi) integral_V J(bold(r)') cross (bold(r) - bold(r)')/abs(bold(r) - bold(r)')^3 dd(bold(r)', 3) hspace bold(B)(bold(r)) = mu_0 I/(4 pi) hat(bold(r)) cross (hat(bold(l)) sin(theta)/r^2)
  $

  *Recipe and Example (Straight Wire $dd(x'), L, I$):*
  + Parametrize Wire #hfill $r' = x' hat(x') + y' hat(y') + z' hat(z'), dd(l') = dd(x') hat(x')$
  + Find separation Vector #hfill $R = r - r'$
  + Compute Cross Prod. #hfill $dd(B) = (mu_0 I)/(4 pi) (dd(l') cross R)/abs(R)^3$
]

#section("Ampere's Law")[
  Shortcut for calculating magnetic fields in high symmetry situations:
  $
    integral.cont_(partial S) B dot dd(l) = mu_0 I_"enc" hspace "where" I_"enc" = integral_V J dd(V)\
  $
  *Key Insight:* Choose surface where $B$ is constant and parallel/perpendicular to surface.
  *Recipe and Example (Infinite Wire $I$):*
  + Identify Symmetry #hfill Infinite straight wire along $z$-axis
  + Choose Loop #hfill Circular loop of radius $r$ centered on wire
  + Integral #hfill $mu_0 I_"enc" =integral.cont_(partial S) B dot dd(l) = B integral.cont_(partial S) dd(l) = B (2 pi r)$
  + Solve for $B$ #hfill $B = mu_0 I/(2 pi r)$
]

#section("Faradays Law")[
  $
    nabla cross E = - pdv(B, t) hspace => integral.cont E dot dd(l) = - dv(Phi_B, t), "where" Phi_B = integral_S B dot dd(S)\
  $
]

#section("Vector Potential")[
  $
    nabla dot B = 0 hspace => B = nabla cross A hspace A(r) = mu_0/(4 pi) integral_V J(r')/abs(r - r') dd(r', 3)\
  $
  *Thin Wire:* #hfill $A(r) = (mu_0 I)/(4 pi) integral_"wire" 1/abs(r- r') dd(l')$

  *Gauge Invariance:* $A' = A + nabla f$ does not change $B$. We choose $nabla dot A = 0$
]

#section("Magnetic Dipole Moment")[
  $
    m = 1/2 integral_V (r' cross J(r')) dd(V)
  $
  *Drehmoment:* #hfill aM = m cross B
]

#section("Multipole Expansion (Far Field)")[
  Far away the magnetic field is dominated by the *dipole term* $m$ from current $I$ and area vector $S$ (curl fingers of right hand around current, thumb points in direction of $m$):
  $
    m = I S hspace B_d (r) = mu_0/(4 pi) [(3(m dot hat(r)) hat(r) - m)/r^3] hspace A_d (r) = mu_0/(4 pi) (m cross hat(r))/r^2\
  $
]

#section("Poisson Equation")[
  $
    nabla^2 phi = -rho/epsilon_0 hspace  <=> nabla^2 A_x = -mu_0 J_x hspace nabla^2 A_y = -mu_0 J_y hspace nabla^2 A_z = -mu_0 J_z\
  $
]

#section("Field Energy and Potential Energy")[
  *Energy Stored in B-Field*: #hfill $W = integral u_B dd(V) = 1/(2 mu_0) integral |B|^2 dd(V), u_B = B^2/(2 mu_0) $
  *Pot Energy of Dipole*: #hfill $U = -m dot B$
]

= Maxwell Equations

#section("Maxwell Equations")[
  - Lorentz-Force #hfill $aF = q(aE + av cross aB)$
  - Induction Law #hfill $nabla^2 U_(partial A) ? pdv(, t) integral_A an dot aB dd(x, 2) = - dot(Psi)_A$
  $
    nabla dot E = rho/e0 hspace nabla dot B = 0 hspace nabla cross E = - pdv(B, t) hspace nabla cross B - mu_0 e0 partial_t aE = mu_0 aJ\
    nabla dot aJ + partial_t rho = 0 hspace 1/c^2 = m0 e0
  $
]


= Relativity

#section("Relativity")[
  $
    g_(mu nu) = diag(1, -1, -1, -1) hspace Delta s^2 = c^2 dd(t,2) - dd(x, 2) = g_(mu nu) dd(x^mu) dd(x^nu)\
  $
  $dd(s, 2)$ is invariant under Lorentz transformations. It is the samte for all $x^mu |-> Lambda_nu wj^mu x^mu + c^nu$

  *Proper Time*: #hfill $dd(tau, 2) = dd(s, 2)$

  *Energy-Momentum Relation*: #hfill $E^2 = p^2 c^2 + m^2 c^4$ 

  Lorentz Boost accelerates observer from rest to velocity $v$ in direction of $x$-axis. Rotation around $z$-axis by angle $phi$.

  $
    Lambda^mu_nu (v) = mat(gamma, - gamma beta, 0, 0; -gamma beta, gamma, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1) hspace Lambda^mu_nu (phi) = mat(1, 0, 0, 0; 0, cos(phi), -sin(phi), 0; 0, sin(phi), cos(phi), 0; 0, 0, 0, 1)\
  $
]

#section("Lorentz Transformations")[
  *Lorentz transformation* relates coordinates in different inertial frames:
  $
    x^mu = mat(c t; ax) hspace x'^mu = mat(c t'; ax') hspace x'^mu = Lambda^mu_nu x^nu\
    Lambda^0_0 = gamma hspace Lambda^0_i = -gamma v_i/c hspace Lambda^i_0 = -gamma v_i/c hspace Lambda^i_j = delta^i_j + (gamma - 1)v_i v_j/c^2\
    gamma = 1/sqrt(1 - v^2/c^2) hspace beta = v/c hspace det(Lambda) = 1 "Proper Lorentz Group"\
  $
]

#section("Dilatation and Contraction")[
  *Time Dilation*: #hfill $t' = gamma t$ (moving clock ticks slower)
  
  *Length Contraction*: #hfill $L = L_0 sqrt(1 - v^2/c^2)$ (moving objects appear shorter)
  
  *Relativistic Momentum*: #hfill $p = m v / sqrt(1 - v^2/c^2) = gamma m v$
]
  

#section("4-Quantities")[
  *Position* $x$, *Velocity* $v$, *Momentum* $p$, *Force* $f$, *Acceleration* $a$, *Current Density* $j$, *Potential* $A$, 
  $
    x^mu = mat(c t; ax) hspace v^mu = dv(x^mu, tau) = mat(c; ax) = gamma mat(1; av) hspace ap^mu = m c dv(x^mu, tau) = mat(m gamma c; m gamma av) = mat(E/c; ap)\
    f^mu = m c^2 dv(x^mu, tau, 2) = q F^(mu nu) dv(x_nu, tau) hspace a^mu = dv(v^mu, tau)\
    J^mu = mat(c rho; aJ) hspace partial_mu J^mu = 0 hspace A^mu = mat(Phi/c; A) hspace partial_mu A^mu = 0 
  $
]

#section("Retarded Greens Function")[
  $
    t_"ret" = t - abs(x - x')/c hspace G_"ret" = 1/(4 pi abs(x - x')) delta(t - t_"ret" - abs(x - x')/c)\
    aA(ax, t) = 1/(4 pi e0 c^2) integral_V aJ(ax, t-abs(x-x')/c)/(abs(x - x')) dd(x', 3)\
    mat(Phi;aA) = integral_V 1/(4 pi e0) 1/abs(x - x') 1/c mat(rho(ax', t - abs(x - x')/c); aJ(ax', t - abs(x - x')/c)) dd(x', 3)\
  $
]

#section("Relativistic Maxwell Equations")[
  $
    F^(mu nu) = mat(0, -E^1, -E^2, -E^3; E^1, 0, -B^3, B^2; E^2, B^3, 0, -B^1; E^3, -B^2, B^1, 0) hspace partial_mu F^(mu nu) = J^nu
  $
  *Electromagnetic 4-Force*: #hfill $f^mu = q F^(mu nu) v_nu$
]

#section("Einstein Notation")[
  $
    A^mu B_mu = A^0 B_0 + A^1 B_1 + ... hspace g_(mu nu) = g^(mu nu) = diag(1, -1...) => g_(mu nu) A^mu = A_nu\
    A^mu = (A^0, A^1, A^2, A^3) => A_mu = (A_0, -A_1, -A_2, -A_3)  hspace g^(nu sigma) F_(sigma rho) = F_rho^nu\
    Tr(T) = T^mu_mu = T^0_0 + T^1_1+... hspace T^(mu nu) ->^(g) T^mu_nu hspace delta_mu^nu = g^(mu nu) g_(nu mu) hspace Tr(delta^mu_mu) = 4
  $
  Rank is the number of open indices.
]

#section("Lorentz Gauge")[
  $chi(x, t)$ is a scalar function. $square$ is the d'Alembert operator $square = 1/c^2 pdv( t, 2) - nabla^2$
  $
    A'_mu = A_mu + partial_mu chi hspace "Lorentz Gauge:" partial_mu A^mu = 0 => square A^mu = mu_0 J'mu
  $
]

= Radiation

#section("Lienard-Wiechert Potentials")[
  *Lieard-Wiechert potentials* describe the electromagnetic field of a moving charge:
  $
    t_r = r - (abs(x - r(t_r)))/c hspace square = 1/c^2 pdv(, t, 2) - nabla^2 hspace square Phi = rho/e0 hspace square A = J/(e0 c^2)\
    square G = delta(x- x') delta(t- t') hspace => G_r (x - x', t - t') = delta(t - t' - (abs(x- x'))/(c))/(4 pi abs(x-x')) 
  $
  This makes the Greens function a propagator!
  $
    Phi(x, t) = 1/(4 pi e0) (evaluated(1/(R - R dot v/c))_(t_r)) hspace A(x, t) = m0/(4 pi) (evaluated((q v)/(R - R dot v/c))_(t_r))\
    v = dot(r) (t_r) hspace R = x - r(t_r)
  $
]

#section("Field Tensor")[
  $
    F^(mu nu) = partial^mu A^nu - partial^nu A^mu hspace R dot v = g_(alpha  beta) R^alpha v^beta\
    = q/(4 pi e0 c) 1/(R dot v)^3 evaluated([(R^mu v^nu - R^nu v^mu) (1 + R dot a) - (R^mu a^nu - R^nu a^mu) (R dot v)])_t_r
  $
  Retarded 4-vector #hfill $R^mu = x^mu - r^mu (tau)$

  We get the electric field split up into *velocity and acceleration*:

  $
    E = 1/(4 pi e0) evaluated([(hat(n) - beta)/(gamma^2 (1 - hat(n) dot beta)^3 R^2)])_t_r + 
    
    q/(4 pi e0 c) evaluated([(hat(n) cross ((hat(n) - beta) cross a))/((1 - hat(n) dot beta)^3 R)])_t_r = E_v + E_a\
    hat(n) prop R hspace
  $
  The radiation field is the acceleration field. If falls of with $1/R$ and is proportional to acceleration. It is perpendicular to the velocity vector.
]

#section("Poynting Vector and Larmor")[
  *Poynting vector* $S$ describes (directed) energy flux density:
  $
    S = 1/m0 (E cross B) hspace pdv(w, t) + nabla dot S = -E dot aJ
  $
  Lamors formula gives the power radiated by a charge. For $v = 0$:
  $
    E_"rad" = q/(4 pi e0 c^2 R) (hat(n) cross (hat(n) cross a)) hspace B_"rad" = 1/c (hat(n) cross E_"rad")\
    abs(S) = 1/(m0 c) abs(E_"rad")^2 = (q^2 a^2)/(16 pi^2 e0 c^3 R^2) sin^2 Theta
  $
  Where $Theta$ angle between $a$ and observation $hat(n)$.

  *Angular Power Distribution*: #hfill $dv(P, Omega) = abs(S) R^2 = (q^2 a^2)/(16 pi^2 e0 c^3) sin^2 Theta$

  *Total Power*: #hfill $P = integral_(Omega) dv(P, Omega) = (q^2 a^2)/(16 pi^2 e0 c^3) integral_0^(2 pi) dd(phi) integral_0^pi sin^2 Theta sin Theta dd(Theta) = 8/3 pi$

  *Larmor Formula*: #hfill $P = (q^2 a^2)/(6 pi e0 c^3)$

  We extend to arbitrary velocities and accelerations (c=1):
  $
    dv(P, Omega) = (q^2 a^2)/(16 pi^2 e0 c^3) (sin^2 Theta)/((1 - beta cos(theta))^5)
  $
  *Accelerator Power Loss (Circular)*: #hfill $P_"rad" = 2/3 gamma^4 (q^2 a^2)/(4 pi e0 c^3) prop gamma^4$

  *Accelerator Power Loss (Linear)*: #hfill $P_"rad" = 2/3 gamma^6 (q^2 a^2)/(4 pi e0 c^3) prop gamma^6$ 
]

#section("Thompson Scattering")[
  For free electrons in a plane wave with electric field $E$ and frequency $Omega$, the radiation emitted by the electron is given by:
  $
    dv(P_"rad", Omega) = (q^2 a^2)/(16 pi^2 e0 c^3) sin^2 Theta hspace avg(dv(P_"rad", Omega)) = (q^4 E^2)/(32 pi^2 m^2) sin^2 Theta\
  $
  *Time Averaged Incident Flux*: #hfill $avg(S) = E^2 /2 $

  *Differential Crossection*: #hfill $dv(sigma, Omega) = q^4/(16 pi m^2) sin^2 Theta$

  *-> Unpolarized*: #hfill $dv(sigma, Omega) = q^4/(32 pi m^2) (1 + cos^2 Theta)$

  *Total Cross Section*: #hfill $sigma = (8 pi)/3 r_q^2 = q^4/(6 pi m^2)$

  *Charge Radius*: #hfill $r_q = q^2/(4 pi m)$
]

#section("Rayleigh Scattering")[
  For charges that are bound in atoms (harmonic oscillator), the radiation emitted is given by:
  $
    ddot(x)_"ray" = ddot(x)_"thom" dot omega/(omega_0^2 - omega^2 + i gamma omega) hspace sigma = sigma_"thom" omega^4/((omega^2 - omega_0^2)^2 + gamma^2 omega^2)\
  $
  If frequency of light $omega$ much smaller than the natural frequency of the oscillator $omega_0$, we get:
  *Rayleigh Scattering Limit*: #hfill $sigma approx sigma_"thom" (omega/omega_0)^4$
]

= Macroscopic Maxwell in Medium

#section("Auxillary Fields and Constitutive Relations")[
  *Polarization*: #hfill $P = N alpha E$ (avg. electric dipole moment per unit volume)

  *Magnetization*: #hfill $M = N mu B$ (avg. magnetic dipole moment per volume)

  *Auxillary Field* #hfill $D = epsilon_0 E + P$ (electric displacement field)

  For simple, linear materials, the response is prop. to applied field.

  *Electric Susceptibility*: #hfill $P = epsilon_0 chi_E E$ (dimensionless)

  *Permittivity*: #hfill $epsilon = epsilon_0 (1 + chi_E)$ (absolute permittivity)

]

#section("Macroscopic Maxwell and Waves")[
  $
    nabla dot D = rho_"eff" hspace nabla dot B = 0 hspace nabla cross E = - pdv(B, t) hspace nabla cross H = J_"eff"/(e0 c^2) + 1/(e0 c^2) pdv(D, t) \
  $

  *Speed of Light in Medium*: #hfill $c_m = c/sqrt(1 + chi_E)$

  *Index of Refraction*: #hfill $n = c/c_m = sqrt(1 + chi_E)$

  *Microscopic Susceptibility*: #hfill $chi_E (omega) = q^2/m N/(omega_0^2 - omega^2 + i gamma omega)$

  *Index of Refraction in Metals*: #hfill $n^2 approx 1 - omega_p^2/omega^2$

  *Plasma Frequency*: #hfill $omega_p^2 = N q^2/(m epsilon_0)$ (frequency at which plasma oscillates)

  Also frequency above which metals become transparent to light.
]

#section("Boundary Conditions")[
  *At interface between two media* (e.g. dielectric and conductor):
  $
    E_(1, parallel) = E_(2, parallel) hspace (e0 E_1 + P_1)_perp = (e0 E_2 + P_2)_perp hspace B_1 = B_2
  $
]

#section("Reflection and Refraction")[
  *Snell's Law*, *S-Polarization* (perpendicular to plane of incidence), *P-Polarization* (parallel to plane of incidence), (reflection $r$, transmission $t$ coefficients for $E_t / E_i$ or $E_r/E_i$):
  $
    (n_1 sin(theta_1))/(n_2 sin(theta_2)) = 1 hspace r_s = (n_1 cos(theta_1) - n_2 cos(theta_2))/(n_1 cos(theta_1) + n_2 cos(theta_2)) hspace t_s = (2 n_1 cos(theta_1))/(n_1 cos(theta_1) + n_2 cos(theta_2))\
    r_p = (n_2 cos(theta_1) - n_1 cos(theta_2))/(n_2 cos(theta_1) + n_1 cos(theta_2)) hspace t_p = (2 n_1 cos(theta_1))/(n_2 cos(theta_1) + n_1 cos(theta_2))\
    E = E_0 e^(i (k dot x - omega t)) hspace B = (k cross E)/omega
  $
]

= Example Problems

#section("Dirichlet Mirror")[
  Plate at $Phi = 0$ with $+q$ at $r_+ = (d, 0, 0)$. We place $-q$ at $r_- = (-d, 0, 0)$.
  $
    Phi(r) = 1/(4 pi epsilon_0) [q/(sqrt((x - d)^2 + y^2 + z^2)) + (-q)/(sqrt((x + d)^2 + y^2 + z^2))]\
  $
]

#section("Spherical Image")[
  Sphere at $Phi = 0$. $+q$ outside at $r_q = (0, 0, 0)$. $q_i$ inside at $r_i = (0, 0, b)$. We calculate colomb and parametrize for the sphere.

  $
    Phi(r) = 1/(4 pi epsilon_0) [q/(abs(r - r_q)) + q_i/(abs(r - r_i))] hspace abs(r - r_q) = sqrt((R cos theta)^2 + (d - R sin theta)^2)\
    = sqrt(R^2 + d^2 - 2 d R cos theta) hspace abs(r - r_i) = sqrt(R^2 + b^2 - 2 b R cos theta)\
    Phi = 0 "if" q/abs(r- r_q) = q_i/abs(r - r_i)\
    [q^2(R^2 + b^2) - q_i (R^2 + d^2)] + cos theta [q^2 (- 2 b R) + q_i^2 (2 d R)] = 0 = A + cos theta B\
    2 R d q_i^2 = 2 R b q^2 => d R^2 d b^2 = b R^2 + b d^2 => b = R^2/d hspace q_i = -q R/d
  $
]

#section("Neumann Rectangular Box")[
  Left/Right: $pdv(Phi, n) = pdv(Phi, x) = 0$, Top $pdv(Phi, n) = pdv(Phi, n) = E_0$, Bottom $Phi = 0$. Box a $cross b$. Z infinite.
  $
    Phi = X Y => (partial_x^2 X)/X = - (partial_y^2 Y)/Y = - k^2 => X'' + k^2 X = 0, Y'' - k^2 Y = 0\
    X = A sin(k x) + B cos(k x) hspace X'(0) = 0 = X'(a)\
    X' = A k cos(k x) - B k sin(k x), X'(0) = 0, X'(a) = 0 => A = 0, k_n = n pi/a\
    X_n = B_n cos(n pi/a x) hspace Y = C sinh(k y) + D cosh(k y), Y(0) = 0 => D = 0\
    Y_n = C_n sinh(n pi/a x) hspace Y_0 = 0 => D_0 = 0 => Y_0 = C_0 y\
    Phi(x, y) = E_0 y + sum_(n=1) E_n cos(n pi/a x) sinh(n pi/a y)\
    Phi' = E_0 + sum_(n=1) E_n cos(n pi/a x) [(n pi/a) cosh(n pi/a y)] hspace Phi'(b) = E_0 => E_n = 0
  $
]

#section("Spherical Harmonics")[
  Sphere. Top Hemisphere at $Phi = 1V$, Bottom Hemisphere at $Phi = -V$. Calculate $Phi$ inside.
  $
    Phi(R, theta) = cases(+V \, 0 <= theta < pi/2, -V \, pi/2 <= theta < pi) hspace "Gnrl:" Phi(R, theta) = sum (A_l r^l + B_l r^(-l-1)) P_l (cos theta)\
    0 in V => B_l = 0 => Phi = sum A_l r^l P_l (cos theta) hspace  Phi(R, theta) = sum A_l R^l P_l (cos theta)\
    integral_(-1)^1 P_l P_m = 2/(2 l + 1) delta_(l m) | x = cos theta hspace A_l R^l = (2 l + 1)/2 integral_(-1)^1 Phi(R, x) P_l (x) dx\
    = (2 l + 1)/2 [integral_(-1)^0 -V P_l(x) dx + integral_0^1 V P_l(x) dx]\
  $
  $V$ Odd, $P_l$ Even $=>$ ($l$ Even $=> A_l = 0$)
  $
    Phi = A_1 r P_1 (cos theta) + A_3 r^3 P_3 (cos theta) ... = V[3/2 r/R P_1 (cos theta) - 7/8 r^3/R^3 P_3 (cos theta)...]\
  $
]

#section("Poisson Surface Charge Density and Spherical Harmonics")[
  Sphere with $sigma(theta) = sigma_0 cos(theta)$. Find $Phi(r, theta)$ everywhere.
  $
    -sigma/e0 = - E_perp = pdv(Phi, n) hspace (1) Phi_"in" (R, theta) = Phi_"out" (R, theta) (+ C)\
    (2) partial_r Phi_"out" |_R - partial_r Phi_"in" |_R = -sigma(theta)/e0 hspace \
    Phi_"in" = sum A_l r^l P_l (cos theta) hspace Phi_"out" = sum B_l r^(-l-1) P_l (cos theta)\
    (1) => B_l = A_l R^(2l + 1) hspace partial_r Phi_"in" = sum l A_l r^(l-1) P_l (cos theta)\
    partial_r Phi_"out" = sum -(l + 1) B_l r^(-l-2) P_l (cos theta)\
    (2) => sum[-(l + 1) B_l R^(-l-2)
    - l A_l R^(l-1)] P_l (cos theta) = -sigma_0 cos(theta)/e0\
    = sum -(2 l + 1) A_l R^(l-1) P_l (cos theta) hspace P_1 (cos theta) = cos theta => A_l = 0 forall l != 0\
    => A_1 = sigma_0/(3 e0) => B_1 = sigma_0/(3 e0) R^3 hspace Phi_"in" = sigma_0/(3 e0) r cos theta hspace Phi_"out" = sigma_0/(3 e0) R^3/r^2 cos theta\
    => E_"in" = -nabla Phi_"in" = -sigma_0/(3 e0) hat(z) hspace E_"out" = -nabla Phi_"out" = -sigma_0/(3 e0) R^3/r^3 (2 cos theta hat(r) + sin theta hat(theta))\
  $
]

#section("Greens Functions")[
  Formally Potential from Single Charge already respecting Boundary. General Dirichlet $Phi|_(partial V) = 0$.\
  $
    Phi(ar) = 1/(4 pi e0) integral_V G_D (ar, ar') rho(ar') dd(ar')
  $
  We Compute the Flux of the Gradient of $G$ across $partial V$\
  $
    "Flux" = integral.cont_(partial V) nabla_x G_D (x, x') dd(S) = integral_V nabla_x dot (nabla_x G_D (x, x')) dd(V)\
    = integral_V nabla_x^2 G_D (x, x') dd(V) = integral_V delta(x - x') dd(V) = cases(1\, x' in V, 0 \, x' in.not V)
  $
]

#section("Dirichlet Poisson Combo")[
  Rectangle $a cross b$. Left/Right/Bottom: $Phi = 0$, Top: $pdv(Phi, y) = 0$. $rho(x, y) = rho_0 sin(pi/a x)$, $nabla^2 Phi = - rho/e0$. We split $Phi = Phi_"poiss" + Phi_"hom"$.
  $
    nabla^2 Phi_p = - rho/e0 hspace nabla^2 Phi_h = 0 hspace "Gnrl:" Phi = sum Y_n(y) sin(n pi/a x)\
    partial_x^2 Phi + partial_y^2 Phi = - rho/e0 => sum_n [Y''_n - (n^2 pi^2)/a^2 Y_n] sin(n pi/a x) = - rho_0/e0 sin(pi/a x) => Y_1\
    Y_(1 p) = C, Y''_(1 p) = 0 => C=(rho_0 a^2)/(e0 pi^2) => Y_1 = A cosh(pi/a y) + B sinh(pi/a y) + (rho_0 a^2)/(e0 pi^2)\
    Y_1(0) = 0 => A = - (rho_0 a^2)/(e0 pi^2) hspace Y'_1(b) = B pi/a cosh(pi/a b) + (rho_0 a^2)/(e0 pi^2) sinh(pi/a b) = 0\
    => B = (rho_0 a^2)/(e0 pi^2) tanh(pi/a b) => Phi = Y_1(y) sin(pi/a x))
  $
]

#section("Field of Relativistic Moving Charge")[
  Charge $q$ moving past Lab $K$ at $v = v hat(x)$
  $
    aB_q = 0 hspace aE_q (r_q) = 1/(4 pi e0) (q r_q)/(abs(r_q)^3) hspace aA_q = 0 hspace Phi_q = 1/(4 pi e0) (q)/(abs(r_q))\
    A_q^mu = mat(Phi_q/c; aA_q) hspace A^mu = Lambda^mu_nu A_q^nu hspace Phi = gamma Phi_q + gamma v_x/c aA_q hspace A_x = gamma v/c^2 Phi_q
  $
  Express in Lab coordinates
  $
    y_q = y hspace z_q = z hspace x_q = gamma (x - v t) hspace abs(r_q) ? sqrt(gamma^2 (x- v t^2) + y^2 + z^2)\
    Phi = 1/(4 pi e0) (q gamma)/(abs(r_q)) hspace A = 1/(4 pi e0) (q gamma v)/(abs(r_q)) hat(x)
  $
]

#section("Trace with Einstein Notation")[
  Given $T^(mu nu) = F^(mu rho) F^nu_rho - 1/4 g^(mu nu) F_(rho sigma) F^(rho sigma)$ calculate $Tr(T^mu_mu)$:
  $
    T^mu_lambda = g_(lambda nu) T^(mu nu) = g_(lambda nu) (F^(mu rho) F^nu_rho - 1/4 g^(mu nu) F_(rho sigma) F^(rho sigma))\
    = F^(mu rho) g_(lambda nu) F^nu_rho - 1/4 g_(lambda nu) g^(mu nu) F_(rho sigma) F^(rho sigma) hspace | g_(lambda nu) F^nu_rho = F_(rho lambda) hspace |g_(lambda nu) g^(mu nu) = delta_lambda^mu\
    = F^(mu rho) F_(mu rho) - 1/4 delta_lambda^mu F_(rho sigma) F^(rho sigma) hspace |Tr(delta) = 4 hspace => F^(rho sigma) F_(rho sigma) - F_(rho sigma) F^(rho sigma)  = 0\
    => Tr(T^mu_mu) = 0
  $
]

#section("Field Tensor Gauge Invariance")[
  $
    (a)F_(mu nu)  F^(mu nu) partial_alpha A^alpha hspace F^(mu nu) = partial^mu A^nu - partial^nu A^mu = partial^mu (A^nu + partial^nu chi) - partial^nu (A^mu + partial^mu chi)\
    F^(mu nu) = (partial^mu A^nu - partial^nu A^mu) + (partial^mu partial^nu chi - partial^nu partial^mu chi) = F^(mu nu) + 0\
    => (a) F_(mu nu) F^(mu nu) "invar." hspace partial_alpha A'^alpha = partial_alpha (A^alpha + partial_alpha chi) = partial_alpha A^alpha + partial_alpha partial^alpha chi\
    partial_alpha partial^alpha chi = partial_alpha A'^alpha + square  chi "not gauge invariant unless" square chi = 0 => "not gauge inv."
  $
]

= Math Reference

#section("Coordinate Systems and Elements")[
  $
    "Cartesian:" hspace dd(bold(l)) = dd(x) hat(bold(x)) + dd(y) hat(bold(y)) + dd(z) hat(bold(z)) hspace dd(bold(x), 2) = dd(S) hspace dd(bold(x), 3) = dd(V) \
    "Cylindrical" (r, phi, z): hspace dd(bold(l)) = dd(r) hat(bold(r)) + r dd(phi) hat(bold(phi)) + dd(z) hat(bold(z)) \
    dd(V) = r dd(r) dd(phi) dd(z) hspace dd(S)_r = r dd(phi) dd(z) hat(bold(r)) hspace dd(S)_phi = dd(r) dd(z) hat(bold(phi)) hspace dd(S)_z = r dd(r) dd(phi) hat(bold(z)) \
    "Spherical" (r, theta, phi): hspace dd(bold(l)) = dd(r) hat(bold(r)) + r dd(theta) hat(bold(theta)) + r sin(theta) dd(phi) hat(bold(phi)) \
    dd(V) = r^2 sin(theta) dd(r) dd(theta) dd(phi) hspace dd(S)_r = r^2 sin(theta) dd(theta) dd(phi) hat(bold(r))
  $
]

#section("Vector Calculus Identities")[
  $
    nabla (f g) = g nabla f + f nabla g hspace nabla dot (f bold(A)) = f nabla dot bold(A) + (nabla f) dot bold(A) \
    nabla cross (f bold(A)) = f (nabla cross bold(A)) + (nabla f) cross bold(A) hspace nabla cross nabla Phi = bold(0) hspace nabla dot (nabla cross bold(A)) = 0 \
    nabla^2 (f g) = f nabla^2 g + g nabla^2 f + 2 (nabla f) dot (nabla g) \
    nabla dot (bold(A) cross bold(B)) = bold(B) dot (nabla cross bold(A)) - bold(A) dot (nabla cross bold(B)) \
    nabla cross (nabla cross bold(A)) = nabla (nabla dot bold(A)) - nabla^2 bold(A) \
    "Triple products:" hspace bold(A) cross (bold(B) cross bold(C)) = bold(B) (bold(A) dot bold(C)) - bold(C) (bold(A) dot bold(B))
  $
]

#section("Operators in Cylindrical Coordinates")[
  $
    nabla f = pdv(f, r) hat(bold(r)) + 1/r pdv(f, phi) hat(bold(phi)) + pdv(f, z) hat(bold(z)) hspace nabla dot bold(A) = 1/r pdv(r A_r, r) + 1/r pdv(A_phi, phi) + pdv(A_z, z) \
    (nabla cross bold(A))_r = 1/r pdv(A_z, phi) - pdv(A_phi, z) hspace (nabla cross bold(A))_phi = pdv(A_r, z) - pdv(A_z, r) \
    (nabla cross bold(A))_z = 1/r pdv(r A_phi, r) - 1/r pdv(A_r, phi)  hspace nabla^2 f = 1/r pdv(r pdv(f, r), r) + 1/r^2 pdv(f, phi, 2) + pdv(f, z, 2)
  $
]

#section("Integral Theorems")[
  $
    "Divergence theorem:" hspace integral_V nabla dot bold(F) dd(V) = integral.cont_(partial V) bold(F) dot hat(bold(n)) dd(S) \
    "Stokes' theorem:" hspace integral_S (nabla cross bold(F)) dot dd(S) = integral.cont_(partial S) bold(F) dot dd(bold(l)) \
    "Green I:" hspace integral_V (u nabla^2 v + nabla u dot nabla v) dd(V) = integral.cont_(partial V) u pdv(v, n) dd(S) \
    "Green II:" hspace integral_V (u nabla^2 v - v nabla^2 u) dd(V) = integral.cont_(partial V) (u pdv(v, n) - v pdv(u, n)) dd(S)
  $
]

#section("Distributions and Delta Rules")[
  $
    integral_-∞^∞ delta(x - a) f(x) dd(x) = f(a) hspace delta(g(x)) = sum_i delta(x - x_i)/abs(g'(x_i))\, (g(x_i)=0) \
    pdv(Theta(x), x) = delta(x) hspace pdv(Theta(g(x)), x) = delta(g(x)) g'(x) \
    \langle delta', f \rangle = - f'(0) hspace f(x) delta'(x) = f(0) delta'(x) - f'(0) delta(x) \
    delta^((3))(bold(r)) = delta(x) delta(y) delta(z) hspace nabla dot (bold(r)/r^3) = 4 pi delta^((3))(bold(r)) \
    nabla^2 (1/r) = -4 pi delta^((3))(bold(r)) hspace nabla(1/r) = - bold(r)/r^3
  $
]

#section("Fourier Transforms (Physics Conventions)")[
  $
    "3D:" hspace F(bold(k)) = integral f(bold(r)) e^(-i bold(k) dot bold(r)) dd(bold(r), 3) hspace f(bold(r)) = 1/((2 pi)^3) integral F(bold(k)) e^(i bold(k) dot bold(r)) dd(bold(k), 3) \
    "Derivatives:" hspace F[ pdv(f, x, n) ] = (i k)^n F(k) hspace F[nabla f] = i bold(k) F hspace F[nabla^2 f] = -k^2 F \
    "Shifts:" hspace F[f(x - a)] = e^(-i k a) F(k) hspace F[e^(i k_0 x) f(x)] = F(k - k_0) \
    "Convolution:" hspace F[f * g] = F G hspace F[f g] = 1/(2 pi) F * G hspace "(1D)" \
    "Parseval:" hspace integral abs(f)^2 dd(x) = 1/(2 pi) integral abs(F)^2 dd(k) hspace integral abs(f)^2 dd(bold(r), 3) = 1/((2 pi)^3) integral abs(F)^2 dd(bold(k), 3) \
    "Angular avg.:" hspace integral e^(i k r cos(theta)) dd(Omega) = 4 pi sin(k r)/(k r)
  $
]

#section("Standard Derivatives and Integrals")[
  $
    "Derivatives:" hspace dv(, x) ln(x) = 1/x hspace dv(, x) arctan(x) = 1/(1 + x^2) \
    dv(, x) sin(a x) = a cos(a x) hspace dv(, x) cos(a x) = - a sin(a x) \
    "Integrals:" hspace integral dd(x)/(x^2 + a^2) = 1/a arctan(x/a) + C \
    integral x dd(x)/(x^2 + a^2) = 1/2 ln(x^2 + a^2) + C hspace integral dd(x)/(x^2 - a^2) = 1/(2 a) ln(abs((x - a)/(x + a))) + C \
    integral dd(x)/((x^2 + a^2)^2) = x/(2 a^2 (x^2 + a^2)) + 1/(2 a^3) arctan(x/a) + C \
    integral_-∞^∞ e^(-a x^2) dd(x) = sqrt(pi/a)\, (a > 0) hspace integral_-∞^∞ x^2 e^(-a x^2) dd(x) = sqrt(pi)/(2 a^(3/2)) \
    integral_0^∞ x^n e^(-alpha x) dd(x) = Gamma(n + 1)/alpha^(n+1)\, (alpha > 0) hspace Gamma(1/2) = sqrt(pi)
  $
]

#section("Trigonometric Identities")[
  $

    sin^2 x + cos^2 x = 1 hspace 1 + tan^2 x = sec^2 x hspace 1 + cot^2 x = csc^2 x \
    sin(a - b) = sin a cos b - cos a sin b hspace cos(a - b) = cos a cos b + sin a sin b \
    tan(a - b) = (tan a - tan b)/(1 + tan a tan b)  hspace sin(2 x) = 2 sin x cos x \
    cos(2 x) = cos^2 x - sin^2 x = 1 - 2 sin^2 x = 2 cos^2 x - 1 \
    tan(2 x) = 2 tan x/(1 - tan^2 x) \
    "Euler:" hspace e^(i x) = cos x + i sin x hspace cos x = (e^(i x) + e^(-i x))/2 hspace sin x = (e^(i x) - e^(-i x))/(2 i) \
  $
]

#section("Small Argument Approximations")[
  $
     sin(x) approx x - x^3/6 + O(x^5) hspace tan(x) approx x + x^3/3 + O(x^5)\
    ln(1 + x) approx x - x^2/2 + O(x^3) hspace e^x approx 1 + x + x^2/2 + O(x^3)\
    arctan(x) approx x - x^3/3 + O(x^5) hspace arctan(1/x) approx pi/2 - x - x^3/3 + O(x^5)\, (x > 0)
  $
]


