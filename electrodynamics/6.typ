#import "lib.typ": *

= Macroscopic Maxwell Equations in a Medium

We want to look at the Maxwell equations at large scales.

We have to find a way to simulate the interactions of the electromagnetic field without having to solve the microscopic equations of motion for each individual charge.

We are seeking an effective theory description. That means we will not use the full theory, but one that is valid at large scales. It relies on physical simplifications.

Macroscopically our full theory needs to be computed in the limit. This means replacing the full theory with the effective theory in the limit.

== The Effective Theory

We use the fact that the atomic length is much smaller than our macroscopic length scales. Practically, if we take a metal, it will have some density of charges $rho$ and some current. The electrons are behaving as free parricles and can travel large distances.The distance covered by macroscopic currents are much larger than currents in an atom.

If we have a polarizen medium with atoms and electrons in each of them. If we shine radiations on these atoms without destroying them, the wavelength will be large for the incident beams. The beam will not interact with the individual atoms because it is much bigger than a single atom.

Thus we take maxwells theory $partial_mu F^(mu nu) = J^nu$ and average over atomic scales. This will be our first examle of an effective theory.

== Atomic Approximation

In an atom, the constituent charges are restricted to small distances but move very fast. Collective mostions of charges ar assumed to be slow and long ranged.

On our scales, we can average the position and velocity of charges.

$
  g(ax) = "measured property of particle"\
  f(ay) = "propability/density of particle"\
  integral g(ax - ay) f(ay) dd(ay, 3) = <g(ax)>
$

Let $f(ay)$ be smooth, positive definite and normalized $integral f(ay) = 1$.

We can average the current density $J^mu$.

$
  J^mu = J_"free"^mu + J_"atomic"^mu\
  ≈ J_"free"^mu + <J_"atomic"^mu>\
$

== Average atomic charge density

$
  rho_"atomic" = sum_(n in "atoms") rho_((n))\
  rho_((n)) (ax) = sum_(j in (n)) q_j rho(ax - ax_y - ax_j)\
  avg(rho_"atomic" (ax)) = sum_n avg(rho_((n)) (ax))\
  avg(rho_n (ax)) = integral dd(ay, 3) (sum_j q_j delta(ax - ax_y - ax_j - ay)) f(ay)\
  avg(rho_n (ax)) = sum_j q_j f(ax - ax_y - ax_j)\ 
$
We can use that $abs(ax - ax_y) >> ax_j$. Thus we can taylor expand ind $abs(ax_j)/abs(ax_y - ax_j)$.

$
  f(ax - ax_y - ax_j) approx f(ax - ax_y) - ax_j dot anabla f(ax - ax_y) + o(ax_j^2)\
  => avg(rho_n (ax)) = sum_j q_j f(ax - ax_y) - ax_j dot anabla f(ax - ax_y) + o(ax_j^2)\
  approx q_n f(ax - ax_y) - (sum_j q_j ax_j) dot anabla f(ax - ax_y)\
  approx q_n f(ax - ax_y) - aPhi dot anabla f(ax - ax_y)\
$

The first term is the average charge density of the atom, the second term is the dipole moment of the atom.

$
  = avg(q_n delta(ax - ax_y)) - anabla dot (aP_n f(ax - ax_y))\
  = avg(q_n delta(ax - ax_y)) - anabla dot avg(aP_n delta(ax - ax_y))\
$

We need to sum over all the atoms:

$
  avg(rho_A (ax)) = avg(sum_n q_n delta(ax - ax_y))\
  aP = avg(sum_n aP_n delta(ax - ax_y))\
$

Where $aP_n$ is the dipole moment of the atom.

$
  => avg(rho_A (ax)) = rho_(A "eff") - anabla dot aP\
$

$aP$ is also called the polarization vector of the medium.

$
  ap_n = sum_j q_j ax_j\
  sum_j q_j f(ax - ax_y - ax_j) approx g_j f(ax - ax_y) - sum_j (ax_j q_j) dot  anabla f(ax - ax_y)\
$

Now we can do the same approximations for the current density $aJ_A$.

We will use that $abs(ax_j) << abs(ax - ax_y)$ and

$
  av_j = dv(ax_j, t)\
  abs(av_j) << abs(av_y)
  avg(aJ_n) = sum_j q_j (av_n + av_j) dot f(ax - ax_y - ax_j)\
$

We can use the same approximation as before:

$
  f(ax - ax_y - ax_j) approx f(ax - ax_y) - ax_j dot anabla f(ax - ax_y)\
  => avg(aJ_n) = sum_j q_j av_j f(ax - ax_y) + sum_j q_j av_y f(ax, ax_y) - sum_j q_j av_j (ax_j dot anabla f(ax - ax_y)) + o\
$

The first term ist dominant, the other two are of the same small order.

$
  sum_j q_j av_j f(ax - ax_y) = sum_j q_j dv(ax_j, t) f(ax - ax_y)\
  = sum_j dv(aP_j, t) f(ax - ax_y)\
  = dv(, t) (sum_j aP_n f(ax - ax_y)) - aP_n dv(, t) f(ax - ax_y)\
$

$
  => sum_j q_j av_j f(ax - ax_y)\
  approx dv(, t) (aP_n f(ax - ax_y))\
$

Further:

$
  sum_j q_j av_j (ax_j dot anabla f(ax - ax_y))\
  = sum_j {q_j/2 av_j (ax_j dot anabla f) - q_j/2 ax_j (av_j dot anabla f)} + sum_j q_j/2 dv(,t) ( ax_j (ax_j dot anabla f))\
$

We split of the term into a symmetric and an antisymmetric part.

The last term is a risky approximation, because it is not clear that the time derivative of a small quantity is also small. We will assume that it is small.

$
  => sum_j q_j av_j ax_j dot anabla f(ax - ax_y) approx sum_j q_j/2 av_j (ax_j dot anabla f(ax - ax_y)) - ax_j (av_j dot anabla f(ax - ax_y))\
  aa cross (ab cross ac) = aa (ab dot ac) - ab (aa dot ac)\
  => = - anabla cross (am_n f(ax - ax_y))\
  am_n = sum_j q_j/2 (ax_j cross av_j)\
$

Putting it all together we get:

$
  avg(aJ_A) = sum_n avg(aJ_n)\
  = aJ_("eff" A) "pointlike with systems vel."\
  + pdv(aP, t)\
  + anabla cross aM\
  aM = sum_n (am_n f(ax - ax_y))\
$

The equation above describes the average angular momentum decomposition. Here, $avg(aJ_A)$ represents the average total angular momentum of system A, which equals the sum of average angular momenta $avg(aJ_n)$ of all constituent particles. This can be expressed as three components: (1) $aJ_("eff" A)$ - the effective angular momentum treating the system as a point-like object moving with the system's velocity; (2) $pdv(aP, t)$ - the time derivative of linear momentum, accounting for changes in the system's overall motion; and (3) $anabla cross aM$ - the cross product between the gradient operator and magnetic moment $aM$. The magnetic moment itself is defined as the sum of individual moments $am_n$ weighted by the distribution function $f(ax - ax_y)$.

Summary:

$
  J^mu = J^mu_("free") + avg(J^mu_("atomic"))\
  J^0 = J_("eff")^0 "atoms viewed as pointlike"\
  + anabla (-aP) "div of avg electric dipole moment"\
  aJ = aJ_("eff") "everthing thats moving freely"\
  + pdv(aP, t) "time derivative of avg electric dipole moment"\
  + anabla cross aM "magnetic moment of the system"\
$

We can now write the macroscopic Maxwell equations in a medium:

$
  anabla dot aB = 0\
  anabla cross aE = -pdv(aB, t)\
  anabla dot aE = rho/e0 approx (rho_("eff") - anabla dot aP)/e0\
  => anabla dot (e0 aE + aP) = rho_("eff")\
  anabla cross aB = aJ/(e0 c^2) + pdv(aE, t) 1/c^2\
  approx (aJ_("eff") + pdv(aP, t) + anabla cross aM)/(e0 c^2) + pdv(aE, t) 1/c^2\
  => anabla cross (aB - aM/(e0 c^2)) = J_("eff")/(e0 c^2) + pdv(aE, t) 1/(e0 c^2)(e0 aE + aP)\
  aH =  aB - aM/(e0 c^2)\
  aD = e0 aE + aP\
  anabla dot aD = rho_("eff")\
  anabla cross aH = J_("eff")/(e0 c^2) + pdv(aD, t) 1/(e0 c^2)\
  anabla dot aB = 0\
  anabla cross aE = -pdv(aB, t)\
$

All of this is an approximation. 

Lets look at the speicla case of a material, that cannot get magnetized $aM = 0$ (e.g. a dielectric). $aE$ and $aP$ are correlated.

$
  aP = 0 "if" aE = 0\
$

Ignoring nonlinear effects, we can write:

$
  aP = e0 chi aE\
  chi = "electric susceptibility"\
$

Maxwells equations simplify to:

$
  anabla dot aE = rho/(e0 (1 + chi))\
  anabla cross aE = -pdv(aB, t)\
  anabla dot aB = 0\
  anabla cross aB = J_"eff"/(e0 c^2) + pdv(aE, t) (1 + chi)/(c^2)\
  = J_"eff"/(e0 (1 + chi) (c/sqrt(1 + chi))^2) + 1/((c/sqrt(1 + chi))^2) pdv(aE, t)\
$

We define:

$
  c_m = c/sqrt(1 + chi)\
  epsilon = e0 (1 + chi)\
  => anabla dot aE = rho_"eff"/epsilon\
  anabla cross aE = -pdv(aB, t)\
  anabla dot aB = 0\
  anabla cross aB = J_"eff"/(epsilon c_m^2) + 1/(c_m^2) pdv(aE, t)\ 
$

Where $c_m$ is the speed of light in the medium and (it is complex because of losses), and $epsilon$ is the permittivity of the medium.

To understand $aP = chi epsilon aE$, we can look at the miscroscopic level.

$
  aE = aE ( ax ,t) "arbitrary"
$

In physics, some functions are plane waves. A supersposition of  plane waves can represent any arbitrary function. Lets take a look at the plane wave:

$
  hat(E) = aE e^(i (omega t - k dot ax))\
$

For a single atom we approximate it as a dipole with the negative charge being somewhere outside and positive being in the center. If we subject the atom to the electromagnetic field, there will be some acceleration.

$
  q aE = m (addx + gamma  adx + omega_0^2 x )\
  omega_0 = "resonance frequency of the atom"\
$

We can be more precise, and refine the harmonic oscillator model to something nonlinear, but we will not do that here.

The solution for the microscopic model is:

$
  ax = (q aE/m)/(omega_0^2 - omega^2 + i gamma omega)\
$

Same as in Rayleigh scattering. With this we can know die dipole moment of the atom:

$
  ap = q ax = (q^2/m)/(omega_0^2 - omega^2 + i gamma omega) aE\
  ap = "dipole moment of the atom"\
  => avg(aP) = N ax\
  N = "density of charges"\
  => = ((N q^w)/m)/(omega_0^2 - omega^2 + i gamma omega) aE = aP\
  aP = "polarization of the medium"\
  = chi epsilon aE\
  => chi(omega) = (N q^2/m)/(omega_0^2 - omega^2 + i gamma omega)\
$

We can see that for a plane wave, the succeptibility is a complex function that is frequency dependent. 

In Maxwell's equations, $chi$ was used twice. To recalibrate the charges $epsilon$ and to change the speed of light in the medium $c_m$. This implies that the speed of light in the medium and the permittivity of the medium are complex.

We consider an EM wave in a medium with:

$
  hat(J)_"eff" = rho_"eff" = 0\
  => anabla dot aE = 0\
  anabla dot aB = 0\  
  anabla cross aE = -pdv(aB, t)\
  anabla cross aB = pdv(aE, t) (1 + chi)/(c_m^2)\
$

If we combine them:

$
  [1/(c_m^2) pdv(, t, 2) + anabla] aE = 0\
  => hat(E) = aE_0 e^(i (omega t - ak dot ax))\
  => k^2 = omega^2/(c_m^2)\
  = omega^2/c_m^2 (1 + chi)\
  => v_"phase" = omega/abs(ak) = c/n\
  n = sqrt(1 + chi)\
$

Lets look at $n$:

$
  n = n_R - i n_I\
  aE = aE_0 e^(i omega [t - n_R/c hat(k) dot ax] e^(- omega/c n_I hat(k) dot ax))\
  hat(k) parallel ax "if" n_I > 0\
$

We found that:
$
  chi(omega) = ((q N)/(e0 m))/(omega_0^2 - omega^2 + i gamma omega)\
  c_m = c/sqrt(1 + chi)\
  => Im(chi) "supression of the wave in the medium"\
$

=== Metal

We will now look at the special case of a metal:

$
  omega_0 = 0\
  chi(omega) = (N q^2)/(e0 m)/(- omega^2 + i gamma omega)\
$

For a metal the $gamma$ is related to what we macroscopically call resistance or its inverse (conductivity).

$gamma$ is given untimately by Ohms law:

$
  q aE = m (addx + gamma adx)\
  aE = "const"\
  q hat(E) = m (adv + gamma av)\
  => av = av_"drift" + av_0 e^(- gamma t)\
$

$v_0$ vanishes at large times and:

$
  av_"drift" = q aE/(m gamma)\
$

This is the equilibrium drift velocity of the electrons in the metal when voltage acceleration and resistance are balanced.

$
  aJ = N q av_"drift" = (n q^2)/(m gamma) aE\
  => aJ = sigma aE\
  sigma = "conductivity"
  => gamma = (N q^2)/(m sigma)\
$

This relates the microscopic susceptibility to the macroscopic conductivity. Now we can relate $chi$ to a macroscopic quantity.

We will look at the behavior in two limits:

- $omega << gamma$

Low frequency.

$
  n = "index of refraction"\
  n^2 = 1 + ((N q^2)/(e0 m))/(- omega^2 + i omega (N q^2)/(m sigma))\
  => n^2 ≈ -i sigma/(e0 omega)\
  => n^2 sqrt(sigma/(e0 omega)) (1 - i)/sqrt(2)\
$

We notice that the index of refraction is complex. The real part is the refractive index, the imaginary part is the absorption coefficient.

$
  aE = aE_0 e^(i (omega t - ak dot ax))\
  = aE_0 e^(i omega(t - ak/omega dot ax))\
  = aE_0 e^(i omega(t - abs(k)/omega cross cos phi)\
  = aE_0 e^(i omega(t - n x/c cos phi))\
  = aE_0 e^(i omega(t - (n_R . i n_I) x/c cos phi))\
  = aE_0 e^(i omega(t - n_R x/c cos phi)) e^(- n_I omega x/c cos phi)\
  n_I = sqrt(sigma/(2 e0 omega))\
  abs(aE) = abs(aE_0) e^(- sqrt((sigma omega)/(2 e0) x cos phi))\
  = abs(aE_0) e^(- x/delta cos phi)\
$

$
  abs(aE) = abs(aE_0) e^(- x/delta)\
  delta = sqrt((2 e0)/sigma omega) c\
$

With a frequency of $10^4$ MHz:

$
  delta approx 6.7 * 10^(-7) "m"\
$


- $omega >> gamma$

High frequency limit.

$
  n^2 = 1 + ((N q^2)/(e0 m))/(- omega^2 + i omega (N q^2)/(m sigma))\
  => n^2 ≈ 1 - ((N q^2)/(e0 m))/omega^2\
  => omega_p^2 = (N q^2)/(e0 m)\
  omega_p = "plasma frequency"\
  => n^2 ≈ 1 - omega_p^2/omega^2\
$

for $omega_p < omega => n^2 > 0 => n$ real. This means periodic wave propagation.

When $omega > omega_p => n^2 < 0 => n$ conplex. This means that the wave is damped and dies off after some length.

This means that metals become transparent at high frequencies. The plasma frequency is the frequency at which the metal becomes transparent.

== Reflection and Refraction

We have materials with refraction indices $n_1, n_2$. An incident wave with angle $phi_1$ will be reflected and refracted at the interface between the two materials.

The wave satisfies Maxwell's equations at every point, especially at the interface. 

Assume that $n_1$ is very different from $n_2$. Maxwell's equations in the boundary region:

$
  anabla dot aE = -1/e0 anabla dot aP\
  => partial_x aE_x + partial_y aE_y + partial_z aE_z = -1/e0 (partial_x aP_x + partial_y aP_y + partial_z aP_z)\
$

The interface is at $x = 0$. $partial_x aE_x$ is large in comparison to the other terms. For close to the boudary:

$
  pdv(, x) E_x = -1/e0 pdv(, x) P_x\
  => (E_x_2 - E_x_1)/(x_2 - x_1) = -1/e0 (P_x_2 - P_x_1)/(x_2 - x_1)\
  => E_x_2 e0 + P_x_2 = E_x_1 e0 + P_x_1\
$

We can repeat this for the other maxwell equations. We get:

$
  anabla cross aE = - pdv(aB, t)\
  => pdv(E_z, x) approx 0\
  => pdv(E_y, x) approx 0\
$

As we go to the boundary we have a parallel and perpendicular component of the electric field. The parallel part is the same close to the boundary. Also the magnetic field is the same close to the boundary.

$
  aE_1_parallel = aE_2_parallel\
  aB_1 = aB_2\
$

The transverse components must fulfill the boundary conditions:

$
  (e0 aE_1 + aP_1)_perp = (e0 aE_2 + aP_2)_perp\
$

== Fresnel Equations

Let's derive the Fresnel equations directly from the boundary conditions we established at the interface between two media. We'll use Maxwell's equations and the continuity conditions at the boundary.

Consider two media with different refractive indices $n_1$ and $n_2$, with the interface at $x = 0$. From our boundary conditions, we know:

$
  aE_1_parallel = aE_2_parallel\
  aB_1_parallel = aB_2_parallel\
  (e0 aE_1 + aP_1)_perp = (e0 aE_2 + aP_2)_perp\
  aB_1_perp = aB_2_perp
$

For dielectric media where $aP = e0 chi aE$:

$
  e0(1 + chi_1)aE_1_perp = e0(1 + chi_2)aE_2_perp\
  => e0 epsilon_1 aE_1_perp = e0 epsilon_2 aE_2_perp\
  => n_1^2 aE_1_perp = n_2^2 aE_2_perp
$

Let's consider a plane wave incident on the boundary:

$
  aE_i = aE_0_i e^(i(ak_i dot ax - omega t))
$

For s-polarization (TE mode), where the electric field is perpendicular to the plane of incidence:

$
  aE_"inc" + aE_"refl" = aE_"trans" \ 
$

For the magnetic field, from Maxwell's equation $anabla cross aE = -pdv(aB, t)$, we get:
$
  ak_"inc" cross aE_"inc"/omega + ak_"refl" cross aE_"refl"/omega = ak_"trans" cross aE_"trans"/omega\
$

Using $abs(ak) = n omega/c$ and applying the boundary conditions:

$
  n_1(cos(theta_1)aE_"inc" - cos(theta_1)aE_"refl") = n_2 cos(theta_2)aE_"trans"
$

Solving these equations simultaneously:

$
  r_s = (aE_"refl")/(aE_"inc") = (n_1 cos(theta_1) - n_2 cos(theta_2))/(n_1 cos(theta_1) + n_2 cos(theta_2))\
  t_s = (aE_"trans")/(aE_"inc") = (2n_1 cos(theta_1))/(n_1 cos(theta_1) + n_2 cos(theta_2))
$

For p-polarization (TM mode), where the magnetic field is perpendicular to the plane of incidence:

$
  aE_"inc" cos(theta_1) - aE_"refl" cos(theta_1) = aE_"trans" cos(theta_2)\
$

Using the boundary condition for the magnetic field:

$
  (n_1/c)(aE_"inc" + aE_"refl") = (n_2/c)aE_"trans"
$

This yields:

$
  r_p = (aE_"refl")/(aE_"inc") = (n_2 cos(theta_1) - n_1 cos(theta_2))/(n_2 cos(theta_1) + n_1 cos(theta_2))\
  t_p = (aE_"trans")/(aE_"inc") = (2n_1 cos(theta_1))/(n_2 cos(theta_1) + n_1 cos(theta_2))
$

These are the Fresnel equations derived directly from the electromagnetic boundary conditions. They describe how the amplitudes of reflected and transmitted waves relate to the incident wave at the interface between two media.

For completeness, Snell's law $n_1 sin(theta_1) = n_2 sin(theta_2)$ emerges from the requirement that the phase matching condition holds at the boundary, ensuring that the tangential components of the wave vectors are equal across the interface. 








