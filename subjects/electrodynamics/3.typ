#import "lib.typ": *

= Magnetostatics

Our electrostatic and magnetostatic equations are decoupled. For our case:

$
  div(aB) = 0\
  curl(aB) = aJ/(e0 c^2)\
$

#gloss.push("Current Density")

This chapter includes:

- What is current density?

- Integral form of magnetostatics

- Vector potential $aA$

- Solution of magnetostatics

- Duality of $aE$ and $aB$

== Current Density

The current density $aJ$ is a vector field, that is a measure of the flow of electric charge per unit area. It is defined as:

$
  dv(Q, t) = aJ dot dd(ass)\
$

If we have a volume with a current flow:

$
  (Q_0 (t) - Q(t))/(Delta t) = integral dd(ax, 3) pdv(rho, t)\
  = - integral_(S(V)) aJ dot dd(ass)\
  => integral_(V(S)) dd(V) pdv(rho, t) = - integral_(V(S)) dd(V) Delta dot aJ\
  => integral_(V(S)) [pdv(rho, t) + Delta dot aJ] = 0 \
  => pdv(rho, t) + Delta dot aJ = 0
$

The is the continuity equation. It is already implied by the Maxwell equations.

We can write the current density as:

$
  aJ = rho av\
$

== Integral Form

$
  c^2 curl(aB) = aJ/e0\
  => c^2 integral_(S(Gamma)) dd(ass) dot (curl(aB)) = integral_(S(Gamma)) dd(ass) dot aJ/e0\
  I = dv(Q, t)
$

This is how many charges escape per time

=== Amperes Law

$
  => integral.cont_(Gamma) aB dot dd(al) = I_("Through" Gamma)/(c^2 e0)
$

== Vector Potential

$
  curl(aB) = 0\
  => aB = curl(aA)
$

You can compute:

$
  div(curl(aA)) = pdv(, x_i) (curl(aA))_i = pdv(, x_i) (epsilon_(i j k) pdv(A_k, x_j))\
  = epsilon_(i j k) pdv(, x_i, x_j) A_k
$

This is a product of a symmetric tensor and an antisymmetric tensor, which is always zero.

We can construct the magnetic field completely through the vector potential.

$
  curl(aB) = aJ/(e0 c^2) => curl(curl(aA)) = aJ/(e0 c^2)\
  => - Delta^2 aA + div(div(aA)) = aJ/(e0 c^2)\
$

We can also use:

$
  epsilon_(i j k) epsilon_(k l m) = abs(mat(delta_(i l), delta_(i m); delta_(j l), delta_(j m))) = delta_(i l) delta_(j m) - delta_(i m) delta(j l)\
$

The above solution if convenient, because it contains the laplacian. We can reuse much of electrostatics.

 === Symmetry

Many properties have to stay the same through different configurations.

$
  aA(ax) -> aA'(ax') = aA(ax) + div(f(ax))\
  aF = q av crossproduct aB "stays invariant"\
  aB' = curl(aA + Delta f)\
  = curl(aA) + curl(Delta f) = aB  
$

We call this *Gauge Symmetry*. We can do this for any point in the full standard model. 

#gloss.push("Gauge Symmetry")

$
  laplacian(aA) - div(div aA ) = aJ/(e0 c^2)\
  laplacian(aA') - div(div aA') = aJ/(e0 c^2)\
  => aA' = aA + div f\
$

We need to construct the function $f$ such that:

$
  aA' = aA + div f\
  div aA' = 0 => div aA + laplacian f = 0\
  => laplacian f = - div aA = "Source"\
$

We know how to solve the poisson equation. The fact that the above can happen means:

$
  laplacian aA' = aJ/(e0 c^2)\
$

Because of this symmetriy, for obtaining the magnetic field, we dont need to solve the regional equation $laplacian aA - div(div aA) = - aJ/(e0 c^2)$, we can use the above equation instead.

We know the solution:

$
  aA(ax) = 1/(4 pi e0 c^2) integral dd(ay, 3) aJ(ay)/(abs(ax - ay))\
$

== Application: Magnetic Dipole

We have a current density in space $aJ$ with currents at $ax$, and want to know $aA$ at $ar$.

We will use a 4-vector.

$
  A(ar) = integral dd(ay, 3) 1/(4 pi e0 c^2) aJ(ay) dot [sum_(l=0)^infinity P_l(cos(theta)) abs(ax)^l/abs(ar)^(l+1)]\
  = integral dd(ay, 3) 1/(4 pi e0 c^2) aJ(ay) [ 1/abs(ar) + (cos(theta) abs(ax))/(abs(ar)^2) + ...]\
  = 1/(4 pi e0 c^2) [1/(abs(ar)) integral dd(ax, 3) aJ(ax) + 1/(abs(ar)^3) integral dd(ax, 3) aJ(ax) (ax dot ar) + ...]\
$

Using integration by parts, we can get:

$
  A(ar) = 1/(4 pi e0 c^2) (integral dd(ax, 3) (ax crossproduct aJ(ax)))/2) crossproduct ar/(r^3) 
$

#gloss.push("Magnetic Moment")

We discover the magnetic moment:

$
  M = 1/2 integral dd(ax, 3) (ax crossproduct aJ(ax))\
  => aA(ar) = amu crossproduct ar/(r^3)
  => aB = (am dot Delta) (Delta 1/r)
$

== Relativity of $aE$ and $aB$

We can use the duality of $aE$ and $aB$ to show that they are the same. We can use the Lorentz transformation to show that the electric field is a function of the magnetic field and vice versa.

$
  F = q v B = 1/(2 pi e0) (q v)/c^2 I/r\
  = (q S)/(2 pi e0) (rho_-)/r v^2/c^2\
$

Lets change the reference frame. If we are in a reference frame, where the charge velocity is zero, the force vanishes. 

This gets solved, because the charge density is dependent on the reference frame. 

$
  N q = Q = rho_("rest") Delta V_("rest")\
$

In the new frame:

$
  Q = rho_("moving") Delta V_("moving")\
  => rho_("moving") = rho_("rest") Delta V_("rest")/Delta V_("moving")\
$

But we are moving in one direction. The dimension in which we are moving is contracted.

$
  => rho_("moving") = rho_("rest")/(sqrt(1 - v^2/c^2))\
$

This affects the electrons and positrons:

$
  rho' = rho'_+ + rho'_- = rho_+/(sqrt(1 - v^2/c^2)) + rho_- sqrt(1 - v^2/c^2)\
  rho' = rho_-/(sqrt(1 - v^2/c^2)) v^2/c^2\
  => F' = F/(sqrt(1 - v^2/c^2))\
$

Here $F'$ is an electric force and $F$ is a magnetic force. Thus we can see that the electric and magnetic forces are equivalent with a change in the reference frame.

== Full Potentials

$
  div aE = rho/e0\
  curl aE = - pdv(aB, t)\
  div aB = 0\
  curl aB = aJ/(e0) + pdv(aE, t)\
$

We can derive:

$
  div aB = 0 => aB = curl aA\
  curl aE = - pdv(aB, t) = - pdv(, t) (curl aA)\
  => curl (aE + pdv(aA, t)) = 0\
  => aE + pdv(aA, t) = - grad(Phi)\
  => aE = - grad(Phi) - pdv(aA, t), aB = curl aA\
$

Maxwells equations imply charge conservation.

$
  e0 c^2 curl(aB) = aJ + pdv(aE, t) e0\
  => e0 c^2 div (curl aB) = div aJ + pdv(div aE, t) e0\
  => 0 = div aJ + pdv(rho, t) e0 = 0\
$

Thus, current is conserved. We integral over the entire universe:

$
  => 0 = integral dd(ax, 3) div aJ + pdv(, t) integral dd(ax, 3) rho(ax)\
  => pdv(, t) Q_("universe") = 0
$

Thus, the charge in the universe is conserved.

$
  integral_("universe") dd(ax, 3) div aJ =  integral_("edge") dd(ass) aJ = 0
$

We see, that no charge is leaving the unverse.

$
  c^2 curl aB = aJ/e0 + pdv(aE, t)\
  => c^2 ( curl(curl aA)) = aJ/e0 + pdv(, t) (- grad Phi - pdv(aA, t))\
  => c^w(grad(div aA) - laplacian aA) = aJ/e0 + pdv(, t) (- grad Phi - pdv(aA, t))\
  => [1/c^2 pdv(, t, 2) - laplacian] aA = aJ/(e0 c^2) - grad(1/c^2 pdv(Phi, t) + div aA)\
$

Similarly

$
  div aE = rho/e0\
  "and" aE = - grad Phi - pdv(aA, t)\
  => [1/c^2 pdv(, t, 2)] Phi = rho/e0 + pdv(, t)(1/c^2 pdv(Phi, t) + grad aA)\
$

We want the second terms for both cases to vanish.

== D'Alembert Operator

$
  square = 1/c^2 pdv(, t, 2) - laplacian\
  => square aA = aJ/(e0 c^2)\
  => square Phi = rho/e0\
$

== Gague Symmatry 

Change:

$
  Phi -> Phi' = Phi + pdv(,t) f(ax, t)\
  aA -> aA' = aA - grad f(ax, t)
$

With a substitution:

$
  square Phi' = rho/e0 + pdv(, t) (1/c^2 pdv(Phi', t) + div aA')\
  square aA' = aJ/(e0 c^2) - grad(1/c^2 pdv(Phi', t) + div aA')\
$

We can choose $f(ax, t)$ such that:

$
  1/c^2 pdv(Phi', t) + div aA' = 0\
$

Then we can work with the simpler equations:

$
  square Phi = rho/e0\
  square aA = aJ/(e0 c^2)\
  square = 1/c^2 pdv(, t, 2) - laplacian\
$

We see, that the electromagnetic wave is a solution of electrical and magnetic fields, without any charge density.

$
  square Phi = rho/e0\
  square aA = aJ/(e0 c^2)\
$

Given a solution of the wave equation $square Phi_("sol") = rho/e0$, then also $Phi = Phi_("free") + Phi_("Sol")$, where $square Phi_("free") = 0$ is a solution for empty space. Then:

$
  square Phi' = square Phi_("free") + square Phi_("sol")\
$

We can see, that the solution is not unique. The uniqueness arises from boundary conditions.

If we want to solve the wave equation for the entire universe, we need to assume, that there are no waves outside the universe. We will use Green's function with boundary conditions that the fields vanish at infinity of space and time.

$
  wave G(ax-ax', t-t') = delta^((3))(ax - ax') delta(t - t')\
$

If we find $G$, then we can find the solution:

$
  Phi(ax, t) = integral dd(ax', 3) dd(t') G(ax - ax', t - t') rho(ax', t')/e0\
  wave Phi(ax, t) = integral dd(ax', 3) dd(t') G(ax - ax', t - t') aJ(ax', t')/(e0)\
  = integral dd(ax', 3) dd(t') delta(ax - ax') delta(t - t') rho(ax', t')/e0\
  = rho(ax, t)/e0\
$

So this indeed works. The integration range in the full spacetime volume.

This means we also want to integrate all of time. The problem is, that we demant to know the charge density at all times to get the field at one time. 

Let's try a different approach. 

$
  Phi(ax, t) = integral_(- infinity)^(t) dd(t') integral dd(ax', 3) G(ax - ax', t - t') rho(ax', t')/e0\
  + integral_(t)^(+ infinity) dd(t') integral dd(ax', 3) G(ax - ax', t - t') rho(ax', t')/e0\
$

The second term is unphysical, because it violates causality. We need the Green's function to vanish in the future. This can be done if

$
  G(ax - ax', t - t') prop Theta(t - t')\
$

This means that the Green's function cutts off for the future.

So we have to extend Maxwells theory, so that it incorporates causality explicitly. A theory which produces the causality respecting Green's function emergey by a limiting procedure.

We will modify the wave equation:

$
  1/C pdv(, t) = lim_(delta -> 0) [1/c pdv(, t) + delta]\
  delta > 0\
  wave -> wave_(delta) = (1/c^2 pdv(, t) + delta)(1/c pdv(, t) + delta) - laplacian\
$

At the end:

$
  lim_(delta -> 0) wave_(delta) = wave\
$

$
  waved aA_delta(ax, t) = aJ/(e0 c^2)\
  -> aA_delta(ax, t)\
  -> lim_(delta -> 0^+) aA_delta(ax, t) = aA(ax, t)\
$

We introduce a 4-D fourier transform.

$
   G(ax - ax', t - t') = integral dd(E) dd(ak, 3) 1/((2 pi)^4) tilde(G) (E, ak) e^(-i E(t - t') + i ak(ax - ax'))\
   Delta t = t - t'\
  Delta ax = ax - ax'\
  G(delta ax, Delta t) = integral dd(E) dd(ak, 3) 1/((2 pi)^4)\
  dot e^(-i(c Delta t E - ak dot Delta ax)) tilde(G)_delta(E, ak)\
  waved G(delta ax, Delta t) = integral dd(E) dd(ak, 3) 1/((2 pi)^4)\
  dot e^(-i(c Delta t E - ak dot Delta ax)) tilde(G) (E, ak) (-1) ((E + i delta)^2 - ak^2)\
  = delta^((3))(ax - ax') delta(t - t')\
  "with" 2 pi delta(x) = integral dd(ak) e^(-i k x)\
  = integral dd(E) dd(ak, 3) 1/((2 pi)^4) e^(-i(c Delta t E - ak dot Delta ax)) c
$

So, in Fourier space:

$
  tilde(G) (E, ak) = -c/((E + i delta)^2 - ak^2)\
  G(Delta x, Delta t) = lim_(delta -> 0) (-c) integral dd(E) dd(ak, 3) 1/((2 pi)^4) e^(-i(c Delta t E - ak dot Delta ax))/((E + i delta)^2 - ak^2)\
$

This vanishes for $Delta t < 0$. This implies that the Green's function is causal.

$
  dd(ak, 3) = dd(k) k^2 dd(cos(theta)) dd(phi)\
$

We can align $Delta ax = Delta x hat(z)$. Then:

$
  ak dot Delta ax = k Delta x cos(theta)\
$

After integrating over angles, we get:

$
  G(Delta ax, Delta t) = - c integral_0^(infinity) dd(k) abs(ax)/(abs(ax - ax')) [e^(i k Delta x) - e^(-i k Delta x)]\
  dot integral_(-infinity)^(infinity) dd(E) e^(-i E c Delta t)/((E + i delta)^2 - k^2)\
  = -c integral_0^(infinity) dd(k) e^(i k Delta x) k integral_(-infinity)^(infinity) dd(E) e^(-i E c Delta t)/((E + i delta)^2 - k^2)\
$

The second integral demermines the causal behavior. We will use the residue theorem to compute this integral. We find poles at $(E + i delta)^2 = k^2$. This gives us:

$
  E = plus.minus k - i delta\
$

With $delta -> 0$, we know that the poles approach the real axis from the bottom. This is important because limits are only unique for the same direction.

Assume $Delta t < 0$ (violates causality). We close the contour in the upper half plane. We observe that the upper integrand vanishes at infinity and that the contour contains no poles. Thus, the integral vanishes.

The vanishing of the integrand means that the Green's function vanishes for $Delta t < 0$.
This is the causality condition.

For $Delta t > 0$, we close the contour in the lower half plane. The integrand vanishes at infinity and the contour contains two poles.

$
  integral dd(E) 1/(2 pi) k e^(-i E c (t - t'))/((E + i delta)^2 - k^2)\
  = - Theta(t - t') i pi [e^(-i k c Delta t) - e^(i k c Delta t)]\
  G(ax - ax', t - t')\
  = - (i c Theta(t - t'))/(2(2 pi)^2 abs(ax - ax')) integral dd(k) [e^(-i k(c Delta t - abs(Delta ax))) - e^(i k(c Delta t + abs(Delta ax)))]\
  = (+R c Theta(t - t'))/(4 pi abs(ax - ax')) [delta(c Delta t - abs(Delta ax)) - delta(c Delta t + abs(Delta ax))]\
  => G(ax - ax', t - t') = 1/(4 pi abs(ax - ax')) delta (t - t' - abs(ax - ax')/c)
$

Then for physical quantities:

$
  Phi(ax, t) = integral dd(ax', 3) dd(t') G(ax - ax', t - t') rho(ax', t')/e0\
  = 1/(4 pi e0) integral dd(ax', 3) rho(ax', t - abs(ax - ax')/c)/abs(ax - ax')\
$

This is Colombs law in full, independent of the reference frame.

For $c -> infinity$, we get the static case and we get our normal Colombs law. We will also get the normal case, if the charge density is constant in time.

When the speed of light is finite, we have to take into account the time it takes for the field to propagate. This means that the field at a point in space is not only dependent on the charge density at that point, but also on the charge density at other points in space and past time.

$
  t_("retarded") = t - abs(ax - ax')/c\
  G_("retarded") = 1/(4 pi abs(ax - ax')) delta(t - t' - abs(ax - ax')/c)\
$

This is the time, that light needs to cover the distance between the observer and the charge density.

In analog, we can also use the *retarded Green's function* to compute the magnetic field. The derivation is of the same form. We get:

$
  aA(ax, t) = 1/(4 pi e0 c^2) integral dd(ax', 3) aJ(ax', t - abs(ax - ax')/c)/abs(ax - ax')\
$

We can write the potentials as a vector:

$
  mat(Phi; aA) = integral dd(ax', 3) 1/(4 pi e0) 1/(abs(ax - ax')) mat(rho(ax', t - abs(ax - ax')/c)/c; aJ(ax', t - abs(ax - ax')/c)/c)\
$

And use the identity:

$
  1/(abs(ax - ax')) delta(t-t' - abs(ax - ax')/c)\
  = 2/c delta((t-t')^2 - abs(ax - ax')^2/c^2) Theta(t - t')\
$

This works on the principle of:

$
  2 delta(a^2 - abs(b)^2) Theta(a>0)\
  = 2 delta(a - abs(b)) (a + abs(b)) Theta(a>0)\
  = 2 delta(a - abs(b))/(2 a) Theta(a>0)\
  = delta(a - abs(b))/abs(b)
$

We also use:

$
  integral_(-infinity)^(infinity) dd(x) delta((x- x_0)^2) f(x) = f(x_0)\
$

We get:

$
  Phi(ax, t)\
  = integral dd(ax', 3) 1/(4 pi e0 c) delta((t - t')^2 - abs(ax - ax')^2/c^2) rho(ax', t')/e0 Theta(t - t')\
$

Our application is to calculate $Phi$ for a charge $q$ moving with a constant velocity $av$. This will get us closer to understanding relativity.

Assume $t'=0, ax'=0$.

$
  ax' = av t'\
  rho(ax', t') = q delta^((3))(ax' - av t')\
  Phi(ax, t)\
  = 1/(2 pi e0 c) integral dd(ax', 3) dd(t) delta((t - t')^2 - abs(ax - ax')^2/c^2) Theta(t - t') delta^((3)) (ax' - av t')\
  = q/(2 pi e0 c) integral dd(t') Theta(t - t') delta((t - t')^2 - abs(ax - av t')^2/c^2)\
  delta(f(x)) = sum_i delta(x - x_i)/(abs(f'(x_i)))\
$\ 

Lets look at the quantity:

$
  (t - t')^2 - abs(ax - av t')^2/c^2, c=1\ 
$

We decompose $ax = ax_parallel + ax_bot, ax_bot dot av = 0$.

$
  (t - t')^2 - abs(ax_parallel - v t)^2 - abs(ax_bot)^2\
  = t'^2 (1-v^2) - 2 t' (t - ax_parallel v) + t^2 - ax_parallel^2 - ax_bot^2\
$

We set 

$ 
  tilde(t) = (t - x_parallel v)/(sqrt(1 - v^2))\
  tilde(x_parallel) = (x_parallel - v t)/sqrt(1-v^2)\
  => t = (tilde(t) + tilde(x_parallel) v)/(sqrt(1 - v^2))\
  => x_parallel = (tilde(x_parallel) + tilde(t) v)/(sqrt(1 - v^2))\
  => t'^2 (1-v^2) - 2 t' sqrt(1-v^2) tilde(t) + tilde(t)^2  - tilde(x)^2\
  tilde(x)^2 = tilde(x_parallel)^2 + ax_bot^2\
$

When we set:

$
  t' sqrt(1-v^2) =  rho\
  => rho_(plus.minus) = tilde(t) plus.minus abs(tilde(x))\
  => Phi(x, t) = 1/(4 pi e0) (q/(sqrt(1 - V^2/c^2)))/(sqrt(x_bot^2 + tilde(x_parallel)^2))\
  = 1/(sqrt(1 - v^2/c^2)) 1/(4 pi e0) q/sqrt((x_parallel - v t)^2/(sqrt(1 - v^2/c^2))^2 + x_bot^2)\
  aA(ax, t) = 1/(4 pi e0) 1/sqrt(1 - v^2) av/c q/sqrt((x_parallel - v t)^2/(sqrt(1 - v^2/c^2))^2 + x_bot^2)\
  => aA(ax, t) = av/c Phi(ax, t)\
$

For $v=0$ we get the electrostatic case:

$
  mat(Phi(ax, t); 0) -> mat(1/(sqrt(1- v^2/c^2)) Phi(tilde(ax), tilde(t)); (av/c)/(sqrt(1 - v^2/c^2)) Phi(tilde(ax), tilde(t)))\
$

This is the Lorentz transformation. We can see that the electric and magnetic fields are equivalent in different reference frames. We also observe, that vector and scalar potentials transmorm similarly to time and space.