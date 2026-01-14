#import "../../../lib/setup_flashcards.typ": flashcard, flashcard-setup, render-flashcards
#import "../../../lib/lib.typ": *

#show: flashcard-setup(
  card-width: 9cm,
  card-height: 5.5cm,
  margin: 0cm,
  show-cut-lines: true,
  topic: "Electrodynamics",
)

#let blue = rgb("#E3F2FD") // electrostatics
#let green = rgb("#E8F5E8") // magnetostatics
#let yellow = rgb("#FFF8E1") // radiation
#let red = rgb("#FFEBEE") // other

// Multiple Choice
#flashcard(
  title: "Electrostatics",
  color: blue,
  question: [
    Laplace (spherical): $Phi = sum_(l=0)^oo sum_(m=-l)^l (A_(l m) r^l + B_(l m) r^(-(l + 1))) Y_(l m)(theta, phi)$. If $partial_phi Phi = 0$, simplify.
  ],
  answer: [
    Azimuthal symmetry means no $phi$ dependence, so only $m = 0$ terms survive:
    $
      Phi(r, theta) = sum_(l=0)^oo (A_l r^l + B_l r^(-(l + 1))) P_l(cos theta)
    $
    since $Y_(l 0) prop P_l(cos theta)$ (absorb normalization into $A_l, B_l$).
  ],
)

#flashcard(
  title: "Electrostatics",
  color: blue,
  question: [
    Uniform field $E = E_0 hat(z)$. What is the potential far away ($r >> R$)?
  ],
  answer: [
    Uniform field has $E = -grad Phi$ with $Phi = -E_0 z + C$. Using $z = r cos theta$:
    $
      Phi(r >> R, theta) = -E_0 r cos theta + C
    $.
  ],
)

#flashcard(
  title: "Electrostatics",
  color: blue,
  question: [
    Conductor sphere radius $R$, $Phi(R, theta) = 0$, far field $Phi -> -E_0 r cos theta + C$. Show outside:
    $
      Phi = -E_0 (r - R^3 / r^2) cos theta + C (1 - R / r),  r >= R
    $.
  ],
  answer: [
    Use azimuthal form:
    $
      Phi = sum_(l=0)^oo (A_l r^l + B_l r^(-(l + 1))) P_l(cos theta)
    $
    Boundary $Phi(R, theta) = 0$ gives $B_l = -A_l R^(2 l + 1)$. So
    $
      Phi = sum_(l=0)^oo A_l (r^l - R^(2 l + 1) / r^(l + 1)) P_l(cos theta)
    $
    For $r >> R$, match $-E_0 r cos theta + C$ so $A_0 = C$, $A_1 = -E_0$, $A_(l>=2) = 0$. Plugging back yields the stated result.
  ],
)

#flashcard(
  title: "Electrostatics",
  color: blue,
  question: [
    Given (outside)
    $
      Phi = -E_0 (r - R^3 / r^2) cos theta + C (1 - R / r),
    $
    the sphere has net charge $Q$. Find $sigma(theta)$ on $r = R$ and $C$.
  ],
  answer: [
    For a conductor: $E_in = 0$, and the field jump gives $E_"out",n = sigma / epsilon_0$. Also $E_n = -partial_r Phi$, so
    $
      sigma(theta) = -epsilon_0 partial_r Phi|_(r=R) = 3 epsilon_0 E_0 cos theta - epsilon_0 C / R.
    $
    Net charge $Q = integral sigma dd(S)$ with $integral cos theta dd(S) = 0$ and $integral d(S) = 4 pi R^2$ gives
    $
      C = -Q / (4 pi epsilon_0 R)\
      => sigma(theta) = 3 epsilon_0 E_0 cos theta + Q / (4 pi R^2)
    $
  ],
)

#flashcard(
  title: "Electrostatics",
  color: blue,
  question: [
    Neutral conducting sphere in uniform $E = E_0 hat(z)$. Find electrostatic pressure $P(theta)$ on the surface.
  ],
  answer: [
    Electrostatic pressure on a surface charge: $P = sigma E_av$ with $E_av = (E_in + E_"out")/2$. For a conductor $E_in = 0$ and $E_"out" = sigma hat(n) / epsilon_0$, so
    $
      P = sigma^2 / (2 epsilon_0).
    $
    For $Q = 0$, $sigma(theta) = 3 epsilon_0 E_0 cos theta$, thus
    $
      P(theta) = (9/2) epsilon_0 E_0^2 cos^2 theta.
    $
  ],
)

#flashcard(
  title: "Electrostatics",
  color: blue,
  question: [
    Neutral conducting sphere in uniform $E = E_0 hat(z)$. Force on the north hemisphere? Total force?
  ],
  answer: [
    Force element $dd(F) = P n^ dd(S)$. By symmetry only $z$ survives:
    $
      dd(F)_z = P cos theta dd(S),  dd(S) = R^2 sin theta dd(theta) dd(phi).
    $
    With $P = sigma^2 / (2 epsilon_0)$ and $sigma = 3 epsilon_0 E_0 cos theta$:
    $dd(F)_z = (9/2) epsilon_0 E_0^2 cos^3 theta \, dd(S)$
    North hemisphere ($theta in [0, pi/2]$):
    $
      F_"NH" = (4/9) pi epsilon_0 E_0^2 R^2.
    $
    Whole sphere integrates to zero, so $F_"total" = 0$.
  ],
)

#flashcard(
  title: "Magnetostatics",
  color: green,
  question: [
    Charged spherical shell: radius $R$, total charge $Q$ uniform on surface, rotating with $omega$. Find volume current density $j(r)$.
  ],
  answer: [
    Surface charge density $sigma = Q / (4 pi R^2)$. Treat as volume density $rho(r) = sigma delta(r - R)$.
    Local velocity $v = omega x r$. Thus
    $
      j(r) = rho v = (Q / (4 pi R^2)) delta(r - R) (omega x r).
    $
  ],
)

#flashcard(
  title: "Magnetostatics",
  color: green,
  question: [
    Rotating charged shell (radius $R$, charge $Q$, angular vel. $omega$). Show vector potential:
    $
      A = (Q / (12 pi epsilon_0 c^2 R)) (omega x r), r < R
    $
    $
      A = (Q R^2 / (12 pi epsilon_0 c^2)) (omega x r) / r^3, r > R
    $.
  ],
  answer: [
    Start from
    $
      A(r) = (1 / (4 pi epsilon_0 c^2)) integral j(r') / |r - r'| d^3 r'\
      j = (Q / (4 pi R^2)) delta(r' - R) (omega x r').
    $
    Factor out $omega$ and by symmetry reduce to a scalar function times $r/r$. Evaluating the radial/angular integrals yields the stated piecewise result.
  ],
)

#flashcard(
  title: "Magnetostatics",
  color: green,
  question: [
    Given $A = alpha (omega x r)$ for $r < R$ with $alpha = Q / (12 pi epsilon_0 c^2 R)$, and
    $A = beta (omega x r / r^3)$ for $r > R$ with $beta = Q R^2 / (12 pi epsilon_0 c^2)$. Find $B$.
  ],
  answer: [
    Inside:
    $
      B = curl A = alpha curl (omega x r) = alpha (2 omega) = (Q / (6 pi epsilon_0 c^2 R)) omega.
    $
    Outside (dipole form):
    $
      B = (Q R^2 / (12 pi epsilon_0 c^2)) [3(omega dot r) r / r^5 - omega / r^3]
    $
    with dipole moment $m = (Q R^2 / (12 pi epsilon_0 c^2)) omega$.
  ],
)

#flashcard(
  title: "Magnetostatics",
  color: green,
  question: [
    Rotating charged spherical shell: radius $R$, total charge $Q$ uniform on the surface, angular velocity $omega$. Find the magnetic dipole moment $m$.
  ],
  answer: [
    Compare the exterior field to the dipole form $B = (mu_0 / (4 pi)) [3(m dot r) r / r^5 - m / r^3]$. For a rotating shell,
    $
      m = (Q R^2 / 3) omega.
    $
  ],
)

#flashcard(
  title: "Magnetostatics",
  color: green,
  question: [
    Rotating charged spherical shell (radius $R$, charge $Q$, angular velocity $omega$) in external field $B_"ext" = k r e_ell$. The angle between $e_ell$ and $omega$ is $theta_0$. Find the force and potential energy.
  ],
  answer: [
    Dipole energy:
    $
      U(r) = -m dot B_"ext" = -(Q R^2 / 3) omega k r cos theta_0.
    $
    Since $U$ depends only on $r$, $F = -grad U = -(dd(U)/dd(r)) e_r$, so
    $
      F(r) = (Q R^2 / 3) omega k cos theta_0 e_r.
    $
  ],
)

#flashcard(
  title: "Relativity",
  color: red,
  question: [
    A point charge (mass $m$) starts at rest and is accelerated by a constant lab-frame force $F$ along the motion. Find $v(t)$.
  ],
  answer: [
    Momentum $p = F t$. With $p = gamma m v$,
    $
      v(t) = (F t / m) / sqrt(1 + (F t / (m c))^2).
    $
  ],
)

#flashcard(
  title: "Relativity",
  color: red,
  question: [
    A point charge (mass $m$) starts at rest and is accelerated by a constant lab-frame force $F$ along the motion. Find energy $E(t)$.
  ],
  answer: [
    $E = gamma m c^2$ with $gamma = sqrt(1 + (F t / (m c))^2)$, so
    $
      E(t) = m c^2 sqrt(1 + (F t / (m c))^2).
    $
  ],
)

#flashcard(
  title: "Relativity",
  color: red,
  question: [
    A point charge (mass $m$) starts at rest and is accelerated by a constant lab-frame force $F$ along the motion. Find distance $x$ as a function of energy $E$.
  ],
  answer: [
    Work-energy with constant force: $dd(E) = F dx$. With $E(0) = m c^2$,
    $
      x(E) = (E - m c^2) / F.
    $
  ],
)

#flashcard(
  title: "Relativity",
  color: red,
  question: [
    A point charge (mass $m$) starts at rest and is accelerated by a constant lab-frame force $F$ along the motion. Find $d tau / dd(E)$ (proper time vs. energy).
  ],
  answer: [
    Use $d tau = dt / gamma$ and $E^2 = p^2 c^2 + m^2 c^4$ with $p = F t$:
    $
      d tau / dd(E) = m / (F sqrt(E^2 / c^2 - m^2 c^2))
      = (m c) / (F sqrt(E^2 - m^2 c^4)).
    $
  ],
)

#flashcard(
  title: "Relativity",
  color: red,
  question: [
    A point charge is accelerated linearly by a constant lab-frame force $F$. What is the instantaneous rest-frame force $F'$?
  ],
  answer: [
    For a force parallel to the velocity, the proper (rest-frame) force equals the lab force:
    $
      F' = F.
    $
  ],
)

#flashcard(
  title: "Relativity",
  color: red,
  question: [
    Constant lab electric field $E = (E, 0, 0)$ accelerates the charge. Give the field tensor $F^(mu nu)$ in the instantaneous rest frame and the rest-frame force.
  ],
  answer: [
    For a boost along $E$, the parallel field is unchanged and $B' = 0$. Thus
    $
      E' = (E, 0, 0), B' = 0,
    $
    so the only nonzero components are $F^(0 1) = -E$, $F^(1 0) = E$. The rest-frame force is
    $
      F' = q E.
    $
  ],
)

#flashcard(
  title: "Radiation",
  color: yellow,
  question: [
    Retarded time: $R(t_"ret") = |x - r(t_"ret")|$, $n = R / R$.
    (i) Relation between $t$ and $t_"ret"$. (ii) Show $dt/dt_"ret" = 1 - v dot n$.
  ],
  answer: [
    (i) Light-cone condition (units $c = 1$):
    $
      t - t_"ret" = R(t_"ret").
    $
    (ii) Differentiate $t = t_"ret" + R(t_"ret")$:
    $
      dt/dt_"ret" = 1 + dd(R)/dt_"ret".
    $
    With $R = |x - r(t_"ret")|$, $dd(R)/dt_"ret" = n dot (-v) = -(v dot n)$, so
    $
      dt/dt_"ret" = 1 - v dot n.
    $
  ],
)

#flashcard(
  title: "Radiation",
  color: yellow,
  question: [
    Radiation zone: $B = [n x E]_"ret"$. Show
    $
      S = E x B = |E|^2 n - (E dot n) E.
    $
  ],
  answer: [
    $S = E x (n x E)$. Use $a x (b x c) = b(a dot c) - c(a dot b)$ with $a = E$, $b = n$, $c = E$:
    $
      S = n(E dot E) - E(E dot n) = |E|^2 n - (E dot n) E.
    $
  ],
)

#flashcard(
  title: "Radiation",
  color: yellow,
  question: [
    From $partial_t omega + div S = 0$, show
    $
      dd(P)_"ret" / dd(Omega) equiv dd(E) / (dt_"ret" dd(Omega)) = [S dot n R^2]_"ret" dt/dt_"ret".
    $
  ],
  answer: [
    Integrate the continuity equation over a large sphere centered on the retarded position:
    $
      dd(E)/dt = integral_(dd(V)) S dot n dd(A) = integral (S dot n) R^2 dd(Omega).
    $
    $
      => dd(P)/dd(Omega) equiv dd(E)/(dt dd(Omega)) = (S dot n) R^2.
    $
    Convert $t -> t_"ret"$ using $dt/dt_"ret"$:
    $
      dd(P)_"ret"/dd(Omega) = [S dot n R^2]_"ret" dt/dt_"ret".
    $
  ],
)

#flashcard(
  title: "Radiation",
  color: yellow,
  question: [
    If $v perp dot(v)$, show angular power:
    $
      dd(P)_"ret"/dd(Omega) = q^2/(16 pi^2) |dot(v)|^2 (1 - v cos theta)^(-3)\
      dot [1 - sin^2 theta cos^2 phi / (gamma^2 (1 - v cos theta)^2)]\
      gamma = (1 - v^2)^(-1/2).
    $
  ],
  answer: [
    Start from (radiation zone)
    $
      dd(P)_"ret"/dd(Omega) = q^2/(16 pi^2) |n x [(n - v) x dot(v)]|^2 (1 - v dot n)^(-5).
    $
    With $v perp dot(v)$, $v dot n = v cos theta$, and the identity
    $
      |n x (c x d)|^2 = |c|^2 (n dot d)^2 + |d|^2 (n dot c)^2 - 2 (c dot d) (n dot c) (n dot d),
    $ 
    the numerator reduces to

    $|dot(v)|^2 (1 - v cos theta)^2 - |dot(v)|^2 gamma^(-2) sin^2 theta cos^2 phi.$
    Divide by $ (1 - v cos theta)^5$ to obtain the stated form.
  ],
)

#flashcard(
  title: "Radiation",
  color: yellow,
  question: [
    Relativistic limit $v -> c$: where is radiation strongest (direction vs. $v$)?
  ],
  answer: [
    Beaming: the factor $(1 - v cos theta)^(-3)$ peaks at $theta -> 0$, so for $v -> c$ radiation is strongest along the direction of $v$.
  ],
)

#flashcard(
  title: "Radiation",
  color: yellow,
  question: [
    Integrate over angles to get total power $P_"tot" = integral dd(Omega) dd(P)_"ret"/dd(Omega)$ for the case $v perp dot(v)$.
  ],
  answer: [
    Carrying out the $phi, theta$ integrals on
    $
      dd(P)_"ret"/dd(Omega) = q^2/(16 pi^2) |dot(v)|^2 (1 - v cos theta)^(-3)\
      dot [1 - sin^2 theta cos^2 phi / (gamma^2 (1 - v cos theta)^2)]
    $
    gives
    $
      P_"tot" = (q^2 / 6 pi) |dot(v)|^2 gamma^4.
    $
  ],
)

#flashcard(
  title: "Magnetostatics",
  color: green,
  question: [
    Write the magnetostatic vector potential in terms of volume current $j$.
  ],
  answer: [
    $
      A(r) = (mu_0 / (4 pi)) integral j(r') / |r - r'| d^3 r'.
    $
    (Equivalently $A = (1 / (4 pi epsilon_0 c^2)) integral j/|r-r'| d^3 r'$.)
  ],
)

#flashcard(
  title: "Magnetostatics",
  color: green,
  question: [
    Given $A$, how do you get $B$?
  ],
  answer: [
    $
      B = curl A.
    $
  ],
)

#flashcard(
  title: "Magnetostatics",
  color: green,
  question: [
    Magnetic dipole moment $m$ of a current loop: formula?
  ],
  answer: [
    $
      m = I a
    $
    where $a$ is the area vector (magnitude = area, direction by right-hand rule).
  ],
)

#flashcard(
  title: "Relativity",
  color: red,
  question: [
    Relativistic momentum: express $p$ in terms of $m$ and $v$.
  ],
  answer: [
    $
      p = gamma m v, gamma = 1 / sqrt(1 - v^2 / c^2).
    $
  ],
)

#flashcard(
  title: "Relativity",
  color: red,
  question: [
    If a constant force $F$ acts along the motion, what is momentum as a function of time?
  ],
  answer: [
    $
      p(t) = F t,  (p(0) = 0).
    $
  ],
)

#flashcard(
  title: "Radiation",
  color: yellow,
  question: [
    Retarded time relation (using $c = 1$): how are $t$ and $t_"ret"$ related?
  ],
  answer: [
    $
      t - t_"ret" = R(t_"ret") = |x - r(t_"ret")|.
    $
  ],
)

#flashcard(
  title: "Radiation",
  color: yellow,
  question: [
    Radiation zone: relation between $E$, $B$, and propagation direction $n$?
  ],
  answer: [
    $
      B = n x E, hspace E perp n, hspace B perp n.
    $
  ],
)

#flashcard(
  title: "Radiation",
  color: yellow,
  question: [
    Use a vector identity to simplify $E x (n x E)$.
  ],
  answer: [
    Using $a x (b x c) = b(a dot c) - c(a dot b)$:
    $
      E x (n x E) = n |E|^2 - E (E dot n).
    $
  ],
)

// Aufgabe 1 - Electrostatics
#flashcard(
  title: "Electrostatics",
  color: blue,
  question: [
    (Gaussian units) Point charge $q$ at position $r_0$. Find potential $Phi(r)$ at $r$.
  ],
  answer: [
    Coulomb potential (Gaussian units):
    $
      Phi(r) = q / |r - r_0|.
    $
    (Then $E(r) = -grad Phi = q (r - r_0) / |r - r_0|^3$.)
  ],
)

#flashcard(
  title: "Electrostatics",
  color: blue,
  question: [
    Sphere radius $R$ centered at origin $O$. Point charge $q$ lies outside on $z$-axis at $r_0 = (0, 0, a)$ with $a > R$.
    (i) Compute $Phi_O = Phi(0)$.
    (ii) For a point on the sphere $r = R$, express $Phi$ as $Phi(theta)$ where $theta$ is polar angle from $+z$.
  ],
  answer: [
    (i) At origin:
    $
      Phi_O = q / a.
    $
    (ii) On sphere: $r = R hat(r)$ and $hat(r) dot hat(z)= cos theta$. Distance:
    $
      |r - r_0| = sqrt(R^2 + a^2 - 2 a R cos theta).
    $
    Thus
    $
      Phi(theta) = q / sqrt(R^2 + a^2 - 2 a R cos theta).
    $
  ],
)

#flashcard(
  title: "Electrostatics",
  color: blue,
  question: [
    On the sphere $r = R$, potential is
    $
      Phi(theta) = q / sqrt(R^2 + a^2 - 2 a R cos theta), a > R.
    $
    Compute spherical average
    $
      Phi_S = (1 / (4 pi)) integral_0^(2 pi) dd(phi) integral_0^pi Phi(theta) sin theta dd(theta).
    $
  ],
  answer: [
    $
      Phi_S = (1 / (4 pi)) integral_0^(2 pi) dd(phi) integral_0^pi sin theta dd(theta)
      q / sqrt(R^2 + a^2 - 2 a R cos theta)\
      =(1 / 2) integral_0^pi sin theta dd(theta) q / sqrt(R^2 + a^2 - 2 a R cos theta).
    $
    Let $u = R^2 + a^2 - 2 a R cos theta => dd(u) = 2 a R sin theta dd(theta)$.
    Limits: $theta = 0 -> u = (a - R)^2$, $theta = pi -> u = (a + R)^2$.
    Then
    $
      Phi_S = (q / (4 a R)) integral_((a - R)^2)^((a + R)^2) u^(-1/2) dd(u)
      = (q / (4 a R)) [2 sqrt(u)]_((a - R)^2)^((a + R)^2)
      = q / a.
    $
  ],
)

#flashcard(
  title: "Electrostatics",
  color: blue,
  question: [
    Mean-value claim: If a sphere contains no charge, then $Phi("center")$ equals the average $Phi$ on the sphere.
    Here: charge $q$ at $(0, 0, a)$ with $a > R$, and results are $Phi_O = q / a$ and $Phi_S = q / a$.
    (i) Does this prove the claim for this point-charge case?
    (ii) Why does it extend to arbitrary charge distributions outside the sphere?
  ],
  answer: [
    (i) Yes: the claim is exactly $Phi_O = Phi_S$, and here $Phi_O = Phi_S = q / a$.
    (ii) By superposition, a potential from any external distribution is a sum/integral of point-charge potentials.
    If each term satisfies the mean-value property (with no charge inside), then the sum does too.
  ],
)

// Aufgabe 2 - Electromagnetic waves
#flashcard(
  title: "EM Waves",
  color: yellow,
  question: [
    Vacuum Maxwell (Gaussian form used):
    $
      (1 / c) partial_t E = curl B, (1 / c) partial_t B = -curl E.
    $
    Use plane-wave ansatz $E = E_0 e^(i(k dot r - omega t))$, $B = B_0 e^(i(k dot r - omega t))$.
    Show (i) $k dot E = k dot B = 0$ (transverse) and (ii) using $omega = c k$:
    $B = (k x E) / k$.
  ],
  answer: [
    Insert $grad -> i k$, $partial_t -> -i omega$:
    $-i omega / c E = i k x B$, $-i omega / c B = -i k x E$.
    Dot with $k$: $k dot (k x B) = 0 => k dot E = 0$. Similarly $k dot B = 0$.
    With $omega = c k$, the second equation gives
    $B = (k x E) / k$.
  ],
)

#flashcard(
  title: "EM Waves",
  color: yellow,
  question: [
    Plane wave propagates along $+z$: $k = k hat(z)$. Complex electric field:
    $E = E_0 (hat(x) - i hat(y)) e^(i(k z - omega t))$.
    Using $B = k^ x E$, find complex $B$.
  ],
  answer: [
    $B = hat(z)x E = E_0 (hat(z)x hat(x) - i hat(z)x hat(y)) e^(i(k z - omega t))
      = E_0 (hat(y) + i hat(x)) e^(i(k z - omega t))$.
    So
    $B = E_0 (i hat(x) + hat(y)) e^(i(k z - omega t))$.
  ],
)

#flashcard(
  title: "EM Waves",
  color: yellow,
  question: [
    Plane wave with fields $E = E_0 (hat(x) - i hat(y)) e^(i(k z - omega t))$ and
    $B = E_0 (i hat(x) + hat(y)) e^(i(k z - omega t))$.
    Gaussian time-average:
    $<S> = (c / (8 pi)) Re(E x B^*)$.
    Compute $<S>$.
  ],
  answer: [
    $E x B^*$ points along $+hat(z)$ with magnitude $2 |E_0|^2$. Therefore
    $<S> = (c / (8 pi)) (2 |E_0|^2) hat(z)= (c / (4 pi)) |E_0|^2 hat(z)$.
  ],
)

#flashcard(
  title: "EM Waves",
  color: yellow,
  question: [
    Wave:
    $E = E_0 (hat(x) - i hat(y)) e^(i(k z - omega t))$.
    Physical field is $Re{E}$. Determine polarization type and handedness
    (observer at origin looking in $+z$ direction at outgoing wave).
  ],
  answer: [
    $Re{E} = E_0 (hat(x) cos(k z - omega t) + hat(y) sin(k z - omega t))$.
    At fixed $z$, magnitude is constant and the tip rotates -> circular polarization.
    Rotation is anti-clockwise in the stated viewing convention -> left-circular polarization.
  ],
)

#flashcard(
  title: "EM Waves",
  color: yellow,
  question: [
    At $z = 0$:
    $E(t) = (E_(0x) cos omega t, E_(0y) cos(omega t + phi), 0)$.
    Case: $E_(0x) = 1$, $E_(0y) = 1/2$, $phi = 0$.
    Eliminate $t$ to get $E_y(E_x)$ and state polarization.
  ],
  answer: [
    $E_x = cos omega t$, $E_y = (1/2) cos omega t => E_y = (1/2) E_x$.
    Straight line -> linear polarization.
  ],
)

#flashcard(
  title: "EM Waves",
  color: yellow,
  question: [
    At $z = 0$:
    $E(t) = (E_(0x) cos omega t, E_(0y) cos(omega t + phi), 0)$.
    Case: $E_(0x) = 1$, $E_(0y) = 1/2$, $phi = pi$.
    Find $E_y(E_x)$ and polarization.
  ],
  answer: [
    $E_y = (1/2) cos(omega t + pi) = -(1/2) cos omega t = -(1/2) E_x$.
    Straight line -> linear polarization.
  ],
)

#flashcard(
  title: "EM Waves",
  color: yellow,
  question: [
    At $z = 0$:
    $E(t) = (cos omega t, cos(omega t + phi), 0)$.
    Case: $phi = pi / 2$.
    Find the curve and polarization (handedness for an observer looking toward $+z$).
  ],
  answer: [
    $E_x = cos omega t$, $E_y = cos(omega t + pi / 2) = -sin omega t$.
    Then $E_x^2 + E_y^2 = 1$, a circle -> circular polarization.
    For $phi = +pi / 2$, rotation is anti-clockwise -> left-circular.
  ],
)

#flashcard(
  title: "EM Waves",
  color: yellow,
  question: [
    At $z = 0$:
    $E(t) = (cos omega t, cos(omega t + phi), 0)$.
    Case: $phi = -pi / 2$.
    Find the curve and polarization.
  ],
  answer: [
    $E_y = cos(omega t - pi / 2) = sin omega t$, $E_x = cos omega t$.
    So $E_x^2 + E_y^2 = 1$: a circle. Rotation is clockwise -> right-circular.
  ],
)

#flashcard(
  title: "EM Waves",
  color: yellow,
  question: [
    At $z = 0$:
    $E(t) = (cos omega t, (1/2) cos(omega t + phi), 0)$.
    Case: $phi = pi / 4$.
    State curve type and polarization.
  ],
  answer: [
    Different amplitudes and nontrivial phase shift -> ellipse.
    For $phi = +pi / 4$, rotation is anti-clockwise -> left-elliptical polarization.
  ],
)

#flashcard(
  title: "EM Waves",
  color: yellow,
  question: [
    At $z = 0$:
    $E(t) = (cos omega t, (1/2) cos(omega t + phi), 0)$.
    Case: $phi = -pi / 4$.
    State curve type and polarization.
  ],
  answer: [
    Ellipse again. For $phi = -pi / 4$, rotation reverses -> right-elliptical polarization.
  ],
)

// Aufgabe 3 - Hall effect
#flashcard(
  title: "Hall Effect",
  color: green,
  question: [
    Particle mass $m$, charge $q$. Initially moves with $v = v hat(x)$.
    At $t = 0$ a uniform magnetic field $B = B hat(z)$ is switched on.
    Gaussian Lorentz force:
    $F = q (E + (1 / c) v x B)$, $E = 0$.
    Describe the motion.
  ],
  answer: [
    At switch-on:
    $F = (q / c) (v hat(x)) x (B hat(z)) = -(q v B / c) hat(y)$.
    So it initially accelerates in $+/- hat(y)$ depending on the sign of $q B$.
    Then it executes uniform circular motion in the $x y$-plane.
  ],
)

#flashcard(
  title: "Hall Effect",
  color: green,
  question: [
    A particle of mass $m$ and charge $q$ moves with $v perp B$ in a uniform magnetic field $B = B hat(z)$, with $E = 0$.
    The trajectory is circular with measurable radius $R$.
    Given centripetal force magnitude $F_c = m v^2 / R$.
    Find momentum $p = m v$ in terms of $q, B, R, c$.
  ],
  answer: [
    Magnetic force magnitude: $|F| = |q| v B / c$.
    Set $m v^2 / R = |q| v B / c => m v = |q| B R / c$.
    Thus
    $p = m v = |q| B R / c$.
  ],
)

#flashcard(
  title: "Hall Effect",
  color: green,
  question: [
    Beam of particles enters region where $B = B hat(z)$ and an electric field $E = E hat(y)$ is applied so the path is straight.
    Use Lorentz force $F = q (E + v x B / c)$. With $v = v hat(x)$, find $v$ in terms of $E, B, c$.
  ],
  answer: [
    Straight path requires $F = 0$:
    $E + (1 / c) v x B = 0$.
    With $v x B = (v hat(x)) x (B hat(z)) = -v B hat(y)$,
    $E hat(y) - (v B / c) hat(y) = 0 => v = c E / B$.
  ],
)

#flashcard(
  title: "Hall Effect",
  color: green,
  question: [
    Measurements:
    With $E = 0$ in $B = B hat(z)$, the radius is $R$.
    With $E = E hat(y)$ and $B = B hat(z)$, the beam is straight.
    Using $p = m v$ and from circular motion $p = |q| B R / c$, and from straight motion $v = c E / B$, find $q / m$.
  ],
  answer: [
    From $p = m v = |q| B R / c$,
    $|q| / m = c / (B R) v$.
    Insert $v = c E / B$:
    $q / m = c^2 E / (B^2 R)$ (sign from curvature).
  ],
)

#flashcard(
  title: "Hall Effect",
  color: green,
  question: [
    Conductor size $l x w x h$. Current $I$ along $+x$ is carried by positive charges drifting in $+x$.
    A magnetic field $B = B hat(z)$ exists inside the conductor region (no external $E$).
    Describe what happens (Hall effect).
  ],
  answer: [
    Positive carriers feel $F = (q / c) v x B prop hat(x) x hat(z)= -hat(y)$.
    Charge accumulates on one side, leaving the opposite side with opposite charge, creating a transverse $E$.
    It grows until electric and magnetic forces balance, producing a Hall voltage across the $y$-direction faces.
  ],
)

#flashcard(
  title: "Hall Effect",
  color: green,
  question: [
    Hall voltage magnitude: positive carriers drift with speed $v$ in $+x$; $B = B hat(z)$.
    Conductor width in $y$ is $w$.
    Use equilibrium $q E = (q / c) v B$. Compute potential difference $Delta Phi$ between the two $y$-faces.
  ],
  answer: [
    Equilibrium gives $E = v B / c$.
    Potential difference across width $w$:
    $Delta Phi = integral_0^w E dd(y) = E w = v B w / c$.
  ],
)

#flashcard(
  title: "Hall Effect",
  color: green,
  question: [
    Hall setup: current is carried by negative charges moving in $-x$ in a field $B = B hat(z)$.
    Qualitatively: which side becomes higher potential, and how does this reveal carrier sign?
  ],
  answer: [
    A negative charge moving $-x$ is deflected downward (same geometric direction), so negative charge builds up where positive carriers would not.
    The sign of the Hall voltage reverses. Measuring which side is at higher potential reveals the carrier sign.
  ],
)

#flashcard(
  title: "Hall Effect",
  color: green,
  question: [
    Hall setup: conductor has magnetic permeability $mu != 1$. What changes qualitatively?
  ],
  answer: [
    Nontrivial $mu$ changes the internal magnetic field strength, so the Lorentz force changes and the Hall field $E$ changes.
    Thus $Delta Phi prop B$ changes with the effective internal $B$.
  ],
)

// Aufgabe 4 - Superconductors (London equations)
#flashcard(
  title: "Superconductors",
  color: red,
  question: [
    London model: super-electron density $n_s$, electron charge $e$, mass $m$.
    Assume (i) electrons feel only EM forces (no scattering), (ii) $|v_s| |B| << c |E|$ so magnetic term negligible.
    Use Lorentz+Newton:
    $m partial_t v_s = e (E + (v_s / c) x B) approx e E$, $J_s = e n_s v_s$.
    Derive $partial_t J_s = (n_s e^2 / m) E$.
  ],
  answer: [
    From Newton-Lorentz:
    $m partial_t v_s approx e E => partial_t v_s = (e / m) E$.
    Multiply by $e n_s$:
    $partial_t (e n_s v_s) = (n_s e^2 / m) E$.
    Since $J_s = e n_s v_s$,
    $partial_t J_s = (n_s e^2 / m) E$.
  ],
)

#flashcard(
  title: "Superconductors",
  color: red,
  question: [
    Given 2nd London equation:
    $curl J_s = -(n_s e^2 / m) B$.
    Claim: "Therefore always $J_s = -(n_s e^2 / m) A$. This is true in all circumstances."
    True or false? Brief reason.
  ],
  answer: [
    False. $A$ is gauge-dependent, so $J_s prop A$ cannot hold in all gauges.
    It is valid only after choosing a specific gauge (London gauge).
  ],
)

#flashcard(
  title: "Superconductors",
  color: red,
  question: [
    Steady state ($partial_t = 0$). London:
    $partial_t J_s = (n_s e^2 / m) E$, $curl J_s = -(n_s e^2 / m) B$.
    Maxwell (Gaussian with constant $k$):
    $curl B = (4 pi k / c) J_s$, $div B = 0$.
    Identity: $curl (curl B) = grad (div B) - nabla^2 B$.
    Show
    $nabla^2 B = B / lambda_L^2$
    and find $lambda_L$.
  ],
  answer: [
    Steady state gives $partial_t J_s = 0 => E = 0$.
    From 2nd London:
    $curl J_s = -(n_s e^2 / m) B => B = -(m / (n_s e^2)) curl J_s$.
    Use $J_s = (c / (4 pi k)) curl B$:
    $B = -(m / (n_s e^2)) (c / (4 pi k)) curl (curl B)$.
    With $div B = 0$, $curl (curl B) = -nabla^2 B$, so
    $B = (m c / (4 pi k n_s e^2)) nabla^2 B$.
    Thus
    $nabla^2 B = (4 pi k n_s e^2 / (m c)) B = B / lambda_L^2$,
    where
    $lambda_L = sqrt(m c / (4 pi k n_s e^2))$.
  ],
)

#flashcard(
  title: "Superconductors",
  color: red,
  question: [
    Superconductor occupies half-space $x >= 0$. Boundary field at surface:
    $B(x = 0, y, z) = B_0 hat(z)$.
    Inside, $B$ satisfies $nabla^2 B = B / lambda_L^2$.
    Assume symmetry and solve $B(x)$ for $x >= 0$. Explain Meissner effect.
  ],
  answer: [
    By symmetry $B = B_z(x) hat(z)$. Then
    $d^2 B_z / dx^2 = B_z / lambda_L^2$, with $B_z(0) = B_0$, $B_z(oo) -> 0$.
    Solution:
    $B(x) = B_0 e^(-x / lambda_L) hat(z)$.
    The field decays exponentially into the superconductor, so the interior is effectively field-free (Meissner effect).
  ],
)

#flashcard(
  title: "Superconductors",
  color: red,
  question: [
    Perfect Meissner: $B = 0$ for $x >= 0$ (superconductor half-space). Vacuum for $x < 0$.
    Magnetic dipole $m = m_0 hat(x)$ located at $x_0 = (-a, 0, 0)$.
    Vacuum dipole field (constant $k$):
    $B(r) = k [3(m dot r) r / hat(r)5 - m / hat(r)3]$.
    Find $B$ on the $x$-axis in vacuum: points $(x, 0, 0)$ with $x < 0$. (Use image method.)
  ],
  answer: [
    Image method: add an image dipole at $(+a, 0, 0)$ with moment $-m$.
    On the $x$-axis, field points along $hat(x)$. Result:
    $B(x, 0, 0) = 2 k m_0 [1 / (x - a)^3 - 1 / (x + a)^3] hat(x), x < 0$.
    Equivalent form:
    $B(x, 0, 0) = -4 k m_0 (3 a x^2 + a^3) / (x^2 - a^2)^3 hat(x)$.
  ],
)

// Aufgabe 5 - Transformations between E and B
#flashcard(
  title: "Field Transforms",
  color: red,
  question: [
    Current sheet in $x y$-plane:
    $j(x, y, z) = J delta(z) hat(x)$.
    Use Ampere (Gaussian with constant $k$):
    $integral B dot dd(r) = (4 pi k / c) I_("enc")$.
    (i) Direction of $B$ for $z > 0$.
    (ii) Find $B$ in $z > 0$.
  ],
  answer: [
    Right-hand rule: for current $+hat(x)$, field is $-hat(y)$ above ($z > 0$) and $+hat(y)$ below.
    Using a rectangular loop crossing the sheet gives $2 B_y = (4 pi k / c) J$ with sign. Final:
    $B(z > 0) = -(2 pi k / c) J hat(y)$.
  ],
)

#flashcard(
  title: "Field Transforms",
  color: red,
  question: [
    Charge sheet in $x y$-plane:
    $rho(x, y, z) = sigma delta(z)$, $j = 0$.
    Use Gauss law (Gaussian with constant $k$):
    $div E = 4 pi k rho$.
    Find $E$ for $z > 0$.
  ],
  answer: [
    Pillbox gives:
    $E(z > 0) A - E(z < 0) A = 4 pi k sigma A$.
    By symmetry $E(z < 0) = -E(z > 0)$, so $2 E(z > 0) = 4 pi k sigma$.
    Therefore $E(z > 0) = 2 pi k sigma hat(z)$.
  ],
)

#flashcard(
  title: "Field Transforms",
  color: red,
  question: [
    Start from charge sheet (no current): $rho = sigma delta(z)$, fields in lab:
    $E = 2 pi k sigma hat(z)$, $B = 0$.
    Observer moves with speed $v$ along $-hat(x)$. Define $beta = v / c$, $gamma = (1 - beta^2)^(-1/2)$.
    Use field transforms for boost along $x$:
    $E_x' = E_x, B_x' = B_x$, $E_y' = gamma(E_y + beta B_z)$, $E_z' = gamma(E_z - beta B_y)$,
    $B_y' = gamma(B_y - beta E_z)$, $B_z' = gamma(B_z + beta E_y)$.
    Find $E'$ and $B'$.
  ],
  answer: [
    Here $E_x = E_y = 0$, $E_z = 2 pi k sigma$, and $B = 0$. Thus
    $E_z' = gamma E_z = 2 pi k gamma sigma$, $E_x' = E_y' = 0$,
    $B_y' = gamma(0 - beta E_z) = -2 pi k beta gamma sigma$, $B_x' = B_z' = 0$.
    So
    $E' = 2 pi k gamma sigma hat(z)$, $B' = -2 pi k beta gamma sigma hat(y)$.
  ],
)

#flashcard(
  title: "Field Transforms",
  color: red,
  question: [
    Charge sheet: $rho = sigma delta(z)$, $j = 0$.
    Observer moves with speed $v$ along $-x$. Define $beta = v / c$, $gamma = (1 - beta^2)^(-1/2)$.
    Transform 4-current (boost along $x$):
    $c rho' = gamma(c rho + beta j_x)$, $j_x' = gamma(j_x + beta c rho)$, $j_y' = j_y$, $j_z' = j_z$.
    Find $rho'$ and $j'$.
  ],
  answer: [
    Since $j_x = j_y = j_z = 0$:
    $c rho' = gamma c rho => rho' = gamma rho = gamma sigma delta(z)$,
    $j_x' = gamma(beta c rho) = gamma beta c sigma delta(z)$.
    So
    $rho' = gamma sigma delta(z)$, $j' = gamma beta c sigma delta(z) hat(x)$.
  ],
)

#flashcard(
  title: "Field Transforms",
  color: red,
  question: [
    Explain how parts (5b-5d) let you compute the magnetic field of the current sheet
    $j = J delta(z) hat(x)$, and compare with Ampere result
    $B(z > 0) = -(2 pi k / c) J hat(y)$.
  ],
  answer: [
    In the moving frame, the transformed sheet has a current density $j_x'$ from a pure charge density.
    That current produces a magnetic field satisfying
    $B_y' = -(2 pi k / c) j_x'$.
    Identifying $J = j_x'$ reproduces
    $B(z > 0) = -(2 pi k / c) J hat(y)$,
    matching the direct Ampere-law computation.
  ],
)

// Aufgabe 6 - Apparent speed
#flashcard(
  title: "Apparent Speed",
  color: red,
  question: [
    Earth observes distant pulsar. At emission of pulse 1, pulsar distance is $R$.
    Pulsar moves at speed $v$ making angle $0 < phi < pi / 2$ relative to line of sight.
    Between emissions, pulsar travels transverse distance $l$ with $l << R$.
    Let $T_0$ be the Earth-frame time between emissions.
    Find distance $d$ from Earth at emission of pulse 2, to first order in small quantity ($l$ or $v T_0$).
  ],
  answer: [
    Geometry:
    $d = sqrt((R - v T_0 cos phi)^2 + l^2)$.
    Since $v T_0 = l / sin phi << R$, expand to first order:
    $d approx R - v T_0 cos phi$.
    Using $l = v T_0 sin phi$:
    $d approx R - l cot phi$.
  ],
)

#flashcard(
  title: "Apparent Speed",
  color: red,
  question: [
    Earth observes arrival-time gap $t$ between the two pulses. Earth-frame emission gap is $T_0$.
    At emission of pulse 1 distance is $R$; at emission of pulse 2 distance is $d approx R - v T_0 cos phi$.
    Using light travel times, derive $T_0$ in terms of $t$, $beta = v / c$, and $phi$.
  ],
  answer: [
    Arrival time difference:
    $t = (T_0 + d / c) - R / c = T_0 + (R - v T_0 cos phi) / c - R / c = T_0 (1 - beta cos phi)$.
    Thus
    $T_0 = t / (1 - beta cos phi)$.
  ],
)

#flashcard(
  title: "Apparent Speed",
  color: red,
  question: [
    Define apparent speed $u := l / t$. Measured $u = c$. Angle $0 < phi < pi / 2$.
    Let $beta = v / c$. Using $l = v T_0 sin phi$ and $t = T_0 (1 - beta cos phi)$, solve for $beta(phi)$.
  ],
  answer: [
    $u = l / t = v T_0 sin phi / (T_0 (1 - beta cos phi)) = v sin phi / (1 - beta cos phi)$.
    Set $u = c$:
    $1 = beta sin phi / (1 - beta cos phi)$.
    Solve:
    $1 - beta cos phi = beta sin phi => 1 = beta (sin phi + cos phi)$.
    Thus
    $beta = 1 / (sin phi + cos phi)$.
  ],
)

#flashcard(
  title: "Apparent Speed",
  color: red,
  question: [
    Given $beta(phi) = 1 / (sin phi + cos phi)$ with $0 < phi < pi / 2$. Prove $beta < 1$.
  ],
  answer: [
    Need $sin phi + cos phi > 1$. Square:
    $(sin phi + cos phi)^2 = 1 + 2 sin phi cos phi = 1 + sin(2 phi)$.
    For $0 < phi < pi / 2$, $sin(2 phi) > 0$, so $(sin phi + cos phi)^2 > 1$.
    Hence $sin phi + cos phi > 1$ and $beta < 1$.
  ],
)

#flashcard(
  title: "Apparent Speed",
  color: red,
  question: [
    Let $T$ be the time between emissions in the pulsar rest frame. Earth-frame emission gap is $T_0$.
    Use time dilation $T = T_0 sqrt(1 - beta^2)$.
    Given measured $u = c => beta = 1 / (sin phi + cos phi)$, and also
    $T_0 = t sin phi / (sin phi + cos phi)$.
    Express $T$ in terms of $t$ and $phi$.
  ],
  answer: [
    $T = T_0 sqrt(1 - beta^2)$.
    Use
    $T_0 = t sin phi / (sin phi + cos phi)$,
    $1 - beta^2 = 1 - 1 / (sin phi + cos phi)^2 = sin(2 phi) / (sin phi + cos phi)^2$.
    Then
    $T = t sin phi sqrt(sin(2 phi)) / (sin phi + cos phi)^2$.
    Since $(sin phi + cos phi)^2 = 1 + sin(2 phi)$, an equivalent form is
    $T = t sin phi sqrt(sin(2 phi)) / (1 + sin(2 phi))$.
  ],
)

// Aufgabe 7 - Detonation paradox
#flashcard(
  title: "Detonation Paradox",
  color: red,
  question: [
    U-structure (lab frame) contains a trigger switch wired to explosive.
    A moving T-structure flies into it at $v = 0.87 c$ ($gamma = 2$).
    In lab rest, T is length-contracted -> seems too short to hit switch; in T-rest frame, U arms are contracted -> seems long enough.
    Labels: front/back of T-arm are $P, Q$; front/back of U arms are $A, B$.
    Use event $Q A$ as origin in both frames.
    Using spacetime diagrams + causality, decide: explosion or not? Explain in one sentence.
  ],
  answer: [
    Explosion occurs (in both frames). In both spacetime diagrams the trigger event $P B$ lies outside the forward light cone of event $Q A$,
    so information about $Q A$ cannot causally prevent $P B$. Causality is frame-invariant.
  ],
)

#flashcard(
  title: "Detonation Paradox",
  color: red,
  question: [
    At rest (when U and T are not moving relative), define distances: $A P = L$ and $P B = epsilon$.
    Find the maximum $epsilon(v)$ such that the conclusion "explosion occurs" remains true.
    Express in terms of $L$ and $v / c$.
  ],
  answer: [
    The maximal allowed $epsilon$ is
    $epsilon = L (sqrt((1 + v / c) / (1 - v / c)) - 1)$.
  ],
)

#render-flashcards()
