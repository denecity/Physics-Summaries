#import "lib.typ": *


= Introduction

#gloss.push("haha")

Electrodynamics is the study of electrical force. Qualitatively, we observe that particles of the same type repel each other, while particles of different types attract each other. 

Qnauntitatively, we will observe a single charge surrounded by other charges and we will determine the force acting on the charge with:

$
  arrow(F) = q(arrow(E) + arrow(v) crossproduct arrow(B))
$

$arrow(E)$ and $arrow(B)$ captiue the effects of all other charges in the system. We use the density of charges $rho$ and the current density $arrow(J)$ and determine the electric field $arrow(E)$ and the magnetic field $arrow(B)$.

 $
   (rho, arrow(J)) -> (arrow(E), arrow(B)) -> arrow(F)
 $


== Maxwell equations

 #definition[Definition][Maxwell equations][
  $
    div(arrow(E)) = rho/epsilon_0\
    curl(arrow(E)) = pdv(arrow(B), t)\
    div(arrow(B)) = 0\
    curl(arrow(B)) = arrow(J)/(epsilon_0 c^2) + 1/c^2 pdv(arrow(E), t)\
  $
 ]

We can then use the boundary conditions $rho, arrow(J)$ to determine the electric field $aE$ and the magnetic field $aB$.

== Electrodynamics to Special Relativity

We want to examine Maxwells equations in a different frame of reference.

- We have a translation:
  $
    ar -> ar' = ar + aa
  $

- We have rotation:
  $
    ar -> ar' = R(ar)
  $

- We have galilean transformation:
  $
    ar -> ar' = ar + ar_0 + av t\
    av = "const"
  $

We expect Maxwell Equations to be invariant under these transformations, but we observe that the equations are not invariant under galilean transformations.

== Translations

If we move the origin from $0$ to $0'$, we conserve the magnitude and direction of the electric field $aE$: $aE'(ar') = aE(ar)$. So does everything else.

$
  anabla' = (pdv(, x'), pdv(, y'), pdv(, z'))\
  => pdv(, x') = pdv(, (x+a)) = pdv(, x)
  => anabla' = anabla
  => nabla' dot aE' (ar') = (rho' (ar))/e0\
  <=> div aE (ar) = (rho (ar))/e0\
$

== Rotations

$
  ar -> ar' = R(theta, ...) ar\
$

We write the rotation matrix in components:

$
  r_i -> r'_i = sum_(k=1)^3 R_(i k) r_k\
$

#definition[Definition][Einstein summation convention][
  We use the convention *Einsteins summation convention* and sum over the repeated index. If two indices are repeated, we sum over all possible values of the index.

  $
    sum_(k=1)^3 R_(i k) r_k = R_(i k) r_k\
  $

  We see, that the index $k$ is repeated and we sum over all possible values of $k$.
]

Rotations preserve lengths of vectors and angles between vectors. This is the defining property of a rotation. This implies that $R$ is orthogonal:
$
  R^T R = bb(1)\
  ar'^2 = ar'_i ar'_i = (R_(i k) r_k)(R_(i e) r_e)\
  = R_(i k) R_(i e) r_k r_e\
  = R^T_(k i) R_(i e) r_k r_e\
  => r'_i r'_i = (R^T R)_(k e) r_k r_e\
  (R^T R)_(k e) = delta_(k e) = cases(1\, k = e, 0\, k != e)\
  => (R^T R) = bb(1)\
$

An additional property of the rotation matrix is that its determinant is 1.

We have *inner product*:

$
  arrow(A) dot arrow(B) -> arrow(A)' dot arrow(B)' = arrow(A) R^T R arrow(B) = arrow(A) arrow(B)\
$

This confirms the invariance of the first and thrid maxwell equations.

We have *outer product*:

$
  (arrow(A) crossproduct arrow(B)) -> ... -> R(arrow(A) crossproduct arrow(B))\
$

We see that the second and fourth maxwell equations are covariant under rotation.

== Galilean transformations
 
We will see that the equations are not invariant under galilean transformations. We will arrive at the Lorentz transformation later, which is the correct transformation for a boost.


