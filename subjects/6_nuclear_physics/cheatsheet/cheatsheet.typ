#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Nuclear and Particle Physics",
  author: "Denis Titov",
  language: "ENG",
)

UNIT SYSTEM: $hbar = c = 1$, REINTRODUCED AFTER CALCULATIONS.

= Particles

#section[Particles and Waves][
  - *DeBroglie Wavelength*: $lambda = h/p = h/(m v)$ for non-relativistic particles.

  - *Electron Kinetic Energy*: Electrons accelerated through a potential difference $V$ gain kinetic energy $E_k = e V$ in electron volts (eV). For example, an electron accelerated through 100 kV has $E_k = 100 keV$.

    $1 eV approx 1.602 x 10^(-19) J$. Binding energy in Atom on order of eV, in nucleus on order of MeV, in particle physics on order of GeV/TeV.

    To image atomic structures, we need wavelengths on the order of picometers (pm), using the DeBroglie relation. 
]

#section[Particle Interactions][
  - *Rules*:
    - Everything that can happen, should happen
    - If it does not happen, it is forbidden by some conservation law (e.g. noether)
]

#section[Standard Model][
  - 12 half spin fermions (6 quarks, 6 leptons)
    - 6 quarks (+2/3 or -1/3 electric charge) (will always add up to integer charge because they never come alone)
    - 6 leptons (-1 charge or neutral)
  - 

  #image("/assets/image-12.png")

  - Column I is the first generation (lightest, most stable) and make up almost all matter.
  - We have seen the other generations in particle accelerators, but they decay very quickly to the first generation.
  - We dont know why we have 3 generations.
  - Each fermion has a corresponding anti-particle with opposite charge.
]

#section[Wilson Cloud Chamber][
  - Super Saturated Vapour in a sealed container. When a charged particle passes through, it ionizes the vapour along its path, creating a visible track of droplets.
]

#section[Galilei and Lorentz Transform][
  - *Galilei Transform*: For the classical limit $v << c$, the transformation of coordinates between two inertial frames moving at a relative velocity $v$ is given by:
    $
    ax' = ax - av t hspace t' = t
    $

  - *Lorentz Transform*: For relativistic speeds, the transformation is given by:
    $
      gamma = 1 / sqrt(1 - (av^2 / c^2)) hspace t' = gamma (t - (av dot ax / c^2)) hspace ax' = gamma (ax - av t)\
      t = gamma (t' + (av dot ax' / c^2) hspace ax = gamma (ax' + av t')
    $

    With the natural Minkovski metric, Minkovski spacetime etc.

    - *Length Contraction*: $Delta x = Delta x' / gamma$ (objects appear shorter in the direction of motion).

    - *Time Dilation*: $Delta t = gamma Delta t'$ (moving clocks run slower).

    - *Velocity Addition*: 
      $
        u = Delta x / Delta t = (u' + v) / (1 + ((u' v )/ c^2))
      $ 
      
      where $u'$ is the velocity in the moving frame and $v$ is the relative velocity between frames.
]

#section[Relativity][
  $
    g_(mu nu) = diag(1, -1, -1, -1) hspace Delta s^2 = c^2 dd(t)^2 - dd(ax)^2 = g_(mu nu) dd(x^mu) dd(x^nu)\
  $
  $dd(s)^2$ is invariant under Lorentz transformations. It is the samte for all $x^mu |-> Lambda_nu wj^mu x^mu + c^nu$

  *Proper Time*: #hfill $dd(s)^2 = c^2 dd(t)^2 - dd(ax)^2 hspace c dd(tau) = dd(s) hspace => gamma dd(tau)= dd(t)$

  *Energy-Momentum Relation*: #hfill $E^2 = p^2 c^2 + m^2 c^4$

  Lorentz Boost Boost relates two inertial frames with relative velocity v along x. Rotation around $z$-axis by angle $phi$.

  $
    Lambda^mu_nu (v) = mat(gamma, - gamma beta, 0, 0; -gamma beta, gamma, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1) hspace Lambda^mu_nu (phi) = mat(1, 0, 0, 0; 0, cos(phi), -sin(phi), 0; 0, sin(phi), cos(phi), 0; 0, 0, 0, 1)\
    gamma = 1/sqrt(1 - v^2/c^2) hspace beta = v/c hspace det(Lambda) = 1 => "Proper Lorentz Group"\
    x'^mu = Lambda_nu^mu (+v) x^nu hspace "for S' moving at +v relative to S"
  $
]

#section[4-Quantities][
  *Position* $x$, *Velocity* $eta$, *Momentum* $p$, *Force* $f$, *Acceleration* $a$, *Current Density* $j$, *Potential* $A$,
  $
    x^mu = mat(c t; ax) hspace eta^mu = dv(x^mu, tau) = gamma mat(c; av) hspace p^mu = m eta^mu = m gamma mat(c; av) = mat(E/c; ap)\
    f^mu = dv(p^mu, tau) = mat(gamma/c aF dot av; gamma aF)= m a^mu = q F^(mu nu) dv(x_nu, tau) hspace a^mu = dv(eta^mu, tau) = dv(x^mu, tau, 2)\
    J^mu = mat(c rho; aJ) hspace partial_mu J^mu = pdv(rho, t) + div aJ = 0 hspace A^mu = mat(Phi/c; A) hspace partial_mu A^mu = 0\
    f^mu u_mu = 0 hspace p_mu p^mu = m^2 c^2 hspace J_mu J^mu = c^2 rho^2 - J^2 hspace A_mu A^mu = Phi^2/c^2 - A^2\
  $

  - *In Circular Orbit* ($aa perp av$): $aF_perp = m gamma aa$

  - *In Linear Motion* ($aa parallel aF parallel av$): $aF_parallel = m gamma^3 aa$
]

#section[Relativistic Kinematics][
  Lorentz Force: $aF = q (aE + av cross aB)$. Then:

  $
    F_perp = m gamma aa hspace m gamma aa = q v B\
    abs(ap) = q R B
  $

  Collisions conserve total energy, relativistic 3 momentum, kinetic energy is not conserved.

  $
    p_a^mu + p_b^mu = p_c^mu + p_d^mu\
  $

  We sometimes use center of momentum frame, where $ap_a + ap_b = 0$. This means that sometimes we dont have conversation of mass.
]

#section[Pion Decay][
  $
    E_pi = E_M + E_N hspace ap_pi = ap_M + ap_N hspace "for each particle" E^2 = p^2 c^2 + m^2 c^4\

  $
]

#section[Center of Mass Energy][
  $
    E_cm^2 = (E_a + E_b)^2 - (ap_a + ap_b)^2 c^2\
  $
  In the lab frame, where particle b is at rest, this simplifies to:
  $
    E_cm^2 = m_a^2 c^4 + m_b^2 c^4 + 2 m_b c^2 E_a\
  $
  It is the total energy available for particle production in the center of mass frame. This is an invariant quantity.
]

#section[Decay Law][
  $
    dv(N, t) = - lambda N(t) hspace N(t) = N_0 e^(- lambda t) hspace tau = 1/lambda\
    "Half-life" t_(1/2) = ln(2) tau hspace "Mean Lifetime" tau = 1/lambda\
  $
]