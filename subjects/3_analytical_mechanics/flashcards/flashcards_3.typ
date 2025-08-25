#import "../../../lib/setup_flashcards.typ": flashcard, flashcard-setup, render-flashcards
#import "../../../lib/lib.typ": *

#show: flashcard-setup(
  card-width: 6cm,
  card-height: 4cm,
  show-cut-lines: true,
  content-margin: 10pt,
  topic: "Relativity",
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is precession in the context of a heavy top?
  ],
  answer: [
    It is the slow rotation of the top's symmetry axis around the vertical axis. This corresponds to the change in the Euler angle $phi$ over time.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is nutation in the context of a heavy top?
  ],
  answer: [
    It is the "nodding" or oscillating motion of the top's symmetry axis. The angle $theta$ between the symmetry axis and the vertical oscillates between two turning points, $theta_"min"$ and $theta_"max"$.
  ],
)

#flashcard(
  title: "Approximation",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is the fast top approximation?
  ],
  answer: [
    The assumption that the initial rotational kinetic energy about the symmetry axis is much larger than the maximum change in potential energy:

    $1/2 Theta_3 omega_3^2 >> m g l$
  ],
)

#flashcard(
  title: "Behavior",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    For a fast top, how does the average precession frequency $angle.l dot(phi) angle.r$ depend on the spin frequency $omega_3$?
  ],
  answer: [
    The average precession frequency is inversely proportional to the spin frequency:
    $angle.l dot(phi) angle.r prop 1/omega_(3 0)$
    A faster spin leads to slower precession.
  ],
)

#flashcard(
  title: "Behavior",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    For a fast top, how does the nutation frequency depend on the spin frequency $omega_3$?
  ],
  answer: [
    The nutation frequency is directly proportional to the spin frequency:
    $b prop omega_(3 0)$
    A faster spin leads to faster (and smaller amplitude) nodding.
  ],
)

#flashcard(
  title: "Special Case",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is a sleeping top?
  ],
  answer: [
    A special case of a fast top whose symmetry axis is initially vertical ($theta = 0$) and spins very fast. It remains spinning vertically without precessing or nutating, but only if the spin frequency $omega_3$ is above a certain critical value.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS24 Q5) A rigid body is suspended by its center of mass in a uniform gravitational field. What is the torque acting on it?
  ],
  answer: [
    Zero. The gravitational force can be considered to act at the center of mass. Since the body is suspended there, the lever arm is zero. The body behaves as a *free top*.
  ],
)

#flashcard(
  title: "Conservation",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    How many conserved quantities does a free asymmetric spinning top ($Theta_1 != Theta_2 != Theta_3$) possess?
  ],
  answer: [
    Two. The total energy ($T$) and the total magnitude of the angular momentum ($|bold(L)|^2$). Unlike the symmetric top, the component of angular momentum along any body axis is not conserved.
  ],
)

#flashcard(
  title: "Procedure",
  color: rgb("#FCE4EC"), // light pink - method
  question: [
    Outline the steps to find the motion of a free rigid body.
  ],
  answer: [
    1. Find the inertia tensor $Theta$ and diagonalize it.
    2. Write Euler's equations in the principal axis frame.
    3. Solve for $bold(omega)(t)$ from the ODEs.
    4. Find orientation $R(t)$ by solving $dot(R) = R Omega(t)$.
  ],
)

// Kinematics & Transformations
#flashcard(
  title: "Property",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is the defining property of a Lorentz transformation matrix, $Lambda$?
  ],
  answer: [
    A matrix $Lambda$ is a Lorentz transformation if it preserves the Minkowski scalar product. Mathematically, this is expressed as:

    $Lambda^T g Lambda = g$

    where $g$ is the Minkowski metric.
  ],
)

#flashcard(
  title: "Formula",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    Write the transformation equations for a Lorentz boost with velocity $v$ along the $x^1$ axis.
  ],
  answer: [
    $hat(t) = gamma (t - v x^1 / c^2)$

    $hat(x)^1 = gamma (x^1 - v t)$

    where $gamma = 1/sqrt(1 - v^2/c^2)$.
  ],
)

#flashcard(
  title: "Effect",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is time dilation? State the formula.
  ],
  answer: [
    A moving clock runs slower as measured by a stationary observer. An interval $Delta t_0$ in the moving frame (proper time) is measured as $Delta t$ in the stationary frame, where:

    $Delta t = gamma Delta t_0$
  ],
)

#flashcard(
  title: "Effect",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is length contraction? State the formula.
  ],
  answer: [
    An object appears shorter in its direction of motion as measured by a stationary observer. A length $L_0$ in its rest frame is measured as $L$ by an observer moving relative to it, where:

    $L = L_0 / gamma$
  ],
)

#flashcard(
  title: "Formula",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the relativistic velocity addition formula for collinear motion?
  ],
  answer: [
    If a frame moves at $v_1$ and an object moves at $v_2$ relative to it, the object's velocity $v$ in the stationary frame is:

    $v = (v_1 + v_2)/(1 + v_1 v_2 / c^2)$

    (This was a key part of the relativistic rocket problem in HS22 Q4).
  ],
)


// 4-Vectors & Dynamics
#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    How is the 4-velocity vector, $u^mu$, defined?
  ],
  answer: [
    The 4-velocity is the derivative of the spacetime position 4-vector $x^mu$ with respect to the proper time $tau$:

    $u^mu = (d x^mu)/(d tau) = gamma (c, bold(v))$
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    How is the 4-momentum vector, $p^mu$, defined?
  ],
  answer: [
    The 4-momentum is the rest mass $m$ times the 4-velocity $u^mu$:

    $p^mu = m u^mu = m gamma (c, bold(v)) = (E/c, bold(p))$
  ],
)

#flashcard(
  title: "Relation",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the relativistic energy-momentum relation?
  ],
  answer: [
    It relates a particle's total energy $E$, its momentum $|bold(p)|$, and its rest mass $m$:

    $E^2 = (|bold(p)| c)^2 + (m c^2)^2$

    This comes from the invariant squared norm of the 4-momentum, $(p, p) = m^2 c^2$.
  ],
)

#flashcard(
  title: "Conservation",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What physical quantity is conserved in all relativistic interactions (collisions, decays)?
  ],
  answer: [
    The *total 4-momentum vector* of the system. This single conservation law implies the conservation of both total energy and total spatial momentum.
  ],
)

#flashcard(
  title: "Special Case",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the energy-momentum relation for a massless particle (e.g., a photon)?
  ],
  answer: [
    For a massless particle, $m = 0$. The energy-momentum relation simplifies to:

    $E = |bold(p)| c$
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is the relativistic expression for kinetic energy, $T$?
  ],
  answer: [
    Kinetic energy is the total energy minus the rest energy:

    $T = E - m c^2 = gamma m c^2 - m c^2 = m c^2 (gamma - 1)$
  ],
)

#flashcard(
  title: "Lagrangian",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the Lagrangian for a free relativistic particle?
  ],
  answer: [
    The action is proportional to the integral of the proper time, $delta integral d s = 0$. This leads to the Lagrangian:

    $L = -m c^2 sqrt(1 - v^2/c^2) = -m c^2 / gamma$
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is the invariant mass of a system of particles?
  ],
  answer: [
    The invariant mass $M$ is defined from the total 4-momentum of the system, $P_"tot"^mu = (E_"tot"/c, bold(p)_"tot")$:

    $M^2 c^2 = (P_"tot", P_"tot") = (E_"tot"/c)^2 - |bold(p)_"tot"|^2$

    This mass is the same for all observers and is generally not the sum of the individual rest masses.
  ],
)

#flashcard(
  title: "Tensors",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is the difference between a contravariant vector $x^mu$ and a covariant vector $x_mu$?
  ],
  answer: [
    *Contravariant* ($x^mu$, upper index) transforms with $Lambda$: $hat(x)^mu = Lambda^mu_nu x^nu$.

    *Covariant* ($x_mu$, lower index) is obtained by $x_mu = g_(mu nu) x^nu$ and transforms differently to keep scalar products invariant.
  ],
)

// Exam-Style Problems
#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS19 Q4) A particle moves on the world-line $x^mu (t) = (c t, v t, 0, 0)$. Determine its 4-velocity vector $u^mu$.
  ],
  answer: [
    Proper time: $d tau = d t sqrt(1 - v^2/c^2) = d t / gamma$.

    4-velocity: $u^mu = (d x^mu)/(d tau) = gamma (d x^mu)/(d t)$.

    $(d x^mu)/(d t) = (c, v, 0, 0)$.

    $u^mu = gamma (c, v, 0, 0)$. This matches the general formula $u = gamma (c, bold(v))$.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS22 Q4) A rocket at velocity $v$ ejects gas with velocity $u$ relative to the rocket. What is the gas velocity in the initial rest frame?
  ],
  answer: [
    Use the relativistic velocity addition formula. The gas velocity relative to the rocket is $-u$. The rocket velocity is $v$. The gas velocity in the rest frame is:

    $v_"gas" = (v - u)/(1 - v u / c^2)$
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS19 Q4) A pion ($m_pi$) at rest decays into two photons: $pi^0 -> gamma_1 + gamma_2$. Find the energy of each photon.
  ],
  answer: [
    Energy conservation: $E_"before" = m_pi c^2 = E_1 + E_2$.
    Momentum conservation: $bold(p)_"before" = 0 => bold(p)_1 + bold(p)_2 = 0$, so $bold(p)_1 = -bold(p)_2$.
    For photons, $E = |bold(p)| c$, so $|bold(p)_1| = |bold(p)_2|$ implies $E_1 = E_2$.
    Substituting into energy conservation: $m_pi c^2 = 2 E_1 => E_1 = E_2 = (m_pi c^2)/2$.
  ],
)

#flashcard(
  title: "Invariance",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    Is the Minkowski scalar product $(xi, eta)$ Lorentz-invariant?
  ],
  answer: [
    Yes. This is the defining property of Lorentz transformations. If $hat(xi) = Lambda xi$ and $hat(eta) = Lambda eta$, then $(hat(xi), hat(eta)) = (xi, eta)$.
  ],
)

#flashcard(
  title: "Simultaneity",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is the condition on the 4-vector difference $x - y$ for two events $x$ and $y$ to be simultaneous in some reference frame?
  ],
  answer: [
    The interval $x - y$ must be spacelike, i.e., $(x - y, x - y) < 0$.
  ],
)

#flashcard(
  title: "Approximation",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the non-relativistic limit ($v << c$) of the Lorentz factor $gamma$?
  ],
  answer: [
    $gamma = (1 - v^2/c^2)^(-1/2)$. Using the binomial approximation $(1 - x)^n approx 1 - n x$ for small $x$:

    $gamma approx 1 + 1/2 v^2/c^2$
  ],
)

#flashcard(
  title: "Approximation",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the non-relativistic limit ($v << c$) of the relativistic kinetic energy $T = m c^2 (gamma - 1)$?
  ],
  answer: [
    Using the approximation $gamma approx 1 + 1/2 v^2/c^2$:

    $T approx m c^2 ((1 + 1/2 v^2/c^2) - 1) = m c^2 (1/2 v^2/c^2) = 1/2 m v^2$

    It correctly reduces to the classical kinetic energy.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    In the relativistic rocket problem (HS22 Q4), what is the key difference from the non-relativistic case regarding conservation laws?
  ],
  answer: [
    In the non-relativistic case, mass and momentum are conserved separately. In the relativistic case, rest mass is *not* conserved; instead, the total 4-momentum (which combines energy and momentum) is the conserved quantity.
  ],
)

#flashcard(
  title: "Causality",
  color: rgb("#F3E5F5"), // light purple - theorem
  question: [
    How does special relativity protect causality (cause precedes effect)?
  ],
  answer: [
    The interval between a cause and its effect must be timelike or lightlike. For such intervals, all inertial observers agree on the temporal order of the events, so the cause is always measured to happen before the effect. Information cannot travel faster than c, so spacelike separated events cannot causally influence each other.
  ],
)

// Fundamental Postulates & Spacetime
#flashcard(
  title: "Postulates",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What are the two fundamental postulates of Einstein's Special Relativity?
  ],
  answer: [
    *Relativity Principle:* The laws of nature are the same (form-invariant) in all inertial reference frames.

    *Constancy of the Speed of Light:* The speed of light in a vacuum, c, is the same for all inertial observers, regardless of the motion of the source.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is Minkowski space?
  ],
  answer: [
    A 4-dimensional real vector space that models spacetime, where a point is an "event" with coordinates $x^mu = (c t, x, y, z)$. It is equipped with the Minkowski metric $g_(mu nu)$.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is the Minkowski metric, $g_(mu nu)$, used in the course materials?
  ],
  answer: [
    It is a diagonal 4×4 matrix with the signature (+, -, -, -):

    $g_(mu nu) = mat(1, 0, 0, 0; 0, -1, 0, 0; 0, 0, -1, 0; 0, 0, 0, -1)$
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    Define the Minkowski scalar product of two 4-vectors, $x_1$ and $x_2$.
  ],
  answer: [
    It is defined as $(x_1, x_2) = g_(mu nu) x_1^mu x_2^nu$. For a single vector, its squared norm is $(x, x) = (x^0)^2 - |bold(x)|^2$.
  ],
)

#flashcard(
  title: "Classification",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    When is the interval between two spacetime events called spacelike, timelike, or lightlike?
  ],
  answer: [
    Let $Delta x$ be the interval.

    *Spacelike:* $(Delta x, Delta x) < 0$. Two events that can be simultaneous in some frame.

    *Timelike:* $(Delta x, Delta x) > 0$. Two events that are causally connected.

    *Lightlike:* $(Delta x, Delta x) = 0$. Two events connected by a light signal.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is proper time, $tau$?
  ],
  answer: [
    Proper time is the time measured by a clock in its own rest frame. It is a Lorentz-invariant quantity, related to coordinate time by:

    $d tau = d t / gamma = d t sqrt(1 - v^2/c^2)$
  ],
)

// Kinematics & Transformations
#flashcard(
  title: "Property",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is the defining property of a Lorentz transformation matrix, $Lambda$?
  ],
  answer: [
    A matrix $Lambda$ is a Lorentz transformation if it preserves the Minkowski scalar product. Mathematically, this is expressed as:

    $Lambda^T g Lambda = g$

    where $g$ is the Minkowski metric.
  ],
)

#flashcard(
  title: "Formula",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    Write the transformation equations for a Lorentz boost with velocity $v$ along the $x^1$ axis.
  ],
  answer: [
    $hat(t) = gamma (t - v x^1 / c^2)$

    $hat(x)^1 = gamma (x^1 - v t)$

    where $gamma = 1/sqrt(1 - v^2/c^2)$.
  ],
)

#flashcard(
  title: "Effect",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is time dilation? State the formula.
  ],
  answer: [
    A moving clock runs slower as measured by a stationary observer. An interval $Delta t_0$ in the moving frame (proper time) is measured as $Delta t$ in the stationary frame, where:

    $Delta t = gamma Delta t_0$
  ],
)

#flashcard(
  title: "Effect",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is length contraction? State the formula.
  ],
  answer: [
    An object appears shorter in its direction of motion as measured by a stationary observer. A length $L_0$ in its rest frame is measured as $L$ by an observer moving relative to it, where:

    $L = L_0 / gamma$
  ],
)

#flashcard(
  title: "Formula",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the relativistic velocity addition formula for collinear motion?
  ],
  answer: [
    If a frame moves at $v_1$ and an object moves at $v_2$ relative to it, the object's velocity $v$ in the stationary frame is:

    $v = (v_1 + v_2)/(1 + v_1 v_2 / c^2)$

    (This was a key part of the relativistic rocket problem in HS22 Q4).
  ],
)

#flashcard(
  title: "Paradox",
  color: rgb("#F3E5F5"), // light purple - theorem
  question: [
    What is the twin paradox and its resolution?
  ],
  answer: [
    *Paradox:* One twin travels into space at high speed and returns. Each twin sees the other's clock running slow. Who is younger?
    *Resolution:* The situation is not symmetric. The traveling twin must accelerate to turn around, so they are not in a single inertial frame. A full analysis shows the traveling twin is unambiguously younger.
  ],
)

// 4-Vectors & Dynamics
#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    How is the 4-velocity vector, $u^mu$, defined?
  ],
  answer: [
    The 4-velocity is the derivative of the spacetime position 4-vector $x^mu$ with respect to the proper time $tau$:

    $u^mu = (d x^mu)/(d tau) = gamma (c, bold(v))$
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    How is the 4-momentum vector, $p^mu$, defined?
  ],
  answer: [
    The 4-momentum is the rest mass $m$ times the 4-velocity $u^mu$:

    $p^mu = m u^mu = m gamma (c, bold(v)) = (E/c, bold(p))$
  ],
)

#flashcard(
  title: "Relation",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the relativistic energy-momentum relation?
  ],
  answer: [
    It relates a particle's total energy $E$, its momentum $|bold(p)|$, and its rest mass $m$:

    $E^2 = (|bold(p)| c)^2 + (m c^2)^2$

    This comes from the invariant squared norm of the 4-momentum, $(p, p) = m^2 c^2$.
  ],
)

#flashcard(
  title: "Conservation",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What physical quantity is conserved in all relativistic interactions (collisions, decays)?
  ],
  answer: [
    The *total 4-momentum vector* of the system. This single conservation law implies the conservation of both total energy and total spatial momentum.
  ],
)

#flashcard(
  title: "Special Case",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the energy-momentum relation for a massless particle (e.g., a photon)?
  ],
  answer: [
    For a massless particle, $m = 0$. The energy-momentum relation simplifies to:

    $E = |bold(p)| c$
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is the relativistic expression for kinetic energy, $T$?
  ],
  answer: [
    Kinetic energy is the total energy minus the rest energy:

    $T = E - m c^2 = gamma m c^2 - m c^2 = m c^2 (gamma - 1)$
  ],
)

#flashcard(
  title: "Lagrangian",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the Lagrangian for a free relativistic particle?
  ],
  answer: [
    The action is proportional to the integral of the proper time, $delta integral d s = 0$. This leads to the Lagrangian:

    $L = -m c^2 sqrt(1 - v^2/c^2) = -m c^2 / gamma$
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is the invariant mass of a system of particles?
  ],
  answer: [
    The invariant mass $M$ is defined from the total 4-momentum of the system, $P_"tot"^mu = (E_"tot"/c, bold(p)_"tot")$:

    $M^2 c^2 = (P_"tot", P_"tot") = (E_"tot"/c)^2 - |bold(p)_"tot"|^2$

    This mass is the same for all observers and is generally not the sum of the individual rest masses.
  ],
)

#flashcard(
  title: "Tensors",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is the difference between a contravariant vector $x^mu$ and a covariant vector $x_mu$?
  ],
  answer: [
    *Contravariant* ($x^mu$, upper index) transforms with $Lambda$: $hat(x)^mu = Lambda^mu_nu x^nu$.

    *Covariant* ($x_mu$, lower index) is obtained by $x_mu = g_(mu nu) x^nu$ and transforms differently to keep scalar products invariant.
  ],
)

// Exam-Style Problems
#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS19 Q4) A particle moves on the world-line $x^mu (t) = (c t, v t, 0, 0)$. Determine its 4-velocity vector $u^mu$.
  ],
  answer: [
    Proper time: $d tau = d t sqrt(1 - v^2/c^2) = d t / gamma$.

    4-velocity: $u^mu = (d x^mu)/(d tau) = gamma (d x^mu)/(d t)$.

    $(d x^mu)/(d t) = (c, v, 0, 0)$.

    $u^mu = gamma (c, v, 0, 0)$. This matches the general formula $u = gamma (c, bold(v))$.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS22 Q4) A rocket at velocity $v$ ejects gas with velocity $u$ relative to the rocket. What is the gas velocity in the initial rest frame?
  ],
  answer: [
    Use the relativistic velocity addition formula. The gas velocity relative to the rocket is $-u$. The rocket velocity is $v$. The gas velocity in the rest frame is:

    $v_"gas" = (v - u)/(1 - v u / c^2)$
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS19 Q4) A pion ($m_pi$) at rest decays into two photons: $pi^0 -> gamma_1 + gamma_2$. Find the energy of each photon.
  ],
  answer: [
    Energy conservation: $E_"before" = m_pi c^2 = E_1 + E_2$.
    Momentum conservation: $bold(p)_"before" = 0 => bold(p)_1 + bold(p)_2 = 0$, so $bold(p)_1 = -bold(p)_2$.
    For photons, $E = |bold(p)| c$, so $|bold(p)_1| = |bold(p)_2|$ implies $E_1 = E_2$.
    Substituting into energy conservation: $m_pi c^2 = 2 E_1 => E_1 = E_2 = (m_pi c^2)/2$.
  ],
)

#flashcard(
  title: "Invariance",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    Is the Minkowski scalar product $(xi, eta)$ Lorentz-invariant?
  ],
  answer: [
    Yes. This is the defining property of Lorentz transformations. If $hat(xi) = Lambda xi$ and $hat(eta) = Lambda eta$, then $(hat(xi), hat(eta)) = (xi, eta)$.
  ],
)

#flashcard(
  title: "Simultaneity",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is the condition on the 4-vector difference $x - y$ for two events $x$ and $y$ to be simultaneous in some reference frame?
  ],
  answer: [
    The interval $x - y$ must be spacelike, i.e., $(x - y, x - y) < 0$.
  ],
)

#flashcard(
  title: "Approximation",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the non-relativistic limit ($v << c$) of the Lorentz factor $gamma$?
  ],
  answer: [
    $gamma = (1 - v^2/c^2)^(-1/2)$. Using the binomial approximation $(1 - x)^n approx 1 - n x$ for small $x$:

    $gamma approx 1 + 1/2 v^2/c^2$
  ],
)

#flashcard(
  title: "Approximation",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the non-relativistic limit ($v << c$) of the relativistic kinetic energy $T = m c^2 (gamma - 1)$?
  ],
  answer: [
    Using the approximation $gamma approx 1 + 1/2 v^2/c^2$:

    $T approx m c^2 ((1 + 1/2 v^2/c^2) - 1) = m c^2 (1/2 v^2/c^2) = 1/2 m v^2$

    It correctly reduces to the classical kinetic energy.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    In the relativistic rocket problem (HS22 Q4), what is the key difference from the non-relativistic case regarding conservation laws?
  ],
  answer: [
    In the non-relativistic case, mass and momentum are conserved separately. In the relativistic case, rest mass is *not* conserved; instead, the total 4-momentum (which combines energy and momentum) is the conserved quantity.
  ],
)

#flashcard(
  title: "Causality",
  color: rgb("#F3E5F5"), // light purple - theorem
  question: [
    How does special relativity protect causality (cause precedes effect)?
  ],
  answer: [
    The interval between a cause and its effect must be timelike or lightlike. For such intervals, all inertial observers agree on the temporal order of the events, so the cause is always measured to happen before the effect. Information cannot travel faster than c, so spacelike separated events cannot causally influence each other.
  ],
)

#render-flashcards()
