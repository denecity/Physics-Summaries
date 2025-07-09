#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Group Theory Cheatsheet",
  author: "Denis Titov",
  language: "GER",
)

#show: frame-style(styles.boxy)

= Maxwell Equations

#definition[Maxwell Equations (Vacuum)][
  + *Gauss's Law*: $nabla dot bold(E) = rho/epsilon_0$
  + *No Magnetic Monopoles*: $nabla dot bold(B) = 0$
  + *Faraday's Law*: $nabla times bold(E) = -pdv(bold(B), t)$
  + *Ampère-Maxwell Law*: $nabla times bold(B) = mu_0 bold(J) + mu_0 epsilon_0 pdv(bold(E), t)$
]

#definition[Constants][
  + $epsilon_0 = 8.854 times 10^(-12)$ F/m (permittivity)
  + $mu_0 = 4pi times 10^(-7)$ H/m (permeability)
  + $c = 1/sqrt(mu_0 epsilon_0) = 2.998 times 10^8$ m/s
]

= Electrostatics

#definition[Coulomb's Law][
  $bold(F) = 1/(4pi epsilon_0) (q_1 q_2)/r^2 hat(bold(r))$
]

#definition[Electric Field][
  $bold(E) = bold(F)/q = 1/(4pi epsilon_0) Q/r^2 hat(bold(r))$

  From potential: $bold(E) = -nabla V$
]

#definition[Electric Potential][
  $V(bold(r)) = 1/(4pi epsilon_0) integral (rho(bold(r)'))/|bold(r) - bold(r)'| dd(tau')$

  Point charge: $V = 1/(4pi epsilon_0) q/r$
]

#theorem[Gauss's Law (Integral)][
  $integral.cont bold(E) dot dd(bold(A)) = Q_("enc")/epsilon_0$
]

#definition[Electric Dipole][
  Moment: $bold(p) = q bold(d)$

  Potential: $V = 1/(4pi epsilon_0) (bold(p) dot hat(bold(r)))/r^2$

  Field: $bold(E) = 1/(4pi epsilon_0) 1/r^3 [3(bold(p) dot hat(bold(r))) hat(bold(r)) - bold(p)]$
]

= Magnetostatics

#definition[Biot-Savart Law][
  $bold(B) = mu_0/(4pi) integral (bold(J) times hat(bold(r)))/r^2 dd(tau')$

  Current loop: $bold(B) = mu_0/(4pi) integral (I dd(bold(l)) times hat(bold(r)))/r^2$
]

#theorem[Ampère's Law][
  $integral.cont bold(B) dot dd(bold(l)) = mu_0 I_("enc")$
]

#definition[Magnetic Dipole][
  Moment: $bold(m) = I bold(A)$ (current loop)

  Field: $bold(B) = mu_0/(4pi) 1/r^3 [3(bold(m) dot hat(bold(r))) hat(bold(r)) - bold(m)]$
]

#definition[Lorentz Force][
  $bold(F) = q(bold(E) + bold(v) times bold(B))$
]

= Special Relativity

#definition[Lorentz Transformation][
  $gamma = 1/sqrt(1 - v^2/c^2)$

  $t' = gamma(t - v x/c^2)$, $x' = gamma(x - v t)$
]

#definition[4-Vectors][
  Position: $x^mu = (c t, x, y, z)$

  Velocity: $u^mu = gamma (c, bold(v))$

  Current: $J^mu = (c rho, bold(J))$
]

#definition[Electromagnetic Tensor][
  $F^(mu nu) = mat(
    0, -E_x/c, -E_y/c, -E_z/c;
    E_x/c, 0, -B_z, B_y;
    E_y/c, B_z, 0, -B_x;
    E_z/c, -B_y, B_x, 0
  )$
]

#theorem[Field Transformations][
  $bold(E)'_parallel = bold(E)_parallel$, $bold(E)'_perp = gamma(bold(E) + bold(v) times bold(B))_perp$

  $bold(B)'_parallel = bold(B)_parallel$, $bold(B)'_perp = gamma(bold(B) - bold(v) times bold(E)/c^2)_perp$
]

= Electromagnetic Waves

#definition[Wave Equation][
  $nabla^2 bold(E) - mu_0 epsilon_0 pdv(bold(E), t, 2) = 0$

  $nabla^2 bold(B) - mu_0 epsilon_0 pdv(bold(B), t, 2) = 0$
]

#definition[Plane Wave Solution][
  $bold(E) = bold(E)_0 e^(i(bold(k) dot bold(r) - omega t))$

  Dispersion: $omega = c |bold(k)|$

  $bold(B) = 1/c (hat(bold(k)) times bold(E))$
]

#theorem[Energy Density][
  $u = 1/2 (epsilon_0 E^2 + B^2/mu_0)$
]

#theorem[Poynting Vector][
  $bold(S) = 1/mu_0 (bold(E) times bold(B))$

  Energy flux: $pdv(u, t) + nabla dot bold(S) = -bold(J) dot bold(E)$
]

= Radiation

#definition[Retarded Potentials][
  $V(bold(r), t) = 1/(4pi epsilon_0) integral (rho(bold(r)', t_("ret")))/|bold(r) - bold(r)'| dd(tau')$

  $bold(A)(bold(r), t) = mu_0/(4pi) integral (bold(J)(bold(r)', t_("ret")))/|bold(r) - bold(r)'| dd(tau')$

  where $t_("ret") = t - |bold(r) - bold(r)'|/c$
]

#theorem[Larmor Formula][
  Power radiated by accelerated charge:
  $P = mu_0 q^2 a^2/(6pi c)$ (non-relativistic)

  $P = mu_0 q^2 gamma^6/(6pi c) [a^2 - (bold(v) times bold(a))^2/c^2]$ (relativistic)
]

#definition[Electric Dipole Radiation][
  Far field: $bold(E) = mu_0/(4pi) (ddot(bold(p)) times hat(bold(r))) times hat(bold(r))/r c^2$

  Power: $P = mu_0 ddot(p)^2/(6pi c)$
]

= Macroscopic Media

#definition[Auxiliary Fields][
  $bold(D) = epsilon_0 bold(E) + bold(P)$ (displacement)

  $bold(H) = bold(B)/mu_0 - bold(M)$ (magnetic field)
]

#definition[Linear Media][
  $bold(D) = epsilon bold(E) = epsilon_0 epsilon_r bold(E)$

  $bold(B) = mu bold(H) = mu_0 mu_r bold(H)$
]

#theorem[Boundary Conditions][
  $D_("2n") - D_("1n") = sigma_f$ (free surface charge)

  $bold(E)_("2t") - bold(E)_("1t") = 0$ (tangential E continuous)

  $B_("2n") - B_("1n") = 0$ (normal B continuous)

  $bold(H)_("2t") - bold(H)_("1t") = bold(K)_f$ (free surface current)
]

= Key Formulas

#theorem[Vector Identities][
  $nabla times (nabla times bold(A)) = nabla(nabla dot bold(A)) - nabla^2 bold(A)$

  $nabla dot (bold(A) times bold(B)) = bold(B) dot (nabla times bold(A)) - bold(A) dot (nabla times bold(B))$
]

#theorem[Green's Reciprocation][
  $integral_V (phi nabla^2 psi - psi nabla^2 phi) dd(tau) = integral.cont_S (phi pdv(psi, n) - psi pdv(phi, n)) dd(a)$
]
