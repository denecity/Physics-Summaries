#import "../../../lib/lib.typ": *

= Radiation

Radiation is a physical phenomenon due to accelerated or decelerated electric charges.

Consider a charge in a generic trajectory:

$
  ar(t) != ar_0 + av t
$

What is the resulting $aE$ an $aB$? We first compute:

$
  a^mu (ax, t)
  => F^mu => "consequences"
$

We have the starting point:

$
  A^mu (x) = integral dd(x', 4) G_("ret") (x -x') J^mu (x')
$

The 4-current density $J^mu$ curresponds to an arbitrary trajectory of a single charge $q$:

$
  J^mu (x') = J^mu (ax', t')\
  = mat(J^0 (ax', t'), aJ (ax', t'))\
  ax' (t') = ar(t')
$

Where $ar (t')$ is our trajectory.

$
  =mat (q delta(ax' - ar(t')), q dv(ar, t) delta(ax', ar(t')))\
$

First term is the charge density, second term is the current density. We take $ar$ to be very generic.

$
  dot(ar) = av\
  dot.double(ar) = aa\
$

For $aa != 0$ we have radiation, which is outward emission of energy, capable of reaching infinite distances. This is on contrast to electrostatic fields, which are static and decay with distance.

$
  a^mu\
  F^mu = partial^mu A^nu - partial^nu A^mu\
  aS "Poynting vector" = aE cross aB\
  dv(P, t) "power of radiation" = integral aS dot dd(A)\
$

$
  J^mu (x) = q integral dd(tau) v^mu delta(x^rho - ar^rho (tau))\
  v^mu = dv(r^mu, tau)\
  A^mu = integral dd(x', 4) G_("ret") (x - x') J^mu (x')\
  G_("ret") (x - x') = 1/(2 pi) delta((x- x')^2) Theta(x^0 - x'^0)\
  => A^mu (x) = q/(2 pi) integral dd(tau) v^mu (Tau) delta((x - ar(tau))^2) Theta(x^0 - ar^0(tau))\
  (x - ar(tau))^2 = 0\
  => x^0 - r^0 (tau) = plus.minus abs(ax - ar(tau))\
  => x^0 - r^0 (tau) > 0\
  => x^0 - r^0 (tau) = abs(ax - ar(tau))\
$

This will give us one solution for $tau$, which we call $tau_0$:

$
  delta((x - ar(tau))^2) = evaluated((delta(tau - tau_0))/(dv(, tau) [(x - ar(tau))^2]))_(tau = tau_0)\
  "remember" delta(f(x)) = delta(x - x_0)/evaluated(abs(pdv(f, x)))_(x = x_0)\
  => pdv(R^2, tau) = pdv(, tau) [g_(mu nu) (R^mu R^nu)], R = x - r (tau)\
  = g_(mu nu) pdv(R^mu, tau) R^nu + g_(mu nu) R^mu pdv(R^nu, tau)\
  = 2 g_(mu nu) R^nu pdv(R^mu, tau)\
  = 2 R dot pdv(R, tau)\
  = 2 (x - r (tau)) dot dv(, tau) (x - r (tau))\
  = - 2 (x - r (tau)) dot dv(r (tau), tau)\
  = 2 (x - r (tau)) dot v (tau)\
$

This works because:

$
  integral dd(x) delta(f(x))\
  = integral dd(f(x))/(abs(pdv(f, x))) delta(f(x))\
  = integral dd(y) delta(y)/abs(pdv(f, x))|_(y=0)\
$

All together:

$
  A^mu (x) = q/(4 pi) integral dd(tau) (delta(tau - tau_0) v^mu (tau))/((x-r(tau)) v(tau))\
  => A^mu (x) = (v^mu (tau_0))/((x - r (tau_0)) v(tau_0)) q/(4 pi)\
$

This is called the *Retarded potential*. $tau_0$ corresponds to the past. It was discovered by Lienard and Wiechert.

In the static limit, the carge is in its rest frame.

$
  v^mu = dv(x^mu, tau) = dv(x^mu, t) = mat(1, arrow(0))\
  (x - r (tau)) dot v = (x^0 - r^0 (tau)) - (ax^i - ar^i (tau)) av = x^0 - r^0 (tau)\
  = abs(ax - ar)
$

Last part from the Green function constraint.

$
  => A^mu (x) = q/(4 pi) mat(1, arrow(0))/(abs(ax - ar (tau)))
$

Thus we recovered electrostatics.

$
  F^(mu nu) = partial^mu A^nu - partial^nu A^mu\
$

We will skip the derivation of the electromagnetic field tensor. Define:

$
  R^mu = x^mu - ar^mu (tau_0)\
$

Greens function requires $R^2 = 0 => R^0 > 0$.

$
  => R^0 = abs(aR)\
  R^mu = mat(R^0, aR)\
  = abs(aR) mat(1, aR/abs(aR))\
$

We call $hat(n) = aR/abs(aR)$.

$
  R^mu = (x^mu - r^mu (tau))\
  = abs(aR) mat(1, hat(n))\
$

We can write:

$
  aB = hat(n) cross aE\
  aE = q/(4 pi (1 - hat(n) dot av)^3) { (1- av^2)/abs(aR)^2 (hat(n) - av) + 1/(abs(aR)) hat(n) cross [(hat(n) - av) cross dot(av)]}
$

When $v=0$, we get electrostatics.

$
  aE = q/(4 pi) (1/abs(aR)^2) hat(n) + 1/abs(aR) hat(n) cross [hat(n) cross dot(av)])\
$

== Poynting vector

$
  aS = aE cross aB = aE cross (hat(n) cross aE)\
  = abs(aE)^2 hat(n) - (aE dot hat(n)) aE\
$

We will substitute the electric field (at rest frame):

$
  aS = hat(n) q^2/(16 pi^2 abs(aR)^2) abs(hat(n) cross (hat(n) cross dot(av)))^2 + O(1/R^3)\
  = ... = hat(n) q^2/(16 pi^2 abs(aR)^2) abs(dot(av))^2 sin^2(theta) + O(1/R^3)\
$

The poynting vector satisfies the continuity equation.

$
  dv(W, t) = P = aS dot dd(A)\
$

We can use spherical coordinates:

$
  dd(aA) = hat(n) dot abs(aR)^2 dd(Omega)\
  => dd(P) = q^2/(16 pi^2) abs(dot(av))^2 sin^2(theta) dd(Omega)\
  => dd(aA) prop R^2\
  aS prop 1/R^2 + O(1/R^3)\
$

We see, that the Poynting vector depends on acceleration. The power, that we see as radiation, so as energy transfer at really large distances, will be the strict infinite limit.

$
  dv(P_"radiation", Omega) = q^2/(16 pi^2) abs(dot(av))^2 sin^2(theta)
$

This is the radiation power, that we see at large distances. It is proportional to the square of the acceleration.

To find the total power, we integrate over the solid angle:

$
  P_"rad" = q^2/(4 pi) 2/3 abs(dot(av))^2\
$

If our acceleration is at a right angle to our line of sight, the radiation is maximal. If it is parallel, the radiation is zero.

In general, radiation is generated by any accelerated charge. The radiation is proportional to the square of the acceleration, and it is emitted in all directions, with a maximum in the direction of the acceleration.

Lets look at the component

$
  1/R hat(n) cross [(hat(n) - av) cross dot(av)]\
$

This is the radiation field, which is perpendicular to the direction of the acceleration. It is responsible for the long range radiation (because $1/R$). The other component is the Coulomb field, which is responsible for the short range interaction.

There is also a connection between acceleration and crossectional radiation power:

$
  dv(P_("rad"), Omega) = q^2/(16 pi^2) abs(dot(av))^2 sin^2(theta) dd(Omega)\
$

This is the radiation power per solid angle. It is proportional to the square of the acceleration. The total radiation power is:

$
  P_("rad") = q^2/(4 pi) 2/3 abs(dot(av))^2\
$

We can use *the Larmor formula* to compute the radiation power of a charge in an arbitrary trajectory. The Larmor formula is:

$
  P_("rad") = q^2/(4 pi) 2/3 abs(dot(av))^2/c\
  = q^2/(4 pi e0 c) 2/3 (dv(ap, t)^2 1/m^2
$

The above is definitely valide in the rest frame. We can use the Lorentz transformation to get an arbitrary $av$.

$
  P_("rad") = "Energy"/"Time" = P'_("rad")
$

This is invariant under Lorentz transformations. If we integrate over the radiation power (solid angle), we get the total radiation power, which is invariant, thus the same for all observers.

In the rest frame, we have:

$
  dv(p^mu, tau) = mat(0, dv(ap, t))\
  dv(p^mu, tau) dv(p_mu, tau) = 0^2 - dv(ap, t)^2\
  = - dv(ap, t)^2\
  => p_"rad" = q^2/(4 pi) 2/(2 m^2) dv(p^mu, tau) dv(p_mu, tau)
$

This is the radiation power in the rest frame. It is valid generally.

Explicitly in termos of $av, dot(av)$:

$
  ... = P_"rad" = q^2/(4 pi) 2/3 gamma^6 [abs(dot(av))^2 - abs(av cross dot(av))^2]\
$

We see that acceleration i still needed at very high velocities, for the charge to produce radiation.

For relativistic velocities, effectively $gamma^6 -> infinity$. The radiation power increases dramatically. This is particularly important in particle colliders, where charged particles are accelerated to near light speeds. The enormous energy loss due to this radiation (called synchrotron radiation) is a major design constraint, especially in circular colliders where particles constantly undergo centripetal acceleration. For electrons, which have small mass, this radiation limits the maximum achievable energies in circular accelerators.

Thus comes the question about the most efficient way to accelerate charged particles.

We can have circular accelerators, where the particles are accelerated in a circular path, or linear accelerators, where the particles are accelerated in a straight line.

For circular accelerators:

$
  av perp dot(av) => abs(av cross dot(av)) = abs(av) abs(dot(av))\
  P_("rad") = q^2/(4 pi) 2/3 gamma^6 abs(av)^2 - abs(av)^2 abs(dot(av))^2\
  = q^2/(4 pi) 2/3 gamma^4 abs(dot(av))^2\
$

For linear accelerators, we have:

$
  av parallel dot(av) => abs(av cross dot(av)) = 0\
  P_("rad") = q^2/(4 pi) 2/3 gamma^6 abs(dot(av))^2\
$

This means, that circular accelerators are much more efficient.

So far we have studied the radiation of a single charge only in the $av-> 0$ limit. We can extend this to arbitrary $av$.

$
  dv(P_("rad"), Omega) = q^2/(16 pi^2) abs(dot(av))^2 sin^2(theta)/(1 - v cos theta)^6 , c=1
$

This only holds for $v$ approaching $c$. For very relativistic velocities, we encounter quantum effects, which are not covered by this formula.

== Scattering

We have a charged particle, some radiation hits it and it scatters. Thus it gains energy and momentum.

We have different types of scattering:

- $q$ is free (Thompson scattering)

- $q$ is bound (Rayeigh scattering)

The difference is in how the incident radiation accelerates the charge.

=== Thompson scattering

$
  aE = hat(e) E R_e e^(i(omega t - hat(k) dot hat(r)))\
  = hat(e) E cos(omega t)
$

The force from the radiation on the still charge is:

$
  aF = q aE = q hat(e) E cos(omega t)\
  => dot(av) = aF/m = q/m hat(e) E cos(omega t)\
  dv(P_("rad"), Omega) = q^2/(16 pi^2) abs(dot(av))^2 sin^2(theta)\
  = q^4/(16 pi^2 m^2) sin^2(theta) E^2 cos^2(omega t)\
$

#image("image-1.png")

We can:

- Take a time average

- Convert it to a convenient angle, and then average over the vector of $hat(e)$.

We have to average of all transverse directions, which is done by integrating over the solid angle.


- Measure cross-section

The time average is:

$
  1/T integral_(0, T) dv(P_("rad"), Omega)dd(t), T= 2 pi/omega\
  = <dv(P_("rad"), Omega)> = q^4/(32 pi m^2) E^2 sin^2(theta)\
$

This still depends on the electric field of the laser.

$
  dv(sigma, Omega) = <dv(P_("rad"), Omega)>/<"Flux">\
$

Flux is energy per unit surface per unit time. The flux is:

$
  <"Flux"> = <abs(aS)> = E^2/2\
  dv(sigma, Omega) = q^4/(16 pi m^2) sin^2(theta)\
$

This is almost independent of the electric field, except for the angle.

#image("image-2.png")

$hat(e)$ is on the x-y plane, because $ak$ is on the z-axis. There is another $Psi$ angle, which is random, because the laser is not polarized. We assume, that $Psi$ is uniformly distributed to cover the x-y plane. What is consistent is where the laser is pointing, which is $hat(k)$.

$
  theta = f(Theta, Psi)
$

And then we can average over the $Psi$ angle.

$
  dv(sigma, Omega) = q^4/(16 pi m^2) (1 + cos^2(theta))/2)\
$

Keep in mind, that is assuming that the laser is unpolarized. $Theta$ is the angle between the insident laser/radiation and the observer/detector.

This is the *differential cross-section* for Thompson scattering (EM and free charge $q$ at rest). This is accurate in practice to approximately 1% (because we ignored quantum effects).

In this entire section, we have ignored what happens to the radiation after it hits the charge.

To consider that, let $q$ be at rest $mat(m_q, arrow(0))$. Let $P_gamma = E_gamma mat(1, hat(x))$. Let $P_q^*$ be the final state of the charge after the radiation hits it.

$
  P_q^* = mat(m_q + E_gamma, hat(x))\
  P_q^2 = (m_q + E_gamma)^2 - E_gamma^2 hat(x)^2\
  = m_q^2 + 2 m_q E_gamma != m_q^2
$

This means, that the charge has gained energy from the radiation. This violation can be explained by uncertainy principle with short time scales.

$
  (2 m_q E_gamma) Delta t approx hbar\
$

Other weird things can happen during scattering, like an emission and reabsorbtion of a virtual photon, which is not detectable. This even contributes to the cross-section.

#image("image-3.png")

The corrections to the cross-section are usually small (on the order of 1%), but they can be significant in some cases.

Lets return to the base case of thompson scattering.

$
  dv(sigma, Omega) = q^4/(16 pi m^2) (1 + cos^2(theta))\
$

We assume that this is independent of the frequency of the radiation. This was special to the case of the electron $e^-$ being free and only valid classically.

The crossection takes its maxima on $Theta = 0, pi$. We except most of the radiation to be scattered in the forward and backward directions.

$
  sigma = integral dd(Omega) dv(sigma, Omega) = (8 pi)/3 r_q^2
$

This is expained by the quantity called *Thompsons radius*:

$
  r_q = q^2/(4 pi e0 m c^2)\
  approx 2.8 * 10^(-15) m = 2.8 "fm"\
$

This is an effective radius of the electron if you assign it to a spherical shape.

=== Rayleigh Scattering

The electron is bound in an atom.

#image("image-4.png")

We can imagine the electron as a harmonic oscillator, which is driven by the incident radiation. We also have to account for friction. We model this as a damped harmonic oscillator:

$
  (q E cos(omega t))/m = dot.double(x) + gamma dot(x) + omega_0^2 x\
  aE = E hat(x) cos(omega t)\
$

To solve this, we can use the ansatz:

$
  Re[q (E e^(i omega t)/m = dot.double(x) + gamma dot(x) + omega_0^2 x]\
  => x = x_0 e^(i omega t)\
$

When we differentiate, the exponential remains, and they will cancel out:

$
  x = ((q E e^(i omega t)/m)/(omega_0^2 - omega^2 + i gamma omega))\
  => ax = ((q aE)/m)/(omega_0^2 - omega^2 + i gamma omega)\
$

$gamma$ is the damping coefficient, or friction coefficient. It is proportional to the frequency of the radiation, and it is inversely proportional to the mass of the electron.

$
  => dot(av) = (q aE (-omega)^2)/(m (omega_0^2 - omega^2 + i gamma omega))\
  cos(omega t) = Re(e^(i omega t))\
  = Re(e^(-i omega t))\
$

For a free electron:

$
  omega_0 = 0, gamma = 0\
  => ad(v)_"Thompson" = (q aE)/m\
  => adv_("Rayleigh") = ad(v)_("Thompson") (omega^2)/(omega_0^2 - omega^2 + i gamma omega)\
$

$sigma_("Rayleigh")$ is computed analogously to $sigma_("Thompson")$:

$
  adv_T -> ad(v)_R = ad(v)_T f/omega\
  => omega_R = omega_T (omega^4)/((omega^2 - omega_0^2)^2 + gamma^2 omega^2)\
$

Thompson and Rayleigh scattering happen on the same magnitude, but rayleigh scattering is frequency dependent on $omega_0, omega$.

We use the principle $hbar omega_0 approx$ energy of electron in the atom. The atom is not broken, so the electron is bound. $hbar << hbar omega_0$. For $hbar omega approx hbar omega_0$ we have ionization of the atom, which is not covered by this model.

We want to consider $omega$ in the visible spectrum.

$
  => omega_R approx omega_T (omega^4)/(omega^4) < 1\
$

It means at high frequencies, the Rayleigh scattering is higher.

If we consider full spectrum light radiating on bound electrions, we can see that the Rayleigh scattering is higher at high frequencies, and lower at low frequencies.

If we observe the light at a scattering direction different from the incident direction, we can observe more blue light than red light. This is called *Rayleigh scattering*.

If we observe the incident scattering, we see a reddish light, because the blue light is scattered more than the red light. This is why the sky is blue, and the sun is red at sunset.














