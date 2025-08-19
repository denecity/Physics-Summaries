#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Physics Cheatsheet",
  author: "Denis Titov",
  language: "ENG",
)


= Statistical Mechanics

#section("Microstates vs. Macrostates", intro: [
  Fundamental distinction: microstates are complete microscopic descriptions, macrostates are bulk measurable properties.
])[

  *Microstate:* Complete specification of system - exact position $(q_i)$ and momentum $(p_i)$ of every particle.

  *Macrostate:* Bulk description via measurable quantities: pressure $p$, volume $V$, temperature $T$, particle number $N$.

  *Key relationship:* Single macrostate corresponds to enormous number of microstates.

  *Probability:* Observed macrostate is the one with largest number of associated microstates.

]
#section("Foundational Principles", intro: [
  Equal probability postulate and its consequences for equilibrium and irreversibility in thermodynamic systems.
])[

  *Fundamental postulate:* For isolated system in equilibrium, every microstate is equally likely.

  *Equilibrium:* System occupies macrostate with maximum number of microstates (maximum entropy).

  *Second Law consequence:* Systems evolve toward maximum entropy states because they're statistically overwhelmingly probable.

  *Irreversibility:* Broken egg has vastly more microstates than whole egg - reassembly is possible but probability ≈ 0.

]
#section("Kinetic Theory", intro: [
  Connection between microscopic particle motion and macroscopic gas properties via equipartition theorem.
])[

  *Bridge equations:*
  $
    "Ideal gas law:" p V = N k_B T\
    "Kinetic theory:" p V = N m avg(v_x^2)
  $

  *Equipartition result:*
  $
    1/2 m avg(v_x^2) = 1/2 k_B T
  $

  Average kinetic energy per particle per dimension equals $k_B T/2$.

  *Total kinetic energy* (all three dimensions):
  $
    avg(E_("kin,total")) = 3/2 N k_B T
  $

  Since $avg(v^2) = avg(v_x^2) + avg(v_y^2) + avg(v_z^2) = 3 avg(v_x^2)$.

]
#section("Partition Function", intro: [
  Statistical sum over all states with Boltzmann weighting. Foundation for thermodynamic calculations.
])[

  System of $N$ particles with temperature $T$. They can be $ket(upar)$ or spin down $ket(doar)$. Lets find the thermodynamic properties with the partition function $Z$ and the Boltzmann factor

  $
    "Boltz" = exp(-E_s/(k_B T)) hspace beta = 1/(k_B T) \
    Z = sum_("states" s) exp(-E_s/(k_B T)) = sum exp(- beta E_s)\
  $

  Single Particle:

  $
    Z_1 = exp(-beta E_(upar)) + exp(-beta E_(doar)) = 2 cosh(beta epsilon) hspace E_doar = epsilon = - epsilon_upar\
  $
]
#section("Average Energy", intro: [
  Derive mean energy from partition function via temperature derivative. Gives temperature dependence.
])[

  $
    avg(E) = - pdv(, beta) ln(Z) hspace avg(E_1) = - pdv(, beta) ln(exp(-beta epsilon) + exp(beta epsilon))\
    dv(, x) ln(u) = 1/u dv(u, x) => - epsilon ((exp(beta epsilon) - exp(-beta epsilon))/(exp(beta epsilon) + exp(-beta epsilon))) = -epsilon tanh(beta epsilon)\
  $

  This gives us the average energy of a single particle in the system depending on $beta(T)$.
]
#section("Total Partition Function", intro: [
  For N identical non-interacting particles: total partition function is single-particle partition raised to N.
])[

  For a system composed of $N$ subsystems, that are distuînguishable and non-interacting, the total partition function is the product of the individual partition functions:

  $
    Z_N = Z_1 dot Z_2 dot ... dot Z_N = (Z_1)^N => Z_N = (2 cosh(beta epsilon))^N
  $
]
#section("Total Heat Capacity", intro: [
  Heat capacity at constant volume: temperature derivative of total average energy.
])[

  At constsant volume $V$:

  $
    avg(E_N) = N avg(E_1) hspace C_V = pdv(avg(E_N), T) = pdv(avg(E_N), beta) pdv(beta, T)
  $
]
#section("Black Body Radiation in 2D", intro: [
  Planck distribution in two dimensions: density of states scales as ω² instead of ω³, leading to σT³ Stefan-Boltzmann law.
])[

  For electromagnetic radiation in 2D cavity, the density of states differs from 3D:

  $
    g(omega) dd(omega) = A/(2pi)^2 dot 2 pi omega dd(omega) = (A omega)/(2pi) dd(omega)
  $

  Average energy per mode with Planck distribution:

  $
    avg(E) = (hbar omega)/(exp(hbar omega / (k_B T)) - 1)
  $

  Total energy density in 2D:

  $
    u = integral_0^infinity g(omega) avg(E) dd(omega) = (k_B^3 T^3)/(2pi hbar^2) integral_0^infinity (x^2)/(e^x - 1) dd(x)
  $

  Where $x = hbar omega / (k_B T)$ and $integral_0^infinity (x^2)/(e^x - 1) dd(x) = 2 zeta(3) approx 2.404$.

  Stefan-Boltzmann law in 2D:

  $
    j = (k_B^3 T^3 zeta(3))/(pi hbar^2) prop T^3
  $

  Key difference: 2D radiation scales as $T^3$ instead of $T^4$ (3D).
]
#section("N Spins in Magnetic Field", intro: [
  Complete statistical analysis of N distinguishable spin-1/2 particles in magnetic field: partition function, energy, entropy.
])[

  *Single spin partition function* (energies $E = plus.minus mu B/2$):
  $
    Z_1 = e^(-beta mu B/2) + e^(beta mu B/2) = 2 cosh(beta mu B/2)
  $

  *Total energy* for $n$ aligned spins:
  $
    E = n(-mu B/2) + (N-n)(mu B/2) = (N-2n) mu B/2
  $

  *N-particle partition function and average energy:*
  $
    Z = Z_1^N = [2 cosh(beta mu B/2)]^N\
    avg(E) = -pdv(ln Z, beta) = -N (mu B/2) tanh(beta mu B/2)
  $

  *Average number of aligned spins:*
  $
    avg(n) = N/2 [1 + tanh(mu B/(2 k_B T))]
  $

  At high temperature: $avg(n) -> N/2$ (maximum disorder).

  *Entropy* at maximum disorder ($n = N/2$):
  $
    S = k_B ln binom(N, N/2) approx k_B N ln(2)
  $

  Each spin contributes $k_B ln(2)$ to total entropy.

]
#section("Entropy & Temperature", intro: [
  Boltzmann entropy connects microscopic arrangements to macroscopic properties. Temperature from energy-entropy relation.
])[

  *Boltzmann entropy* (microscopic → macroscopic bridge):
  $
    S = k_B ln(Omega)
  $

  Where $Omega$ is multiplicity (number of microstates for given macrostate).

  *Temperature definitions:*
  $
    "Thermodynamic:" 1/T = (pdv(S, U))_(N,V) hspace "Statistical:" beta = 1/(k_B T) = (pdv(ln Omega, U))_(N,V)
  $

  Low T: entropy changes greatly with added energy (solid).
  High T: entropy barely changes with energy (hot gas).

]
#section("Laws of Thermodynamics", intro: [
  Fundamental rules governing energy, heat, and entropy in physical systems.
])[

  *0th Law:* Thermal equilibrium is transitive - defines temperature scale.

  *1st Law:* Energy conservation:
  $
    Delta U = Q - W
  $

  Internal energy change = heat added - work done by system.

  *2nd Law:* Entropy of isolated system never decreases:
  $
    Delta S >= 0 hspace "("="for reversible processes)"
  $

  Defines "arrow of time" - systems evolve toward maximum entropy.

]
#section("Reversible Processes", intro: [
  Idealized quasi-static processes through succession of equilibrium states. Fundamental thermodynamic relation.
])[

  *Definition:* Infinitely slow process maintaining thermal equilibrium at each step.

  *Fundamental thermodynamic relation:*
  $
    dd(U) = T dd(S) - p dd(V)
  $

  Combines 1st and 2nd laws for reversible processes.

  *Microstate relations:*
  $
    pdv(E_s, V) = -p_s hspace "and" hspace g = dd(N)/dd(V)
  $

  Where $p_s$ is pressure contribution from microstate $s$, $g$ is particle density.

]
#section("Advanced Partition Function", intro: [
  Canonical ensemble: weighted sum over microstates. Contains all thermodynamic information of system.
])[

  *Canonical partition function:*
  $
    Z = sum_s e^(-beta E_s) hspace "where" beta = 1/(k_B T)
  $

  *Probability of microstate s:*
  $
    P(s) = (e^(-beta E_s))/Z
  $

  *Distinguishable vs. indistinguishable particles:*
  $
    "Distinguishable:" Z = Z_("sp")^N hspace "Indistinguishable:" Z = Z_("sp")^N/N!
  $

  The $1/N!$ factor resolves Gibbs paradox for identical particles (avoids overcounting).

]
#section("Maxwell-Boltzmann Distribution", intro: [
  Speed distribution in thermal equilibrium gas. Characteristic speeds: most probable, average, RMS.
])[

  *Speed distribution:*
  $
    n(v) = 4 pi N (m/(2 pi k_B T))^(3/2) v^2 e^(-m v^2/(2 k_B T))
  $

  *Characteristic speeds:*
  $
    "Most probable:" v_p = sqrt((2 k_B T)/m)\
    "Average:" avg(v) = sqrt((8 k_B T)/(pi m))\
    "RMS:" v_("rms") = sqrt((3 k_B T)/m)
  $

  RMS speed most directly related to kinetic energy: $1/2 m v_("rms")^2 = 3/2 k_B T$.

]
#section("Equipartition Theorem", intro: [
  Each quadratic energy term contributes ½kᵦT. Quantum effects cause "freezing out" at low temperatures.
])[

  *Classical equipartition:* Each quadratic term in energy contributes $1/2 k_B T$ to average energy.

  *Examples:*
  $
    "Monatomic gas (3 translational):" U = 3/2 N k_B T\
    "Diatomic gas (3 trans + 2 rot):" U = 5/2 N k_B T
  $

  *Specific heat:*
  $
    C_V = (pdv(U, T))_V
  $

  *Quantum limitation:* At low T, rotational/vibrational modes "freeze out" - not enough energy to excite quantized levels. $C_V$ decreases, violating classical prediction.

  This failure led to quantum mechanics development.

]
#section("Planck's Law of Radiation", intro: [
  Quantum theory of black body radiation. Density of states × quantum average energy per mode.
])[

  *Spectral energy density* (3D cavity):
  $
    rho(nu) dd(nu) = (8 pi h nu^3)/c^3 1/(e^(h nu/(k_B T)) - 1) dd(nu)
  $

  *In terms of angular frequency:*
  $
    rho(omega) dd(omega) = (hbar omega^3)/(pi^2 c^3) 1/(e^(hbar omega/(k_B T)) - 1) dd(omega)
  $

  *Density of states* (modes per unit volume per frequency):
  $
    g(nu) = (8 pi nu^2)/c^3 hspace "Average energy per mode:" avg(E) = (h nu)/(e^(h nu/(k_B T)) - 1)
  $

  Quantum hypothesis: energy quantized in units of $h nu$.

]
#section("Radiation Approximations", intro: [
  Wien and Rayleigh-Jeans limits of Planck's law. Classical fails at high frequency (UV catastrophe).
])[

  *Wien approximation* (high frequency: $h nu >> k_B T$):
  $
    rho(nu) approx (8 pi h nu^3)/c^3 e^(-h nu/(k_B T))
  $

  Valid for short wavelengths (blue/UV region).

  *Rayleigh-Jeans law* (low frequency: $h nu << k_B T$):
  $
    rho(nu) approx (8 pi nu^2 k_B T)/c^3
  $

  Classical limit, valid for long wavelengths but predicts infinite total energy (ultraviolet catastrophe).

]
#section("Stefan-Boltzmann & Wien Laws", intro: [
  Total radiation power scales as T⁴. Peak wavelength inversely proportional to temperature.
])[

  *Stefan-Boltzmann law:*
  $
    "Energy density:" u(T) = a T^4 hspace "Emittance:" j(T) = sigma T^4
  $

  Where:
  $
    sigma = (2 pi^5 k_B^4)/(15 h^3 c^2) approx 5.67 times 10^(-8) "W m"^(-2) "K"^(-4)
  $

  *Wien displacement law:*
  $
    lambda_("peak") = b/T hspace "where" b = 2.898 times 10^(-3) "m K"
  $

  Hot objects shift from red → yellow → white as temperature increases.

  *Relation between constants:*
  $
    a = (4 sigma)/c
  $

]
#section("Wave & Particle Relations", intro: [
  Molecular flux rates and time-bandwidth uncertainty relation for wave packets.
])[

  *Molecular flux* (effusion rate):
  $
    R = 1/4 n avg(v)
  $

  Rate at which gas molecules strike surface per unit area. Where $n$ is number density, $avg(v)$ is average speed.

  *Time-bandwidth product* (uncertainty principle for waves):
  $
    Delta nu Delta t >= 0.44
  $

  Short pulses require broad frequency spectrum. Fundamental Fourier transform property - cannot have both narrow time and narrow frequency simultaneously.

]