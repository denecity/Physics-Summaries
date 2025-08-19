#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Physics Cheatsheet",
  author: "Denis Titov",
  language: "ENG",
)


= Wave Properties and Grating

#section("Wave Equation & Solutions", intro: [
  Fundamental PDE governing electromagnetic wave propagation. Connects spatial curvature to temporal acceleration.
])[

  *Wave equation* (electromagnetic waves in vacuum):
  $
    nabla^2 E = 1/c^2 pdv(E, t, 2)
  $

  Relates spatial variation (Laplacian) to temporal acceleration.

  *Plane wave* (parallel wavefronts, far from source):
  $
    E(r, t) = E_0 exp(i (k dot r - omega t)) = E_0 [cos(k dot r - omega t) + i sin(k dot r - omega t)]
  $

  Physical wave is real part of complex expression.

  *Spherical wave* (point source, expanding outward):
  $
    E(r, t) = E_0/r exp(i(k r - omega t))
  $

  *Energy conservation:* Amplitude ∝ 1/r ensures intensity ∝ 1/r² (energy spread over sphere surface 4πr²).

]
#section("Huygens-Fresnel Principle", intro: [
  Every point on wavefront acts as secondary source of spherical wavelets. New wavefront is envelope of all wavelets.
])[

  *Core concept:* Each point on current wavefront becomes source of spherical wavelets.

  *Mathematical expression:*
  $
    E_0(P') prop e^(i k r)/r
  $

  Each wavelet decreases in amplitude with distance $r$ from source point.

  *Wavefront construction:* Future wavefront position = envelope of all secondary wavelets from current wavefront.

  *Physical insight:* Explains wave propagation, diffraction around obstacles, and interference patterns as natural consequence of wave superposition.

]
#section("Single-Slit Diffraction", intro: [
  Interference pattern from single aperture. Demonstrates wave nature through characteristic minima and maxima positions.
])[

  *Dark fringes* (destructive interference):
  $
    a sin(theta) = m lambda hspace "where" m = plus.minus 1, plus.minus 2, ...
  $

  Path difference between top and bottom of slit equals integer wavelengths.

  *Bright fringes* (approximate maxima):
  $
    a sin(theta) approx (m + 1/2) lambda hspace "where" m = plus.minus 1, plus.minus 2, ...
  $

  *Intensity pattern:*
  $
    I(theta) = I_0 (sin(beta)/beta)^2 hspace "where" beta = (pi a sin(theta))/lambda
  $

  Classic sinc² function with bright central maximum and progressively weaker side lobes.

  *Spreading rule:* $lambda arrow.t$ or $a arrow.b$ $=> theta arrow.t$

  Larger wavelength or smaller aperture increases diffraction spreading.

]
#section("Transmission (Double-Slit Interference)", image: image("image-2.png"), iw: 35%, intro: [
  Classic interference pattern from two identical slits.

  *Setup:*
  - Slit width: $d$
  - Center spacing: $s$
  - Observation angle: $theta$

  *Key physics:* Interference creates bright/dark fringes modulated by single-slit diffraction envelope.
])[
  Path difference and wave vector:

  $
    k = 2 pi / lambda hspace Delta = s sin(theta)\
  $

  Amplitude and intensity (width $d$, separation $s$):

  $
    U(theta) prop 2 sinc((k d/2) sin(theta)) cos((k s/2) sin(theta))\
    I(theta) prop 4 sinc((k d/2) sin(theta))^2 cos((k s/2) sin(theta))^2
  $

  Fringes/envelope:

  - Interference maxima: $s sin(theta) = m lambda$; minima: $s sin(theta) = (m + 1/2) lambda$.
  - Single-slit zeros (envelope): $d sin(theta) = m lambda$, $m ≠ 0$.
  - Note: $sinc(x) = sin(x)/x$.
]
#section("N-Element Reflection Grating", intro: [
  Diffraction grating with N elements. Form factor (single element) × structure factor (N-element interference).
])[

  N equally spaced reflective elements, width $a$, period $d$ (center-to-center spacing).

  Amplitude and intensity:

  $
    U prop e^(i k r_a) sinc((k_X a)/2) (sin(k_X N d / 2))/(sin(k_X d / 2)) e^(-i k_X (N-1) d / 2)\
    I prop sinc^2((k_X a)/2) (sin^2(k_X N d / 2))/(sin^2(k_X d / 2))
  $

  Where $k_X$ is the x-component of the wave vector difference.

  Structure:
  - *Form factor*: $sinc^2((k_X a)/2)$ - single element diffraction envelope
  - *Structure factor*: $(sin^2(k_X N d / 2))/(sin^2(k_X d / 2))$ - interference from N elements

  Principal maxima occur when $sin(k_X d / 2) = 0$, giving sharp, widely spaced peaks.
  Between principal maxima are $(N-2)$ secondary minima.
]
#section("Fresnel Equations & Reflection", intro: [
  Complete description of light reflection and transmission at interfaces. Depends on polarization and incident angle.
])[

  *Amplitude coefficients* (p = parallel, s = perpendicular to plane of incidence):

  $
    r_p = (n_2 cos theta_1 - n_1 cos theta_2)/(n_2 cos theta_1 + n_1 cos theta_2) hspace t_p = (2 n_1 cos theta_1)/(n_2 cos theta_1 + n_1 cos theta_2)\
    r_s = (n_1 cos theta_1 - n_2 cos theta_2)/(n_1 cos theta_1 + n_2 cos theta_2) hspace t_s = (2 n_1 cos theta_1)/(n_1 cos theta_1 + n_2 cos theta_2)
  $

  *Reflectance and transmittance* (intensity fractions):
  $
    R_p = r_p^2 hspace R_s = r_s^2\
    T_p = (n_2 cos theta_2)/(n_1 cos theta_1) t_p^2 hspace T_s = (n_2 cos theta_2)/(n_1 cos theta_1) t_s^2
  $

  *Energy conservation:* $R + T = 1$

  *Normal incidence* (special case, $theta_1 = 0$):
  $
    R = ((n_1 - n_2)/(n_1 + n_2))^2 hspace T = (4 n_1 n_2)/((n_1 + n_2)^2)
  $

  *Brewster's angle* ($R_p = 0$):
  $
    tan(theta_B) = n_2/n_1
  $

  At Brewster's angle, p-polarized light has zero reflection - principle behind polarized sunglasses.

]
#section(
  "Compton Scattering",
  intro: [
    Inelastic scattering of photons by free electrons. Energy and momentum conservation determine scattered photon wavelength shift.
  ],
  image: image("image.png"),
  iw: 50%,
)[

  Photon-electron collision with energy and momentum conservation:

  *Energy conservation:*
  $
    h f = h f' + K_e hspace => h c/lambda = h c/lambda' + (gamma - 1) m_e c^2
  $

  *Momentum conservation:*
  $
    "x-component:" h/lambda = h/lambda' cos(theta) + gamma m_e v cos(phi)\
    "y-component:" 0 = h/lambda' sin(theta) - gamma m_e v sin(phi)
  $

  *Compton wavelength and wavelength shift:*
  $
    lambda_c = h/(m_e c) = 2.43 times 10^(-12) "m"\
    Delta lambda = lambda' - lambda = lambda_c (1 - cos(theta))
  $

  Where $theta$ is photon scattering angle, $phi$ is electron recoil angle.

  *Key insights:*
  - Demonstrates particle nature of light
  - Maximum wavelength shift: $Delta lambda_("max") = 2 lambda_c$ at $theta = 180°$
  - Independent of initial photon wavelength

]
#section("Rayleigh Scattering", intro: [
  Elastic scattering by particles much smaller than wavelength ($d << lambda$). Strong $lambda^(-4)$ dependence explains blue sky.
])[

  Scattering intensity for particles much smaller than wavelength:

  $
    I prop lambda^(-4) prop omega^4
  $

  Cross-section for small particles:

  $
    sigma prop (2 pi/lambda)^4 r^6 ((n^2-1)/(n^2+2))^2
  $

  Where:
  - $r$ = particle radius ($r << lambda$)
  - $n$ = refractive index of particle
  - $lambda$ = wavelength of incident light

  *Key physics:*
  - Blue light (shorter $lambda$) scattered ~16× more than red light
  - Explains blue sky: molecules scatter blue more than red
  - Explains red sunsets: blue light scattered away, red transmitted
  - Symmetric scattering pattern for small particles

]
#section("Jones Calculus", intro: [
  Vector description of light polarization states. Matrices represent optical elements like polarizers and waveplates.
])[

  Electric field components for light polarization. Jones vector describes E-field amplitude and relative phase:

  $
    arrow(E) = mat(E_x; E_y) = mat(E_(0,x) e^(i delta_x); E_(0,y) e^(i delta_y)) => mat(E_(0,x); E_(0,y) e^(i delta))
  $

  Where $delta = delta_y - delta_x$ is relative phase difference.

  *Common polarization states:*

  $
    "Vertical:" mat(0; 1) hspace "Horizontal:" mat(1; 0) hspace "45° linear:" 1/sqrt(2) mat(1; 1)\
    "Left circular:" 1/sqrt(2) mat(1; i) hspace "Right circular:" 1/sqrt(2) mat(1; -i)\
    "Right elliptical:" 1/sqrt(A^2 + B^2) mat(A; -i B) hspace "Left elliptical:" 1/sqrt(A^2 + B^2) mat(A; i B)
  $

  *Key Jones matrices for optical elements:*

  $
    "Linear polarizer (x):" mat(1, 0; 0, 0) hspace "Quarter-wave plate:" mat(1, 0; 0, i)\
    "Half-wave plate:" mat(1, 0; 0, -1) hspace "Rotation by" theta: mat(cos theta, -sin theta; sin theta, cos theta)
  $
]
#section("Polarization States & Applications", intro: [
  Complete classification of light polarization states. Applications in polarizers, waveplates, and optical components.
])[

  *Polarization types* (defined by phase difference φ between Ex and Ey):

  $
    "Linear:" phi = 0 "or" pi hspace "Circular:" phi = plus.minus pi/2, E_x = E_y\
    "Elliptical:" "general case with arbitrary" phi "and amplitude ratio"
  $

  *P-polarization:* E-field parallel to plane of incidence
  *S-polarization:* E-field perpendicular to plane of incidence

  *Elliptical polarization* (π/2 phase difference):
  $
    arrow(E)(z,t) = E_(0x) cos(k z - omega t) hat(x) + E_(0y) sin(k z - omega t) hat(y)
  $

  E-field traces ellipse over time. If $E_(0x) = E_(0y)$, becomes circular polarization.

  *Brewster's angle applications:*
  $
    tan(theta_B) = n_2/n_1
  $

  - Polarized sunglasses block horizontally-polarized glare
  - Laser brewster windows minimize reflection losses
  - Stress analysis using photoelasticity

  *Three-polarizer transmission:*
  Unpolarized light $I_0$ through polarizers at angles 0°, $phi_2$, $90° - phi_2$:

  $
    I_1 = I_0/2 hspace "after P1"\
    I_3 = I_0/8 sin^2(2 phi_2) hspace "final intensity"
  $

  Maximum transmission: $phi_2 = 45°$ gives $I_3 = I_0/8$.

  Counter-intuitive: Middle polarizer at 45° allows more light than removing it entirely.

]
#section("Macroscopic Maxwell's Equations", intro: [
  Maxwell equations in matter with auxiliary fields D and H. Include material polarization and magnetization effects.
])[

  Maxwell's equations in materials (no free charges/currents):

  $
    nabla dot aD = 0 hspace nabla dot aB = 0\
    nabla cross aE = -pdv(aB, t) hspace nabla cross aH = pdv(aD, t)
  $

  *Auxiliary fields in materials:*

  $
    aD = epsilon_0 aE + aP hspace aH = 1/mu_0 aB - aM
  $

  Where $aP$ is polarization density, $aM$ is magnetization density.

  *Linear materials:*

  $
    aP = epsilon_0 chi_e aE hspace aD = epsilon aE = epsilon_0 (1 + chi_e) aE\
    epsilon = n^2 epsilon_0 hspace => aD = n^2 epsilon_0 aE
  $

  *Key relationships:*

  $
    "Energy density:" u = 1/2 (aE dot aD + aB dot aH)\
    "E-B relation (plane wave):" B = n/c E\
    "Refractive index:" n = sqrt(epsilon/epsilon_0) = sqrt(1 + chi_e)
  $
]
#section("Bragg's Law", intro: [
  Constructive interference condition for crystal diffraction. Essential for X-ray crystallography and structure determination.
])[

  Constructive interference condition for waves reflecting off parallel atomic planes in crystals:

  $
    2 d sin(theta) = n lambda
  $

  Where:
  - $d$ = spacing between atomic planes
  - $theta$ = incident angle (measured from plane surface)
  - $n$ = integer (1, 2, 3, ...)
  - $lambda$ = wavelength

  *Applications:*
  - X-ray crystallography for determining crystal structure
  - Neutron diffraction
  - Electron diffraction

  *Key insight:* Path difference between rays from adjacent planes is $2d sin(theta)$. Constructive interference occurs when this equals integer multiples of wavelength.
]
#section("X-Ray Michelson Interferometer", intro: [
  Advanced interferometry using crystal diffraction. Silicon crystals split/recombine X-ray beams via Bragg diffraction instead of mirrors.
])[

  *Diffraction condition* (special case of Bragg's law):
  $
    d = lambda/2 hspace "when" n = 1, theta = 90°
  $

  Sets characteristic length scale for device geometry.

  *Path difference* (standard Michelson):
  $
    Delta L = 2(d_1 - d_2)
  $

  Where $d_1, d_2$ are arm lengths. Factor of 2 from round-trip travel.

  *Thermal stability* requirement:
  $
    Delta L = alpha L Delta T < lambda/2\
    => Delta T < lambda/(2 alpha L)
  $

  Where $alpha$ is thermal expansion coefficient, $L$ is arm length.

  *Key challenge:* X-ray wavelengths are ~1000× shorter than visible light, requiring extreme thermal stability for coherent interference.

]
#section("Particle Beam & Cross-Section", intro: [
  Beam attenuation through matter. Cross-section σ represents effective target area for particle interactions.
])[

  *Beam attenuation differential equation:*
  $
    dd(I) = -I n sigma dd(x)
  $

  Where:
  - $I$ = beam intensity (particles/area/time)
  - $n$ = number density of target particles
  - $sigma$ = interaction cross-section
  - $x$ = distance through material

  *Beer-Lambert Law* (integrated solution):
  $
    I(L) = I_0 e^(-n sigma L) hspace => ln(I_0/I(L)) = n sigma L
  $

  *Total force on target:*
  $
    F = p R (1 - e^(-n sigma d))
  $

  Where $p$ is momentum per particle, $R$ is particle flux, $d$ is target thickness.

  *Key insights:*
  - Cross-section has units of area (typically barns: $10^(-24) "cm"^2$)
  - Exponential attenuation characteristic of random interactions
  - Force depends on momentum transfer and stopping fraction

]
#section("2D Diffraction from a Cross-Shaped Aperture", intro: [
  Complex aperture diffraction using additive principle. Cross = vertical rectangle + horizontal rectangle, with interference between components.
])[

  *Additive aperture principle:*
  Cross shape (+) = vertical bar (|) + horizontal bar (—)

  *Component amplitudes:*
  $
    T_("vert") = A_("vert") sinc(v_x w) sinc(v_y h_("long"))\
    T_("horiz") = A_("horiz") sinc(v_x w_("long")) sinc(v_y h)
  $

  Where $v_x, v_y$ are spatial frequencies, $w, h$ are component dimensions.

  *Total complex amplitude:*
  $
    T_("cross")(v_x, v_y) = T_("vert") + T_("horiz")
  $

  *Intensity pattern:*
  $
    I = abs(T_("cross"))^2 = abs(T_("vert") + T_("horiz"))^2
  $

  *Key features:*
  - Bright central spot with radiating spikes
  - Spikes perpendicular to cross arms
  - Interference terms create complex structure (not simple product)
  - Demonstrates linearity of Fourier transforms

]
#section("Rayleigh Criterion", intro: [
  Angular resolution limit for distinguishing two point sources. Maximum of one source coincides with first minimum of the other.
])[

  *Criterion:* Two objects resolved when max(O₁) = min(O₂)

  *Slit aperture* (width $a$):
  $
    sin(theta) approx theta = lambda/a
  $

  *Circular aperture* (diameter $D$, telescopes):
  $
    sin(theta) approx theta = 1.22 lambda/D
  $

  *Key insights:*
  - Better resolution (smaller $theta$) requires larger aperture or shorter wavelength
  - Applies to telescopes distinguishing binary stars, headlights at distance
  - Fundamental diffraction limit independent of lens quality

]
#section("Abbe Diffraction Limit", intro: [
  Spatial resolution limit for microscopes. Minimum resolvable distance depends on wavelength and numerical aperture.
])[

  *Resolution limit:*
  $
    d_("min") = lambda/(2 "NA") = lambda/(2 n sin(alpha))
  $

  *Numerical Aperture (NA):*
  $
    "NA" = n sin(alpha)
  $

  Where:
  - $n$ = refractive index of medium (air: n=1, oil: n>1)
  - $alpha$ = half-angle of maximum light cone collected by lens

  *Geometric relation:*
  $
    "NA" = n dot r/sqrt(d^2 + r^2)
  $

  Where $r$ is lens radius, $d$ is working distance.

  *Applications:*
  - Oil immersion increases resolution (n > 1)
  - UV microscopy improves resolution (smaller λ)
  - Electron microscopy: much smaller effective wavelength

]
#section("Thin-Film Interference", intro: [
  Colorful interference from reflections at front and back surfaces of thin films. Phase shifts from path difference and reflection.
])[

  *Two interfering waves:*
  - E₀: reflection from front surface (air-soap interface)
  - E₁: transmission through film, reflection from back, transmission out

  *Path difference phase shift:*
  $
    Delta phi_("path") = (4 pi n_s d)/lambda
  $

  Where $n_s$ is soap refractive index, $d$ is film thickness.

  *Reflection phase shift:* π phase flip at air-to-soap interface (higher refractive index). No phase flip at soap-to-air back interface.

  *Constructive interference condition:*
  $
    Delta phi_("total") = Delta phi_("path") - pi = 2 m pi
  $

  $
    => (4 pi n_s d)/lambda - pi = 2 m pi
  $

  Where $m = 0, 1, 2, ...$ for different colors/thicknesses.

  *Key insight:* Different wavelengths satisfy condition at different thicknesses, creating rainbow colors on soap bubbles.

]
#section("Fabry-Pérot Etalon", intro: [
  High-precision optical filter using multiple beam interference. Two parallel mirrors create extremely sharp transmission peaks.
])[

  *Setup:* Two highly reflective parallel surfaces separated by distance L. Light bounces multiple times, small fraction transmitted at each bounce.

  *Constructive interference condition:*
  $
    2 n L cos(theta) = m lambda
  $

  Where $n$ is refractive index, $theta$ is angle, $m$ is integer order.

  *Phase difference per round-trip:*
  $
    delta = (4 pi n L cos(theta))/lambda
  $

  *Transmitted intensity* (Airy distribution):
  $
    I_t = I_0/(1 + (4 R sin^2(delta/2))/((1-R)^2))
  $

  Where $R$ is reflectivity (typically ~99%).

  *Key features:*
  - Extremely sharp transmission peaks (high finesse)
  - Output forms concentric ring pattern
  - Very high spectral resolution for precision measurements
  - Applications: laser cavities, wavelength standards, spectroscopy

]
#section("Birefringence", intro: [
  Materials with polarization-dependent refractive index. Splits light into ordinary and extraordinary rays with different speeds.
])[

  *Concept:* Different refractive indices for different polarization directions: $n_x != n_y$.

  *Phase shift accumulation:*
  $
    Delta phi = (n_x - n_y) k_0 L = (n_x - n_y) (2 pi)/lambda_0 L
  $

  Where $L$ is material thickness, $k_0 = 2pi/lambda_0$ is vacuum wave number.

  *Wave plates:*
  - *Half-wave plate:* $Delta phi = pi$ (rotates linear polarization)
  - *Quarter-wave plate:* $Delta phi = pi/2$ (converts linear to circular)

  *Slow vs. fast axis:*
  - Slow axis: higher refractive index (light travels slower: $v = c/n$)
  - Fast axis: lower refractive index

  *Applications:* Polarization control, stress analysis, LCD displays, optical modulators

]
#section("Fiber Optics", intro: [
  Light guiding through total internal reflection. Core-cladding structure confines light within fiber.
])[

  *Numerical Aperture* (light-gathering ability):
  $
    "NA" = sqrt(n_1^2 - n_2^2)
  $

  Where $n_1$ is core index, $n_2$ is cladding index.

  *Acceptance angle:*
  $
    theta_("max") = sin^(-1)("NA")
  $

  Maximum entrance angle for guided light.

  *V-number* (mode parameter):
  $
    V = (2 pi a)/lambda "NA"
  $

  Where $a$ is core radius.

  *Mode classification:*
  - Single-mode: $V < 2.405$ (no dispersion)
  - Multimode: $V > 2.405$ (multiple paths, pulse broadening)

  *Velocities:*
  - Phase velocity: $v_p = omega/k$
  - Group velocity: $v_g = dd(omega)/dd(k)$ (information speed)

]
#section("Mass Spectrometer", intro: [
  Measures mass-to-charge ratio of ions. Velocity selector followed by magnetic deflection chamber.
])[

  *Velocity selector* (crossed E and B fields):
  Only particles with $v = E/B$ pass straight through:
  $
    q E = q v B => v = E/B
  $

  Electric force balances magnetic force.

  *Deflection chamber* (magnetic field B'):
  Selected particles follow semicircular path with radius:
  $
    r = (m v)/(q B') = (m E)/(q B B')
  $

  *Detection:*
  Final position after semicircle: $y = 2r$ (diameter)

  *Mass-to-charge determination:*
  $
    m/q = (2 E y)/(B B')
  $

  Where $y$ is measured detector position.

  *Key insight:* Different masses separate spatially - heavier ions have larger radius, travel farther to detector.

]
#section("Prism Dispersion", intro: [
  Wavelength-dependent refraction splits white light into spectrum. Refractive index varies with wavelength.
])[

  *Physical Principle:* Dispersion occurs because refractive index depends on wavelength: $n = n(lambda)$.

  *Snell's Law:*
  $
    n_1 sin theta_1 = n_2 sin theta_2
  $

  *Dispersion Mechanism:*
  - Different wavelengths have different refractive indices
  - Each color bends at slightly different angle
  - White light separates into rainbow spectrum

  *Key Point:* Same physical law (Snell's law) but wavelength-dependent material property $n(lambda)$ creates separation.

  *Applications:* Spectroscopy, prism spectrometers, separation of colors in optical instruments.
]
#section("Grating Spectrometer", intro: [
  Multi-slit interference produces sharp spectral lines. More slits give sharper, brighter peaks than prism.
])[

  *Phase Difference* between adjacent slits:
  $
    delta phi = (2 pi)/lambda d (n_i sin theta_i - n_j sin theta_j)
  $

  Where $d$ is slit spacing, $theta_i$ and $theta_j$ are incident and diffraction angles.

  *N-Slit Intensity Pattern:*
  $
    I(theta_j) = I(0) (sin^2(N delta phi / 2))/(sin^2(delta phi / 2))
  $

  Sharp principal maxima when all N slits interfere constructively.

  *Constructive Interference Condition:*
  $
    delta phi = 2 pi m hspace "(for integer m)"
  $

  *Correction:* Condition is $delta phi = 2pi m$, NOT $N delta phi = 2pi n$.

  *Grating Equation:*
  $
    d (n_i sin theta_i - n_j sin theta_j) = m lambda_0
  $

  Substituting corrected condition into phase difference formula.

  *Advantages over Prism:*
  - Sharper spectral lines (narrow peaks)
  - Higher resolution with more slits
  - Larger angular dispersion
  - Multiple diffraction orders (different m values)
]
#section("Spectrometer Resolution", intro: [
  Resolving power determines minimum wavelength separation between distinguishable spectral lines. Limited by grating width.
])[

  *Frequency Resolution:*
  $
    Delta nu = (c)/(N d (sin theta_j - sin theta_i))
  $

  Where $N$ is number of slits, $d$ is slit spacing.

  *Resolving Power:*
  $
    R = nu/(Delta nu) = lambda/(Delta lambda) = m N
  $

  Where $m$ is diffraction order.

  *Maximum Path Difference:* Best resolution at grazing incidence/exit ($theta_i = 90°$, $theta_j = -90°$):
  $
    delta_(s,"max") = N d (sin(90°) - sin(-90°)) = 2 N d
  $

  *Wavelength Resolution (Corrected Formula):*
  $
    R = (delta_(s,"max"))/lambda = (2 N d)/lambda
  $

  *Minimum Resolvable Wavelength Difference:*
  $
    (Delta lambda)_("min") = lambda^2/(delta_(s,"max")) = lambda^2/(2 N d)
  $

  *Correction*: Original formula $Delta lambda = lambda/delta_(s,"max")$ missing factor of $lambda$.

  *Physical Limit:* Resolution limited by illuminated grating width $W = N d$:
  $
    R_("max") = (2 W)/lambda
  $

  *Key Insight:* Better resolution requires bigger instrument - fundamental optics principle.

  *Practical Considerations:*
  - More slits $N$ → higher resolution
  - Larger grating width → better spectral separation
  - Higher diffraction orders $m$ → improved resolving power
]
#section("Michelson Interferometer", intro: [
  Two-beam interference from split and recombined light paths. Precision instrument for distance and wavelength measurements.
])[

  *Phase Difference:* Determined by optical path difference:
  $
    Delta x = 2(d_1 - d_2) hspace "(round-trip path difference)"
  $
  $
    delta phi = k Delta x = (2 pi)/lambda dot 2(d_1 - d_2)
  $

  *Intensity Pattern:* Standard two-beam interference:
  $
    I(delta phi) = I_("max")/2 (1 + cos(delta phi))
  $

  Sinusoidal variation between bright and dark fringes.

  *Fringe Counting:* Mirror movement creates measurable fringe shifts:
  - Move mirror by $Delta d = lambda/2$
  - Total path change: $Delta x = 2 Delta d = lambda$
  - Result: One complete fringe passes detector

  *Applications:*
  - Precision distance measurements (interferometric metrology)
  - Wavelength determination
  - Refractive index measurements
  - Gravitational wave detection (LIGO)
]
#section("Fourier Transform Spectroscopy", intro: [
  Advanced interferometry technique. Measures spectrum by Fourier transforming interferogram data.
])[

  *Core Concept:* Interferogram $I(x)$ is Fourier transform of source spectrum $S(f)$.

  *Measurement Process:*
  1. Record intensity vs. mirror position: $I(x)$
  2. Computer calculates Fourier transform
  3. Result gives source spectrum $S(f)$

  *Fourier Transform Relationship:*
  $
    S(f) prop integral_0^(x_("max")) [2 I(x) - I_0] cos((2 pi f x)/c) dd(x)
  $

  Where $I_0$ is DC component, $2I(x) - I_0$ is AC component.

  *Spectral Resolution:* Limited by maximum scan distance:
  $
    R = lambda/(Delta lambda_("min")) approx (2 x_("max"))/lambda
  $

  *Key Advantages over Dispersive Spectrometers:*
  - Multiplex advantage (all wavelengths measured simultaneously)
  - Higher light throughput
  - Better signal-to-noise ratio
  - Excellent resolution for IR spectroscopy

  *Resolution Improvement:* Longer mirror scan → higher spectral resolution.
]
#section("Littrow Laser Configuration", intro: [
  Grating-based wavelength selection for tunable lasers. Specific angle provides retroreflection for desired wavelength.
])[

  *Configuration:* Grating oriented so desired wavelength diffracts back along incident path.

  *Geometry:* Incident angle equals diffraction angle: $alpha = beta$

  *Littrow Condition:* 
  $
    2 d sin alpha = m lambda
  $

  Derived from general grating equation $d(sin alpha + sin beta) = m lambda$ with $alpha = beta$.

  *Intensity Pattern:* Full N-slit grating intensity:
  $
    I = I_0 ("sinc"^2(delta phi/2)) (sin^2(N delta phi/2))/(sin^2(delta phi/2))
  $

  Product of single-slit envelope and sharp N-slit interference.

  *Applications:*
  - Tunable laser cavities
  - External cavity diode lasers  
  - Wavelength-selective feedback
  - Laser line narrowing
]
#section("Grating Resolution", intro: [
  Resolving power determines minimum distinguishable wavelength separation. Set by diffraction order and illuminated slits.
])[

  *Rayleigh Criterion:* Two wavelengths just resolved when peak of one falls on first minimum of the other.

  *Resolving Power (Corrected):*
  $
    R = lambda/(Delta lambda) = m N
  $

  Where:
  - $m$ = diffraction order
  - $N$ = number of illuminated slits
  - $Delta lambda$ = minimum resolvable wavelength separation

  *Key Insights:*
  - Higher order $m$ → better resolution
  - More illuminated slits $N$ → better resolution
  - Resolution independent of grating spacing $d$

  *Physical Limit:* Resolution ultimately limited by:
  1. Number of grating lines illuminated
  2. Diffraction order used
  3. Beam quality and divergence
]
#section("Tuning and Angular Dispersion", intro: [
  Grating angle changes select different wavelengths. Angular dispersion and beam divergence limit resolution.
])[

  *Angular Dispersion:* Rate of diffraction angle change with wavelength:
  $
    (dd(lambda))/(dd(alpha)) = (2 d cos alpha)/m hspace "(Littrow configuration)"
  $

  *Tuning:* Rotating grating selects different wavelengths for retroreflection.

  *Beam Divergence Limit (Corrected):*
  $
    delta alpha = lambda/(2 N d cos alpha)
  $

  *Correction:* Removed extra factor of $|m|$ from original formula.

  *Physical Meaning:*
  - Smaller beam divergence $delta alpha$ → better resolution
  - Larger illuminated area $N d$ → smaller divergence limit
  - Beam quality directly affects achievable resolution

  *Design Trade-offs:*
  - Large grating → better resolution but higher cost
  - Higher orders → better resolution but lower efficiency
  - Beam collimation critical for optimal performance
]
