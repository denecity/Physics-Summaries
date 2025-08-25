#import "../../../lib/setup_flashcards.typ": flashcard, flashcard-setup, render-flashcards
#import "../../../lib/lib.typ": *

#show: flashcard-setup(
  card-width: 6cm,
  card-height: 4cm,
  show-cut-lines: true,
  content-margin: 10pt,
  topic: "Allg. Mech.",
)

// Lagrangian Mechanics Flashcards - 30 Questions

// Concepts & Definitions
#flashcard(
  title: "Core Concept",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is the core idea behind the Lagrangian formalism?
  ],
  answer: [
    Instead of using forces (Newtonian), it describes a system's dynamics by finding the path that minimizes a quantity called the action. This is known as the Principle of Least Action or Hamilton's Principle.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    How is the Lagrangian function, L, defined for a typical mechanical system?
  ],
  answer: [
    The Lagrangian is the difference between the kinetic energy (T) and the potential energy (V) of the system:

    $L = T - V$
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What are generalized coordinates?
  ],
  answer: [
    A set of independent parameters, $q_1, ..., q_f$, that uniquely specify the configuration of a system. Their number, $f$, is the system's number of degrees of freedom.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is a cyclic or ignorable coordinate?
  ],
  answer: [
    A generalized coordinate $q_alpha$ that does not explicitly appear in the Lagrangian, meaning $frac(partial L, partial q_alpha) = 0$.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is the conjugate momentum (or generalized momentum), $p_alpha$, corresponding to the coordinate $q_alpha$?
  ],
  answer: [
    It is defined as the partial derivative of the Lagrangian with respect to the generalized velocity:

    $p_alpha = frac(partial L, partial dot(q)_alpha)$
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is a holonomic constraint? Give an example.
  ],
  answer: [
    A restriction on the system's coordinates that can be expressed as an algebraic equation, $f(x_1, x_2, ..., t) = 0$.

    Example: A bead moving on a wire of radius R, constrained by $x^2 + y^2 - R^2 = 0$.
  ],
)

#flashcard(
  title: "Advantage",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is the main advantage of the Lagrangian formalism over the Newtonian approach?
  ],
  answer: [
    The Lagrangian is a scalar, making it independent of the coordinate system. This is perfect for systems with constraints, as we can choose coordinates that already satisfy them, eliminating the need to calculate complex constraint forces.
  ],
)

// Theory & Derivations
#flashcard(
  title: "Euler-Lagrange",
  color: rgb("#F3E5F5"), // light purple - theorem
  question: [
    What are the Euler-Lagrange equations of motion for a system with generalized coordinates $q_alpha$?
  ],
  answer: [
    The set of differential equations that describe the path that extremizes the action:

    $frac(d, d t) frac(partial L, partial dot(q)_alpha) - frac(partial L, partial q_alpha) = 0$
  ],
)

#flashcard(
  title: "Conservation",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    How do cyclic coordinates, conjugate momenta, and conservation laws relate?
  ],
  answer: [
    If a coordinate $q_alpha$ is cyclic (i.e., $frac(partial L, partial q_alpha) = 0$), then its corresponding conjugate momentum ($p_alpha = frac(partial L, partial dot(q)_alpha)$) is a conserved quantity.
  ],
)

#flashcard(
  title: "Energy Conservation",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    If the Lagrangian has no explicit time dependence ($frac(partial L, partial t) = 0$), what quantity is conserved?
  ],
  answer: [
    The quantity $E = sum_alpha p_alpha dot(q)_alpha - L$, which is often (but not always) the total mechanical energy ($T + V$), is conserved.
  ],
)

#flashcard(
  title: "Gauge Freedom",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    Do two Lagrangians that differ by a total time derivative, $L' = L + frac(d, d t) f(q, t)$, describe the same physics?
  ],
  answer: [
    Yes. Because the action integrals differ only by a boundary term ($f(t_2) - f(t_1)$), which does not change upon variation, both Lagrangians yield the identical Euler-Lagrange equations.
  ],
)

#flashcard(
  title: "Higher Order",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the Euler-Lagrange equation for a Lagrangian that depends on the second derivative, $L(q, dot(q), accent(q, "¨"))$?
  ],
  answer: [
    The equation is generalized to include a higher-order term:

    $frac(partial L, partial q) - frac(d, d t) (frac(partial L, partial dot(q))) + frac(d^2, d t^2) (frac(partial L, partial accent(q, "¨"))) = 0$
  ],
)

#flashcard(
  title: "Derivation",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    Outline the key steps to derive the Euler-Lagrange equation from the principle of least action, $delta S = 0$.
  ],
  answer: [
    1. Define the action $S = integral L(q, dot(q), t) d t$.
    2. Vary the path: $q(t) arrow q(t) + delta q(t)$.
    3. Expand $delta S = integral (frac(partial L, partial q) delta q + frac(partial L, partial dot(q)) delta dot(q)) d t = 0$.
    4. Integrate the second term by parts and use the fact that the variation $delta q$ is zero at the endpoints.
    5. Since $delta q$ is arbitrary, the remaining integrand must be zero, yielding the E-L equation.
  ],
)

// Practice Problems (Easier)
#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Find the Lagrangian for a free particle of mass m moving in one dimension, x.
  ],
  answer: [
    Kinetic Energy: $T = 1/2 m dot(x)^2$.
    Potential Energy: $V = 0$.
    Lagrangian: $L = T - V = 1/2 m dot(x)^2$.
  ],
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Using the Lagrangian $L = 1/2 m dot(x)^2$, find the equation of motion for a free particle.
  ],
  answer: [
    $frac(partial L, partial x) = 0$.
    $frac(partial L, partial dot(x)) = m dot(x)$.
    Euler-Lagrange: $frac(d, d t)(m dot(x)) - 0 = 0 arrow.double m accent(x, "¨") = 0$.
    This is just Newton's first law, as expected.
  ],
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    What is the Lagrangian for a simple harmonic oscillator in 1D with mass m and spring constant k?
  ],
  answer: [
    Kinetic Energy: $T = 1/2 m dot(q)^2$.
    Potential Energy: $V = 1/2 k q^2$.
    Lagrangian: $L = T - V = 1/2 m dot(q)^2 - 1/2 k q^2$.
  ],
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    What is the Lagrangian for a simple pendulum of mass m and length l? (Use θ as the generalized coordinate).
  ],
  answer: [
    Kinetic Energy: $T = 1/2 m v^2 = 1/2 m (l dot(theta))^2 = 1/2 m l^2 dot(theta)^2$.
    Potential Energy: $V = m g h = m g (l - l cos theta) = m g l (1 - cos theta)$.
    Lagrangian: $L = 1/2 m l^2 dot(theta)^2 - m g l (1 - cos theta)$. (The constant $m g l$ can be dropped).
  ],
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    The Lagrangian for a particle in a 2D central potential is $L = 1/2 mu (dot(r)^2 + r^2 dot(phi)^2) - V(r)$. Identify the cyclic coordinate and find the conserved quantity.
  ],
  answer: [
    The coordinate $phi$ is cyclic since it does not appear in L.
    The conserved quantity is its conjugate momentum, $p_phi = frac(partial L, partial dot(phi)) = mu r^2 dot(phi)$.
    This is the angular momentum, which is conserved.
  ],
)

#flashcard(
  title: "Relativistic",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    What is the Lagrangian for a single, free relativistic particle of rest mass m?
  ],
  answer: [
    The action is proportional to the integral of the proper time, so the Lagrangian is:

    $L = -m c^2 sqrt(1 - v^2\/c^2) = -m c^2 / gamma$

    (Note: it is not T-V).
  ],
)

// Exam-Style Problems
#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (FS20 Q1) A ball of mass m slides on a frictionless ring of radius R rotating with constant angular velocity ω around a vertical axis. Let θ be the angle from the bottom. Find the Lagrangian.
  ],
  answer: [
    Kinetic Energy: $T = 1/2 m R^2 (dot(theta)^2 + omega^2 sin^2 theta)$.
    Potential Energy: $V = -m g R cos theta$.
    Lagrangian: $L = 1/2 m R^2 (dot(theta)^2 + omega^2 sin^2 theta) + m g R cos theta$.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS22 Q1) The action for a system is $S = integral d t [1/2 dot(x)^2 + 1/2 dot(y)^2 - 1/4 alpha x^2 - 1/2 beta x y - 1/4 alpha y^2]$. Find the equations of motion.
  ],
  answer: [
    For x: $frac(partial L, partial x) = -1/2 alpha x - 1/2 beta y$. $frac(d, d t)(frac(partial L, partial dot(x))) = accent(x, "¨")$.
    Eq for x: $accent(x, "¨") + alpha/2 x + beta/2 y = 0$.

    For y: $frac(partial L, partial y) = -1/2 beta x - 1/2 alpha y$. $frac(d, d t)(frac(partial L, partial dot(y))) = accent(y, "¨")$.
    Eq for y: $accent(y, "¨") + beta/2 x + alpha/2 y = 0$.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS19 Q1) Two pendula ($m_1 = m_2 = m$, $l_1 = l_2 = l$) are coupled by a spring (constant k) that is unstretched at $theta_1 = theta_2 = 0$. Write the Lagrangian for small angles.
  ],
  answer: [
    $T approx 1/2 m l^2 (dot(theta)_1^2 + dot(theta)_2^2)$
    $V_g approx 1/2 m g l (theta_1^2 + theta_2^2)$
    $V_s = 1/2 k (l theta_2 - l theta_1)^2$
    $L = 1/2 m l^2 (dot(theta)_1^2 + dot(theta)_2^2) - 1/2 m g l (theta_1^2 + theta_2^2) - 1/2 k l^2 (theta_2 - theta_1)^2$.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (FS23 Q1) For $L = 1/2 m dot(q)^2 - V(q)$, derive the equation of motion.
  ],
  answer: [
    $frac(partial L, partial q) = -frac(partial V, partial q) = F(q)$ (the force).
    $frac(partial L, partial dot(q)) = m dot(q)$.
    $frac(d, d t)(frac(partial L, partial dot(q))) = m accent(q, "¨")$.
    E-L Equation: $m accent(q, "¨") - (-frac(partial V, partial q)) = 0 arrow.double m accent(q, "¨") = F(q)$.
    This shows the E-L equations are equivalent to Newton's second law for this case.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS24 Q2) Two particles (mass m) are on circles of radius R. The circles are parallel to the xy-plane, separated by distance d in y and h in z. They are connected by a spring (constant k). Find the potential energy.
  ],
  answer: [
    Positions: $bold(x)_1 = (R sin theta_1, R cos theta_1, 0)$, $bold(x)_2 = (R sin theta_2, d + R cos theta_2, h)$.
    Squared distance: $|bold(x)_2 - bold(x)_1|^2 = R^2(sin theta_2 - sin theta_1)^2 + (d + R cos theta_2 - R cos theta_1)^2 + h^2$.
    Potential Energy: $V = 1/2 k |bold(x)_2 - bold(x)_1|^2$. (This is the full expression to be used in the Lagrangian).
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (FS20 Q3) For a 2D harmonic oscillator $L = 1/2 (dot(x)^2 + dot(y)^2) - 1/2 (x^2 + y^2)$, are there any cyclic coordinates? Find the conserved quantities.
  ],
  answer: [
    In Cartesian coordinates (x, y), neither is cyclic.
    In polar coordinates ($x = r cos phi$, $y = r sin phi$), $L = 1/2 (dot(r)^2 + r^2 dot(phi)^2) - 1/2 r^2$.

    $phi$ is cyclic.
    Conserved quantity: $p_phi = frac(partial L, partial dot(phi)) = r^2 dot(phi)$ (Angular Momentum).
    Also, since $frac(partial L, partial t) = 0$, Energy ($E = T + V$) is conserved.
  ],
)

#flashcard(
  title: "Procedure",
  color: rgb("#FCE4EC"), // light pink - method
  question: [
    Outline the procedure for solving mechanics problems using the Lagrangian formalism.
  ],
  answer: [
    1. Identify degrees of freedom and choose suitable generalized coordinates.
    2. Write T and V in these coordinates.
    3. Form the Lagrangian $L = T - V$.
    4. Apply the Euler-Lagrange equations for each coordinate to get the equations of motion.
    5. Solve the resulting differential equations.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS23 Q3) The Lagrangian for a harmonic oscillator is $L = m/2 dot(q)^2 - k/2 q^2$. Find the conjugate momentum and derive the Hamiltonian.
  ],
  answer: [
    Conjugate Momentum: $p = frac(partial L, partial dot(q)) = m dot(q)$. So $dot(q) = p\/m$.
    Hamiltonian: $H = p dot(q) - L = p(p\/m) - (m/2 (p\/m)^2 - k/2 q^2)$.
    $H = p^2\/m - p^2\/(2m) + k/2 q^2 = p^2\/(2m) + k/2 q^2$. This is $T + V$.
  ],
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    A particle of mass m moves on the surface of a cone $z = k r$. Gravity acts in the -z direction. Find the Lagrangian in cylindrical coordinates (r,θ).
  ],
  answer: [
    Constraint: $z = k r arrow.double dot(z) = k dot(r)$.
    Kinetic Energy: $T = 1/2 m (v_r^2 + v_theta^2 + v_z^2) = 1/2 m (dot(r)^2 + (r dot(theta))^2 + (k dot(r))^2) = 1/2 m ((1+k^2) dot(r)^2 + r^2 dot(theta)^2)$.
    Potential Energy: $V = m g z = m g k r$.
    Lagrangian: $L = 1/2 m ((1+k^2) dot(r)^2 + r^2 dot(theta)^2) - m g k r$.
  ],
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    A particle moves in the potential $V(q) = 1/2 a q^2 - 1/4 b q^4$. What is its equation of motion?
  ],
  answer: [
    $L = T - V = 1/2 m dot(q)^2 - (1/2 a q^2 - 1/4 b q^4)$.
    Force: $F = -frac(partial V, partial q) = -a q + b q^3$.
    Equation of motion ($m accent(q, "¨") = F$): $m accent(q, "¨") = -a q + b q^3$ or $m accent(q, "¨") + a q - b q^3 = 0$.
  ],
)

#flashcard(
  title: "Concept",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    Is the generalized momentum $p_alpha$ always equal to the mechanical momentum $m dot(q)_alpha$? Explain.
  ],
  answer: [
    No. This is only true in specific cases, like when using Cartesian coordinates for a free particle. In general, $p_alpha = frac(partial L, partial dot(q)_alpha)$ has a different form. For an angle coordinate, the conjugate momentum is angular momentum; for a charge in an EM field, it includes a term from the vector potential.
  ],
)

// HAMILTONIAN MECHANICS FLASHCARDS - 30 Additional Questions

// Fundamental Concepts
#flashcard(
  title: "Core Concept",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is the fundamental shift in perspective when moving from Lagrangian to Hamiltonian mechanics?
  ],
  answer: [
    Instead of using coordinates and velocities $(q, dot(q))$, Hamiltonian mechanics uses coordinates and conjugate momenta $(q, p)$. The state of the system is a point in a $2f$-dimensional space called phase space.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    How is the Hamiltonian function, H, defined in terms of the Lagrangian, L?
  ],
  answer: [
    The Hamiltonian is defined via the Legendre transformation of the Lagrangian:

    $H(q, p, t) = sum_(alpha=1)^f p_alpha dot(q)_alpha - L(q, dot(q), t)$

    where $dot(q)$ must be expressed in terms of $p$.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    How is the Poisson bracket $\{F, G\}$ of two functions $F(q, p)$ and $G(q, p)$ defined?
  ],
  answer: [
    The Poisson bracket is defined as:

    $\{F, G\} := sum_(alpha=1)^f (frac(partial F, partial q_alpha) frac(partial G, partial p_alpha) - frac(partial F, partial p_alpha) frac(partial G, partial q_alpha))$
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is a canonical transformation?
  ],
  answer: [
    A coordinate transformation in phase space $(overline(q), overline(p)) = f(q, p)$ that preserves the form of Hamilton's equations for any Hamiltonian. The new dynamics are governed by a new Hamiltonian, $K$.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is a generating function $S$?
  ],
  answer: [
    A function used to construct a canonical transformation from old coordinates $(q, p)$ to new coordinates $(Q, P)$. For example, for a function of type $S(q, P)$, the transformation is defined by the relations:

    $p_alpha = frac(partial S, partial q_alpha)$, $Q_alpha = frac(partial S, partial P_alpha)$
  ],
)

#flashcard(
  title: "Liouville's Theorem",
  color: rgb("#F3E5F5"), // light purple - theorem
  question: [
    What does Liouville's Theorem state?
  ],
  answer: [
    The volume of a region in phase space is conserved under the time evolution of a Hamiltonian system. This means the "phase space fluid" is incompressible.
  ],
)

#flashcard(
  title: "Poincaré Recurrence",
  color: rgb("#F3E5F5"), // light purple - theorem
  question: [
    What is the physical implication of the Poincaré Recurrence Theorem?
  ],
  answer: [
    For any bounded Hamiltonian system, almost every initial state will eventually return arbitrarily close to its starting point an infinite number of times.
  ],
)

// Theory & Derivations
#flashcard(
  title: "Hamilton's Equations",
  color: rgb("#F3E5F5"), // light purple - theorem
  question: [
    What are Hamilton's equations of motion?
  ],
  answer: [
    They are a set of $2f$ first-order differential equations governing the evolution of the system in phase space:

    $dot(q)_alpha = frac(partial H, partial p_alpha)$

    $dot(p)_alpha = -frac(partial H, partial q_alpha)$
  ],
)

#flashcard(
  title: "Time Evolution",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    How does the time evolution of any function on phase space, $F(q, p, t)$, relate to the Hamiltonian and Poisson brackets?
  ],
  answer: [
    The total time derivative of $F$ along a physical trajectory is given by:

    $frac(d F, d t) = \{F, H\} + frac(partial F, partial t)$

    (As seen in exam HS19 Q3).
  ],
)

#flashcard(
  title: "Conservation",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    When is a quantity $F(q, p)$ that doesn't explicitly depend on time a conserved quantity?
  ],
  answer: [
    A quantity $F$ is conserved if and only if its Poisson bracket with the Hamiltonian is zero:

    $\{F, H\} = 0$
  ],
)

#flashcard(
  title: "Canonical Condition",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is the mathematical requirement for a transformation to be canonical?
  ],
  answer: [
    The transformation must preserve the fundamental Poisson brackets. That is, if $(overline(q), overline(p))$ are the new coordinates, they must satisfy:

    $\{overline(q)_alpha, overline(q)_beta\} = 0$, $\{overline(p)_alpha, overline(p)_beta\} = 0$, $\{overline(q)_alpha, overline(p)_beta\} = delta_(alpha beta)$
  ],
)

#flashcard(
  title: "Poisson's Theorem",
  color: rgb("#F3E5F5"), // light purple - theorem
  question: [
    What does Poisson's Theorem state?
  ],
  answer: [
    If $F$ and $G$ are two conserved quantities (constants of motion), then their Poisson bracket, $\{F, G\}$, is also a conserved quantity.
  ],
)

#flashcard(
  title: "Noether Connection",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is the connection between a conserved quantity $F$ and symmetries of the Hamiltonian $H$?
  ],
  answer: [
    A quantity $F$ is conserved (i.e., $\{F, H\} = 0$) if and only if the Hamiltonian $H$ is invariant under the canonical flow generated by $F$. This is the Hamiltonian equivalent of Noether's Theorem.
  ],
)

#flashcard(
  title: "Hamilton-Jacobi",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    State the time-dependent Hamilton-Jacobi equation.
  ],
  answer: [
    It is a partial differential equation for a generating function $S$ that seeks to make the new Hamiltonian $K = 0$:

    $frac(partial S, partial t) + H(q, frac(partial S, partial q), t) = 0$

    where we have substituted $p = frac(partial S, partial q)$ into $H$.
  ],
)

// Practice Problems (Easier)
#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Calculate the fundamental Poisson brackets: $\{q_alpha, q_beta\}$, $\{p_alpha, p_beta\}$, and $\{q_alpha, p_beta\}$.
  ],
  answer: [
    $\{q_alpha, q_beta\} = 0$

    $\{p_alpha, p_beta\} = 0$

    $\{q_alpha, p_beta\} = delta_(alpha beta)$ (where $delta$ is the Kronecker delta).
  ],
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Find the Hamiltonian for a 1D simple harmonic oscillator with Lagrangian $L = 1/2 m dot(q)^2 - 1/2 k q^2$. (HS23 Q3)
  ],
  answer: [
    $p = frac(partial L, partial dot(q)) = m dot(q) arrow.double dot(q) = p\/m$.

    $H = p dot(q) - L = p(p\/m) - (1/2 m (p\/m)^2 - 1/2 k q^2)$.

    $H = p^2\/m - p^2\/(2m) + k/2 q^2 = p^2\/(2m) + k/2 q^2$.
  ],
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Using the Hamiltonian $H = p^2\/(2m) + k/2 q^2$, find Hamilton's equations of motion.
  ],
  answer: [
    $dot(q) = frac(partial H, partial p) = p\/m$.

    $dot(p) = -frac(partial H, partial q) = -k q$.

    Differentiating the first gives $accent(q, "¨") = dot(p)\/m$. Substituting the second gives $accent(q, "¨") = -k q\/m$, the correct SHO equation.
  ],
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Find the Hamiltonian for a free particle ($V = 0$) in 3D Cartesian coordinates.
  ],
  answer: [
    $L = T = 1/2 m (dot(x)^2 + dot(y)^2 + dot(z)^2)$.

    $p_x = m dot(x)$, $p_y = m dot(y)$, $p_z = m dot(z)$.

    $H = bold(p) dot bold(dot(q)) - L = 1/m (p_x^2 + p_y^2 + p_z^2) - 1/(2m) (p_x^2 + p_y^2 + p_z^2)$.

    $H = bold(p)^2\/(2m)$.
  ],
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    A particle has Hamiltonian $H = p^2\/(2m) + V(q)$. When is the momentum $p$ conserved?
  ],
  answer: [
    Momentum $p$ is conserved if $\{p, H\} = 0$.

    $\{p, H\} = \{p, p^2\/(2m)\} + \{p, V(q)\} = 0 - frac(partial p, partial p) frac(partial V, partial q) = -frac(partial V, partial q)$.

    So, $p$ is conserved if and only if $frac(partial V, partial q) = 0$, meaning the potential is constant (i.e., there is no force).
  ],
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Find the Hamiltonian for a particle of mass $m$ on a sphere of radius $R$ ($V = 0$) in spherical coordinates $(theta, phi)$.
  ],
  answer: [
    $L = 1/2 m R^2 (dot(theta)^2 + sin^2 theta dot(phi)^2)$.

    $p_theta = m R^2 dot(theta)$ and $p_phi = m R^2 sin^2 theta dot(phi)$.

    $H = p_theta dot(theta) + p_phi dot(phi) - L$.

    $H = 1/(2m R^2) (p_theta^2 + p_phi^2\/sin^2 theta)$.
  ],
)

// Exam-Style Problems
#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS24 Q1) The Hamiltonian for a 2D system is $H = 1/(2mu) (p_x^2 + p_y^2) + V(x^2 + y^2)$. Show that angular momentum $F = x p_y - y p_x$ is conserved using Poisson brackets.
  ],
  answer: [
    We must show $\{F, H\} = 0$.\
    $\{F, H\} = \{F, T\} + \{F, V\}$.\
    $\{F, V\} = frac(partial F, partial x) frac(partial V, partial p_x) - frac(partial F, partial p_x) frac(partial V, partial x) + ... = p_y (0) - (-y) frac(partial V, partial x) + (-p_x)(0) - (x) frac(partial V, partial y) = y frac(partial V, partial x) - x frac(partial V, partial y)$.\
    Since $V = V(r)$, $frac(partial V, partial x) = V' x\/r$ and $frac(partial V, partial y) = V' y\/r$.\
    $\{F, V\} = y(V' x\/r) - x(V' y\/r) = 0$. A similar calculation shows $\{F, T\} = 0$. Therefore, $\{F, H\} = 0$.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (FS20 Q3) For which parameters $(beta, gamma)$ is the transformation $overline(q) = q^gamma cos(beta p)$, $overline(p) = q^gamma sin(beta p)$ canonical?
  ],
  answer: [
    Check the condition $\{overline(q), overline(p)\} = 1$.\
    $\{overline(q), overline(p)\} = frac(partial overline(q), partial q) frac(partial overline(p), partial p) - frac(partial overline(q), partial p) frac(partial overline(p), partial q) = beta gamma q^(2gamma-1)$.\
    Coefficient must be one, so $beta gamma = 1 arrow.double beta (1\/2) = 1 arrow.double beta = 2$.\
    The transformation is canonical for $(beta, gamma) = (2, 1\/2)$.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (FS20 Q3) How can Hamilton's equations be written in a compact matrix form using the symplectic matrix $epsilon$?
  ],
  answer: [
    Let $bold(x) = (q_1, p_1, ..., q_f, p_f)^T$ be the phase space vector. The equations can be written as:

    $sum_(k=1)^(2f) epsilon_(i k) dot(x)_k = frac(partial H, partial x_i)$

    where $epsilon = mat(0, -I_f; I_f, 0)$.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (FS20 Q3, continued) For the canonical transformation with $gamma = 1\/2$, $beta = 2$, find the generating function $S(overline(q), p)$ defined by $frac(partial S, partial p) = -q$ and $frac(partial S, partial overline(q)) = -overline(p)$.
  ],
  answer: [
    From the transformation, $q = overline(q)\/cos(2p)$.\
    Integrate the first condition: $S = integral -q d p = integral -overline(q)\/cos(2p) d p = -overline(q)\/2 ln |sec(2p) + tan(2p)| + f(overline(q))$.\
    Differentiate w.r.t $overline(q)$: $frac(partial S, partial overline(q)) = -1/2 ln |sec(2p) + tan(2p)| + f'(overline(q))$.\
    This must equal $-overline(p) = -overline(q)^(1\/2) sin(2p) = -overline(q)\/cos(2p) sin(2p)$, which is not possible. There is likely a typo in the exam; this should be a different type of generating function like $S(q, overline(q))$.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS24 Q1) A conserved quantity $F = x p_y - y p_x$ generates a flow. Find the differential equations for this flow on the coordinates $(x, y, p_x, p_y)$.
  ],
  answer: [
    The flow equations are $frac(d phi, d lambda) = (frac(partial F, partial p_x), frac(partial F, partial p_y), -frac(partial F, partial x), -frac(partial F, partial y))^T$.

    $frac(d x, d lambda) = -y hspace frac(d y, d lambda) = x hspace frac(d p_x, d lambda) = -p_y hspace frac(d p_y, d lambda) = p_x$

    This flow represents a rotation in phase space.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS19 Q3) A quantity $F$ is conserved. Show that the Hamiltonian $H$ is invariant under the flow generated by $F$.
  ],
  answer: [
    Change in $H$ under the flow generated by $F$ with parameter $lambda$ is $frac(d H, d lambda)$.\
    Using the general rule for evolution under a generated flow, $frac(d H, d lambda) = \{H, F\}$.\
    Since $F$ is conserved, we know $\{F, H\} = 0$.\
    By the antisymmetry of the Poisson bracket, $\{H, F\} = -\{F, H\} = 0$.\
    $=>frac(d H, d lambda) = 0=> H$ is invariant under the flow.
  ],
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Consider the Hamiltonian for a particle in a central potential, $H = p_r^2\/(2m) + L^2\/(2m r^2) + V(r)$. Identify the conserved quantities.
  ],
  answer: [
    Energy: The Hamiltonian has no explicit time dependence, so $H$ itself is conserved.

    Angular Momentum: The coordinate $phi$ is cyclic (it doesn't appear in $H$). Its conjugate momentum, $p_phi = L_z$, is conserved. Since the problem is spherically symmetric, the entire angular momentum vector $bold(L)$ is conserved.
  ],
)

#flashcard(
  title: "Quantum Connection",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    Why is the Hamiltonian formalism so important for the transition to quantum mechanics?
  ],
  answer: [
    The structure of Hamiltonian mechanics provides a direct analogy for quantum mechanics. The Poisson bracket of two classical observables $\{A, B\}$ is analogous to the commutator of their corresponding quantum operators $[hat(A), hat(B)]\/(i hbar)$. Hamilton's equations and the Schrödinger equation are both descriptions of time evolution generated by the Hamiltonian.
  ],
)

#render-flashcards()
