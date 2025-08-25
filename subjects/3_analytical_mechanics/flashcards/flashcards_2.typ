#import "../../../lib/setup_flashcards.typ": flashcard, flashcard-setup, render-flashcards
#import "../../../lib/lib.typ": *

#show: flashcard-setup(
  card-width: 6cm,
  card-height: 4cm,
  show-cut-lines: true,
  content-margin: 10pt,
  topic: "Mechanics",
)

// Mechanics Flashcards - 30 Questions

// General Description & Kinematics
#flashcard(
  title: "Description",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    How is the motion of a rigid body generally described?
  ],
  answer: [
    It's a superposition of two motions: the *translation of its center of mass* and a *rotation about the center of mass*. The system has 6 degrees of freedom.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What are Euler angles and what do they describe?
  ],
  answer: [
    Euler angles $(phi, theta, psi)$ are three angles used to specify the orientation of a rigid body's body-fixed coordinate system relative to a fixed inertial frame. They parameterize any rotation in $"SO"(3)$.
  ],
)

#flashcard(
  title: "Relation",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    How is the angular velocity vector $bold(omega)$ related to the time-dependent rotation matrix $R(t)$?
  ],
  answer: [
    It is defined through the anti-symmetric matrix $Omega = R^T dot(R)$. The components of $bold(omega)$ are such that for any vector $bold(y)$ in the body frame, $Omega bold(y) = bold(omega) times bold(y)$.
  ],
)

#flashcard(
  title: "Relation",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is the relationship between angular momentum in the inertial frame ($bold(L)$) and the body-fixed frame ($bold(S)$)?
  ],
  answer: [
    They are related by the rotation matrix $R(t)$:

    $bold(L) = R bold(S)$

    The time evolution is governed by $dot(bold(L)) = bold(M)$, where $bold(M)$ is the external torque.
  ],
)

#flashcard(
  title: "Formula",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the rotational kinetic energy of a rigid body in terms of its inertia tensor $Theta$ and angular velocity $bold(omega)$?
  ],
  answer: [
    The rotational kinetic energy is given by:

    $T_"rot" = 1/2 bold(omega)^T Theta bold(omega) = 1/2 sum_(i,j=1)^3 Theta_(i j) omega_i omega_j$
  ],
)

// The Tensor of Inertia
#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    How are the components of the tensor of inertia ($Theta_(i j)$) defined for a system of discrete masses $m_k$?
  ],
  answer: [
    For masses at positions $bold(y)_k$ in the body-fixed frame, the components are:

    $Theta_(i j) = sum_k m_k (|bold(y)_k|^2 delta_(i j) - (y_k)_i (y_k)_j)$

    where $(y_k)_i$ is the $i$-th component of the vector $bold(y)_k$.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    How are the components of the tensor of inertia ($Theta_(i j)$) defined for a continuous body with mass density $rho(bold(y))$?
  ],
  answer: [
    The sum is replaced by an integral over the body's volume:

    $Theta_(i j) = integral_V (|bold(y)|^2 delta_(i j) - y_i y_j) rho(bold(y)) d^3 y$
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What are the principal axes of inertia?
  ],
  answer: [
    They are the eigenvectors of the symmetric inertia tensor $Theta$. When the body-fixed coordinate system is aligned with these axes, the inertia tensor becomes *diagonal*.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What are the principal moments of inertia?
  ],
  answer: [
    They are the eigenvalues $(Theta_1, Theta_2, Theta_3)$ of the inertia tensor. In the principal axis frame, the kinetic energy simplifies to:

    $T = 1/2 (Theta_1 omega_1^2 + Theta_2 omega_2^2 + Theta_3 omega_3^2)$
  ],
)

#flashcard(
  title: "Theorem",
  color: rgb("#F3E5F5"), // light purple - theorem
  question: [
    What is the perpendicular axis theorem for a planar object (lamina)?
  ],
  answer: [
    If a planar object lies in the $y_1 - y_2$ plane, the moment of inertia about the axis perpendicular to the plane ($I_33$) is the sum of the moments about two perpendicular axes in the plane:

    $I_33 = I_11 + I_22$
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (FS23 Q4) For a thin circular disk in the $y_1 - y_2$ plane, what is the relationship between its principal moments of inertia?
  ],
  answer: [
    From the perpendicular axis theorem, $I_33 = I_11 + I_22$.

    Due to circular symmetry, the moments about any axis in the plane are equal, so $I_11 = I_22$.

    Therefore, $I_33 = 2 I_11$.
  ],
)

#flashcard(
  title: "Exam Problem",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    (HS24 Q5) Calculate the inertia tensor $Theta$ for 8 masses $m$ at positions $plus.minus l hat(bold(y))_1, plus.minus l hat(bold(y))_2, plus.minus l hat(bold(y))_3, plus.minus 2l hat(bold(y))_3$.
  ],
  answer: [
    $Theta_11 = sum m_k (y_k^2 + z_k^2) = 2m(l^2) + 2m(l^2) + 2m((2l)^2) = 14 m l^2$.

    $Theta_22 = Theta_11 = 14 m l^2$ by symmetry.

    $Theta_33 = sum m_k (x_k^2 + y_k^2) = 2m(l^2) + 2m(l^2) = 4 m l^2$.

    Off-diagonal terms are zero. $Theta = "diag"(14, 14, 4) m l^2$.
  ],
)

// Dynamics of Spinning Bodies
#flashcard(
  title: "Relation",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is the key relation between angular momentum $bold(S)$ and angular velocity $bold(omega)$ in the body-fixed frame?
  ],
  answer: [
    They are related by the inertia tensor:

    $bold(S) = Theta bold(omega)$
  ],
)

#flashcard(
  title: "Euler's Equations",
  color: rgb("#F3E5F5"), // light purple - theorem
  question: [
    Write down Euler's equations for a free rigid body (no external torques) in the principal axis frame.
  ],
  answer: [
    $Theta_1 dot(omega)_1 = (Theta_2 - Theta_3) omega_2 omega_3$

    $Theta_2 dot(omega)_2 = (Theta_3 - Theta_1) omega_3 omega_1$

    $Theta_3 dot(omega)_3 = (Theta_1 - Theta_2) omega_1 omega_2$
  ],
)

#flashcard(
  title: "Euler's Equations",
  color: rgb("#F3E5F5"), // light purple - theorem
  question: [
    What is the form of Euler's equations when there is an external torque $bold(M)_y$ in the body-fixed frame?
  ],
  answer: [
    The equations become:

    $Theta dot(bold(omega)) = -bold(omega) times (Theta bold(omega)) + bold(M)_y$
  ],
)

#flashcard(
  title: "Stability",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    For a free rigid body with $Theta_1 < Theta_2 < Theta_3$, rotations about which principal axes are stable?
  ],
  answer: [
    Rotations about the axes with the smallest ($Theta_1$) and largest ($Theta_3$) principal moments of inertia are stable. Rotation about the intermediate axis ($Theta_2$) is unstable.
  ],
)

#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is a symmetric top?
  ],
  answer: [
    A rigid body where two of its three principal moments of inertia are equal. By convention, we set $Theta_1 = Theta_2 != Theta_3$. The object has an axis of rotational symmetry.
  ],
)

#flashcard(
  title: "Motion",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    Describe the motion of a free symmetric top ($Theta_1 = Theta_2$).
  ],
  answer: [
    The angular velocity component along the symmetry axis, $omega_3$, is constant. The angular velocity vector $bold(omega)$ precesses with a constant frequency $alpha = (Theta_3 - Theta_1)/Theta_1 omega_3$ around the symmetry axis in the body-fixed frame.
  ],
)

// The Heavy Symmetric Top
#flashcard(
  title: "Definition",
  color: rgb("#E3F2FD"), // light blue - definition
  question: [
    What is a heavy symmetric top?
  ],
  answer: [
    A symmetric top with one point fixed (the pivot), moving under the influence of a uniform gravitational field. Its center of mass is not at the pivot point.
  ],
)

#flashcard(
  title: "Lagrangian",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    What is the Lagrangian for a heavy symmetric top ($Theta_1 = Theta_2$) in terms of Euler angles?
  ],
  answer: [
    $L = Theta_1/2 (dot(theta)^2 + dot(phi)^2 sin^2 theta) + Theta_3/2 (dot(psi) + dot(phi) cos theta)^2 - m g l cos theta$
  ],
)

#flashcard(
  title: "Conservation",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What are the conserved quantities for a heavy symmetric top?
  ],
  answer: [
    *Total Energy* ($E$): The Lagrangian has no explicit time dependence.

    $p_phi$: The coordinate $phi$ is cyclic (vertical component of angular momentum).

    $p_psi$: The coordinate $psi$ is cyclic (component of angular momentum along the body's symmetry axis).
  ],
)


#render-flashcards()
