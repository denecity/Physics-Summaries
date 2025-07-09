#import "../../../lib/lib.typ": *

= Electrostatics

Electrostatics deals with phenomena involving electric charges that are stationary or moving very slowly. Key assumptions include:
- *No electrical currents* (or negligible currents).
- *Steady density of charges*: $rho(ax, t) = rho(ax)$.

The fundamental laws governing electrostatics are special cases of Maxwell's equations:
- *Gauss's Law*: Relates electric field to charge density.
  $
    div(aE) = rho/epsilon_0
  $
- *Faraday's Law (Static Case)*: Implies the electric field is conservative.
  $
    curl(aE) = 0
  $

== Gauss's Law in Integral Form

Integrating Gauss's law over a volume $V$ bounded by a surface $S$ and applying the divergence theorem:
$
  integral_(V) dd(ax, 3) div(aE) = integral_(V) dd(ax, 3) rho/epsilon_0 \
  integral_(S) dd(aS) dot aE = integral_(V) dd(ax, 3) rho/epsilon_0 = Q_"enc"/epsilon_0
$
The electric flux through a closed surface $S$ equals the total charge $Q_"enc"$ enclosed within the volume $V$, divided by the permittivity of free space $epsilon_0$.

== Superposition Principle

Since $div(aE)$ is linear in $aE$, if $rho = rho_1 + rho_2$, and $aE_1, aE_2$ are solutions for $rho_1, rho_2$ respectively:
$
  div(aE_1) = rho_1/epsilon_0 "and" div(aE_2) = rho_2/epsilon_0
$
Then the total field is $aE = aE_1 + aE_2$, satisfying $div(aE) = (rho_1 + rho_2)/epsilon_0$. This allows us to find the field for complex distributions by summing the fieldd(S) of simpler components, like point charges.

== Electric Field of a Point Charge (Coulomb's Law)

Consider a point charge $q$ at the origin. Due to spherical symmetry, the electric field must be radial: $aE = E(r) ar$. Applying Gauss's law to a sphere of radius $R$:
$
  integral_S dd(aS) dot aE = integral_S R^2 sin theta dd(theta) dd(phi) ar dot (E(R) ar)\
  =E(R) (4 pi R^2) = q/epsilon_0 \
  => E(R) = 1/(4 pi epsilon_0) q/R^2
$
The electric field at position $ax$ due to a charge $q$ at $ay$ is:
$
  aE(ax) = 1/(4 pi epsilon_0) q/abs(ax - ay)^2 hat(r)_(ax-ay) = 1/(4 pi epsilon_0) q/abs(ax - ay)^3 (ax - ay)
$
This is *Coulomb's Law*.

For a system of $N$ point charges $q_i$ at positions $ay_i$, the total field at $ax$ is (by superposition):
$
  aE(ax) = sum_(i=1)^N aE_i(ax) = 1/(4 pi epsilon_0) sum_(i=1)^N q_i/abs(ax - ay_i)^3 (ax - ay_i)
$
Note: $curl(aE) = 0$ because each term $aE_i$ is proportional to $(ax - ay_i)/abs(ax - ay_i)^3$, which is a gradient field (see below). Also, $div(aE_i) = 0$ for $ax != ay_i$.

== Continuous Charge Distributions and Dirac Delta

Often, charges are described by a continuous density $rho(ax)$. The charge in an infinitesimal volume $dd(V)$ is $dd(q) = rho(ax) dd(V)$. The total field is obtained by integrating over the distribution:
$
  aE(ax) = 1/(4 pi epsilon_0) integral dd(ay, 3) rho(ay)/abs(ax - ay)^3 (ax - ay)
$
A point charge $q$ at $ay_0$ can be represented using the Dirac delta function:
$
  rho(ay) = q delta^((3))(ay - ay_0)
$
where $delta^((3))(ar) = delta(x) delta(y) delta(z)$ and $integral dd(ar, 3) delta^((3))(ar - ar_0) F(ar) = F(ar_0)$.
A collection of point charges correspondd(S) to:
$
  rho(ay) = sum_(i=1)^N q_i delta^((3))(ay - ay_i)
$

== Scalar Potential

Since $curl(aE) = 0$ in electrostatics, the electric field can always be expressed as the gradient of a scalar potential $Phi$:
$
  aE = - grad Phi = - nabla Phi
$
This is because $curl(grad Phi) = 0$ for any scalar function $Phi$.

Substituting this into Coulomb's law for a continuous distribution:
$
  aE(ax) = 1/(4 pi epsilon_0) integral dd(ay, 3) rho(ay) (- grad_ax 1/abs(ax - ay)) \
  "since" grad_ax (1/abs(ax - ay)) = - (ax - ay)/abs(ax - ay)^3
$
Assuming we can interchange gradient and integral:
$
  aE(ax) = - grad_ax [ 1/(4 pi epsilon_0) integral dd(ay, 3) rho(ay)/(abs(ax - ay)) ]
$
Comparing with $aE = - grad Phi$, we identify the *scalar potential*:
$
  Phi(ax) = 1/(4 pi epsilon_0) integral dd(ay, 3) rho(ay)/(abs(ax - ay))
$
Working with the scalar $Phi$ is often simpler than working directly with the vector field $aE$.

=== Poisson and Laplace Equations

Substituting $aE = - grad Phi$ into Gauss's law $div(aE) = rho/epsilon_0$:
$
  div(- grad Phi) = rho/epsilon_0 \
  => nabla^2 Phi = - rho/epsilon_0
$
This is the *Poisson equation*. It relates the potential to the charge density.

In regions where the charge density is zero ($rho = 0$), the Poisson equation reduces to the *Laplace equation*:
$
  nabla^2 Phi = 0
$

=== Verifying the Potential Integral Solution

Does the integral form of $Phi$ satisfy the Poisson equation?
$
  nabla_ax^2 Phi(ax) = nabla_ax^2 [ 1/(4 pi epsilon_0) integral dd(ay, 3) rho(ay)/(abs(ax - ay)) ] \
  = 1/(4 pi epsilon_0) integral dd(ay, 3) rho(ay) nabla_ax^2 (1/abs(ax - ay))
$
We know the result should be $-rho(ax)/epsilon_0$. This requires:
$
  nabla_ax^2 (1/abs(ax - ay)) = -4 pi delta^((3))(ax - ay)
$
This identity is crucial. It shows that the Laplacian of the $1/r$ potential is zero everywhere except at the origin, where it represents a point source (the delta function).

=== Physical Meaning of Potential: Work and Energy

Consider the force on a test charge $q$ in an electric field $aE$: $aF = q aE = -q grad Phi$.
The work done *by an external agent* to move the charge $q$ from point $A$ to point $B$ against the electric field is:
$
  W_(A->B) = integral_(A)^(B) aF_("ext") dot dd(al) = - integral_(A)^(B) aF dot dd(al) \
  = - integral_(A)^(B) (q aE) dot dd(al) = q integral_(A)^(B) (grad Phi) dot dd(al) \
  = q [Phi(ax_B) - Phi(ax_A)]
$
The work done dependd(S) only on the potential difference between the endpoints, not the path taken (confirming $aE$ is conservative). $q Phi(ax)$ represents the potential energy of the charge $q$ at position $ax$.

== Potential Energy of a Charge Distribution

What is the energy stored in assembling a configuration of charges?

=== Discrete Charges

Imagine bringing $N$ charges $q_i$ from infinity (where $Phi=0$) to their final positions $ay_i$.
- Bring $q_1$: $W_1 = 0$ (no field yet).
- Bring $q_2$: $W_2 = q_2 (Phi_1(ay_2) - Phi_1(infinity)) = q_2 Phi_1(ay_2)$, where $Phi_1(ax) = 1/(4 pi epsilon_0) q_1/abs(ax - ay_1)$.
  $W_2 = 1/(4 pi epsilon_0) (q_1 q_2)/abs(ay_1 - ay_2)$.
- Bring $q_3$: $W_3 = q_3 (Phi_(1+2)(ay_3)) = q_3 (Phi_1(ay_3) + Phi_2(ay_3))$
  $W_3 = 1/(4 pi epsilon_0) ( (q_1 q_3)/abs(ay_1 - ay_3) + (q_2 q_3)/abs(ay_2 - ay_3) )$.
- Continue for all charges. The total work (potential energy $W$) is:
  $
    W = sum_(n=2)^N W_n = 1/(4 pi epsilon_0) sum_(n=2)^N sum_(i=1)^(n-1) (q_i q_n)/abs(ay_n - ay_i)
  $
This can be written symmetrically by summing over all pairs $(i, j)$ with $i != j$ and dividing by 2:
$
  W = 1/(8 pi epsilon_0) sum_(i=1)^N sum_(j=1, j!=i)^N (q_i q_j)/abs(ay_i - ay_j)
$
Alternatively, recognize that $sum_(j!=i) (q_j / (4 pi epsilon_0 abs(ay_i - ay_j)))$ is the potential $Phi_("other")(ay_i)$ at $ay_i$ due to all *other* charges.
$
  W = 1/2 sum_(i=1)^N q_i Phi_("other")(ay_i)
$

=== Continuous Distributions

Replace sums with integrals and $q_i$ with $rho(ax) dd(V)$:
$
  W = 1/(8 pi epsilon_0) integral dd(ax, 3) integral dd(ay, 3) (rho(ax) rho(ay))/abs(ax - ay)
$
Recognizing the inner integral as related to the potential $Phi(ax)$ caused by $rho(ay)$:
$
  Phi(ax) = 1/(4 pi epsilon_0) integral dd(ay, 3) rho(ay)/abs(ax - ay)
$
So, the energy becomes:
$
  W = 1/2 integral dd(ax, 3) rho(ax) Phi(ax)
$

=== Energy in Terms of Electric Field

Using $rho = epsilon_0 div(aE) = -epsilon_0 nabla^2 Phi$:
$
  W = 1/2 integral dd(ax, 3) (-epsilon_0 nabla^2 Phi) Phi(ax) \
  = -epsilon_0/2 integral dd(ax, 3) Phi nabla^2 Phi
$
Using the vector identity $div(Phi nabla Phi) = (nabla Phi) dot (nabla Phi) + Phi nabla^2 Phi = abs(nabla Phi)^2 + Phi nabla^2 Phi$:
$
  W = -epsilon_0/2 integral dd(ax, 3) [ div(Phi nabla Phi) - abs(nabla Phi)^2 ] \
  = -epsilon_0/2 integral_S dd(aS) dot (Phi nabla Phi) + epsilon_0/2 integral_V dd(ax, 3) abs(nabla Phi)^2
$
If the volume $V$ extendd(S) to infinity where $Phi$ and $nabla Phi$ vanish sufficiently fast, the surface integral is zero. Since $aE = -nabla Phi$, $abs(nabla Phi)^2 = aE^2$:
$
  W = epsilon_0/2 integral dd(ax, 3) aE^2(ax)
$
The energy can be thought of as stored in the electric field itself, with an energy density $omega = epsilon_0/2 aE^2$. Since $aE^2 >= 0$, the electrostatic energy is always non-negative.

=== Self-Energy Problem

The continuous formula $W = 1/2 integral rho Phi dd(V)$ includes the interaction of infinitesimal charge elements $rho(ax)dd(V)$ with their own potential contribution, unlike the discrete sum $W = 1/2 sum q_i Phi_("other")(ay_i)$ where $i!=j$.
Consider the energy $W = (epsilon_0/2) integral aE^2 dd(V)$ for a single point charge $q$. The field is $aE prop q/r^2$, so $aE^2 prop q^2/r^4$. The integral $integral (1/r^4) (r^2 dd(r) sin theta d theta d phi)$ diverges as $r -> 0$.
$
  W prop integral_0^R 1/r^4 r^2 dd(r) = integral_0^R 1/r^2 dd(r) -> infinity
$
Classical electrodynamics predicts an infinite *self-energy* for a point charge. This divergence arises because the classical model allows charge to be concentrated at a single point.

In Quantum Electrodynamics (QED), self-energy calculations involve quantum corrections. While divergences still appear, they are handled through renormalization. The classical divergence can be seen as the $hbar -> 0$ limit of the QED result, indicating it's a fundamental aspect of point-particle interactions in field theory, not just a mathematical artifact.

In practice, we often calculate *changes* in energy between configurations, where the (infinite) self-energy cancels out, leaving a finite, physically meaningful result.

== Conductors in Electrostatics

Conductors contain charges free to move. In electrostatic equilibrium:
1. *Electric Field Inside is Zero*: $aE_"inside" = 0$. If not, charges would move until the field is cancelled.
2. *Potential Inside is Constant*: Since $aE = -grad Phi$, $aE=0$ implies $grad Phi = 0$, so $Phi = "const"$ inside and on the surface. The surface of a conductor is an equipotential.
3. *Net Charge Resides on the Surface*: From Gauss's law, $div(aE) = rho/epsilon_0$. Since $aE=0$ inside, $rho=0$ inside. Any net charge must be on the surface.
4. *Electric Field at the Surface is Normal*: $aE_"surface" bot "surface"$. If there were a parallel component $aE_(\|)$, charges on the surface would move along the surface, violating equilibrium.

=== Field and Charge Density at a Conductor Surface

Apply Gauss's law to a small "pillbox" straddling the surface. The flux through the sides is negligible, and the flux through the bottom (inside) is zero ($aE=0$). Only the top surface $Delta S$ contributes:
$
  integral dd(aS) dot aE = E_bot Delta S = Q_"enc"/epsilon_0 = (sigma Delta S)/epsilon_0
$
where $sigma$ is the surface charge density.
$
  E_bot = sigma / epsilon_0 => aE_"surface" = (sigma/epsilon_0) hat(n)
$
where $hat(n)$ is the outward normal unit vector.

=== Electric Pressure on a Conductor

The electric field exerts an outward force on the surface charges. Consider the energy density just outside the surface: $omega = epsilon_0/2 aE^2 = epsilon_0/2 (sigma/epsilon_0)^2 = sigma^2 / (2 epsilon_0)$.
Imagine displacing a surface area $Delta S$ outward by a small distance $Delta x$. The work done by the electric field is $F Delta x$. This work equals the change in field energy. The volume swept is $Delta V = Delta S Delta x$.
$
  Delta W = omega Delta V = (sigma^2 / (2 epsilon_0)) (Delta S Delta x)
$
Equating work done to energy change: $F Delta x = Delta W$.
$
  F Delta x = (sigma^2 / (2 epsilon_0)) Delta S Delta x \
  => F = (sigma^2 / (2 epsilon_0)) Delta S
$
The pressure (force per unit area) is:
$
  P = F / Delta S = sigma^2 / (2 epsilon_0) = epsilon_0/2 E^2
$
This outward pressure exists on the surface of any charged conductor.

== Boundary Value Problems in Electrostatics

Often, we don't know the charge distribution everywhere but want to find the potential $Phi$ (and thus $aE$) in a region $V$, given information on its boundary $S$. The governing equation is Poisson's: $nabla^2 Phi = -rho/epsilon_0$.

=== Uniqueness Theorem

Suppose $Phi_1$ and $Phi_2$ are two solutions to Poisson's equation in $V$ for the same $rho$. Let $Phi_D = Phi_1 - Phi_2$. Then:
$
  nabla^2 Phi_D = nabla^2 Phi_1 - nabla^2 Phi_2 = (-rho/epsilon_0) - (-rho/epsilon_0) = 0
$
So $Phi_D$ satisfies the Laplace equation in $V$.
Consider the integral:
$
  integral_V dd(ax, 3) div(Phi_D grad Phi_D) = integral_S dd(aS) dot (Phi_D grad Phi_D)
$
Using the identity $div(f vec(A)) = (grad f) dot vec(A) + f (div vec(A))$ with $f=Phi_D$ and $vec(A)=grad Phi_D$:
$
  integral_V dd(ax, 3) [ abs(grad Phi_D)^2 + Phi_D (nabla^2 Phi_D) ] = integral_S dd(aS) dot (Phi_D grad Phi_D)
$
Since $nabla^2 Phi_D = 0$ in $V$:
$
  integral_V dd(ax, 3) abs(grad Phi_D)^2 = integral_S dd(aS) dot (Phi_D grad Phi_D)
$
The term $grad Phi_D = grad Phi_1 - grad Phi_2 = -(aE_1 - aE_2)$. The integrand on the left is $abs(aE_1 - aE_2)^2 >= 0$.

*Case 1: Dirichlet Boundary Conditions*
If $Phi$ is specified on the boundary $S$, then $Phi_1 = Phi_2$ on $S$, so $Phi_D = 0$ on $S$. The surface integral becomes zero.
$
  integral_V dd(ax, 3) abs(aE_1 - aE_2)^2 = 0
$
Since the integrand is non-negative, it must be zero everywhere: $abs(aE_1 - aE_2)^2 = 0 => aE_1 = aE_2$ everywhere in $V$. If the fieldd(S) are the same, the potentials can differ only by a constant ($Phi_1 = Phi_2 + C$). Since $Phi_1 = Phi_2$ on the boundary, $C=0$.
*Conclusion*: The solution $Phi$ to Poisson's equation is unique within $V$ if $Phi$ is specified on the boundary $S$.

*Case 2: Neumann Boundary Conditions*
If the normal component of the electric field, $aE dot hat(n) = - (grad Phi) dot hat(n)$, is specified on the boundary $S$. Then $grad Phi_1 dot hat(n) = grad Phi_2 dot hat(n)$ on $S$, so $grad Phi_D dot hat(n) = 0$ on $S$. The surface integral is $integral_S Phi_D (grad Phi_D dot hat(n)) dd(S) = 0$.
Again, $integral_V abs(aE_1 - aE_2)^2 dd(S) = 0$, implying $aE_1 = aE_2$ everywhere in $V$.
*Conclusion*: The electric field $aE$ is unique within $V$ if $aE dot hat(n)$ is specified on the boundary $S$. The potential $Phi$ is unique up to an additive constant.

These uniqueness theorems guarantee that if we find *a* solution satisfying the Poisson/Laplace equation and the given boundary conditions, it is *the* solution.

== Green's Functions

Green's functions provide a general method for solving inhomogeneous differential equations like Poisson's equation with boundary conditions.

=== Green's Identities

Start with the divergence theorem for a vector field $aF$: $integral_V div(aF) dd(V) = integral_S aF dot dd(aS)$.
Let $aF = Psi grad Phi$. Then $div(aF) = grad Psi dot grad Phi + Psi nabla^2 Phi$.
$
  integral_V (grad Psi dot grad Phi + Psi nabla^2 Phi) dd(V)\
  = integral_S (Psi grad Phi) dot dd(aS) "(Green's First Identity)"
$
Now swap $Phi$ and $Psi$:
$
  integral_V (grad Phi dot grad Psi + Phi nabla^2 Psi) dd(V) = integral_S (Phi grad Psi) dot dd(aS)
$
Subtracting the second from the first (and noting $grad Phi dot grad Psi = grad Psi dot grad Phi$):
$
  integral_V (Psi nabla^2 Phi - Phi nabla^2 Psi) dd(V)\
  = integral_S (Psi grad Phi - Phi grad Psi) dot dd(aS) "(Green's Second Identity)"
$

=== Solving Poisson's Equation using Green's Function

Let $Phi(ax)$ be the potential we want to find, satisfying $nabla^2 Phi(ax) = -rho(ax)/epsilon_0$.
Let $Psi(ax)$ be a *Green's function* $G(ax, ay)$ defined by:
$
  nabla_ax^2 G(ax, ay) = -4 pi delta^((3))(ax - ay)
$
Here, $ay$ is a specific point where we want to evaluate the potential $Phi(ay)$, and the Laplacian is taken with respect to $ax$. The Green's function represents the potential at $ax$ due to a unit point charge at $ay$ (scaled by $-4 pi$).

Substitute $Phi(ax)$ and $Psi(ax) = G(ax, ay)$ into Green's Second Identity (integrating over $ax$ within volume $V$):
$
  integral_V [ G(ax, ay) (-rho(ax)/epsilon_0) - Phi(ax) (-4 pi delta^((3))(ax - ay)) ] dd(ax, 3) \
  = integral_S [ G(ax, ay) grad_ax Phi(ax) - Phi(ax) grad_ax G(ax, ay) ] dot dd(aS_x)
$
Evaluate the delta function integral: $integral_V Phi(ax) (4 pi delta^((3))(ax - ay)) dd(ax, 3) = 4 pi Phi(ay)$ (assuming $ay$ is inside $V$).
$
  -1/epsilon_0 integral_V G(ax, ay) rho(ax) dd(ax, 3) + 4 pi Phi(ay) \
  = integral_S [ G(ax, ay) grad_ax Phi(ax) - Phi(ax) grad_ax G(ax, ay) ] dot dd(aS_x)
$
Rearranging to solve for $Phi(ay)$:
$
  Phi(ay) = 1/(4 pi epsilon_0) integral_V G(ax, ay) rho(ax) dd(ax, 3) \
  + 1/(4 pi) integral_S [ Phi(ax) grad_ax G(ax, ay) - G(ax, ay) grad_ax Phi(ax) ] dot dd(aS_x)
$
This formula gives the potential $Phi$ at any point $ay$ inside $V$ in terms of:
1. The charge density $rho(ax)$ inside the volume $V$.
2. The values of the potential $Phi(ax)$ and its normal derivative $grad Phi(ax) dot hat(n)$ on the boundary $S$.
3. The Green's function $G(ax, ay)$.

The simplest Green's function satisfying $nabla^2 G = -4 pi delta$ is $G_0(ax, ay) = 1/abs(ax - ay)$. However, this doesn't necessarily simplify the boundary integral.

The power of the method comes from choosing a specific $G(ax, ay)$ that satisfies certain boundary conditions itself, simplifying the surface integral. The general Green's function is:
$
  G(ax, ay) = 1/abs(ax - ay) + F(ax, ay)
$
where $F(ax, ay)$ is any function satisfying Laplace's equation $nabla_ax^2 F(ax, ay) = 0$ within $V$. We choose $F$ to impose convenient conditions on $G$ on the boundary $S$.

=== Dirichlet Green's Function ($G_D$)

Choose $F(ax, ay)$ such that $G_D(ax, ay) = 0$ for $ax$ on the boundary $S$.
The surface integral term becomes:
$
  1/(4 pi) integral_S [ Phi(ax) grad_ax G_D(ax, ay) - 0 ] dot dd(aS_x) \
  = 1/(4 pi) integral_S Phi(ax) (grad_ax G_D(ax, ay) dot hat(n)) dd(S)_x
$
The solution is:
$
  Phi(ay) = 1/(4 pi epsilon_0) integral_V G_D(ax, ay) rho(ax) dd(ax, 3) \
  + 1/(4 pi) integral_S Phi(ax) (partial G_D / partial n_x) dd(S)_x
$
This requires knowing the potential $Phi(ax)$ on the boundary (Dirichlet condition) and finding the specific Green's function $G_D$ that vanishes on $S$.

=== Neumann Green's Function ($G_N$)

Choose $F(ax, ay)$ such that the normal derivative $partial G_N / partial n_x = grad_ax G_N(ax, ay) dot hat(n)$ is constant on the boundary $S$. Specifically, $partial G_N / partial n_x = -4 pi / A$, where $A$ is the area of the surface $S$. (This choice ensures consistency, as $integral_S (partial G_N / partial n_x) dd(S) = integral_V nabla^2 G_N dd(V) = -4 pi$).
The surface integral term becomes:
$
  1/(4 pi) integral_S [ Phi(ax) (-4 pi / A) - G_N(ax, ay) (partial Phi / partial n_x) ] dd(S)_x \
  = -1/A integral_S Phi(ax) dd(S)_x - 1/(4 pi) integral_S G_N(ax, ay) (partial Phi / partial n_x) dd(S)_x
$
The first term is the average value of $Phi$ on the boundary, $<Phi>_S$. Since potential is defined up to a constant, this term can often be absorbed or set to zero.
$
  Phi(ay) = 1/(4 pi epsilon_0) integral_V G_N(ax, ay) rho(ax) dd(ax, 3) \
  - 1/(4 pi) integral_S G_N(ax, ay) (partial Phi / partial n_x) dd(S)_x + <Phi>_S
$
This requires knowing the normal derivative of the potential $partial Phi / partial n_x = -aE dot hat(n)$ on the boundary (Neumann condition) and finding the specific Green's function $G_N$.

== Method of Images

This is a powerful technique for finding the Green's function (usually $G_D$) for problems with simple boundary geometries (planes, spheres, cylinders) by introducing fictitious "image" charges outside the volume of interest. The potential within the volume is then calculated as the superposition of the real charges and these image charges. The image charges are chosen such that their combined potential satisfies the required boundary condition (e.g., $Phi=0$ or $Phi=V_0$ on a conducting surface).

=== Example 1: Point Charge near a Grounded Conducting Plane

Consider a charge $q$ at $ay = (d, 0, 0)$ with $d>0$, and an infinite conducting plane at $x=0$ held at potential $Phi=0$. We want the potential $Phi(ax)$ for $x>0$.
We need $G_D(ax, ay)$ such that $G_D = 0$ when $x_1 = 0$.
Let $ax = (x_1, x_2, x_3)$ and $ay = (y_1, y_2, y_3)$. The mirror image position of $ay$ is $ay^* = (-y_1, y_2, y_3)$.
Try the Green's function:
$
  G_D(ax, ay) = 1/abs(ax - ay) - 1/abs(ax - ay^*)
$
Check the boundary condition: If $ax$ is on the plane, $x_1 = 0$.
$
  abs(ax - ay)^2 = (0 - y_1)^2 + (x_2 - y_2)^2 + (x_3 - y_3)^2\
  = y_1^2 + (x_2 - y_2)^2 + (x_3 - y_3)^2 \
  abs(ax - ay^*)^2 = (0 - (-y_1))^2 + (x_2 - y_2)^2 + (x_3 - y_3)^2\
  = y_1^2 + (x_2 - y_2)^2 + (x_3 - y_3)^2
$
So $abs(ax - ay) = abs(ax - ay^*)$ when $x_1 = 0$. Therefore, $G_D(ax, ay) = 0$ for $ax$ on the plane.
This $G_D$ also satisfies $nabla_ax^2 G_D = -4 pi delta(ax - ay)$ for $x_1 > 0$ (since $ay^*$ is outside this region, $nabla_ax^2 (1/abs(ax-ay^*)) = 0$ for $x_1>0$).

The potential for $x>0$ is given by the Dirichlet formula. If $rho(ax') = q delta(ax' - ay)$ and $Phi=0$ on the boundary:
$
  Phi(ax) = 1/(4 pi epsilon_0) integral_(x'>0) G_D(ax', ax) q delta(ax' - ay) dd(ax', 3) + 0 \
  Phi(ax) = q/(4 pi epsilon_0) G_D(ay, ax) \
  Phi(ax) = q/(4 pi epsilon_0) [ 1/abs(ay - ax) - 1/abs(ay^* - ax) ] \
  Phi(ax) = q/(4 pi epsilon_0) [ 1/abs(ax - ay) - 1/abs(ax - ay^*) ]
$
This is the potential due to the original charge $q$ at $ay$ and an image charge $-q$ at $ay^*$.

=== Example 2: Point Charge near a Grounded Conducting Sphere

Consider a charge $q$ at position $ad$ outside a grounded conducting sphere of radius $R$ centered at the origin ($abs(ad) = d > R$). We want $Phi(ar)$ for $r > R$.
We need $G_D(ax, ar)$ such that $G_D = 0$ when $abs(ax) = R$.
The method of images suggests placing an image charge $q'$ inside the sphere at position $ad'$ such that the potential from $q$ and $q'$ sums to zero on the sphere surface $r=R$.
It can be shown that this requires an image charge $q' = -q R/d$ placed at $ad' = (R^2/d^2) ad$.
The potential outside the sphere is:
$
  Phi(ar) = 1/(4 pi epsilon_0) [ q/abs(ar - ad) + q'/abs(ar - ad') ] \
  Phi(ar) = q/(4 pi epsilon_0) [ 1/abs(ar - ad) - (R/d)/abs(ar - (R^2/d^2) ad) ]
$
This potential is zero for $abs(ar) = R$.
Since $Phi(ar) = (q / (4 pi epsilon_0)) G_D(ad, ar)$ for a single point charge $q$ at $ad$ (and $rho=0$ elsewhere, $Phi=0$ on boundary), we can identify the Green's function:
$
  G_D(ax, ar) = 1/abs(ar - ax) - (R/abs(ax))/abs(ar - (R^2/abs(ax)^2) ax)
$
This Green's function works for any charge distribution $rho(ax)$ outside the sphere ($abs(ax) > R$) when the sphere is grounded ($Phi=0$ on $r=R$).

== General Method: Eigenfunction Expansion

A systematic way to construct Green's functions involves using a complete set of orthogonal eigenfunctions of the Laplace operator that satisfy the appropriate boundary conditions.

Consider the eigenvalue problem for the Laplacian in volume $V$:
$
  nabla^2 Psi_n(ax) = -lambda_n Psi_n(ax)
$
subject to boundary conditions on $S$. For Dirichlet conditions, we require $Psi_n(ax) = 0$ for $ax$ on $S$.
The eigenfunctions $Psi_n$ form a complete orthonormal set:
- *Orthogonality*: $integral_V Psi_m^*(ax) Psi_n(ax) dd(ax, 3) = delta_(m n)$ (assuming normalization).
- *Completeness*: $sum_n Psi_n^*(ay) Psi_n(ax) = delta^((3))(ax - ay)$.

We expand the Green's function $G(ax, ay)$ in terms of these eigenfunctions:
$
  G(ax, ay) = sum_n c_n(ay) Psi_n(ax)
$
Apply the defining equation $nabla_ax^2 G(ax, ay) = -4 pi delta^((3))(ax - ay)$:
$
  nabla_ax^2 sum_n c_n(ay) Psi_n(ax) = sum_n c_n(ay) nabla_ax^2 Psi_n(ax) \
  = sum_n c_n(ay) (-lambda_n Psi_n(ax)) = -4 pi delta^((3))(ax - ay)
$
Use the completeness relation to write the delta function:
$
  sum_n c_n(ay) (-lambda_n Psi_n(ax)) = -4 pi sum_n Psi_n^*(ay) Psi_n(ax)
$
Comparing coefficients of $Psi_n(ax)$ on both sides:
$
  -c_n(ay) lambda_n = -4 pi Psi_n^*(ay) \
  => c_n(ay) = (4 pi / lambda_n) Psi_n^*(ay)
$
Substituting back into the expansion for $G$:
$
  G_D(ax, ay) = sum_n (4 pi / lambda_n) Psi_n^*(ay) Psi_n(ax)
$
This gives the Dirichlet Green's function once the eigenvalues $lambda_n$ and eigenfunctions $Psi_n$ satisfying $Psi_n=0$ on $S$ are found.

=== Example: Infinite Space (No Boundaries)

The eigenfunctions are plane waves $Psi_ak(ax) = (1/(2 pi)^(3/2)) e^(i ak dot ax)$.
$
  nabla^2 Psi_ak(ax) = -abs(ak)^2 Psi_ak(ax) => lambda_ak = abs(ak)^2
$
The sum becomes an integral over $ak$:
$
  G(ax, ay) = integral dd(ak, 3) (4 pi / abs(ak)^2) Psi_ak^*(ay) Psi_ak(ax) \
  = integral dd(ak, 3) (4 pi / abs(ak)^2) (1/(2 pi)^3) e^(-i ak dot ay) e^(i ak dot ax) \
  = 4 pi / (2 pi)^3 integral dd(ak, 3) (e^(i ak dot (ax - ay))) / abs(ak)^2
$
This integral evaluates to $1/abs(ax - ay)$, recovering the familiar free-space Green's function.

=== Next Steps: Electrostatics in a Box

The eigenfunction method can be applied to find the Green's function for a finite region, such as a rectangular box, by finding the appropriate eigenfunctions (e.g., sine functions satisfying zero boundary conditions on the walls).

$
  (e^(i ak dot ax) + e^(-i ak dot ax)) approx sin(k x)\
  => Psi_(l m n) = sqrt(8/(a b c)) sin((l pi x)/a) sin((m pi y)/b) sin((n pi z)/c)\
$

This satisfies the boundary conditions $Psi = 0$ on the walls of the box.

$
  nabla^2 Psi_(l m n) (ax) = lambda_(l m n) Psi_(l m n) (ax) \
  lambda_(l m n) = - pi^2 (l^2/a^2 + m^2/b^2 + n^2/c^2) \
$

The spectrum of eigenvalues is discrete $l, m, n in ZZ$. We can easily show, that the eigenfunctions are orthogonal, normalized, and complete.

$
  G_D(ax, ay) = - 4 pi sum_(l m n =1)^(infinity) (1/lambda_(l m n)) Psi_(l m n)^*(ax) Psi_(l m n)(ay) \
$

This Green's function can be used to solve Poisson's equation for any charge distribution within the box, given the boundary conditions on the walls. Due to it's complexity, this is typically done numerically.


== Electrostatics with Spherical Symmetry

For these problems, we can use spherical coordinates $(r, theta, phi)$ and the Laplacian in spherical coordinates:

When we deal with dipole problems, we can estimate the potential at large distances from the dipole as a spherically symmetric problem.

We want to solve the Poisson equation:

$
  nabla^2 Phi(ax) = -rho(ax)/epsilon_0 \
  => G(ar, ar')\
  => nabla^2 Psi(ar) = lambda Psi(ar) \
$

=== Laplace in Spherical Coordinates

$
  nabla^2 = 1/r pdv(, r, 2) + hat(A)/r^2\
$

Where $hat(A)$ is an operator that depends on the angular coordinates, which we will not need to solve because we are looking for spherically symmetric solutions.

$
  hat(A) = 1/sin(theta) pdv(, theta) sin(theta) pdv(, theta) + 1/sin^2(theta) pdv(, phi, 2)\
  pdv(, phi, 2) e_m (phi) = -m^2 e_m (phi)\
$

This is a harmonic oscillator equation.

$
  e_m (phi) = e^(i m phi)/sqrt(2 pi) \
$

We can verify, that this is an eigenfunction of the operator $hat(A)$ with eigenvalue $-m^2$.

We still have to verify, that the boundary conditions are satisfied. The boundary conditions are:

$
  phi in [0, 2 pi] \
  e_m(0) = e_m(2 pi) \
  => m in NN\
  1 = e^0 = e^(2 pi i m) \
$

We can solve $hat(A)$ now, by seperation:

$
  hat(A) (theta, phi) Y(theta, phi) = rho Y(theta, phi) \
  => Y(theta, phi) = sum_m c_m e_m (phi)\
  hat(A) (theta, phi) (c_m(theta) e_m(phi)) = rho (c_m(theta) e_m(phi)) \
  => [1/sin(theta) pdv(, theta) sin(theta) pdv(, theta) + 1/sin^2(theta) pdv(, phi, 2)] c_m(theta) e_m(phi)\
  = rho c_m(theta) e_m(phi) \
$

We see that $e_m$ is an eigenfunction of $pdv(, phi, 2)$:

$
  => [1/sin(theta) pdv(, theta) sin(theta) pdv(, theta) + (-m^2)/sin^2(theta) ] c_m(theta) = rho c_m(theta) \
  rho = - l (l+1) \
  [1/sin(theta) pdv(, theta) sin(theta) pdv(, theta) + (-m^2)/sin^2(theta)] P_l^m (theta) = -l (l+1) P_l^m (theta)\
$

This is a difficult problem, but it is a one-dimensional problem.

$
  m = 0\
  => [1/sin(theta) pdv(, theta) sin(theta) pdv(, theta)] P_l^0 (theta) = -l (l+1) P_l^0 (theta)\
  P_l^0 (theta) = P_l (theta) = P_l (cos(theta))
$

The $cos(theta)$ is a restriction, but if we can prove, that this solution is complete (with our conditions), we know that we dont need a more general solution.

$
  P_l (cos(theta)) = sum_n beta_l^n (cos(theta))^n\
  P_l (cos(theta)) = 1/2^l dv(, cos(theta), l) (-sin^2(theta))^l\
  [pdv(, x) (1-x^2) pdv(, x) + l(l+1)] P_l (x) = 0\
$

Now we need to solve it for arbitrary $m$.

$
  hat(A)_m (theta, phi) Y_l^m (theta, phi) = -l(l+1) Y(theta, phi)\
  Y(theta, phi) = sum_m Theta (theta) Phi (phi)\
$

This factorized assumption relies on the fact, that the factorized solution is complete. We can show that this is true, by showing that the eigenfunctions are orthogonal and normalized.

$
  x = cos(theta)\
  [pdv(, x) (1-x^2) pdv(, x) + l(l+1)] P_l(x) = 0\
  P_l (x) = 1/(2^l l!) dv(, x, l) (x^2 - 1)^l\
  l=0: P_0 (x) = 1\
  l=1: P_1 (x) = x\
  => [pdv(, x) (1-x^2) pdv(, x) + 2] x = 0\
  P_2(x) = 1/(2 2!) dv(, x, 2) (x^2 - 1)^2 = 3/2 x - 1/2\
$

We can see that the $P_l$ are orthogonal and normalized.

$
  P_l^(-m) (x) = (-1)^m (l-m)!/(l+m)! P_l^m (x)
$

Recap:

We wanted to solve the angular part of $hat(A) (theta, phi) Y (theta, phi) = -(l + 1) l Y (theta, phi)$.

$
  Y_(l m) = e^(i m phi) P_l^m (cos(theta)) sqrt((2l + 1)/(4 pi) (l-m)!/(l+m)!)\
$

This is a complete solution on the space of periodic functions on the sphere with respect to $theta$. Completeness means:

$
  sum_(l=0)^(infinity) sum_(m=-l)^l Y_(l m)^* (theta, phi) Y_(l m) (theta', phi') = delta(phi - phi') delta(cos)(theta - cos(theta'))\
$

Orthonormality means:

$
  integral_(-1)^1 dd(cos(theta)) integral_0^(2 pi) dd(phi) Y_(l m)^* (theta, phi) Y_(l' m') (theta, phi) = delta_(l l') delta_(m m')\
$

These functions are called *spherical harmonics*.

$
  Psi(r, theta, phi) = sum_(l=0)^(infinity) sum_(m=-l)^l R_(l m)(r)/r Y_(l m) (theta, phi)\
  dv(, r, 2) R_(l m)(r)/ r - l(l+1)/r^3 = lambda R_(l m)(r)/r\
$

This can be solved with boundary conditions. For example:

- We have a conductor $R_1$ inside a circular building $R_2$ that is conductive:
  $
    Psi(r=R_1, theta, phi) = Psi(r=R_2, theta, phi) = 0\
    => R_(l m)/r |_(r = R_1 = R_2) = 0
  $

  In the case that $R_2 -> infinity$, we can model the conductor as a point.

  For $r -> 0$, we can solve the radial differential equation generally.

  $
    R''(r) - (l(l+1))/r^2 R(r) = lambda R(r)\
  $

  Take $R(r) approx r^alpha$ because, as $r -> 0$, all the higher powers vanish faster.

  $
    => alpha (alpha-1) r^(alpha-2) - l(l+1)/r^2 r^(alpha-2) = lambda r^(alpha) approx 0\
    => alpha (alpha-1) = l(l+1)\
    => alpha = -l "or" alpha = l + 1\
  $

  The generic solution is:

  $
    R_(l m) (r) ) sum_(n=0)^(infinity) c_n r^(l + n) + sum_(n=0)^(infinity) d_n r^(l + 1 + n)\
  $

  This is a power series. To inspect it, we put it in the original equation. We have everything we need to calculate the coefficients.

== Other uses of spehrical harmonics

If we have a local charge distribution and we want to calculate the potential at points that are very far away (imagine calculating the potential effects of a distant star on earth), we dont need to use Colombs law.

Sometimes we also want to calculate the charge distribution from a known potential. For this inverse problem, we can use spherical harmonics to calculate the charge distribution from the potential.

When the distance is much larger than the size of the charge distribution, we can expand:

$
  1/abs(ar - ax) = sum_n c_n P_n(theta)\
$

Where $P_n$ is a legendre polynomial.

$
  1/abs(ar - ax) = 1/(ar^2 + ax^2 - 2 abs(ar) abs(ax) cos(theta))^(1/2)\
  abs(ax) = delta abs(ar)\
  => 1/(ax - ar) = 1/abs(ar) 1/sqrt(1 + delta^2 - 2 delta cos(theta))\
  f(delta, theta) = 1/sqrt(1 + delta^2 - 2 delta cos(theta))\
$

$f$ can be expanded

$
  f(delta, theta) = sum_n c_n(delta) P_n(cos(theta))\
$

- $
    f(- delta, theta) = sum_n c_n (-delta) P_n(cos theta) = sum_n c_n (delta) P_n (-cos(theta))\
    = sum_n c_n (delta) (-1)^n P_n (cos(theta))\
    => c_n (-delta) = (-1)^n c_n (delta)\
  $

- $
    f(1/delta, theta) = delta f(delta, theta)
  $

For $theta = 0 => P_n (1) = 1$:

$
  1/sqrt(1 + delta^2 - 2 delta) = 1/sqrt((1-delta)^2) = 1/(1-delta)\
  = sum_n delta^n
$

We can conclude:

$
  1/sqrt(1 + delta^2 - 2 delta cos(theta)) = sum_n delta^n P_n (cos(theta))\
  => 1/abs(ar - ax) = 1/abs(ar) sum_n abs(ax)^n/(abs(ar))^(n) P_n(cos(theta))\
$

Back to the original problem:

$
  Phi(ar) = integral dd(ax, 3) rho(ax)/(abs(ar - ax)) 1/(4 pi e0)\
  = integral dd(ax, 3) rho(ax)/(4 pi e0) sum_n P_n (cos(theta) abs(ax)^n/(abs(ar))^(n+1))\
$

When we define $theta = theta(theta_x, phi_x, theta_0, phi_0)$, where $x$ is the position of the charge distribution, we can calculate the potential at $ar$.

$
  P_n(cos(theta(theta_x, phi_x, theta_0, phi_0))) = sum_(l, m) Y_(l m) (theta_0, phi_0) c_(l m) (theta_x, phi_x)\
$

The first factor corresponds to angular dependence in the observer, the second factor to the angular dependence of the charge distribution.

$
  P_l (cos(theta(theta_x, phi_x, theta_0, phi_0)))\
  = (4 pi)/(1+2 l) sum_(m = -l)^l Y_(l m)^* (theta_x, phi_x) Y_(l m) (theta_0, phi_0)\
$

Then
$
  Psi(ar) = 1/(4 pi e0) sum_(l=0)^infinity 1/(1 + 2 l) sum_(m = -l)^l integral dd(ax, 3) rho(ax) abs(ax)^l/(abs(ar))^(l+1) Y_(l m)^* (theta_x, phi_x) Y_(l m) (theta_0, phi_0)\
  = 1/(4 pi e0) sum_(l=0)^infinity 1/(1 + 2 l)\ (Y_(l m)(theta_0 phi_0))/abs(ar)^(l+1) q_(l m)\
  q_(l m) = integral dd(ax, 3) rho(ax) abs(ax)^l Y_(l m) (theta_x, phi_x)\
$

This $q_(l m)$ "knows" everything about the charge distribution. It is characteristic of the charge distribution.

$q_(l m)$ is called the *multipole moment* of the charge distribution. It is a generalization of the dipole moment. The dipole moment is $q_(1 0)$, the quadrupole moment is $q_(2 0)$, and so on.

#gloss.push("multipole moment")
#gloss.push("dipole moment")
#gloss.push("quadrupole moment")

== Dipole Moment

Suppose you have opposing charges with distance $d$ between them. the charges are close to $ar$. The potential of the charges cancels with large $ar$. We can see, that the dipole moment is directionally dependent on the distance between the charges.

Compared to the Colomb dropoff of $1/abs(ar)$, the dipole moment behaves with $1/abs(ar)^2$, the quadrupole moment with $1/abs(ar)^3$, and so on.

Mutiple moments give us a deeper insight over the geometry of the charge distribution of distant systems.


