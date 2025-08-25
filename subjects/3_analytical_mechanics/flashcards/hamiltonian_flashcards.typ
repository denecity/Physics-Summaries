#import "../../../lib/setup_flashcards.typ": flashcard, flashcard-setup, render-flashcards
#import "../../../lib/lib.typ": *

#show: flashcard-setup(
  card-width: 7cm,
  card-height: 4cm,
  show-cut-lines: true,
  content-margin: 10pt,
  topic: "Hamiltonian Mechanics",
)

// Hamiltonian Mechanics Flashcards - 30 Questions

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
    We must show $\{F, H\} = 0$.

    $\{F, H\} = \{F, T\} + \{F, V\}$.

    $\{F, V\} = frac(partial F, partial x) frac(partial V, partial p_x) - frac(partial F, partial p_x) frac(partial V, partial x) + ... = p_y (0) - (-y) frac(partial V, partial x) + (-p_x)(0) - (x) frac(partial V, partial y) = y frac(partial V, partial x) - x frac(partial V, partial y)$.

    Since $V = V(r)$, $frac(partial V, partial x) = V' x\/r$ and $frac(partial V, partial y) = V' y\/r$.

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
    Check the condition $\{overline(q), overline(p)\} = 1$.

    $\{overline(q), overline(p)\} = frac(partial overline(q), partial q) frac(partial overline(p), partial p) - frac(partial overline(q), partial p) frac(partial overline(p), partial q) = beta gamma q^(2gamma-1)$.

    For this to equal 1, the exponent must be zero, so $2gamma - 1 = 0 arrow.double gamma = 1\/2$.

    The coefficient must be one, so $beta gamma = 1 arrow.double beta (1\/2) = 1 arrow.double beta = 2$.

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
    From the transformation, $q = overline(q)\/cos(2p)$.

    Integrate the first condition: $S = integral -q d p = integral -overline(q)\/cos(2p) d p = -overline(q)\/2 ln |sec(2p) + tan(2p)| + f(overline(q))$.

    Differentiate w.r.t $overline(q)$: $frac(partial S, partial overline(q)) = -1/2 ln |sec(2p) + tan(2p)| + f'(overline(q))$.

    This must equal $-overline(p) = -overline(q)^(1\/2) sin(2p) = -overline(q)\/cos(2p) sin(2p)$, which is not possible. There is likely a typo in the exam; this should be a different type of generating function like $S(q, overline(q))$.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS23 Q3) We make the ansatz $q(Q, P) = sqrt(f(P)\/(m omega)) sin Q$ and $p(Q, P) = sqrt(f(P)) cos Q$. Find the form of $f(P)$ that makes this transformation canonical.
  ],
  answer: [
    Check $\{q, p\}_(Q,P) = 1$.

    $frac(partial q, partial Q) frac(partial p, partial P) - frac(partial q, partial P) frac(partial p, partial Q) = (sqrt(f\/(m omega)) cos Q)(f'\/(sqrt(f)) cos Q) - (f'\/(m omega sqrt(f)) sin Q)(-sqrt(f) sin Q) = 1$.

    $f'\/(m omega) (cos^2 Q + sin^2 Q) = f'\/(m omega) = 1$.

    So $f frac(d f, d P) = m omega$. Integrating gives $1/2 f^2 = m omega P arrow.double f(P) = sqrt(2m omega P)$.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS23 Q3, continued) For the harmonic oscillator with $H = p^2\/(2m) + m omega^2 q^2\/2$, find the Hamiltonian in the new coordinates $(Q, P)$ from the previous card.
  ],
  answer: [
    Substitute $q = sqrt(2P\/(m omega)) sin Q$ and $p = sqrt(2m omega P) cos Q$ into $H$.

    $H = 1/(2m) (2m omega P cos^2 Q) + (m omega^2)/2 (2P\/(m omega) sin^2 Q)$.

    $H = omega P cos^2 Q + omega P sin^2 Q = omega P (cos^2 Q + sin^2 Q) = omega P$.
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

    $frac(d x, d lambda) = -y$

    $frac(d y, d lambda) = x$

    $frac(d p_x, d lambda) = -p_y$

    $frac(d p_y, d lambda) = p_x$

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
    The change in $H$ under the flow generated by $F$ with parameter $lambda$ is $frac(d H, d lambda)$.

    Using the general rule for evolution under a generated flow, $frac(d H, d lambda) = \{H, F\}$.

    Since $F$ is conserved, we know $\{F, H\} = 0$.

    By the antisymmetry of the Poisson bracket, $\{H, F\} = -\{F, H\} = 0$.

    Thus, $frac(d H, d lambda) = 0$, meaning $H$ is invariant under the flow.
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
