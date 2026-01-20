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
    nabla dot aE = rho/e0 hspace nabla cross aE = 0 hspace nabla^2 Phi = - rho/e0 hspace aE = - nabla Phi\
  $
]

#section("Colombs Law (Brute Force)")[
  $
    aE(r) = 1/(4pi e0) q/abs(r - r')^2 hat(r) hspace aE(r) = 1/(4pi e0) integral_V rho(r')/(abs(r - r')^3) (r - r') dd(r', 3)\
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
    Phi(x) = sum 1/(4 pi e0) q_i/abs(x - x_i) = integral_V 1/(4 pi e0) rho(y)/abs(x - y) dd(y, 3) hspace aE = - nabla Phi
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
    integral_V nabla dot bold(E) dd(bold(x), 3) = integral.cont_(partial V) hat(bold(n)) dot bold(E) dd(bold(x), 2) = Q_"enc"/epsilon_0 hspace nabla dot bold(r)/abs(bold(r))^3 = 4 pi delta^((3)) (bold(r))
  $
  
  *Key insight:* Choose Gaussian surface where $bold(E)$ is constant and parallel/perpendicular to surface.
]


#section("Near and Far Field Approximations")[
  *Far Field* $(r >> L)$: Shape doesn't matter, acts like point charge.

  $
    bold(E) = 1/(4 pi epsilon_0) (Q_"total")/r^2 hat(bold(r)) quad "where" Q_"total" = integral_V rho dd(V) hspace 1/abs(ar - ar') = 1/r + (ar' dot ar)/r^2 + ...
  $
  
  *Near Field* $(r << L)$: Shape matters, boundary effects negligible.

  $
    "Infinite line": bold(E) = lambda/(2 pi epsilon_0 r) hat(bold(r))_perp hspace "Infinite plane": bold(E) = sigma/(2 epsilon_0) hat(bold(n))
  $
  
  *Multipole expansion* (far field):
  $
    Phi(bold(r)) = 1/(4 pi epsilon_0) sum_(l=0)^infinity sum_(m=-l)^l (q_(l m))/r^(l+1) Y_l^m (theta, phi)= 1/(4 pi epsilon_0) [Q/r + (ap dot hat(r))/r^2 + 1/2 (Q_(i j) hat(r)_i hat(r)_j)/r^3 + ...]
  $
  where $q_(0 0) = Q_"total"$ (monopole), $q_(1 m)$ related to dipole moment, etc.

    *Monopole term:* $Q = integral_V rho dd(V) hspace Phi = Q/(4 pi e0 r)$ (total charge)
  
  *Dipole term:* $bold(p) = integral_V bold(r) rho dd(V) hspace Phi = (p dot hat(r))/(4 pi e0 r^2) $ (dipole moment)
  
  *Quadrupole term:* $arrow(Q) = integral_V (3 ar ar^T - r^2 id) rho dd(V) prop 1/r^3$ (quadrupole moment)
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
    aE = - nabla Phi => nabla dot aE = -nabla^2 Phi = rho/epsilon_0 hspace "Poisson Eq.": nabla^2 Phi = - rho/epsilon_0\
    "Laplace Eq.": nabla^2 Phi = 0 quad "where" rho = 0
  $

  Grounded conductors set $Phi = 0$ on their surface. 
  
  Insulated conductors set $hat(n) dot aE = 0 => pdv(Phi, n) = 0$ on their surface.
  
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
  *Point charge and grounded sphere:*
  - Charge $q$ at distance $d$ from center of sphere (radius $R$)
  - *Image charge:* $q_"image" = -q R/d$ at position $bold(r)_"image" = R^2/d hat(bold(r))_"source"$
  - *Image location:* $r_"image" = R^2/d$ (inside sphere)
  
  *Force on original charge:* $F = -q^2 R/(4 pi epsilon_0 d^2 (d^2 - R^2))$ (attractive toward sphere)
]

= Math

#section("Spherical Coordinates")[
  $
    r = sqrt(x^2 + y^2 + z^2) hspace ax = mat(r sin theta cos phi; r sin theta sin phi; r cos theta)\
    nabla^2 = (pdv(, r))^2 + 2/r pdv(, r) + 1/r^2 (pdv(, theta))^2 + 1/(r^2 sin^2(theta)) (pdv(, phi))^2\
    nabla = pdv(,r) hat(r)  1/r + pdv(, theta) hat(theta) + 1/(r sin theta) pdv(, phi) hat(phi)\
    nabla dot = 1/r^2 pdv(, r) (r^2 pdv(, r)) + 1/(r^2 sin theta) pdv(, theta) (sin theta pdv(, theta)) + 1/(r^2 sin^2(theta)) pdv(, phi, 2)\
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

  $
    bold(P_0) = 1,  bold(P_1) = mu, bold(P_2)= 1/2 (3 mu^2 - 1), bold(P_3)= 1/2 (5 mu^3 - 3 mu),  bold(P_4)= 1/8 (35 mu^4 - 30 mu^2 + 3)\
    bold(P_0^0) = 1, bold(P_1^0) = mu, bold(P_1^1)=- sqrt(1-mu^2), bold(P_2^0) = 1/2 (3 mu^2 -1), bold(P_2^1) = -3 mu sqrt(1-mu^2)\
    bold(P_2^2) = 3 (1 - mu^2), bold(P_3^0) = 1/2 (5 mu^3 - 3 mu), bold(P_3^1) = -3/2 (5 mu^2 - 1) sqrt(1-mu^2)\
    bold(P_3^2) = 15 mu (1 - mu^2), bold(P_3^3) = -15 (1 - mu^2)^(3/2), bold(Y_0^0) = 1/sqrt(4 pi), bold(Y_1^0) = sqrt(3/(4 pi)) cos theta\
    bold(Y_1^(plus.minus 1)) = minus.plus sqrt(3/(8 pi)) sin theta e^(plus.minus i phi)
    ,bold(Y_2^0) = sqrt(5/(16 pi)) (3 cos^2 theta - 1)\
     bold(Y_2^(plus.minus 1)) = minus.plus sqrt(15/(8 pi)) sin theta cos theta e^(plus.minus i phi), bold(Y_2^(plus.minus 2)) = sqrt(15/(32 pi)) sin^2 theta e^(plus.minus 2 i phi)
  $
]

#section("Problems with Azimudal Symmetry or other Symmetry")[
  $
    => f(cos theta) = sum_(l=0)^infinity c_l P_l (cos theta) hspace c_l = (2 l + 1)/2 integral_(-1)^1 f(u) P_l (u) dd(u)\
  $

  Usually most terms are zero due to symmetry. Then solve the radial part as usual. Any polynomial of degree $n$ can be expressed as a sum of $P_l$ with $l <= n$.
]

#section("Sperical Integration Methods")[
  *Direct Integration*: $integral_0^pi (sin theta dd(theta))/sqrt(a-b cos theta)$ etc: $=> u = cos theta$\

  *Legendre Expansion*: $1/abs(ar - ar') = sum_(l=0)^oo (r_<^l)/(r_>^(l+1)) P_l (cos gamma)$

  $
    r_< = min(r, r') hspace r_> = max(r, r') hspace cos gamma = hat(r) dot hat(r)' "angle between"\
  $

  For: Multipole Expansion, Boundary Conditions $f(theta)$, often only $l=0, 1$

  *Spherical Harmonics*: (non-axissymetric or non-azimudal symmetric)

  $
    1/abs(ar - ar') = sum_(l=0)^oo sum_(m=-l)^l (4 pi)/(2 l + 1) (r_<^l)/(r_>^(l+1)) Y_(l m)(Omega) Y_(l m)^*(Omega') \
  $

  For Arbitrary Sphere Charges, Charge not aligned with Axis.
]


#section("Sperical Coords Cross Prod")[
  *Jacobian*: $dd(Omega) = sin theta dd(theta) dd(phi) hspace dd(V) = r^2 sin theta dd(r) dd(theta) dd(phi)$

  *Kernel*: $G(ar, ar') = 1/abs(ar - ar') => grad_r G = - (ar - ar')/(abs(ar-ar')^3) = - grad_r' G$

  *Solid Angle (Direction, FOV)*: $integral_Omega f(cos theta) sin theta dd(theta) dd(phi) = 2 pi integral_m1^1 f(mu) dd(mu)$

  *Surface Area Sphere*: $integral_S(R) f(cos theta) sin theta dd(theta) dd(phi)=  2 pi R^2 integral_m1^1 f(mu) dd(mu)$

  *Magnitude and Direction*:

  $
    dd(aa) cross b = dd(a) b sin alpha (dd(hat(a)) cross hat(b)) hspace dd(aa) dot b = dd(a) b cos alpha hspace abs(aa cross ab) = a b sin alpha\
    aa dot ab = a b cos alpha hspace integral dd(Omega) hat(r)_i = 0 hspace integral dd(Omega) hat(r)_i hat(r)_j = (4 pi)/3 delta_(i j) hspace integral dd(Omega) hat(r) (hat(r) dot aa) = (4 pi)/3 delta_(i j)\ 
    (aA cross aB)_i = epsilon_(i j k) aA_j aB_k hspace aA dot (aB cross aC) = epsilon_(i j k) A_i B_j C_k\
    epsilon_(i j k) epsilon_(i m n) = delta_j^m delta_k^n - delta_j^n delta_k^m hspace epsilon_(i j k) = epsilon_(j k i) = epsilon_(k i j) = - epsilon_(j i k) = - epsilon_(i k j) = - epsilon_(k j i)\
    hat(r) cross hat(theta) = hat(phi) hspace hat(theta) cross hat(phi) = hat(r) hspace hat(phi) cross hat(r) = hat(theta) hspace hat(r) = sin theta cos phi hat(x) + sin theta sin phi hat(y) + cos theta hat(z)\
    hat(theta) = cos theta cos phi hat(x) + cos theta sin phi hat(y) - sin theta hat(z) hspace hat(phi) = - sin phi hat(x) + cos phi hat(y)\
    hat(x) cross hat(y) = hat(z) hspace hat(y) cross hat(z) = hat(x) hspace hat(z) cross hat(x) = hat(y) hspace hat(z) = cos theta hat(r) - sin theta hat(theta) hspace hat(z) dot hat(r) = cos theta\
    hat(z) dot hat(theta) = - sin theta hspace hat(z) dot hat(phi) = 0 hspace hat(z) cross hat(r) = sin theta hat(phi) hspace hat(r) cross hat(z) = - sin theta hat(phi)\
  $
]





#section("Coordinate Systems and Elements")[
  $
    "Cartesian:" hspace dd(al) = dd(x) hat(x) + dd(y) hat(y) + dd(z) hat(z) hspace dd(ax,2) = dd(S) hspace dd(ax,3) = dd(V) \
    "Cylindrical" (r, phi, z): hspace dd(al) = dd(r) hat(r) + r dd(phi) hat(phi) + dd(z) hat(z) \
    dd(V) = r dd(r) dd(phi) dd(z) hspace dd(S)_r = r dd(phi) dd(z) hat(r) hspace dd(S)_phi = dd(r) dd(z) hat(phi) hspace dd(S)_z = r dd(r) dd(phi) hat(z) \
    "Spherical" (r, theta, phi): hspace dd(al) = dd(r) hat(r) + r dd(theta) hat(theta) + r sin(theta) dd(phi) hat(phi) \
    dd(V) = r^2 sin(theta) dd(r) dd(theta) dd(phi) hspace dd(S)_r = r^2 sin(theta) dd(theta) dd(phi) hat(r) hspace dd(Omega) = sin(theta) dd(theta) dd(phi)\
    abs(ar-ar') = sqrt((x-x')^2 + (y-y')^2 + (z-z')^2) \
    "cylindrical "= sqrt(r^2 + r'^2 - 2 r r' cos (phi - phi') + (z - z')^2)\
    = sqrt(r^2 + r'^2 - 2 r r' cos gamma) hspace cos gamma = hat(r) dot hat(r') = sin theta sin theta' cos(phi - phi') + cos theta cos theta'\
  $
]

#section("Vector Calculus Identities")[
  $
    nabla (f g) = g nabla f + f nabla g hspace nabla dot (f aA) = f nabla dot aA + (nabla f) dot aA \
    nabla cross (f aA) = f (nabla cross aA) + (nabla f) cross aA hspace nabla cross nabla Phi = 0 hspace nabla dot (nabla cross aA) = 0 \
    nabla^2 (f g) = f nabla^2 g + g nabla^2 f + 2 (nabla f) dot (nabla g) \
    nabla dot (aA cross aB) = aB dot (nabla cross aA) - aA dot (nabla cross aB) \
    nabla cross (nabla cross aA) = nabla (nabla dot aA) - nabla^2 aA \
    "Triple products:" hspace aA cross (aB cross aC) = aB (aA dot aC) - aC (aA dot aB)\
    aa dot (ab cross ac) = ab dot (ac cross aa) = ac dot (aa cross ab)
  $
]

#section("Integral Theorems")[
  $
    "Divergence theorem:" hspace integral_V nabla dot aF dd(V) = integral.cont_(partial V) aF dot hat(n) dd(S) \
    "Stokes' theorem:" hspace integral_S (nabla cross aF) dot dd(S) = integral.cont_(partial S) aF dot dd(l) \
    "Green I:" hspace integral_V (u nabla^2 v + nabla u dot nabla v) dd(V) = integral.cont_(partial V) u pdv(v, n) dd(S) \
    "Green II:" hspace integral_V (u nabla^2 v - v nabla^2 u) dd(V) = integral.cont_(partial V) (u pdv(v, n) - v pdv(u, n)) dd(S)
  $
]

#section("Distributions and Delta Rules")[
  $
    integral_(-oo)^oo delta(x - a) f(x) dd(x) = f(a) hspace delta(g(x)) = sum_i delta(x - x_i)/abs(g'(x_i))\, (g(x_i)=0)\
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
    integral_(-oo)^oo e^(-a x^2) dd(x) = sqrt(pi/a)\, (a > 0) hspace integral_(-oo)^oo x^2 e^(-a x^2) dd(x) = sqrt(pi)/(2 a^(3/2)) \
    integral_0^oo x^n e^(-alpha x) dd(x) = Gamma(n + 1)/alpha^(n+1)\, (alpha > 0) hspace Gamma(1/2) = sqrt(pi)\
  $
  $
    integral (1 dd(x))/(sqrt(x^2 + a^2)) = ln(x + sqrt(x^2 + a^2)) + C hsmall integral (1 dd(x))/sqrt(x^2-a^2)  = ln abs(x + sqrt(x^2-a^2)) + C\
     integral (x dd(x))/(sqrt(x^2 + a^2)) = sqrt(x^2 + a^2) + C hspace integral (x dd(x))/(sqrt(x^2 - a^2)) = sqrt(x^2-a^2) + C\
    integral (1 dd(x))/(x^2 + a^2) = 1/a arctan(x/a) + C hspace integral (1 dd(x))/(x^2 - a^2) dd(x) = 1/(2 a) ln abs((x - a)/(x + a)) + C \
    integral (x dd(x))/(x^2 + a^2) = 1/2 ln(x^2 + a^2) + C hspace integral (x dd(x))/(x^2 - a^2) = 1/2 ln abs(x^2-a^2) + C\
    integral (1 dd(x))/((x^2 + a^2)^2)= x/(2 a^2 (x^2 + a^2)) + 1/(2 a^3) arctan(x/a) + C \
    integral (1 dd(x))/((x^2 -a^2)^2)  = (x)/(2 a^2 (x^2 + a^2)) + 1/(2 a^3) arctan(x/a) + C \
    integral (x dd(x))/((x^2 + a^2)^2) = (- 1)/(2 (x^2 + a^2)) + C hspace integral (x dd(x))/((x^2 - a^2)^2) = (-1)/(2 (x^2 - a^2)) + C\
    integral (1 dd(x))/(x^2 + a^2)^(3/2) = x/(a^2 sqrt(x^2 + a^2)) + C hspace integral (1 dd(x))/(x^2 - a^2)^(3/2) = x/(a^2 sqrt(x^2 - a^2)) + C\
    integral (x dd(x))/(x^2 + a^2)^(3/2) = (-1)/sqrt(x^2 + a^2) + C hspace integral (x dd(x))/(x^2 - a^2)^(3/2) = (-1)/sqrt(x^2 - a^2) + C\
  $
  $
    integral_0^pi sin theta dd(theta) = 2 hspace integral_0^pi cos theta sin theta dd(theta) = 0 hspace integral_0^pi cos^2 theta sin theta dd(theta) = 2/3\
    integral_0^pi (sin theta)/sqrt(a - b cos theta) dd(theta) = integral_m1^1 1/sqrt(a - b u) dd(u) = 2/b (sqrt(a+b) - sqrt(a-b))\
    integral_0^pi (sin theta) /(a - b cos theta)^(3/2) dd(theta) = integral_m1^1 1/(a - b u)^(3/2) dd(u) = 2/b (1/sqrt(a-b) - 1/sqrt(a + b))\
    sqrt(R^2 + a^2 plus.minus 2 a R) = abs(a plus.minus R) 
  $
]

#section("Trigonometric Identities")[
  $

    sin^2 x + cos^2 x = 1 hspace 1 + tan^2 x = sec^2 x hspace 1 + cot^2 x = csc^2 x \
    sin(a plus.minus b) = sin a cos b plus.minus cos a sin b hspace cos(a plus.minus b) = cos a cos b minus.plus sin a sin b \
    tan(a plus.minus b) = (tan a plus.minus tan b)/(1 minus.plus tan a tan b)\
    cos(2 x) = cos^2 x - sin^2 x = 1 - 2 sin^2 x = 2 cos^2 x - 1 \
    tan(2 x) = 2 tan x/(1 - tan^2 x) hspace sin(2 x) = 2 sin x cos x\
    e^(i x) = cos x + i sin x hspace cos x = 1/2 (e^(i x) + e^(-i x)) hspace sin x = 1/(2 i)(e^(i x) - e^(-i x)) \
  $
]

#section("Small Argument Approximations")[
  $
     sin(x) approx x - x^3/6 + O(x^5) hspace tan(x) approx x + x^3/3 + O(x^5)\
    ln(1 + x) approx x - x^2/2 + O(x^3) hspace e^x approx 1 + x + x^2/2 + O(x^3)\
    arctan(x) approx x - x^3/3 + O(x^5) hspace arctan(1/x) approx pi/2 - x - x^3/3 + O(x^5)\
    f(x + dx) approx f(x) + f'(x) dx + 1/2 f''(x) dx^2 + O(dx^3)\
    (1 + x)^alpha approx 1 + alpha x + alpha(alpha - 1) x^2/2 + O(x^3)\
    1/(1 + x) approx 1 - x + x^2 - x^3 + O(x^4) hspace 1/(1 - x) approx 1 + x + x^2 + x^3 + O(x^4)\
    ln(1 + x) approx x - x^2/2 + x^3/3 + O(x^4) hspace e^x approx 1 + x + x^2/2 + x^3/6 + O(x^4)\
  $
]




= Magnetostatics

#section("Maxwell Equations")[
  - Lorentz-Force #hfill $aF = q(aE + av cross aB)$
  - Induction Law #hfill $nabla^2 U_(partial A) ? pdv(, t) integral_A an dot aB dd(x, 2) = - dot(Psi)_A$
  $
    nabla dot E = rho/e0 hspace nabla dot B = 0 hspace nabla cross E = - pdv(B, t) hspace nabla cross B - mu_0 e0 partial_t aE = mu_0 aJ\
    nabla dot aJ + partial_t rho = 0 hspace 1/c^2 = m0 e0 hspace aB = nabla cross A hspace aE = - nabla Phi - partial_t aA\
  $
]

#section("Magnetostatics Maxwell")[
  $
    nabla dot aB = 0 hspace nabla cross aB = mu_0 J + mu_0 epsilon_0 pdv(aE, t) hspace nabla dot aE = rho/epsilon_0 hspace nabla cross aE = - pdv(aB, t)\
    nabla dot aJ = 0 hspace aF = integral_V aJ dot aB dd(V) = q(aE + av cross aB) hspace dd(aF) = q (aE + av cross aB)\
    "Coulomb Gauge:" nabla dot aA = 0 hspace 
  $
]

#section("Current Density")[
  *Current density* $J$ is the current per unit area:
  $
    dv(Q, t) = aJ dot dd(arrow(s)) hspace => aJ = rho av\

  $
]

#section("Biot-Savart Law")[
  *Magnetic field* $B$ at point $ar)$ due to current $I$ in wire segment $dd(al))$ and straight wire:
  $
    aB(ar) = mu_0/(4 pi) integral_V aJ(ar') cross (ar - ar')/abs(ar - ar')^3 dd(ar', 3) hspace aB(ar) = mu_0 I/(4 pi) hat(r) cross hat(l) sin(theta)/r^2
  $

  *Recipe and Example (Straight Wire $dd(x'), L, I$):*
  + Parametrize Wire #hfill $r' = x' hat(x') + y' hat(y') + z' hat(z'), dd(l') = dd(x') hat(x')$
  + Find separation Vector #hfill $R = r - r'$
  + Compute Cross Prod. #hfill $dd(aB) = (mu_0 I)/(4 pi) (dd(l') cross R)/abs(R)^3$
]

#section("Ampere's Law")[
  Shortcut for calculating magnetic fields in high symmetry situations:
  $
    integral.cont_(partial S) aB dot dd(l) = mu_0 I_"enc" hspace "where" I_"enc" = integral_S aJ dd(aA) hspace ";perp:" I = J A\
    "Surface Current:" aJ(rho, theta, phi) = aK(theta, phi) delta(rho - R)
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
    nabla cross aE = - pdv(aB, t) hspace => integral.cont aE dot dd(l) = - dv(Phi_B, t), "where" Phi_B = integral_S aB dot dd(S)\
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
    m = 1/2 integral_V (r' cross J(r')) dd(V) hspace "Drehmoment:" aM = m cross aB
  $
  
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


= Relativity

#section("Relativity")[
  $
    g_(mu nu) = diag(1, -1, -1, -1) hspace Delta s^2 = c^2 dd(t)^2 - dd(ax)^2 = g_(mu nu) dd(x^mu) dd(x^nu)\
  $
  $dd(s)^2$ is invariant under Lorentz transformations. It is the samte for all $x^mu |-> Lambda_nu wj^mu x^mu + c^nu$

  *Proper Time*: #hfill $dd(s)^2 = c^2 dd(t)^2 - dd(ax)^2 hspace  c dd(tau) = dd(s) hspace => gamma dd(tau)= dd(t)$

  *Energy-Momentum Relation*: #hfill $E^2 = p^2 c^2 + m^2 c^4$ 

  Lorentz Boost Boost relates two inertial frames with relative velocity v along x. Rotation around $z$-axis by angle $phi$.

  $
    Lambda^mu_nu (v) = mat(gamma, - gamma beta, 0, 0; -gamma beta, gamma, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1) hspace Lambda^mu_nu (phi) = mat(1, 0, 0, 0; 0, cos(phi), -sin(phi), 0; 0, sin(phi), cos(phi), 0; 0, 0, 0, 1)\
    gamma = 1/sqrt(1 - v^2/c^2) hspace beta = v/c hspace det(Lambda) = 1 => "Proper Lorentz Group"\
    x'^mu = Lambda_nu^mu (+v) x^nu hspace  "for S' moving at +v relative to S"
  $
]

#section("4-Quantities")[
  *Position* $x$, *Velocity* $v$, *Momentum* $p$, *Force* $f$, *Acceleration* $a$, *Current Density* $j$, *Potential* $A$, 
  $
    x^mu = mat(c t; ax) hspace u^mu = dv(x^mu, tau) = gamma mat(c; av) hspace p^mu = m u^mu = m gamma mat(c; av) = mat(E/c; ap)\
    f^mu = dv(p^mu, tau) = mat(gamma/c aF dot av; gamma aF)= m a^mu =  q F^(mu nu) dv(x_nu, tau) hspace a^mu = dv(u^mu, tau) = dv(x^mu, tau, 2)\
    J^mu = mat(c rho; aJ) hspace partial_mu J^mu = pdv(rho, t) + div aJ =  0 hspace A^mu = mat(Phi/c; A) hspace partial_mu A^mu = 0\
    f^mu u_mu = 0 hspace p_mu p^mu = m^2 c^2 hspace J_mu J^mu = c^2 rho^2 - J^2 hspace A_mu A^mu = Phi^2/c^2 - A^2\
  $
]



#section("Relativistic Maxwell Equations")[
  $
    F^(mu nu) = mat(0, -E^1/c, -E^2/c, -E^3/c; E^1/c, 0, -B^3, B^2; E^2/c, B^3, 0, -B^1; E^3/c, -B^2, B^1, 0) hspace partial_mu F^(mu nu) = mu_0 J^nu hspace F_(mu nu) = partial_mu A_nu - partial_nu A_mu\
  $
  *Electromagnetic 4-Force*: #hfill $f^mu = q F^(mu nu) v_nu$
  $
    partial_mu = pdv(, x^mu) = mat(1/c pdv(, t); pdv(, ax)) = mat(1/c pdv(, t); nabla) hspace partial^mu = g^(mu nu) partial_nu = mat(1/c pdv(, t); - pdv(, ax))\
    F'^(mu nu) = Lambda_alpha^mu Lambda_beta^nu F^(alpha beta) <=> F' = Lambda F Lambda^T hspace Lambda^m1 = g Lambda^T g\
     aE'_parallel = aE_parallel hspace aB'_parallel = aB_parallel hspace aE'_perp = gamma (aE_perp + av cross aB) hspace aB'_perp = gamma (aB_perp - 1/c^2 (av cross aE))\
     "Invariants:" hspace  aE dot aB hspace E^2 - c^2 B^2
  $
]

#section("Einstein Notation")[
  $
    g_(mu nu) = g^(mu nu) = diag(1, -1...) => hspace A^nu = g^(nu mu) A_nu hspace A_nu = g_(nu mu) A^mu\
    A^mu = (A^0, A^1, A^2, A^3) => A_mu = (A_0, -A_1, -A_2, -A_3)  hspace g^(nu sigma) F_(sigma rho) = F_rho^nu\
    Tr(T) = T^mu_mu = T^0_0 + T^1_1+... hspace T^(mu nu) ->^(g) T^mu_nu hspace g^(mu alpha) g_(alpha nu) = delta^mu_nu hspace Tr(delta^mu_mu) = 4
  $
  Rank is the number of open indices.
]

#section("Lorentz Gauge")[
  $chi(x, t)$ is a scalar function. $square$ is the d'Alembert operator $square = partial_mu partial^mu = 1/c^2 pdv( ,t, 2) - nabla^2$
  $
    A'_mu = A_mu + partial_mu chi hspace "Lorentz Gauge:" partial_mu A^mu = 0 => square A_mu = mu_0 J_mu
  $
]

= Radiation

#section("Retarded Greens Function")[
  $
    t_"ret" = t - abs(x - x')/c hspace G_"ret" (ax, t, ax', t') = 1/(4 pi) 1/abs(ax - ax') delta(t - t' - abs(ax - ax')/c)\
    Phi(ax, t) = 1/(4 pi e0)integral_V  1/abs(x - x') rho(ax', t_"ret") dd(x', 3)\
    aA(ax, t) = 1/(4 pi e0 c^2) integral_V 1/(abs(x - x')) aJ(ax', t_"ret") dd(x', 3)\
    
  $
]

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

