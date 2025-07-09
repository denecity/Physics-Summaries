#import "../../../lib/lib.typ": *

= QED

Maxwell's equations are the classical limit of quantum electrodynamics (QED). In QED, we have to take into account the quantum nature of the electromagnetic field and the particles that interact with it.

In QED, everything is quantized in terms of propability amplitudes.

$
  P = abs(M)^2\
  M = "propability amplitude"\
$

We compute propabilities $P$ for *Events*.  Events are defined as a set of initial and final states.

== Classical propabilities

convencionally, we know propabilities to work the following way:

$
  P(A -> B) = abs(M(A - B))^2\
  A ->^(C_1) B: P_1\
  A ->^(C_2) B: P_2\
  => P = P_1 + P_2\
$


$
  A -> C -> B\
  P(A -> B) dot P(C -> B) = P(A -> B)
$

== Quantum propabilities

$
  A ->^(C_1) B: M_1\
  A ->^(C_2) B: M_2\
  => M = M_1 + M_2\
  P = abs(M)^2 = P_1 + P_2 + 2 Re(M_1^* M_2)\
$

Where $Re(M_1^* M_2)$ is the interference term. This is the quantum mechanical way of computing propabilities.

$
  A -> C -> B\
  M(A -> B) = M(A -> C) M(C -> B)\
$

== Events

An even can be that we have a photon at $t=0$ and an electron and positron $t>0$. This is a transition.

This can be complicated. We use the fact that all events can be composed of simpler events. Eventually we can deduce everything to a set of events that are simple enough to be computed.

Here we have 3 types of events:

+ Photon can move drom $x$ to $y$, where $x$ and $y$ are points in space-time.

  #image("image-5.png")

  For this we have an associated propability amplitude $M(x -> y)$.

+ Electron can move from $x$ to $y$.

  #image("image-6.png")

  For this we have an associated propability amplitude $M_e(x -> y)$.

+ At point $x$ a photon is absorbed or emitted by an electron.

  #image("image-7.png")

  For this we have an associated propability amplitude $M_(e e gamma)$.

+ A photon can split into an electron and a positron.

  #image("image-8.png")

  For this we have an associated propability amplitude $M_(gamma -> e e)$.

Type 1 and 2 are the simplest and very similar.

== Feynman Rules

A photon going from $x$ to $y$ is formulated as:

$
  = integral dd(ax, 4) 1/(2 pi)^4 (e^(-i k dot (x - y))/(k^2 + i delta)) (-g^(mu nu)), delta -> 0\
$

This is a Green's function for the photon propagator:

$
  wave "___" = -g^(mu nu) delta^((4)) (x-y)
$

$k$ can be thought of as the momentum of the photon. If you integrate over all momenta, you get the full propability amplitude.

The most important contribution came from:

$
  k^2 approx 0 -> E_k^2 - abs(ak)^2 = 0\
  => E_k = abs(ak)\
$

This means the photon is massless and travels at the speed of light. This is the rule of the photon propagator.

The $g^(mu nu)$ corresponds to the polarization of the photon. Most of the time we will use the same polarization for all photons, so it will equate to $1$.

For the movement of an electron from $x$ to $y$ we have:

$
  = integral dd(k, 4) 1/(2 pi)^4 e^(-i k dot (x - y))/(k^2 -m_e^2 + i delta) dot slash(k + m 1)\
  slash(k) + m 1 = (gamma^mu k_mu + m_e 1)_(4 cross 4)
$

The numberator is because $k^2 = m_e^2$ in special relativity.

The spinor is a mathematical object that describes the spin of the electron. It is a 4-component object that transforms under Lorentz transformations.

The final rule:

$
  M_(e e gamma) = -i e gamma^mu\
  e = "electric charge"\
  gamma^mu = "Spin of the electron"\
$

If the particle is spinless:

$
  M_(e e gamma) = -i e\
$

The *Fine Structure Constant* is the propability of an electron to emit or absorb a photon. It is a dimensionless constant that characterizes the strength of the electromagnetic interaction between charged particles. It is defined as:

$
  alpha = e^2/(4 pi) <= 1%
$

This means that the interaction between electrons and photons is very weak. This is why we can use the classical approximation of Maxwell's equations for macroscopic systems.

== QED Thompson Scattering

An electron and photon meet in spacetime. The electron absorbs the photon and then emits it again. This is called Thompson scattering.

#image("image-9.png")

To compute the propability amplitude for this process, we can use the Feynman rules we established earlier.

$
  & M_1 =                                                        \
  & M_gamma (x_0 -> z)      &             "photon from x_0 to z" \
  & dot M_e (y_0 -> z)      &           "electron from y_0 to z" \
  & dot M_(e e gamma) (z)   & "photon absorbed by electron at z" \
  & dot M_e (z -> z')       &            "electron from z to z'" \
  & dot M_(e e gamma) (z')  & "photon emitted by electron at z'" \
  & dot M_e (z' -> x_1)     &          "electron from z' to x_1" \
  & dot M_gamma (z' -> y_1) &            "photon from z' to y_1" \
$

There are also other alternative processes that correspond to the same event. We can compute the propability amplitude for each of them and then sum them up.

We have to consider that most processes of an event are extremely complex and unlikely. We only consider the simplest processes that contribute significantly to the propability amplitude.

== QED Rayleigh Scattering

For Rayleigh scattering, we have to consider the interaction of a photon with an electron in the presence of an proton.

This makes the amplitude more complex and depends on the material.

#image("image-10.png")

== Glass Optics

We produce a photon. In order to have reflection, the photon will arrive at the glass and interact with the electrons in the glass. A new photon will be emitted in the direction of the detector. We can see that this is a different photon.

#image("image-11.png")

We choose to compute only the simplest processes which contribute significantly to the propability amplitude.

$
  M(gamma "Laser" -> D)\
  = M(gamma @ "Laser") dot M_gamma (L_-> X_("Glass")) dot M_R dot M_gamma (X -> D)\
  approx M(gamma @ "Laser") dot M_(gamma "classical") (L -> X) M_R dot M_gamma (X -> D)\
  approx M_R dot M (gamma @ "Laser")
$

We can assume that the photon travel in classical paths. To get a full answer, we have to intergrate over all posssible reflection points $X$ in the glass.

$
  integral dd(X, 3) M_R dot M (gamma @ "Laser")\
$

We assume the laser light is monochromatic. That also means that we can't know the exact time of emission of the photon (uncertainty principle).

We find that the amplitude to create a photon at the laser:

$
  M (gamma @ "Laser", t) prop e^(i omega t)
  => M(gamma "from Laser" -> D) = integral dd(X, 3) e^(i omega t) M_R
$

But the time before you detect it depends on the path length $L$. A photon that was created early, will have more possbility of paths compare to photons that were created later. This is why we have to integrate over all possible paths.
