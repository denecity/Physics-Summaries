#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Astro",
  author: "Denis Titov",
  language: "Eng",
)

= Basics

#section("Units")[
  - *Angles*:
    $
      & 1'' approx 4.8dot 10^(-6) ["rad"] hspace     && "Arcsecond" \
      & 1 "mas" approx 4.8dot 10^(-9) ["rad"] hspace && "Milliarcsecond" \
    $
  - *Distances*:
    $
      & "AU" approx 1.5dot 10^(11) ["m"] hspace                   && "Astronomical Unit (Earth-Sun distance)" \
      & "ly" approx 9.46dot 10^(15) ["m"] hspace                  && "Light Year" \
      & "pc" approx 3.09dot 10^(16) ["m"] approx 3.26 ["ly"] hspace && "Parsec (Distance for 1'' parallax)" \
      & "kiloparsec" hspace                                     && "Galactic Scale" \
      & approx"megaparsec" hspace                               && approx "Cosmology Scale"
    $


  - *Solar Units* (for Stellar and Galaxy Properties):
    $
      & M_sun approx 1.99 dot 10^(30) ["kg"] hspace   && "Solar Mass" \
      & R_sun approx 6.96 dot 10^(8) ["m"] hspace     && "Solar Radius" \
      & L_sun approx 3.83 dot 10^(26) ["W"] hspace    && "Solar Luminosity" \
      & M_oprod approx 5.97 dot 10^(24) ["kg"] hspace && "Earth Mass" \
      & R_oprod approx 6.37 dot 10^(6) ["m"] hspace   && "Earth Radius"
    $
  - *Cosmology Units*:
    $
      & H_0 approx 100 h ["km"/("s" dot "Mpc")] hspace                                           && "Hubble Constant" \
      & rho_"crit" = 3 H_0^(2) / (8 pi G) approx 1.88 dot h^(2) dot 10^(-26) ["kg"/"m"^3] hspace && "Critical Density" \
    $

  - *Constants*:
    $
      & c = 2.99792458 dot 10^8 ["m"/"s"] hspace        && "Speed of light" \
      & G = 6.674 dot 10^(-11) ["m"^3/("kg" dot "s"^2)] hspace && "Gravitational constant" \
      & h = 6.626 dot 10^(-34) ["J" dot "s"] hspace     && "Planck constant" \
      & hbar = 1.055 dot 10^(-34) ["J" dot "s"] hspace  && "Reduced Planck constant" \
      & k_B = 1.381 dot 10^(-23) ["J"/"K"] hspace       && "Boltzmann constant" \
      & sigma = 5.670 dot 10^(-8) ["W"/("m"^2 dot "K"^4)] hspace && "Stefan-Boltzmann constant" \
      & a_B = 7.566 dot 10^(-16) ["J"/("m"^3 dot "K"^4)] hspace && "Radiation constant" \
      & m_p = 1.673 dot 10^(-27) ["kg"] hspace          && "Proton mass" \
      & m_e = 9.109 dot 10^(-31) ["kg"] hspace          && "Electron mass" \
      & e = 1.602 dot 10^(-19) ["C"] hspace             && "Elementary charge" \
      & epsilon_0 = 8.854 dot 10^(-12) ["F"/"m"] hspace && "Vacuum permittivity" \
    $
]

#section("Equatorial Coordinates")[
  Origin: Earth Center,

  - *Declination*: $delta = 0 deg$ equator, $90 deg$: NP, $-90 deg$: SP.

  - *Right Ascention*: $alpha in [0 deg, 360 deg]$ or $[0 h, 24 h]$, increases eastward from vernal equinox.

    When equatorial plane intersects ecliptic plane at vernal equinox, stars fixed, planets move eastward.
]

#section("Galactic Coordinates")[
  Origin: Sun Center,

  - *Galactic Latitude*: $b = 0 deg$ galactic plane, $90 deg$: NGP, $-90 deg$: SGP.

  - *Galactic Longitude*: $l in [0 deg, 360 deg]$, increases clockwise from galactic center.

  #image("/assets/image.png", width: 70%)
]

#section("Obserational Flux Units")[
  - *Luminosity*: Energy/Time emmited by source, $L$ in Watts.

  - *Flux*: Energy/(Time Area) received from source, $F = L/(4 pi d^2)$ in $W/m^2$.

  - *Apparent Magnitude*: 2 Sources with fluxes $F_1, F_2$ have magnitudes $m_1, m_2$ related by: $m_1 - m_2 = -2.5 log_(10) (F_1/F_2)$. A difference of 5 mag corresponds to factor 100 in flux. Brighter sources have smaller (even negative) apparent magnitudes.

  - *Absolute Magnitude*: Apparent magnitude at distance of 10 $pc$. Distance Modulus: $m - M = 5 log_(10) (d/10 pc)$.

  - *UBV Magnitude System*: (Ultraviolet, Blue, Visual) Magnitudes measured through different filters, e.g. $B - V$ color index measures color of star (temperature).

  - *Extinction*: Dimming of starlight by interstellar dust. $A_V$ in magnitudes at visual wavelengths. $m = M + 5 log_(10) (d/(10 pc)) + A_V$.
]

#section("Flux, Opacity and Optical Depth")[
  - *Specific Intensity*: $I_nu$ Power per Unit Area per Unit Solid Angle per Unit Frequency. Conserved along ray in absence of emission/absorption. Unit: $[W/(m^2 dot sr dot Hz)]$.

  - *Flux*: $F_nu = integral I_nu cos theta dd(Omega)$ what hits your detector. Unit: $[W/(m^2 dot Hz)]$.

  - *Bolometric Flux*: $F = integral F_nu dd(nu)$.

  - *Telescope power from patch in sky*: $P = integral_(Delta nu) integral_A integral_Omega I_nu cos theta dd(Omega) dd(A) dd(nu)$.

  - *Emission Coefficient*: $j_nu$ Power emitted per Unit Volume per Unit Solid Angle per Unit Frequency. Unit: $[W/(m^3 dot sr dot Hz)]$. From Blackbody, Bremsstrahlung, Synchrotron, etc.

  - *Absorption Coefficient*: $alpha_nu$ Fractional decrease in $I_nu$ per Unit Length. Unit: $[m^(-1)]$. $alpha = n sigma$ with $n$ number density and $sigma$ cross-section.

  - *Source Function*: $S_nu = j_nu/alpha_nu$ with units of $I_nu$. Effective intensity of emission/absorption process.

  - *Kirchhoffs Law*: In thermal equilibrium, $S_nu = B_nu (T)$ (Blackbody Intensity). $=> j_nu = alpha_nu B_nu (T)$.

  - *Radiative Transfer Equation*: $dv(I_nu, s) = j_nu - alpha_nu I_nu = - alpha_nu (I_nu - S_nu)$ along a ray.

  - *Optical Depth*: $dd(tau_nu) = alpha_nu dd(s) hspace => tau_nu = integral alpha_nu dd(s) hspace dv(I_nu, tau_nu) = S_nu - I_nu$. Is medium optically thin ($tau_nu << 1$) or thick ($tau_nu >> 1$)?

  - *Pure Absorption*: $I_nu (tau_nu) = I_nu (0) e^(-tau_nu)$.

  - *General Solution*: $I_nu (tau_nu) = I_nu (0) e^(-tau_nu) + integral_0^(tau_nu) S_nu (tau'_nu) e^(-(tau_nu - tau'_nu)) dd(tau'_nu)$.

  - *Mean Free Path*: $l_nu = 1/(alpha_nu)$ average distance photon travels before being absorbed/scattered.

  - *Opacity*: $chi_nu = alpha_nu/rho, hspace alpha = rho chi_nu$ with units of $[m^2/kg]$. How strongly 1 kg of material absorbs/scatters radiation at frequency $nu$.

  - *Solutions for RTE*:
    - Empty Space ($j_nu = 0 = alpha_nu$): $I_nu (s) = I_nu (0)$.
    - Matter does not emit ($j_nu = 0$): $I_nu (tau_nu) = I_nu (0) e^(-tau_nu)$.
    - General Case $(j_nu != 0 != alpha_nu)$: $I_nu (tau_nu) = I_nu (0) e^(-tau_nu) + integral_0^(tau_nu) S_nu (tau'_nu) e^(-(tau_nu - tau'_nu)) dd(tau'_nu)$.
    - Matterr with constant Properties $(S_nu (tau_nu) = S_nu = "const")$: $I_nu (tau_nu) = I_nu (0) e^(-tau_nu) + S_nu (1 - e^(-tau_nu))$.
      - Optically Thin ($tau_nu << 1$): $I_nu approx I_nu (0) + S_nu tau$.
      - Optically Thick ($tau_nu >> 1$): $I_nu approx j_nu L .-> S_nu$, where $L = integral dd(s)$

  - *For Stars*: Radiative Transfer in stellar atmospheres, assuming steady state, no curvature, LTE and optically thick with z-axis facing outward. Consider ray alond $dd(arrow(s))$, angled at $theta$ to normal.
    $
      dd(z) = cos theta dd(s) hspace I_nu (ar, t, hat(n)) = I_nu (z, theta) hspace "LTE": T = T(z)\
      => "RTE": I_nu = B_nu - (cos theta)/alpha_nu pdv(I_nu, z)\
      "Moments": P_nu approx (4 pi)/(3 c) B_nu (T) hspace F_nu = - c/a_nu dv(P_nu, z) = - (4 pi)/(3 alpha_nu) dv(B_nu, T)u dv(T, z)\
      F = integral F_nu dd(nu) = - c/alpha_R dv(, z) (a_B/3 T^4) = - c/(chi rho) dv(, z) (a_B/3 T^4) hspace alpha_R = rho chi_R
    $
]

#section("Sun Dynamics")[
  - *Local Thermal Equilibrium (LTE)*: Matter and Radiation in equilibrium locally, but not globally.

  - *Stellar Interiors are Thick*: Photons undergo many absorptions/scatterings before escaping, $tau_nu >> 1 => I_nu approx S_nu = B_nu (T)$. Energy Flow is set by temperature gradient.

  - *First Order Diffusion Approximation*: $I_nu approx B_nu (T) - (cos theta)/alpha_nu pdv(B_nu, T) dv(T, s)$.

  - *Flux-Radiation-Pressure Gradient Relation*: $F_nu = - c/alpha_nu pdv(P_nu, z)$. $P_nu$ radiation pressure per unit frequency.

  - *Thermal Equilibrium*: is achieved through collisions, when mean free path between collisions $l_"mfp" << l_nu$ mean free path of photons.

    In global thermal equilibrium, macro variables like $T, P, ...$ are constant in space and time.

    In local thermal equilibrium, macro variables vary slowly in space and time, but micro variables (particle energies, photon energies) are in equilibrium locally.

  - *Bolometric absorbtion coefficient*: $alpha = n sigma hspace sigma$ cross section $hspace n$ number density of scatterers/absorbers.
]

#section("Blackbody and Thermal Radiation")[
  Radiation in cavity in thermal equilibrium with walls at temperature $T$.

  - *Energy Density (Plancks Law)*: $U_nu (T) = (8 pi h)/(c^3) (nu^3)/(exp((h nu)/(k_B T)) - 1)$. Describes energy per unit volume per unit frequency.

  - *Intensity*: $I_nu = B_nu (T) = c/(4 pi) U_nu$.

  - *Total Energy Density (Stefan-Boltzmann Law)*: $F = sigma T^4, hspace U = integral U_nu dd(nu) = a_B T^4, hspace a_B = 4 sigma/c, hspace sigma = (2 pi^5 k_B^4)/(15 c^2 h^3)$.

  - *Wiens Displacement Law*: $lambda_"max" T approx 2.89 dot 10^(-3) "m" dot "K"$.

  - *Rayleigh-Jeans Approximation* (Low energy limit): Works for $h nu << k_B T$: $U_nu (T) approx (8 pi nu^2)/(c^3) k_B T$.

  - *Wien Approximation* (high frequency tail): Works for $h nu >> k_B T$: $U_nu (T) approx (8 pi h)/(c^3) nu^3 exp(-(h nu)/(k_B T))$.
]

#section("Basic Distributions")[
  - *Maxwellian Distribution*: For classical particles, mass $m$, number density $n$ in thermal equilibrium at temperature $T$, number of particles per unit volume $dd(n_v)$ with velocities in $[v, v+dd(v)]$:

    $dd(n_v) = n (m/(2 pi k_B T))^(3/2) exp(- (m v^2)/(2 k_B T)) 4 pi v^2 dd(v)$.

  - *Boltzmann Distribution*: 2-Level system with particles in thermal equilibrium at temperature $T$, number density of particles $n_0, n_e$ in ground and excited states obey: $n_e/n_0 = (g_e/g_0) exp(- (E_e - E_0)/(k_B T))$, where $g_e, g_0$ are statistical weights (degeneracies) of the levels.
]
= Stars and Compact Objects

#section("Stellar structure Equations")[
  - *Gravitational Potential*: $Phi (r) = - (G M (r))/r$, where $M_r$ is mass enclosed within radius $r$ and convention $Phi(oo) = 0$.

    - *Inside Star*: $Phi(r) = - G [M(r)/r + integral_r^(oo) 4 pi r'^2 (rho (r'))/(r') dd(r')]$.

    - *Outside star*: $Phi (r) = - (G M)/(r)$.

    - *Gravitational Binding Energy*: $E_"grav" = - integral_0^(M) (G M_r)/r dd(M_r) approx - (3/5) (G M^2)/R$ for constant density sphere.

  - *Spherical Luminosity*: $L_r = 4 pi r^2 F$. Luminosity through sphere of radius $r$.

  - *Spherical Energy Generation*: $epsilon (r)$ energy generated per unit mass per unit time at radius $r$.

  - *Mass Fractions*: $X$: Hydrogen, $Y$: Helium, $Z$: Metals, with $X + Y + Z = 1$.

  - *Number of Particles per Volume*: $n = (2 X + 3/4 Y + 1/2 Z) (rho/m_p)$.

  - *Mean Molecular Weight*: $mu = (2 X + 3/4 Y + 1/2 Z)^(-1)$.

  $
    & bold("Mass Continuity Equation"):             && hspace dv(M_r, r) = 4 pi r^2 rho \
    & bold("Hydrostatic Equilibrium Equation"):     && hspace dv(P, r) = - (G M_r rho)/(r^2) \
    & bold("Energy Generation Equation"):           && hspace dv(L_r, r) = 4 pi r^2 rho epsilon \
    & bold("Radiative Energy Transport Equation"):  && hspace dv(T, r) = - 3/(4 a_B c) (chi rho)/(T^3) L_r/(4 pi r^2) \
    & bold("Convective Energy Transport Equation"): && hspace dv(T, r) approx (1 - 1/gamma) T/P dv(P, r) \
    & bold("Equation of State"):                    && hspace P = n k_B T = (rho k_B T)/(mu m_p)
  $

  Mass Continuity describes how mass $M_r$ increases with radius $r$ due to density $rho$. Hydrostatic Equilibrium describes balance of gravity and pressure (if not in equilibrium, star would collapse or expand). Energy Generation describes how luminosity $L_r$ builds up with radius due to energy generation $epsilon$. Radiative Energy Transport describes how temperature gradient is set by luminosity and opacity (if radiation is dominant energy transport mechanism). Convective Energy Transport describes how temperature gradient is set by pressure gradient in convective regions (if convection is dominant energy transport mechanism). Equation of State relates pressure, density and temperature.

  - *Boundary Conditions*:
    - At center of Star: at $r = 0 hspace => M_r = 0, L_r = 0$ .
    - At surface of Star: at $r = R hspace => rho=0, T = 0$.

  - *Schwartzschild Stability Condition*: For convective stability, require $abs(dv(T, r)) < (1 - 1/gamma) T/P dv(P, r)$
]

#section("Typical Sun Scales")[
  - *Radius*: #h$R_sun approx 7 dot 10^8 "m"$.
  - *Mass*: $M_sun approx 2 dot 10^(30) "kg"$.
  - *Luminosity*: $L_sun approx 4 dot 10^(26) "W"$.
  - *Central Temperature*: $T_c approx 1.5 dot 10^(7) "K"$.
  - *Central Density*: $rho_c approx 1.5 dot 10^(5) "kg/m"^3$.
  - *Central Pressure*: $P_c approx 6 dot 10^(13) "N/m"^2$ (very rough approximation).
  - *Surface Temperature*: $T_"eff" approx 5800 "K"$.
]

#section("Scaling Relations")[
  Derived from SSE. "ms" stands for Main Sequence Stars. $tau$ is lifetime. Approximation techniques: $dv(X,r) approx X/R$, $hsmall integral_0^R C 1/r^2 dd(r) approx C 1/R^2 R$

  $
    &R prop sqrt(L)/T_"eff"^2 hspace&&<- L = 4 pi R^2 sigma T_"eff"^4 hsmall &&"Surface Boundary" \
    &rho prop M/R^3 hspace&& <- dv(M_r, r) = 4 pi r^2 rho hspace M approx 4 pi R^3 rho hsmall &&"Mass Continuity"\
    &P prop M^2/R^4 hspace&& <- dv(P, r) = - (G M_r rho)/r^2 hspace P_c/R approx (G M)/R^2 M/R^3 hsmall &&"Hydrostat Eq."\
    &L_"ms" prop M^3hspace&& <- "Radiative Diffusion" + "Ideal Gas" +&& "Hydrostatic"\
    &L_"ms" prop T_"eff"^6hspace&& <- L prop R^2 T^4_"eff" hspace R prop sqrt(M) hspace L prop M^3 \
    &tau_"ms" prop 1/M^2hspace&& <- tau_"ms" = "Available Fuel"/"Luminosity" approx M/L, hsmall L prop M^3
  $
]

#section("Nuclear Energy and Binding")[
  - *Nuclear Binding Energy*: Energy required to disassemble nucleus into protons and neutrons. $E_B = [Z m_p + (A - Z) m_n - m_"nuc"] c^2 > 0$.

    $F = E_B/A$ Binding Energy per Nucleon. Helium: $f approx 6.6 "MeV" approx 0.007 m_H c^2$, with $m_H approx 938 "MeV"/c^2$, Peaks at Fe-56 with $F approx 8.8 "MeV"$.

  - *Nuclear Energy Generation*: Fusion of light nuclei ($A < 56$) releases energy, fission of heavy nuclei ($A > 56$) releases energy.

    Rate: $epsilon_"nuc" = (n_1 n_2 avg(sigma nu) Delta E)/rho = C rho X_1 X_2 T^(-2/3) exp(- 3 (e^4/(32 epsilon_0^2 k_B hbar^2) (m Z_1^2 Z_2^2)/T)^(1/3))$, where $m = (m_1 m_2)/(m_1 +
    m_2)$ reduced mass of reacting nuclei, $Z_1, Z_2, X_1, X_2$ atomic numbers and mass fractions.

  - *Proton-Proton Chain*: In stars like Sun. ($nu$ electron neutrino, $gamma$ photon)

    PP-Chain (1): #hspace $"H"_1 + "H"_1 -> "H"_2 + e^+ + nu_e$ (twice)

    PP-Chain (2): #hspace $"H"_2 + "H"_1 -> "He"_3 + gamma$ (twice)

    PP1-Chain: #hspace$"He"_3 + "He"_3 -> "He"_4 + 2 "H"_1$

  - *Energy Generation Rates*:CNO is carbon-nitrogen-oxygen cycle, dominant in massive stars. CNO is much harder to ignite due to higher Coulomb barrier (needs more tunneling).
    $
      epsilon_"pp" approx 2.4 dot 10^m1 rho X_"H"^2 ((10^6 K)/T)^(2/3) exp(-33.8 ((10^6 K)/(T))^(1/3)) ["J"/("s" dot kg)]\
      epsilon_"CNO" approx 8.7 dot 10^20 rho X_"H" X_"CNO" ((10^6 K)/T)^(2/3) exp(-152.3 ((10^6 K)/(T))^(1/3)) ["J"/("s" dot kg)]\
    $


]

#section("Limits and Hertzsprung-Russell Diagram")[
  - *Chandreasekhar Limit*: When all nuclear fuel is exhausted, electron degeneracy pressure can no longer support star against gravity.

    If $M < M_"Ch" ->$. White Dwarf

    If $M > M_"Ch" ->$. Supernova, Neutron Star or Black Hole.

  - *Eddington Luminosity*: Maximum luminosity where radiation pressure balances gravity. $L_"Edd" = (4 pi G M c)/(chi)$, where $chi$ is opacity.

  - *Hertzsprung-Russell Diagram*: Plot of Luminosity $L$ or Magnitude vs Surface Temperature $T_"eff"$ of stars.

    Main Sequence: Stars fusing hydrogen in cores, from hot, luminous to cool, dim.

    Giants/Supergiants: Large, luminous stars with low surface temperatures.

    White Dwarfs: Hot, dim stars with small radii.

  #image("/assets/image-5.png",width: 60%)

  - *Spectral Classification*: OBAFGKM sequence based on surface temperature and spectral lines. O: hottest, M: coolest. Sun is G-type. 

  #image("/assets/image-8.png")
]

= Galaxies

#section("Milky Way")[
  Spiral Galaxy with $approx 4 dot 10^11$ stars, diameter $approx 30 "kpc"$, thickness $approx 0.3 "kpc"$, mass $approx 1.2 dot 10^(12) M_sun$, luminosity $approx 2 dot 10^(10) L_sun$.

  Distance to Galactic Center $approx 8.2 "kpc"$.

  - *Stellar Populations*: - *In Disk*: Young, Bright, Metal-Rich, Massive (*Population I*) stars. Continuous formation of stars.

  - *In Bulge and Halo*: Old Stars, Dim, Metal-Poor, Low-Mass, Old Globular Clusters (*Population II*). No recent star formation.

  - *Extinction*: Dust in disk absorbs and scatters light, causing reddening and dimming (extinction) of starlight. ISM (Interstellar Dust in Insterstellar Medium) absorbs $approx 30%$ of visible light.

    $m$: Apparent Magnitude, $M$: Absolute Magnitude (intrinsic brightness), $d$: distance in parsecs, $A_lambda$: extinction at wavelength $lambda$.

    $
      & m = M + 5 log_(10) (d/10 pc) -5 + A_lambda hspace && "Distance Modulus with Extinction" \
    $

    where $A_lambda > 0$, For $V$ magnitudes, $A_V approx 1.5 (d/(1 "kpc"))$.

    $
      (B-V)_"obs" = (B-V) + E(B-V), hsmall E(B-V)approx 0.5 (d/(1 "kpc")) hsmall && "Color Exc."
    $

  - *Extinction Measure*: $A_lambda/(E(B-V)) approx$ independent of $d$ (bcs $A, E$ both approx scale with path length), depends on $lambda ->$ can be used to probe composition of ISM (dust).

  #image("/assets/image-4.png", width: 70%)
]

#section("2 Level System, Energy and Emission")[
  - *2 Level System*: Atoms with 2 energy levels $E_0, E_1$ with degeneracies $g_0, g_1$. Transitions between levels due to Absorption, Spontaneous Emission and Stimulated Emission.

    $h nu_0 = E_u - E_l$ energy difference between levels. $n_u, n_l$ number densities in upper and lower levels (states/volume). $U_nu$ Energy density of radiation field at frequency $nu_0$.

    $
      & A_"ul" hspace          && "Spontaneous Emission Coefficient" \
      & B_"ul" hspace          && "Induced (Stimulated) Emission Coefficient" \
      & B_"lu" hspace          && "Induced (Stimulated) Absorption Coefficient" \
      & n_u A_"ul" hspace      && "Number of Spontaneous Emissions per Volume per  Time" \
      & n_l B_"lu" U_nu hspace && "Number of induced " arrow.t "transitions per Volume per Time (abs.)" \
      & n_u B_"ul" U_nu hspace && "Number of induced " arrow.b "transitions per Volume per Time (emiss.)" \
    $

  - *Emissivity*: $phi(Delta nu)$ line profile function (normalized: $integral phi(Delta nu) dd(nu) = 1$).

  - *Bolometric Emissivity*: $integral j_nu dd(nu) = (h nu_0)/(4 pi) n_u A_"ul" = "energy emitted"/(s dot m^3 dot "solid angle" dot nu)$.

  - *Absorption Coefficient*:

    $alpha_nu = (h nu_0)/c (n_l B_"lu" - n_u B_"ul") phi(Delta nu) = "rel loss of intensity"/"distance"$.

  - *Source Function*: $S_nu = j_nu/alpha_nu = c/(4 pi) (n_u A_"ul")/(n_l B_"lu" - n_u B_"ul")$.

  - *Statistical Weights*: $g_u, g_l$ degeneracies of upper and lower levels. We get relations:
    $
      A_"ul" = (8 pi h nu^3)/(c^3) B_"ul" hspace g_u B_"ul" = g_l B_"lu"\
      "in LTE": n_u/n_l = (g_u/g_l) exp(- (h nu_0)/(k_B T)) hspace => S_nu = B_nu (T)
    $

  - *21cm Line*: Radio spectral line from hyperfine transition (flip in relative orientation of electron spin and proton spin) of neutral hydrogen (HI) $lambda = 21.1 "cm"$.

  - In $1 s$ *triplet state* (ground state) , electron and proton spins can be parallel: Total spin $F = 1$ (higher energy, $g_u = 2 F +1 = 3$).

  - In $0 s$ *singlet state* (excited state), spins anti-parallel: Total spin $F = 0$ (, lower energy, $g_l = 1$).

    Triplet has slightly higher energy due to magnetic interaction of proton and electron spins $Delta E approx 5.9 dot 10^(-6) "eV" => nu_0 = (Delta E)/h approx 1.42 "GHz" -> lambda_0 = 21 "cm"$.

    In typical H I regions, $n_u/n_l approx 3$ (since $k_B T >> Delta E$), so spontaneous emission dominates absorption, and line is seen in emission. The 21cm line is important probe of structure and dynamics of galaxies (redshifted due to doppler effect, velocity mapping, etc).

    #image("/assets/image-3.png", width: 70%)

  - *Bolometric Intensity 21 cm*: $I approx (3 h nu_0)/(16 pi) A_"ul" integral n_H dd(s) approx 3.1 dot 10^(-21) N_H ["W"/("m"^2 dot "sr")]$. Absorbtion (neglecting emission): $tau_nu approx 3/(32 pi) A_"ul" (h c^2)/(nu_0 k_B) phi(Delta nu) integral n_H/T_s dd(s), hspace$ where $T_s$ is spin temperature.

  - *Absorbtion of Visible Light*: Passing through optically thin gas in ISM, modelled as 2 level system: $h nu_0 approx 1 "eV" >> k_B T approx 10^(-2) "eV"$ for H I clouds at $approx 100 K$. Then optical depth $tau_nu approx (h nu_0)/c B_"lu" phi(Delta nu) N$, where $N = integral n_l dd(s)$ column density of gas ($"Number of atoms"/"area"$)

  - *Equivalent Width*: Way to quantify strength of spectral line (absorbtion or emission), that does not depend on spectral resolution. Assume $lambda approx lambda_0$, Weak-line limit ($tau_lambda << 1$), so we can linerize.

    $W_lambda = integral 1 - I_lambda/I_c dd(lambda) = integral (I_c - I_lambda)/I_c dd(lambda)$, where $W_lambda$ is the width of a hypothetical completely black noth of depth $100%$ that would absorb same amount of energy as actual line. $I_c$ is continuum intensity adjacent to line. At large values of $N f lambda$, $I_nu -> 0$ near line center.
]

#section("Cosmic Rays, IMF, ISM")[
  - *Cosmic Rays*: $90 %$ protons, $9 %$ helium nuclei, $1 %$ heavier nuclei and electrons. Energies from $10^9 "eV"$ to $10^(20) "eV"$. Originate from supernovae, active galactic nuclei, etc. Interact with ISM, produce secondary particles and gamma rays. Travel close to speed of light, spiral around magnetic field lines in galaxy (emit synchrotron radiation).

  - *Salpeter Initial Mass Function (IMF)*: Describes distribution of stellar masses at formation in a population of stars. $xi(M) dd(M) prop M^(-2.35) dd(M)$ number of stars formed with masses in $[M, M + dd(M)]$.

  - *Interstellar Medium (ISM)*: Consists of:
    - *Interstellar Dust*: $approx 1%$ in dust grains (silicates, carbonaceous compounds, ices) around $100 - 1000 angstrom$. Absorbs and scatters starlight, causes extinction and reddening. Re-emits absorbed energy in infrared.
    - *HI Clouds*: $T approx 80 K$, Density $n_H approx 10^6 - 10^8 "m"^(-3)$, traced by 21 cm line emission. $approx 5%$ of interstellar volume, $approx 40%$ of interstellar mass.
    - *Molecular Clouds*: $T approx 10 - 30 K$, Density $n_H approx 10^9 - 10^(11) "m"^(-3)$, traced by CO line emission. Sites of star formation. Occupies $approx 1 - 2%$ of interstellar volume, $approx 40 %$ of interstellar mass. Contain $"H"_2, "CO", "OH"$.
    - *Warm Intercloud Medium*: $T approx 8000 K$, Density $n_H approx 10^5- 10^6 "m"^(-3)$, traced by optical emission lines (H-alpha, [OIII]). Fills $approx 40%$ of interstellar volume, $approx 10%$ of interstellar mass.
    - *HII Regions*: Process: $"O"_* ->$ emits UV photons with $lambda < 912 angstrom$ (binding energy of H $approx 13.6 "eV"$)  $->$ ionizes surrounding gas by knocking off electrons from H atoms $->$ creates region of ionized hydrogen (HII region) around OB stars $->$ electrons recombine with protons, emit recombination lines (H-alpha at $6563 angstrom$, etc) $->$ region cools via line emission.

      $T approx 6000 K$, Density $n_e approx 10^8 - 10^(10) "m"^(-3)$, traced by H-alpha and other recombination lines.

      - *Strömingen Sphere*: Radius where ionization rate balances recombination rate.

        $
          "num recombs in sphere"/"time" = alpha n_p n_e dot 4/3 pi R_s^3 hspace R_s = (3/(4 pi) N_gamma/(alpha n_p n_e))^(1/3)\
        $
      - *Hot Coronal Gas*: $T approx 10^6 K$, Density $n_e approx 10^3 - 10^5 "m"^(-3)$, traced by X-ray emission from bremsstrahlung ($approx "keV"$). Fills $approx 50%$ of interstellar volume, tiny fraction of interstellar mass.

  #image("/assets/image-7.png", width: 70%)
]

#section("Exoplanets")[
  Detection Methods:
  - *Transit*: Dimming of star as planet passes in front. Measures planet radius, orbital period.
  - *Radial Velocity*: Doppler shift from wobbles in star's motion due to planet's gravity. Measures planet mass, orbital period.
  - *Direct Imaging*: Taking pictures of planets by blocking out starlight. Measures planet brightness, atmosphere.
  - *Gravitational Microlensing*: Brightening of background star as planet-hosting star passes in front. Measures planet mass, distance.
]

= Stellar Dynamics and Dark Matter

#section("Virial Theorem")[
  Let Virial $G = sum_i m_i ar_i^2$, for cont: $G = integral rho r^2 dd(V)$.

  Then: $dot(G) = 2 sum_i m_i ar_i dot av_i hspace ddot(G) = 2 sum_i m_i (av_i^2 + ar_i dot aa_i) hspace => ddot(G) = 4 T + 2 U$.

  For bound, steady state system: $avg(ddot(G)) = 0 => 2 avg(T) + avg(U) = 0$.

  - If $ddot(G) > 0$, system expands

  - If $ddot(G) < 0$, system contracts.

  Useful for $T approx 1/2 M sigma^2 hspace U approx - (G M^2)/R hspace M approx (r sigma^2)/G$.

  Temperature: $1/2 m avg(v^2) approx 3/2 k T$,

  With $v^2 approx (G M)/R$ we get $k T approx (G M m)/(3 R)$.
]

#section("Gravitational Potential")[
  $
    "Point mass M": Phi (r) = - (G M)/r hspace "E of test Mass m": U = m Phi (r) = - (G M m)/r\
    "Many Body": Phi (ar) = - G integral (rho (ar'))/abs(ar - ar') dd(V') hspace U = - sum_i (m_i Phi (ar_i)) /2 = 1/2 integral rho Phi dd(V)\
    "Virial": 2 avg(T) = avg(sum_i ar_i dot aF_i) approx -n U hspace U approx-(G M^2)/R
  $
]

#section("Self-Gravitating Systems")[
  Size $avg(R)$, Mass $M$, Velocity Dispersion $sigma$, Number of Stars $N$ with mass $m$. If system is virialized, then $2 T + U = 0 => avg(v^2) = (G M)/(2 avg(R))$.

  - *Associated Temperature*: $overline(K) = 3/2 N k_B T$, where $overline(K)$ is average kinetic energy of system.

  - *Specific Heat*: $c_V = dv(overline(E), T) =_"viralized" - dv(overline(K), T) = - 3/2 N k_B < 0$.

  - If total energy $overline(E) = overline(V)/2 prop avg(R)^m1$ dicreases $avg(R), overline(K) prop avg(v^2) prop avg(R)^m1$ increases (system contracts).

  - *Relaxation*: Self-gravitating system $=> c_V < 0$, system in TDE cannot be $c_V <0 =>$ Self-gravitating systems cannot be in thermal equilibrium.

  - *Collisional Relaxation*: 2-Body encounters change star velocities. $b$ impact parameter, $n$ number of particles per volume. Collision occurs if $Delta p >=. p => b <= (G m)/v^2 = b_"col"$. Cross section $sigma approx pi b^2_"col" = pi (G^2 m^2)/v^4$. This leads to a relaxation time:

    $
      T_"rel" = 1/(n sigma v) hspace & approx 10^17 "yrs for galaxies (all too large for age of universe)" \
      & approx 10^9 "yrs for open clusters" \
      & approx 10^(10) "yrs for globular clusters " \
    $

  - *Violent Relaxation*: Rapid fluctuations in gravitational potential during collapse from large initial volume lead to energy redistribution among stars. Occurs on dynamical timescale $T_"dyn" = (R^3/(G M))^(1/2) approx R/sigma$. For violent relaxation $T_"cross" = R/v approx T_"vr"$

  - *Dynamical Friction*: As particle moves through stellar system, gravitational interactions with stars create overdensity wake behind it, exerting drag force slowing it down. Acts on short timescales.
]

#section("Stellar Distributions and Boltzmann Equation")[
  - *Distribution Function*: Consider system of particles with mass $m$, positions $ax$, velocities $av$. Distribution function $f(ax, av, t)$ such that $f(ax, av, t) dd(ax) dd(av)$ is number of particles in phase space volume $dd(ax) dd(av)$ at time $t$.

    - *Mass Density*: $rho(ax, t) = m integral f(ax, av, t) dd(av)$,
    - *Velocity Dispersion*: $avg(v^2) = integral v^2 f(ax, av) dd(av) dot (integral f(ax, av) dd(av))^m1$

  - *Collisionless Boltzmann Equation (CBE)*:
    $
      dv(f, t) = pdv(f, t) + sum_i pdv(f, x_i) dv(x_i, t) + sum_i pdv(f, v_i) dv(v_i, t) = 0\
      "For Self-Gravitating": pdv(f, t) + sum_i v_i pdv(f, x_i) - sum_i pdv(Phi, x_i) pdv(f, v_i) = 0\
    $

    Where $Phi$ gravitational potential that obeys Poisson Equation:

    $nabla^2 Phi = 4 pi G rho$.

    Poisson eq. + mass density + CBE form *Collisionless Boltzmann-Poisson System*, a coupled set of integro-differential equations describing evolution of collisionless self-gravitating systems.

  - *Jeans Theorem*: At steady state ($f(ax, av, t) = f(ax, av)$) we can construct solutions of CBE by making $f$ depend on integrals of motion (quantities conserved along particle trajectories in given potential $Phi$).

    Consider constants of motion $C_k (ax, av),hsmall dv(C_k, t) = 0$ along particle trajectories. Then any function $f(C_1, C_2, ...)$ is a steady-state solution of CBE. Examples of $C_k$ are total energy $E = 1/2 m v^2 + m Phi(ax)$, angular momentum $L = m ax cross av$, etc.

  - *Liouville's Theorem*: In absence of collisions, distribution function $f(ax, av, t)$ is constant along particle trajectories in phase space.

    $
      dv(f, t) = pdv(f, t) + sum_i pdv(f, x_i) dv(x_i, t) + sum_i pdv(f, v_i) dv(v_i, t) = 0
    $

  - *Singular Isothermal Sphere*: Define $rho_c = rho_0 exp((m Phi(0))/sigma^2)$ central density, $r_0 = sqrt((9 sigma^2)/(4 pi G rho_c m))$ core radius, $l = r/r_0$ rescaled radius, $xi = rho/rho_c$ rescaled density.

    Solution to CBE: $rho(r) = 2/9 rho_c (r_0/r)^2$. Singular at $r = 0$.

    Isothermal since $avg(v^2) = 3 sigma^2$ independent of $r$.

    Is called "flat rotation curve" because $v_c (r) = sqrt((G M(r))/r) = sqrt((4 pi G rho_c r_0^2)/9) =$ constant.

  - *King Model*: More realistic model with finite central density and cutoff radius. Distribution function:

    $
      f(E) = cases(f_0 (exp(- (E+m Phi_0)/(m sigma^2)) - 1) hspace &"if" E <= Phi_0 m, 0 &"if" E > Phi_0 m)
    $

    - Needs to me integrated numerically.
    - We find $rho(r) = 0$ for some finite $r = r_t$ (tidal radius).
    - Good fit for elliptical galaxies
    - Can be thought of as a truncated isothermal sphere.
]

#section("Gravity and Schwartzschild Radius")[
  - *Newtonian Gravity*: $F = G (m_1 m_2)/r^2 hspace a = G M/r^2$.

  - *Gravitational Potential*: $Phi(r) = - integral_oo^r a dd(r) = - G M/r$.

  - *Escape Velocity*: $v_"esc" = sqrt(2 (G M)/r)$.

    $M$ is trapped when $E = K + U <= 0 => v >= v_"esc"$.

    Photon trapped when $v_"esc" >= c => r <= R_s hspace f = (2 G M)/(e c^2)$

  - *Schwarzschild Radius*: $R_s = 2 G M/c^2$.  General Relativity becomes important when $f approx 1 <-> r approx R_s$
]

= Fluid and Plasma Astrophysics

#section("Fluid Dynamics")[
  Assuming local thermal equilibrium, a fluid is described by density $rho(ax, t)$, velocity field $av(ax, t)$, pressure $P(ax, t)$, temperature $T(ax, t)$.

  - *Steady State*: When the state variables do not depend on time: $pdv(rho, t) = 0, pdv(av, t) = 0, pdv(P, t) = 0, pdv(T, t) = 0$.

  - *Eulerian Derivative*: Time derivative of quantity $Q$ at a fixed point in space: $pdv(Q, t) = pdv(Q(ax, t), t)$.

  - *Lagrangian (convective) Derivative*: Time derivative of quantity $Q$ following a fluid element:

    $
      dv(Q, t) = pdv(Q, t) + sum_i pdv(Q, x_i) dv(x_i, t) = pdv(Q, t) + (av dot nabla) Q
    $

  - *Fluid Dynamics Equations*:

    $
      & pdv(rho, t) + nabla dot (rho av) = 0                && hspace "Continuity Equation" \
      & dv(av, t) + (av dot nabla)av = - 1/rho nabla P + aF && hspace "Euler Equation" \
      & dv(, t) (P/rho^gamma) = 0                           && hspace "Equation of State (Adiabatic)" \
    $

    where $aF$ external force per unit mass (e.g. gravity: $aF = - nabla Phi$), $gamma = c_P/c_V = 5/3$ adiabatic index for monatomic ideal gas.

  - *Sound Speed*: Small perturbations in fluid propagate as sound waves with speed $c_s = pdv(P, rho) = sqrt(gamma P_0/rho_0) = sqrt(gamma k_B T/(mu m_p))$.

  - *Jeans Wavenumber*: $k_J = sqrt((4 pi G rho_0)/(c_s^2))$

  - *Dispersion Relation*: $omega^2 = c_s^2 (k^2 - k_J^2)$. For $k < k_J$, $omega^2 < 0$ => instability (gravitational collapse).

  - *Jeans Scale*:
    - Jeans Wavelength $lambda_J = 2 pi/k_J = c_s sqrt(pi/(G rho_0))$.

    - Jeans Mass $M_J = (4 pi/3) rho_0 (lambda_J)^3$.

    *Pertubations* will collapse if their mass $M > M_J$, $abs(k) < k_J$ or $lambda > lambda_J$.

    *Pressure* would be dominating for $M < M_J$, $abs(k) > k_J$ or $lambda < lambda_J$ and perturbations will oscillate as sound waves instead of collapsing.

    *Gravity* dominates for large scales, pressure dominates for small scales. Jeans instability is important in star formation and structure formation in the universe.

    $
      & M_J = 4/3 pi^(5/2) ((gamma P_0)/G)^(3/2) 1/rho_0^2 hspace && "Jeans Mass" \
      & M_j = 4/2 pi^(5/2) ((gamma k_B T)/(G m))^(3/2) 1/sqrt(rho_0) hspace  && "for Ideal Gas" \
    $
]
#section("Thermal Bremsstrahlung")[
  Fully ionized plasma in thermal equilibrium at temperature $T$. Electrons accelerated in Coulomb fields of ions emit radiation (free-free emission).

  - *Emissivity*: $epsilon approx 6.8 dot 10^-51 (n_e n_i Z^2)/sqrt(T) exp(-(h nu)/(k_B T)) g(nu, T) [W/(m^3 Hz)]$.

    where $n_e, n_i$ electron and ion number densities, $Z$ ion charge, $g(nu, T)$ Gaunt factor (quantum correction, order unity).

  - *Examples*: In region HII emissions in radio band (free-free emission) and in hot gas in galaxy clusters (X-ray bremsstrahlung, $approx 10^7-10^8 K$).

  - *Energy per unit volume per time avg. over all frequencies*:

    $epsilon = 1.4 dot 10^(-40) sqrt(T) n_e n_i Z^2 overline(g) [W/(m^3 sqrt(K))]$
]

#section("Cyclotron and Synchrotron Radiation")[
  Hot ionized plasma with magnetic field: free electrons spiral around magnetic field lines and radiate photons.

  - *Cyclotron Frequency*: $omega_c = (q B)/(m)$ for non-relativistic particles.

  - *Synchrotron Frequency*: $omega_"syn" = gamma^2 omega_c$ for relativistic particles with Lorentz factor $gamma$.

  - *Spectrum of Synchrotron Radiation*: For power-law distribution of electron energies $N(E) dd(E) prop E^(-p) dd(E) => f(nu) dd(nu) prop nu^((1 - p)/2) dd(nu)$.

  - *Power Radiated*: $P = (2/3) (q^4 B^2 gamma^2 sin^2 theta)/(m^2 c^3)$, where $theta$ is pitch angle between velocity and magnetic field.

  - *Applications*: Radio emission from supernova remnants, active galactic nuclei jets, pulsar wind nebulae.
]

#section("Ionization Fraction and Saha Equation")[
  In a gas in thermal equilibrium at temperature $T$, the ionization fraction $x$ (fraction of atoms that are ionized) can be estimated using the Saha equation.

  - *Saha Equation*: $x^2/(1 - x) = (2 pi m_e k_B T/h^2)^(3/2) (2 g_1/g_0) (1/n_e) exp(- chi/(k_B T))$.

    where $m_e$ electron mass, $k_B$ Boltzmann constant, $h$ Planck constant, $g_1, g_0$ statistical weights of ionized and neutral states, $n_e$ electron number density, $chi$ ionization energy.

  - *Interpretation*: Higher temperatures and lower densities favor ionization. The equation balances the rates of ionization and recombination.

  - *Applications*: Used to determine ionization states in stellar atmospheres, HII regions, and the interstellar medium.
]

= Extragalactic Astrophysics
#section("Types of Galaxies")[
  - *Spiral Galaxies*: Flat, rotating disks with spiral arms, central bulge. Contain young stars, gas, dust. E.g. Milky Way.

    In central regions of rich clusters, spirals are less common due to interactions and stripping of gas $approx 10%$, more common in low density environments $approx 80%$.

  - *Elliptical Galaxies*: Ellipsoidal shape, little gas/dust, older stars. Range from nearly spherical (E0) to elongated (E7).

  - *Lenticular Galaxies (S0)*: Intermediate between spirals and ellipticals. Disk-like but no spiral arms, little gas/dust.

  - *Irregular Galaxies*: No defined shape, often rich in gas/dust, active star formation. E.g. Large Magellanic Cloud.

  - *Active Galactic Nuclei (AGN)*: Extremely luminous centers of some galaxies powered by accretion onto supermassive black holes. Types include quasars, Seyfert galaxies, blazars.
]

#section("Radiation from Galaxies")[
  - *Luminosity Function*: $Phi(L)dd(L)$ Number of Galaxies per unit volume with luminosities in $[L, L + dd(L)]$. Often modeled by Schechter function:

    $
      Phi(L) dd(L) = N_0 (L/L_*)^alpha exp(- L/L_*) 1/L_* dd(L)\
    $

    where $N_0 = 1.2 dot 10^(-2) h^3 [1/"Mpc"^3]$, $alpha = -1.25, L_* = 1dot 10^10 h^(-2)L_sun$ and $h = H_0/100 ["km"/("s" dot "Mpc")]$ hubble parameter.

    Spirals have wider range of luminosities than ellipticals.

  - *Faber-Jackson Relation*: Empirical relation for velocity dispersion $sigma$ and luminosity $L$ of elliptical galaxies: $L prop sigma^4 hspace sigma approx 220 (L/L_*)^(1/4) ["km"/s]$, where $L_*$ is characteristic luminosity from luminosity function.

  - *Rotation Curves*: Plot of orbital velocity of stars/gas vs distance from galactic center. Observed rotation curves remain flat at large radii, indicating presence of dark matter halo.

    #image("/assets/image-2.png", width: 90%)

  - *Tully-Fisher Relation*: Empirical relation for spiral galaxies in flat part of rotation curve: $L prop v_"c, flat"^alpha$, where $v_"c, flat" approx 200 (L/L_*)^(0.22) ["km"/s]$, with $alpha approx 3 - 4$ depending on wavelength band.

  - *Doppler Effect*: $nu_"obs"/nu_"emit" approx c/(c + v_"rad")$ for $v_"rad" << c hsmall$(non-relativistic).

  - *Redshift*: If source is moving at velocity $v << c$ away from observer, observed wavelength $lambda_"obs" = lambda_"emit" (1 + z)$, where $z = v/c$ is redshift.

    For cosmological redshifts due to expansion of universe: $1 + z = a(t_"obs")/a(t_"emit")$, where $a(t)$ is scale factor of universe at time $t$.

]

#section("Hubble Law")[
  - *Hubble's Law*: For distances $l$ small compared to size of observable universe, recessional velocity $v approx H_0 l$, where $H_0$ is Hubble constant.

  - *Dimensionless Hubble Parameter*: $H_0 = 100 h ["km"/("s" dot "Mpc")]$, current value $h approx 0.72$.

    With $l = v/H_0 = c/H_0 z$, we can get a way to estimate distances to far away galaxies using redshift for $l approx 3000 z/h ["Mpc"]$ for $z << 1$.

  - *Hubble Time*: $H_0^m1 approx 9.78 dot 10^9 1/h ["yrs"]$ related to age of the universe $approx 13.8 dot 10^9$ yrs.
]

#section("Galaxy Clusters and Formations")[
  - *Active Galaxies*: Luminosities dominated by bright nuclei rather than stars. Nuclei called Active Galactic Nuclei (AGN). Types:

    - *Seyfert Galaxies*: Spiral galaxies with bright, compact nuclei. Strong emission lines in spectra.
      - Seyfert 1 (broad emission lines).
      - Seyfert 2 (narrow emission lines).

    - *Radio Galaxies*: Elliptical galaxies with strong radio emission from jets and lobes powered by central supermassive black hole. Lobes produced when jets from central nucleus interact with intergalactic medium. Emit via synchrotron radiation from relativistic electrons spiraling in magnetic fields.

    - *Quasars*: Extremely luminous AGN ($approx 10^39 W$, 100x normal Galaxies), powered by supermassive black hole. Outshining entire host galaxy. Compact radio sources, found at high redshifts ($z approx 6-10$). Emission varies on timescales of days to months, indicating small size of emitting region.
      - Quasar spectrum similar to Seyfert 1 galaxies but more extreme.
      - Radio quiet/Quasi-stellar Quasars (RQQs) $approx 90%$ of quasars, weak radio emission, strong optical/UV emission.
      - Radio loud Quasars (RLQs) $approx 10%$ of quasars, strong radio jets/lobes.

  #image("/assets/image-9.png")

  - *Galaxy Clusters*: Largest gravitationally bound structures in universe. Contain hundreds to thousands of galaxies, hot intracluster gas, dark matter.

    $
      & M_"gc" approx 10^15 M_sun hspace && "Mass" \
      & R_"gc" approx 2 "Mpc" hspace     && "Radius" \
      & L_"gc" approx 10^13 W hspace     && "Luminosity"
    $

    $=> M_"gc"/L_"gc" approx 100 M_sun/L_sun$ (Without dark matter, we would expect $M_"gc"/L_"gc" approx M_sun/L_sun$).

    - *Gas in Clusters*: Hot ($T approx 10^7 - 10^8 K$), diffuse ($n_e approx 10^3 - 10^4 "m"^(-3)$), ionized plasma emitting X-rays via thermal bremsstrahlung. Contains more mass than galaxies themselves.
    - *Luminosity of Gas*: $L_X approx 10^43 W$ in X-rays from hot gas.
    - *Mass of Gas*: $M_"gas" approx 10^13 M_sun$ in hot gas.
]

= Cosmology

#section("Cosmological Principles and Metrics")[
  - *Cosmological Principle*: On large scales ($>= 100 1/h "Mpc"$), universe is homogeneous (same everywhere) and isotropic (same in all directions).

  - *Metrics*: Curvature can be
    - *Flat* ($k = 0$): $dd(s)^2 a^2 (dd(chi)^2 + chi^2 dd(Omega)^2)$
    - *Sphereical* ($k = +1$): $dd(s)^2 a^2 (dd(chi)^2 + sin^2 chi dd(Omega)^2)$
    - *Hyperbolical* ($k = -1$): $dd(s)^2 a^2 (dd(chi)^2 + sinh^2 chi dd(Omega)^2)$

    where $chi = tilde(r)/a hspace dd(Omega)^2 = dd(theta)^2 + sin^2 theta dd(phi)^2$

    $
      "Let" r = S(chi) = cases(chi hspace hspace& "for" k = 0 ("flat geometry"), sin chi hspace &"for" k = +1 ("spherical geometry"), sinh chi hspace& "for" k = -1 ("hyperbolical geometry"))\
    $

    then $dd(s)^2 = a^2 (dd(r)^2/(1 - k r^2) + r^2 dd(Omega)^2)$ for $k in {-1, 0, +1}$

    In terms of $chi$: $hspace dd(s)^2 = -c^2 dd(t)^2 + a^2 (dd(chi)^2 + S^2(chi) dd(Omega)^2)$.

  - *Equivalence Principle (GR)*: Locally, effects of gravity are indistinguishable from acceleration. In small enough region of spacetime, physics is that of special relativity. Particles in the same gravitational field follow same trajectories regardless of mass or composition.

  - *Scale Factor*: $a(t)$ describes how distances in universe expand/contract over time.

    $l = a(t) chi$. $l$ is physical distance, $chi$ is comoving distance (fixed coordinate).

    Normalized so that $a(t_0) = 1$ at present time $t_0$.

  - *Hubble Parameter*: $H = dot(a)/a => v = H l$

  - *Redshift and Scale Factor*: $1 + z = a(t_"obs")/a(t_"emit")$. For light emitted at time $t_"emit"$ and observed at time $t_"obs"$. $hspace 1 + z = lambda_"obs"/lambda_"emit" = a_0/a$


]
#section("Friedmann Equations")[
  - *Friedmann Equations*:

    $
      & (dot(a)/a)^2 = (8 pi G)/(3) rho - (k c^2)/(a^2) hspace && "First Friedmann Equation" \
      & ddot(a)/a = - (4 pi G)/(3) (rho + 3 P/c^2)             && "Second Friedmann Equation" \
    $

    where $rho$ energy density, $P$ pressure, $Lambda$ cosmological constant.

    Density determines geometry of the universe. Critical density: $rho_c = (3 H^2)/(8 pi G)$.

    If $rho > rho_c => k = +1$ (closed), $rho = rho_c => k = 0$ (flat), $rho < rho_c => k = -1$ (open).

  - *Density Parameters*: Define dimensionless density parameters:

    $
      & Omega_m = rho_m/rho_c hspace                            && "Matter Density Parameter" \
      & Omega_r = rho_r/rho_c hspace                            && "Radiation Density Parameter" \
      & Omega_Lambda = rho_Lambda/rho_c = Lambda/(3 H^2) hspace && "Dark Energy Density Parameter" \
    $

    where $rho_m$ matter density, $rho_r$ radiation density, $rho_Lambda = Lambda/(8 pi G)$ dark energy density. With Friedmann eq.: $(k c^2)/(a^2 H^2) = Omega - 1$

    Total density parameter: $Omega_"total" = Omega_m + Omega_r + Omega_Lambda$.

    Geometry determined by $Omega_"total"$: $Omega_"total" > 1$ (closed), $Omega_"total" = 1$ (flat), $Omega_"total" < 1$ (open).

  - *Generic Solutions*:
    $
      & k = 0 hspace  && => dot(a) = sqrt((8 pi G rho)/(3) a) \
      & k = +1 hspace && => dot(a) = sqrt((8 pi G rho)/(3) a - c^2) \
      & k = -1 hspace && =>dot(a) = sqrt((8 pi G rho)/(3) a + c^2)
    $

  - *Conformal Time*: $c dd(t) = a dd(eta)$

    For $k plus.minus 1 hspace => eta = plus.minus integral ((8 pi G)/(3 c^2) rho a^4 - k a^2)^(-1/2) dd(a)$.

    Can integrate if $rho(a)$ known.
]

#section("Contents of the Universe")[
  To solve the Friedmann equation, we need $rho = rho(a)$.

  - *Generic Fluid*: If expansion is adiabatic: $rho prop a^(-3(1+w))$, where $w$ is the equation of state parameter.

  - *Non-relativistic Gas*: $rho c^2 prop 1/a^3$.

  - *Relativistic Particles* (e.g. photons): $rho c^2 prop 1/a^4$.

  - *Matter*: Current matter density param.: $Omega_(M,0) approx 0.3$ (for luminous matter: $Omega_("lum",0) approx 0.01 << Omega_(M,0)$). Well described by non-relativistic gas: $rho_M = rho_(M,0) (a_0/a)^3$.

  - *Radiation*: CMB has black body spectrum with $T_0 approx 2.735 plus.minus 0.06 "K"$ and energy density $rho_gamma c^2 = a_B T^4$. Neutrino background also contributes. Total radiation energy density today: $rho_(R,0) approx 1.68 rho_(gamma,0)$. Hence $rho_R = rho_(R,0) (a_0/a)^4$.

  - *Total Energy Density* (without dark energy): $rho = rho_(M,0) (a_0/a)^3 + rho_(R,0) (a_0/a)^4$.

  Today: $rho_(R,0) approx 10^(-5) rho_("crit",0)$ and $rho_(M,0) approx 0.3 rho_("crit",0)$.
]

#section("Evolution of the Universe")[
  *Matter Dominated Universe*: $rho(a) = rho_M (a)$.

  - *Flat* ($k = 0$): $a prop t^(2\/3)$, expands and slows down to a halt.

  - *Closed* ($k = +1$): $a prop (1 - cos eta) -> 0$ as $eta -> 0$ and $eta -> 2 pi$ $=>$ expansion followed by contraction.

  - *Open* ($k = -1$): $a prop (cosh eta - 1)$, expands forever.

  - *Age of Universe*: For $eta << 1$: $t_0 approx 2/3 H_0^(-1) Omega_(M,0)^(-1/2)$ (approx. for open/closed, exact for flat).

  - *Radiation Dominated Universe*: $rho = rho_R$.

  - *Flat* ($k = 0$): $a prop sqrt(t)$.
]

= Miscellaneous

#section("Spherical Coordinates")[
  $
    r = sqrt(x^2 + y^2 + z^2) hspace mat(x;y;z) = mat(r sin theta cos phi; r sin theta sin phi; r cos theta)\
    dd(V) = r^2 sin theta dd(r) dd(theta) dd(phi) hspace dd(S) = r^2 sin theta  dd(theta) dd(phi) hspace dd(Omega) = sin theta dd(theta) dd(phi)\
    nabla f = pdv(f, r) hat(r) + 1/r pdv(f, theta) hat(theta) + 1/(r sin theta) pdv(f, phi) hat(phi)\
    nabla^2 f = 1/r^2 pdv(, r)(r^2 pdv(f, r)) + 1/(r^2 sin theta) pdv(, theta)(sin theta pdv(f, theta)) + 1/(r^2 sin^2 theta) pdv(f, phi, 2)\
    nabla dot arrow(A) = 1/r^2 pdv(, r)(r^2 A_r) + 1/(r sin theta) pdv(, theta)(sin theta A_theta) + 1/(r sin theta) pdv(A_phi, phi)\
    "Gauss Law": hspace nabla dot arrow(g) = - 4 pi G rho hspace integral_(partial V) arrow(g) dot dd(arrow(A)) = - 4 pi G M_"enc"\
    "Gauss Theorem": hspace integral_V nabla dot arrow(A) dd(V) = integral.cont_(partial V) arrow(A) dot an dd(S)\
    "Keplers 3rd Law": hspace a^3/T^2 = G (M + m)/(4 pi^2) approx (G M)/(4 pi^2) "if" M >> m\
    "Centripetal Force": hspace F_c = m a_c= m v^2/r = m r omega^2\
    "Poisson Equation": hspace nabla^2 Phi = 4 pi G rho\
  $
]

#section("Vector Calculus Identities")[
  $
    nabla (f g) = g nabla f + f nabla g hspace nabla dot (f aA) = f nabla dot aA + (nabla f) dot aA \
    nabla cross (f aA) = f (nabla cross aA) + (nabla f) cross aA hspace nabla cross nabla Phi = 0 hspace nabla dot (nabla cross aA) = 0 \
    nabla^2 (f g) = f nabla^2 g + g nabla^2 f + 2 (nabla f) dot (nabla g) \
    nabla dot (aA cross aB) = aB dot (nabla cross aA) - aA dot (nabla cross aB) \
    nabla cross (nabla cross aA) = nabla (nabla dot aA) - nabla^2 aA \
    "Triple products:" hspace aA cross (aB cross aC) = aB (aA dot aC) - aC (aA dot aB)\
    aa dot (ab cross ac) = ab dot (ac cross aa) = ac dot (aa cross ab)
  $
]



#section("Small Argument Approximations")[
  $
    sin(x) approx x - x^3/6 + O(x^5) hspace tan(x) approx x + x^3/3 + O(x^5)\
    ln(1 + x) approx x - x^2/2 + O(x^3) hspace e^x approx 1 + x + x^2/2 + O(x^3)\
    arctan(x) approx x - x^3/3 + O(x^5) hspace arctan(1/x) approx pi/2 - x - x^3/3 + O(x^5)\
    f(x + dx) approx f(x) + f'(x) dx + 1/2 f''(x) dx^2 + O(dx^3)\
    (1 + x)^alpha approx 1 + alpha x + alpha(alpha - 1) x^2/2 + O(x^3)\
    1/(1 + x) approx 1 - x + x^2 - x^3 + O(x^4) hspace 1/(1 - x) approx 1 + x + x^2 + x^3 + O(x^4)\
    ln(1 + x) approx x - x^2/2 + x^3/3 + O(x^4) hspace e^x approx 1 + x + x^2/2 + x^3/6 + O(x^4)\
  $
]

#section("Integral Theorems")[
  $
    "Divergence theorem:" hspace integral_V nabla dot aF dd(V) = integral.cont_(partial V) aF dot hat(n) dd(S) \
    "Stokes' theorem:" hspace integral_S (nabla cross aF) dot dd(S) = integral.cont_(partial S) aF dot dd(l) \
    "Green I:" hspace integral_V (u nabla^2 v + nabla u dot nabla v) dd(V) = integral.cont_(partial V) u pdv(v, n) dd(S) \
    "Green II:" hspace integral_V (u nabla^2 v - v nabla^2 u) dd(V) = integral.cont_(partial V) (u pdv(v, n) - v pdv(u, n)) dd(S)
  $
]

= Old Exams 

#section("Apparent Magnitude")[
  -  *Question*: A star has absolute magnitude $M = 1$. Observed at distance $d = 100 pc$, with interstellar extinction $A_lambda = 0.2$ along line of sight. What is the apparent magnitude $m$?

  - *Solution*: Absolute magnitude $M$ is defined as apparent magnitude at distance of 10 pc without extinction. Apparent magnitude $m$ at distance $d$ with extinction $A_lambda$ is given by:

    $
      m = M + 5 log_10(d/10 pc) + A_lambda = 1 + 5 log_10(100/10) + 0.2 = 6.2
    $
]

#section("Specific Intensity")[
  - *Question*: The specific intensity $I_nu$ of a source observed by an observer at large distance $R$ away from it with no intervening matter...

  - *Solution*: ... remains constant along the line of sight in absence of absorption or emission. This is because specific intensity is defined as energy per unit area per unit time per unit solid angle per unit frequency, and in free space, there are no processes to change this quantity. Thus, $I_nu$ does not change with distance in vacuum. 
]

#section("Optical Depth and Observation")[
  - *Question*: An astronomical observation is made of a cloud of dust with high optical depth $tau >> 1$ at the observing wavelength. Direct observations of the cloud will be...

  - *Solution*: ... limited to the surface of the cloud facing the observer. The high optical depth means that the cloud is opaque at that wavelength, so radiation from deeper layers cannot escape.
]

#section("Schwartzschild Criterion")[
  - *Question*: The Schwartzschild Criterion for stellar material is given by

    $
      abs(dv(T, r)) < (1 - 1/gamma) T/P dv(P, r)
    $

    When this condition holds, the material...


  - *Solution*: ... is stable against convection. This means that energy transport occurs primarily through radiation or conduction rather than through convective motions.
]

#section("Spectral Classification")[
  - *Question*: In terms of spectral classification, the sun is a...

  - *Solution*: ... G-type main-sequence star (G dwarf). It has a surface temperature of about 5,800 K and shows strong absorption lines of ionized calcium (Ca II) and neutral metals in its spectrum.
]

#section("Fusion Chains")[
  - *Question*: Important reaction chains for energy generation via fusion in stars include proton-proton (PP) chains and the Carbon-Nitrogen-Oxygen (CNO) cycle. For the sun with $T approx 107 K$, the dominant energy generation mechanism is...

  - *Answer*: ... the proton-proton (PP) chain is dominant in the sun, as it operates efficiently at temperatures around 10 million K. The CNO cycle becomes more significant in hotter stars with temperatures above 15 million K.
]

#section("Milky Way Dynamical Support")[
  - *Question*: The different stellar components of the Milky Way, the disk, the bulge and the halo objects are not all dynamically supported against gravitational collapse in the same manner. In which manner are the disk, bulge and halo objects supported?

  - *Solution*: Halo and bulge objects are primarily supported by random motions (velocity dispersion), while the disk is supported by rotation (angular momentum).
]

#section("Disks of Galaxies")[
  - *Question*: Compared to elliptical galaxies, the disks of spiral galaxies are...

  - *Solution*: Spiral galaxies have younger stellar populations, more gas and dust, and ongoing star formation. Theyr radiation is often bluer due to the presence of hot, young stars, whereas elliptical galaxies are dominated by older, redder stars.
]

#section("HII and HIII Regions")[
  - *Question*: In contrast to HI regions, HII regions are...

  - *Solution*: ... regions of ionized hydrogen surrounding young, hot stars. They are approximately 100 times hotter than HI regions, which are composed of neutral hydrogen gas.
]

#section("Relaxation Time")[
  - *Question*: Systems of stars such as galaxies or globular clusters are often observed to be gravitationally relaxed. Compare violent relaxation time $T_"VR"$, collisional relaxation time $T_"coll"$ and the typical crossing time $T_"cross"$ for such systems.
  - *Solution*: In such systems, the typical crossing time $T_"cross"$ is on the timescale of violent relaxation time $T_"VR"$, which is much shorter than the collisional relaxation time $T_"coll"$. Thus, $T_"cross" approx T_"VR" << T_"coll"$.
]

#section("Singular Isothermal Sphere")[
  - *Question*: The singular isothermal sphere (SIS) is a relaxed self-gravitating system with density profile $rho(r) = prop r^(-2)$. The root mean square velocity $avg(v^2)$ of particles in the SIS is...

  - *Solution*: ... independent of radius $r$. This is because the density profile leads to a gravitational potential that results in a constant velocity dispersion throughout the system.
]

#section("Jeans Instability")[
  - *Question*: In the Jeans analysis of gravitational instability, we can define the Jeans mass $M_J$ and the Jeans wavenumber $k_J$ . Pressure would be dominating over gravity, preventing collapse on length and mass scales where...

  - *Solution*: ... $abs(k) > k_J$ and $M < M_J$. On these scales, the pressure support is sufficient to counteract gravitational attraction, leading to stability against collapse.
]

#section("Gas in Intracluster Medium")[
  - *Question*: The typical temperature of the hot, ionized gas in the intracluster medium of galaxy clusters is...

  - *Solution*: ... approximately $10^7$ to $10^8$ Kelvin. This high temperature is due to the gravitational potential of the cluster, which heats the gas through shocks and compression.
]

#section("Cosmological Principle")[
  - *Question*: In large scale studies of the distribution of structure in the universe we find taht matter observed to be statistically homogeneous and isotropic on scales larger than...

  - *Solution*: ... approximately 100 Mpc. This scale is where the cosmological principle holds, indicating that the universe appears uniform and the same in all directions when viewed on sufficiently large scales.
]

#section("Telescope Resolution and Cosmic Background")[
  - *Question*: The moon has an angular extent of about $0.5 deg$ on the sky. A telescope measuring CMB uses thermal emission of the moon for calibration. To do so, the moon needs to be unresolved, meaning its angular size must be smaller than the telescope's resolution. Assuming a resolution with Rayleigh criterion for diffraction limited sircular aperture and assuming CMB observations at frequency of $nu = 150 "GHz"$ with a mirror of diameter $D = 6m$, would the moon be resolved or unresolved?

  - *Solution*: The angular resolution $theta$ of the telescope is given by the Rayleigh criterion:

    $
      theta = 1.22 lambda/D
    $

    where $lambda = c/nu$. For $nu = 150 "GHz"$, $lambda = (3 dot 10^8 "m/s")/(150 dot 10^9 "Hz") = 2 dot 10^(-3) "m"$.

    Thus,

    $
      theta = 1.22 (2 dot 10^(-3) "m")/(6 "m") approx 4.07 dot 10^(-4) "radians" approx 0.023 deg
    $

    Since $0.023 deg < 0.5 deg$, therefore the moon would be resolved.
]

#section("Scaling Relations")[
  - *Question*: Use the condition of hydrostatic equilibrium to find the scaling relation of Pressure $P$ in terms of radius $R$ and mass $M$ of a self-gravitating system.

  - *Solution*: Hydrostatic equilibrium condition: $dv(P, r) = - G M(r) rho(r)/r^2$.

    Assuming constant density $rho = M/(4/3 pi R^3)$ and mass enclosed $M(r) approx M (r/R)^3$ for $r <= R$.

    Integrating from center to surface ($r = R$):

    $
      integral_(0)^(P) dd(P) = - G M rho integral_(0)^(R) (r/R)^3/r^2 dd(r)\
      => P = (G M rho)/(R^2) integral_(0)^(R) r dd(r) = (G M rho R)/(2)
    $

    Thus, the scaling relation is $P prop M^2/R^4$.

  - *Question*: Use equation of state for ideal gas to find scaling relation of Temperature $T$ in terms of radius $R$ and mass $M$ of a self-gravitating system.

  - *Solution*: Equation of state for ideal gas: $P = (rho k_B T)/(mu m_p)$.

    From previous result, $P prop M^2/R^4$ and $rho prop M/R^3$.

    Thus,

    $
      (rho k_B T)/(mu m_p) prop M^2/R^4 => T prop (mu m_p)/(k_B) (M^2/R^4) (R^3/M) = (mu m_p)/(k_B) (M/R)
    $

    Therefore, the scaling relation is $T prop M/R$.

  - *Question*: Use condition for radiative energy transport to find scaling relation of Luminosity $L$ in terms of mass $M$.

  - *Solution*: Radiative energy transport condition: $dv(T, r) = - (3 kappa rho L(r))/(16 pi a c T^3 r^2)$.

    Assuming constant density $rho = M/(4/3 pi R^3)$ and luminosity enclosed $L(r) approx L (r/R)^3$ for $r <= R$.

    Integrating from center to surface ($r = R$):

    $
      integral_(T_c)^(T_s) dd(T) = - (3 kappa rho L)/(16 pi a c T^3) integral_(0)^(R) (r/R)^3/r^2 dd(r)\
      => T_s - T_c = - (3 kappa rho L)/(16 pi a c T^3) integral_(0)^(R) r dd(r) = - (3 kappa rho L R)/(32 pi a c T^3)
    $

    Assuming $T_c >> T_s$, we have:

    $
      T_c prop (kappa rho L R)/(T^3) => L prop (T_c^4)/(kappa rho R)
    $

    Substituting $rho prop M/R^3$ and $T_c prop M/R$ from previous results:

    $
      L prop (M^4/R^4)/(kappa (M/R^3) R) = (1/kappa) (M^3/R)
    $

    Therefore, the scaling relation is $L prop M^3/R$.
]

#section("Total Thermal Energy of the Sun")[
  - *Question*: Calculate the total thermal energy of the Sun from its mass and the fact that its internal temperature is on the order of $10^7 K$. Show that its of the same order as a rough estimate based on gravitational potential energy. Assume the Sun is comprised of fully ionized hydrogen with thermal energy per particle of $E_"th" = (3/2) k_B T$.

  - *Solution*: Total number of particles in the Sun:

    $
      N = M_sun/m_p approx (2 dot 10^30 "kg")/(1.67 dot 10^(-27) "kg") approx 1.2 dot 10^57
    $

    Total thermal energy:

    $
      E_"th" = N E_"th" = N (3/2) k_B T approx 2.5 dot 10^41 "J"
    $

    Gravitational potential energy of the Sun:

    $
      U = - (3/5) (G M_sun^2)/(R_sun) approx - 1.1 dot 10^41 "J"
    $

    The total thermal energy $E_"th, total" approx 2.5 dot 10^41 "J"$ is of the same order as the gravitational potential energy $U approx -1.1 dot 10^41 "J"$, confirming the estimate.
]

#section("Strömingen Radius")[
  - *Question*: For a HII region in steady state, the rate of ionizations equals the rate of recombinations. Use this fact to derive the Strömingen radius $R_s = (3/(4 pi) N_gamma/(alpha n_p n_e))^(1/3)$, where $alpha$ is recombination rate defined such that recombination rate per unit volume is $alpha n_p n_e$, and $N_gamma$ is the number of ionizing photons emitted per second by the central star.

  - *Solution*: Given the recombination rate per unit volume is $alpha n_p n_e$, the total recombination rate within a sphere of radius $R_s$ is:

    $
      R_"rec" = integral_(0)^(R_s) alpha n_p n_e 4 pi r^2 dd(r) = 4/3 pi R_s^3 alpha n_p n_e
    $

    In steady state, the rate of ionizations equals the rate of recombinations:

    $
      N_gamma = R_"rec" => N_gamma =4/3 pi R_s^3 alpha n_p n_e
    $

    Solving for $R_s => R_s = (3/(4 pi) N_gamma/(alpha n_p n_e))^(1/3)$
]

#section("Mean Squared Velocity")[
  - *Question*: Derive the mean square velocity $avg(v^2)$ of a self-gravitating system in virial equilibrium with total mass $M$. Show that the time averaged kinetic and potential energies are $overline(K) approx 1/2 M avg(v^2)$ and $overline(V) approx - (G M^2)/(2 avg(R))$ and drive an expression for $avg(v^2)$. Assume all $N$ stars have the same mass $m = M/N$ and that the average distance between stars is $avg(R)$.

  - *Solution*: The total kinetic energy $K$ of the system is:

    $
      K = sum_(i=1)^(N) 1/2 m v_i^2 = 1/2 m sum_(i=1)^(N) v_i^2 = 1/2 M avg(v^2)
    $

    The total potential energy $V$ of the system can be approximated as:

    $
      overline(V) approx - G sum_(i<j) (m^2)/r_"ij" approx - G (M^2)/(2 avg(R))
    $

    where $r_"ij"$ is the distance between stars $i$ and $j$, and we approximate the average distance between stars as $avg(R)$.

    By the virial theorem, for a self-gravitating system in equilibrium, we have:

    $
      2 overline(K) + overline(V) = 0 => 2 (1/2 M avg(v^2)) - (G M^2)/(2 avg(R)) = 0
    $

    Solving for $avg(v^2)$ gives:

    $
      avg(v^2) = (G M)/(avg(R))
    $
]

#section("Flat Rotation Curves")[
  - *Question*: In the solar neighbourhood, the Milky Way has a flat rotation curve with circular velocity $v(r) = v_c$, implying a density profile $rho(r) prop r^(-2)$. In the case of a flat rotation curve with a cut-off radius $R$, derive an expression for the total mass $M_r$ enclosed as a function of radius $r < R$.

  - *Solution*: The general expression for the enclosed mass is:

    $
      M_r = integral_(0)^(r) 4 pi r'^2 rho(r') dd(r')\
      => M_r prop  r
    $

    Therefore, with total mass $M$ we can write:

    $
      M_r = cases(M (r/R) hspace hspace& "for" r < R, M hspace& "for" r >= R)
    $

  - *Question*: Using the result from above, derive an expression for the escape velocity from any radius $r < R$ in terms of the circular velocity $v_c$.

  - *Solution*: The escape velocity $v_"esc"(r)$ from radius $r$ is given by:

    $
      1/2 v_"esc"^2 = - integral_(oo)^r (G M_r')/(r'^2) dd(r') = evaluated((G M)/r')_oo^R - evaluated((G M_r')/r' ln(r'))_ R^r = (G M)/R (1+ ln(R/r))\
      v_c (r) = sqrt((G M_r)/r) => v_"esc"^2 = 2 v_c^2 (1 + ln(R/r))
    $

  - *Question*: The largest velocity measurement of any star in the solar neighbourhood at $r approx 8 "kpc"$ is $440 "km"/"s"$. Assuming this star is still gravitationally bound to the Milky Way, estimate a lower limit in $M_sun$ to the mass of the Milky Way. Take rotation velocity in solar neighbourhood to be $v_c = 230 "km"/"s"$.

  - *Solution*: From above: $R/r = exp(v_"esc"^2/(2 v_c^2) - 1)$. 

    $
      => R > 8 "kpc" dot exp((440^2)/(2 dot 230^2) - 1) approx 18 "kpc"\
    $

    Given $v_c (8 "kpc") = 230 "km"/"s"$, we can estimate mass enclosed within 18 kpc:

    $
      M_"8kpc" = (8 "kpc" dot (230 "km"/"s"))/G approx 9.8 dot 10^10 M_sun\
      => M = M_"8kpc" (R/8 "kpc")  => "we find" M > 9.8 dot 10^10 M_sun (18/8) approx 9.8 dot 10^11 M_sun
    $
]

#section("Cosmological Constant and Expansion")[
  - *Question*: Einstein's cosmological constant is one of the possible models for dark energy. Consider a spatially flat homogeneous and isotropic universe dominated by a cosmological constant $Lambda$, which can be modelled as a fluid with an energy density $rho_Lambda c^2$, independent of time.

  - *Question*: The Friedmann equation is given by
    $
      dot(a)^2/a^2 = 8 pi G/3 rho - k c^2/a^2
    $
    Write down the Friedmann equation for a flat universe whose energy density is dominated by dark energy. You can assume that the universe contains neither matter nor radiation.

  - *Solution*: Set $k = 0$, keep only $rho = rho_Lambda$. Then $ dot(a)^2/a^2 = 8 pi G/3 rho_Lambda $.

  - *Question*:  Rewrite this version of the Friedmann equation in terms of the Hubble parameter $H$. What is the time dependence of $H$?

  - *Solution*: Define $H = dot(a)/a$, rewrite the Friedmann equation. Then $H^2 = 8 pi G/3 rho_Lambda$. $H$ is constant with time.

  - *Question*: Use the result from (b) and the definition of the Hubble parameter to write an expression for $dv(a, t)$ of the scale factor $a$, in terms of $H$.

  - *Solution*: Start from $H = dot(a)/a$, solve for $dot(a)$. $=> dv(a, t) = a H$.

  - *Question*: Show that the solution of the equation from (c) is that the scale factor grows exponentially with time and give the coefficient in the argument of the exponential.

  - *Solution*: Separate variables and integrate. $dd(a)/a = H dd(t)$, so $dd(log a) = H dd(t)$. Integrating, $log a prop H t => a prop e^(H t)$.
]

#section("Naked-Eye Limiting Magnitude")[
  - *Question*: In good conditions, one can observe stars with the naked eye at apparent magnitudes less than $m = 6.5$. Out to what distance from us would a star of absolute magnitude $M = 4$ be observable unaided? Assume no absorption along the line-of-sight.

  - *Solution*: Neglecting extinction, the distance modulus is $m - M = 5 log_(10) (d/(10 pc))$.
    With $m < 6.5$ and $M = 4$:
    $
      4 + 5 log_(10) (d/(10 pc)) < 6.5 hspace log_(10) (d/(10 pc)) < 0.5 hspace d < 10^(3/2) "pc" approx 30 "pc"
    $
]

#section("B-V Color Comparison")[
  - *Question*: Consider two stars, S1 and S2 with B-V colors of 0.5 and 1.0 respectively. Which of the following statements has to be true about these stars over the range of wavelengths these bands cover? Note that the B band is bluer than the V band.

  - *Solution*: S1 has a smaller B-V color, implying it is relatively brighter in the B band than the V band. Since the B band is bluer than the V band, S1 emits more short wavelength light than S2. Distance and brightness differences cannot be inferred by difference in colors alone.
]

#section("Local vs Global Thermal Equilibrium")[
  - *Question*: A system of size $L$ with collisional mean free path $l$ can be said to be in local thermal equilibrium through collisions but not in global thermal equilibrium if macroscopic thermodynamic variables (e.g. $T$ and $P$) are

  - *Solution*: For collisional local equilibrium to hold, it is sufficient that $l << L$. This can occur without global equilibrium when macroscopic variables such as temperature and pressure vary in time and position.
]

#section("Radiative Transfer with Constant Properties")[
  - *Question*: For radiative transfer through matter with constant properties and optical depth $tau_nu$, the relationship between the intensity $I_nu$ and the source function $S_nu$ is

  - *Solution*: In matter with constant properties, $I_nu (tau_nu) = I_nu e^(-tau) + S_nu (1 - e^(-tau_nu))$.
    In the optically thick limit ($tau_nu >> 1$), $I_nu approx S_nu$.
    In the optically thin limit ($tau_nu << 1$), $e^(-tau_nu) approx 1 - tau_nu + O(tau_nu^2)$, so $I_nu approx S_nu tau_nu$.
]

#section("HR Diagram: Red Giant Transition")[
  - *Question*: In a typical trajectory along the Hertzsprung–Russell diagram, when a star leaves the main sequence and transitions to a red giant it will become

  - *Solution*: When becoming a red giant, a star will traverse from the main sequence up (higher luminosity) and to the right (lower temperature) in the HR diagram. Additionally, the stellar envelope expands significantly.
]

#section("Solar Neutrino Oscillations")[
  - *Question*: (3 points) Reactions in the sun emit electron neutrinos, $nu_e$, at a rate that can be predicted through solar models. Observations of the Sun suggest that neutrinos oscillate between flavours (indicating they have mass) because we detect...

  - *Solution*: We observe about $1/3$ of the expected electron neutrino flux. Due to neutrino oscillations, the $nu_e$ emitted from the Sun can change flavour (to $nu_mu$ or $nu_tau$) before being observed on Earth.
]

#section("Main Sequence Energy Source")[
  - *Question*: As a main sequence star, the sun primarily generates energy through which process?

  - *Solution*: Main sequence stars like the sun primarily generate energy through fusing hydrogen into helium.
]

#section("Molecular Clouds")[
  - *Question*: In the interstellar medium, molecular clouds are

  - *Solution*: Molecular clouds are cool, dense regions of the interstellar medium (ISM) containing molecules and which are the birth place of stars.
]

#section("Curve of Growth")[
  - *Question*: The 'curve of growth' describes the relation between...

  - *Solution*: The 'curve of growth' describes the relation between the equivalent width of a spectral absorption line and the column density of the absorbing gas.
]

#section("Virial Theorem: Total Energy")[
  - *Question*: For a self-gravitating system in steady state, the virial theorem holds, relating the time averaged kinetic energy $overline(K)$ and $overline(V)$. In this case, which expression for the total energy holds?

  - *Solution*: The virial theorem states $2 overline(K) + overline(V) = 0$. With $overline(E) = overline(K) + overline(V)$, we have $overline(E) = 1/2 overline(V)$.
]

#section("Self-Gravitating Systems and Relaxation")[
  - *Question*: Self-gravitating stellar dynamical systems such as galaxies and globular clusters

  - *Solution*: Self gravitating systems found in astrophysics such as galaxies and globular clusters relax to a state which is not thermal equilibrium, via processes other than collisions which are inefficient in this case.
]

#section("ICM Bremsstrahlung Emission")[
  - *Question*: Consider a galaxy cluster whose ionized intracluster medium (ICM) has an approximately constant temperature and metallicity but a spatially varying gas density, $rho_"gas"$. Observations of its emission in the X-ray band through thermal bremsstrahlung

  - *Solution*: With all other variables constant, the emission from thermal bremsstrahlung is $prop n_e n_p prop rho_"gas"^2$. Therefore, the X-ray emission from this process is more concentrated in high density regions of the cluster.
]

#section("Galaxy Cluster Definition")[
  - *Question*: A galaxy cluster refers to a gravitationally bound system typically made up of

  - *Solution*: Galaxy clusters typically comprise over 100 (and up to approx 1000) galaxies gravitationally bound within a halo of mass approx 10^15 M_sun.
]

#section("Constant-Density Star")[
  - *Question*: Consider a hypothetical star of radius $R$ with density $rho$ that is constant, independent of radial distance $r$ from the centre. The star is composed of a classical, non-relativistic, ideal gas of fully ionized hydrogen.

    (a) Using the hydrostatic equilibrium equation with the boundary condition $P(R) = 0$, show that the pressure profile is 
    
    $P(r) = 2/3 pi G rho^2 (R^2 - r^2)$. Hint: integrate from $r$ to $R$.

    (b)  Using the equation of state, find the temperature profile $T(r)$.

    (c)  Assume that the nuclear energy production rate depends on temperature as $epsilon prop T^4$. At what radius does $epsilon$ decrease to $0.1$ of its central value?

  - *Solution*:
    (a) The hydrostatic equilibrium equation gives $dv(P, r) = -(G M_r rho)/r^2$. For constant $rho$, $M_r = 4/3 pi r^3 rho$ so
    $
      integral_(P(r))^(P(R)) dd(P') = - integral_r^R (G M_r' rho)/(r'^2) dd(r') \
      => P(R) - P(r) = -(4 pi/3) G rho^2 integral_r^R r' dd(r') = -4/3 pi G rho^2 (R^2/2 - r^2/2)
    $
    With $P(R) = 0$, $P(r) = (2 pi/3) G rho^2 (R^2 - r^2)$.

    (b) For fully ionized hydrogen, $P = (2 rho/m_H) k_B T$. Using (a),
    $\
      T(r) = (m_H/(2 rho k_B)) P(r) = (pi/3) (m_H G rho/k_B) (R^2 - r^2)
    $

    (c) With $epsilon(r) prop T^4(r)$,
    $
      alpha = epsilon(r)/epsilon(0) = (T(r)/T(0))^4 = ((R^2 - r^2)/R^2)^4 = (1 - (r/R)^2)^4 \
      => r/R = (1 - alpha^(1/4))^(1/2)
    $
    
    For $alpha = 0.1$, $r approx 0.66 R$.
]
