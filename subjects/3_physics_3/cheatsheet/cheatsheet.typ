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
#section("Single-Slit Diffraction",image:image("image-5.png"), intro: [
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
#section("Fresnel Equations & Reflection",image:image("image-4.png"), intro: [
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
#section("Rayleigh Scattering",image: image("image-3.png") ,intro: [
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
#section("Bragg's Law",image:image("image-6.png"), intro: [
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
#section("X-Ray Michelson Interferometer",image:image("image-7.png"), intro: [
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



= Quantum

#section("Normalization", intro: [
  Ensure quantum state has unit probability. For superposition states, coefficients must satisfy normalization condition.
])[

  $
    Psi = c_1 psi_(1, 0, 0) + c_2 psi_(2, 1, 1) hspace t= 0\
  $

  Normalization condition:

  $
    integral abs(Psi)^2 dd(V) = 1
  $

  Eigenfunctions are orthonormal, so

  $
    integral psi_(n, l, m) psi_(n', l', m') dd(V) = delta\
    => abs(C)^2 (abs(c_1)^2 + abs(c_2)^2) = 1 => C = 1/sqrt(abs(c_1)^2 + abs(c_2)^2)\
    =>Psi_("norm") = C (c_1 psi_(1, 0, 0) + c_2 psi_(2, 1, 1))\
  $
]
#section("Measurement Probabilities of Operators", intro: [
  Calculate probability of measuring specific eigenvalues from quantum superposition state.
])[

  $
    Psi = 1/(sqrt(5)) (psi_(1, 0, 0) + 2 i dot psi_(2, 1, 1))\
  $

  Possible Operators:

  $
                             "Energy:" & hat(H) psi(n, l, m)   &          = E_(n) psi(n, l, m) \
           "Squared Angular Momentum:" & hat(L)^2 psi(n, l, m) & = hbar l (l + 1) psi(n, l, m) \
    "Z-component of Angular Momentum:" & hat(L)_z psi(n, l, m) &         = hbar m psi(n, l, m) \
  $

  The expectation value of an operator is the square of the absolute value of the eigenvalues times their components:

  $
    P(E_1) = abs(1/sqrt(5))^2 dot abs(1)^2 = 1/5 hspace P(E_2) = abs(1/sqrt(5))^2 dot abs(2 i)^2 = 4/5\
    sum P(E_i) = 1\
  $
]
#section("Time Evolution", intro: [
  Each eigenstate evolves with phase factor $e^(-i E t/hbar)$. Include magnetic field effects if present.
])[

  Start with state at $t=0$. *Each Eigenstate evolves independently* with phase factor *$e^(-i E t/hbar)$*. *Total Energy* of state must be used. If *Magnetic Field* is present, consider *Zeeman Effect*.

  $
    E' = E_n + Delta E_("Zee") = E_n + m mu_B B
  $

  The solution is then:

  $
    Psi(t=0) = c_1 psi_(1, 0, 0) + c_2 psi_(2, 1, 1)\
    => Psi(t) = c_1 psi_(1, 0, 0) e^(-i E_(1) t/hbar) + c_2 psi_(2, 1, 1) e^(-i (E_2 + (m=1) mu_B B) t/hbar)
  $
]
#section("Expectation Value", intro: [
  Calculate mean value of observable from quantum state. Two methods: weighted average or integral.
])[

  Normalized $Psi$. Method 1 if we already have the probabilities. The Expectation is just the weighted average:

  $
    avg(O) = sum_i P(O_i) dot O_i\
  $

  Method 2. We need this for position etc.:

  $
    avg(O) = integral Psi^* hat(O) Psi dd(V)\
    => avg(r) = integral_0^oo e dot P(r) dd(r)
  $

  Where $P$ is the radial probability density.
]
#section("Radial Probability density", intro: [
  Probability distribution of electron distance from nucleus. Most likely at Bohr radius $a_0$ for ground state.
])[

  Previous chapter but look at radius. "What is the probability of finding the electron at a distance $r$ from the nucleus?".

  $
    Psi = R dot Y\
    => P(r) dd(r) = (integral_0^(2 pi) integral_0^pi abs(R_(n l) (r))^2 abs(Y_l^m (theta, phi))^2 r^2 sin(theta) dd(theta) dd(phi)) dd(r)\ \
    => P(r) = abs(R_(n l) (r))^2 r^2\
    "For spherically symmetric wave functions:" P(r) = abs(psi)^2 4 pi r^2\
  $

  Example:

  $
    R_(1, 0) = 2/a_0^(3/2) e^(-r/a_0) hspace P(r) = 4 pi r^2 abs(R_(1, 0))^2 hspace "max" => dv(P(r), r) = 0\
  $

  In this case we get zero at $r = 0, a_0, oo$. $0$ and $oo$ are minima, $a_0$ is a maximum. The electron is most likely to be found at the Bohr radius $a_0$.
]
#section("Angular Momentum Raising/Lowering Operators", intro: [
  Ladder operators that shift magnetic quantum number $m$ by ±1. Useful for constructing angular momentum states.
])[

  Given $ket(l\, m)$ use Angular Momentum Lowering $hat(L)_-$ and Raising $hat(L)_+$ Operators:

  $
    hat(L)_- ket(l \, m) = hbar sqrt((l + m)(l - m + 1)) ket(l\, m - 1)\
    hat(L)_+ ket(l \, m) = hbar sqrt((l - m)(l + m + 1)) ket(l\, m + 1)\
  $

  You can construct operators like $hat(L)_x$ and $hat(L)_y$ from the those operators

  $
    hat(L)_x = (hat(L)_+ + hat(L)_-) / 2 hspace hat(L)_y = (hat(L)_+ - hat(L)_-) / (2i)\
    hat(L)^2 = hat(L)_+ hat(L)_- + hat(L)_z^2 - hbar hat(L)_z
  $

  Example:

  $
    hat(L)_- ket(1\, 1) = sqrt(2) hbar ket(1\, 0)\
  $
]
#section("Angular Momentum Operators and Eigenstates", intro: [
  Fundamental eigenvalue equations for orbital angular momentum operators.
])[

  $
    hat(L)^2 psi = hbar^2 l (l + 1) psi\
    hat(L)_z psi = hbar m psi\
  $
]
#section("Quantum Numbers", intro: [
  Four quantum numbers completely describe electron state in atom. Each set provides unique "address" for electrons.
])[

  *Principal (n):* Main energy level/shell
  $
    n = 1, 2, 3, ...
  $

  *Angular Momentum (l):* Orbital shape and angular momentum
  $
    l = 0, 1, 2, ..., n-1 hspace "where" l = 0("s"), 1("p"), 2("d"), 3("f")
  $

  *Magnetic ($m_l$):* Orbital orientation in space
  $
    m_l = -l, -l+1, ..., 0, ..., l-1, l
  $

  *Magnetic Spin ($m_s$):* Electron spin orientation
  $
    m_s = plus.minus 1/2 hspace "(spin up/down)"
  $

  *Example:* For $n=3$: $l$ can be $0, 1, 2$ (s, p, d orbitals)
]

#section("Particle Spin: Fermions and Bosons", intro: [
  Fundamental particle classification by intrinsic angular momentum determines quantum statistics.
])[

  *Fermions:* Half-integer spin $(1/2, 3/2, ...)$
  - Obey Pauli Exclusion Principle
  - No two identical fermions in same quantum state
  - Examples: electrons, protons, neutrons

  *Bosons:* Integer spin $(0, 1, 2, ...)$
  - No exclusion principle
  - Unlimited particles in same state
  - Examples: photons, mesons
  - Enable phenomena like lasers, Bose-Einstein condensates
]

#section("Zeeman Effect", intro: [
  Spectral line splitting in magnetic field. Energy shifts depend on $m_l$ and $m_s$ quantum numbers.
])[

  *Energy Shift:* External B-field shifts electron energy levels
  $
    Delta E = m_l mu_B B
  $
  where $mu_B$ is Bohr magneton.

  *Key Points:*
  - Orbital magnetic moment: $L=0 => mu_"orbital"=0$
  - Spin magnetic moment persists even for $L=0$ (s-orbitals)
  - Even s-states split due to electron spin ($m_s = plus.minus 1/2$)

  *Spectroscopy Application:*
  $
    "Number of spectral lines" = 2L + 1
  $

  *Example:* 25 spectral lines $=> 2L+1=25 => L=12$

]
#section("Volumetric Probability Density/Born Rule", intro: [
  Born rule: probability density = $|Psi|^2$. Uses spherical coordinates for 3D calculations.
])[

  Reference Spherical Integrals.

  *Born Rule:* The volumetric probability density is given by the square of the absolute value of the wave function:

  $
    P(r) = abs(Psi(r))^2 dd(V)\
    dd(V) = r^2 sin(theta) dd(r) dd(theta) dd(phi) hspace => dd(P) = abs(Psi(r))^2 sin(theta) r^2 dd(r) dd(theta) dd(phi)\
  $


]
#section("Spherical Harmonics solutions", intro: [
  Exact hydrogen atom wavefunctions: angular $Y_l^m$ and radial $R_(n l)$ parts. Key states for calculations.
])[

  Angular Functions:

  $
    Y_0^0 = sqrt(1/(4 pi)) hspace Y_1^(plus.minus 1) = sqrt(3/(8 pi)) e^(plus.minus i phi) sin(theta) hspace Y_1^0 = sqrt(3/(4 pi)) cos(theta)\
    Y_2^(plus.minus 2) = sqrt(15/(32 pi)) e^(plus.minus 2 i phi) sin^2(theta) hspace Y_2^0 = sqrt(5/(16 pi)) (3 cos^2(theta) - 1) hspace\
    Y_2^(plus.minus 1) = sqrt(15/(8 pi)) e^(plus.minus i phi) sin(theta) cos(theta)\
  $

  Radial Functions (depend on $n$ and $l$):

  $
    R_(1 0) (r) = 2 (1/a0)^(3/2) e^(-r/a0) hspace R_(2 0) (r) = 2(1/(2 a0))^(3/2) (1 - r/(2 a0)) e^(-r/(2 a0)) hspace \
    R_(2 1) (r) = 2/sqrt(3) (1/(2 a0))^(3/2) (r/(2 a0)) e^(-r/(2 a0))\
  $

  Combined with this pattern:

  $
    psi_(n l m) (r, theta, phi) = R_(n l) (r) Y_l^m (theta, phi)\
    = sqrt((2/(n a0))^3 (n-l-1)!/(2n(l + n)!)) exp(-r/(n a0)) ((2r)/(n a0))^(l) L_(n - l - 1)^(2l + 1) ((2r)/(n a0)) Y_l^m \
    psi_(1 0 0) = 1/sqrt(pi a0^3) e^(-r/a0) hspace psi_(2 0 0) = 1/(4 sqrt(2 pi a0^3)) (2 - r/a0) e^(-r/(2 a0))\
    psi_(2 1 0) = minus.plus 1/(4(sqrt(2 pi a0^3))) r/a0 e^(-r/(2 a0)) cos(theta) \
    psi_(2 1 plus.minus 1) = 1/(8(sqrt(pi a0^3))) (r/a0) e^(plus.minus i phi) e^(-r/(2 a0)) sin(theta)\
    psi_(3 0 0) = 1 / (81 sqrt(3 pi a0^3)) (27 - 18r/a0 + 2 r^2/a0^2) e^(-r/(3a0))
  $

]
#section("Spherical Integrals", intro: [
  Volume element in spherical coordinates. Separates radial and angular parts for calculations.
])[

  Spherical differential:

  $
    dd(V) = r^2 sin(theta) dd(r) dd(theta) dd(phi)\
    => integral_0^oo integral_0^pi integral_0^(2 pi) Psi^* (r, theta, phi) Psi(r, theta, phi) r^2 sin(theta) dd(phi) dd(theta) dd(r)\
    Psi = R(r) Y(theta, phi) hspace => integral_0^oo abs(R(r))^2 r^2 dd(r) integral_0^pi integral_0^(2 pi) abs(Y(theta, phi))^2 sin(theta) dd(phi) dd(theta)\
  $
]
#section("Operators", intro: [
  Quantum mechanical operators for observables. Position, momentum, energy, angular momentum.
])[

  *Basic Position and Momentum:*
  $
    hat(x) = x hspace hat(y) = y hspace hat(z) = z hspace hat(p)_x = -i hbar pdv(, x) hspace hat(p)_y = -i hbar pdv(, y) hspace hat(p)_z = -i hbar pdv(, z)
  $

  *Energy Operators:*
  $
    hat(H) = hat(T) + hat(V) = hat(p)^2/(2m) + V(x) = -hbar^2/(2m) nabla^2 + V(x) hspace hat(E) = i hbar pdv(, t)
  $

  *Angular Momentum Operators:*
  $
    hat(L) = hat(r) times hat(p) hspace hat(L)_x = hat(y) hat(p)_z - hat(z) hat(p)_y = -i hbar (y pdv(, z) - z pdv(, y))
  $
  $
    hat(L)_y = hat(z) hat(p)_x - hat(x) hat(p)_z = -i hbar (z pdv(, x) - x pdv(, z)) hspace hat(L)_z = hat(x) hat(p)_y - hat(y) hat(p)_x = -i hbar (x pdv(, y) - y pdv(, x))
  $

  *Spherical Coordinates:*
  $
    hat(L)^2 = -hbar^2 [1/(sin theta) pdv(, theta)(sin theta pdv(, theta)) + 1/(sin^2 theta) pdv(, phi, 2)]
  $
  $
    hat(L)_z = -i hbar pdv(, phi)
  $

  *Ladder Operators:*
  $
    hat(L)_+ = hat(L)_x + i hat(L)_y = hbar e^(i phi) (pdv(, theta) + i cot theta pdv(, phi))
  $
  $
    hat(L)_- = hat(L)_x - i hat(L)_y = hbar e^(-i phi) (-pdv(, theta) + i cot theta pdv(, phi))
  $

  *Spin Operators (Pauli matrices):*
  $
    hat(S)_x = hbar/2 sigma_x = hbar/2 mat(0, 1; 1, 0) hspace hat(S)_y = hbar/2 sigma_y = hbar/2 mat(0, -i; i, 0) hspace hat(S)_z = hbar/2 sigma_z = hbar/2 mat(1, 0; 0, -1)
  $

  *Operator Properties & Tricks:*

  - *Hermitian operators:* Real eigenvalues, $hat(A)^dagger = hat(A)$
  - *Unitary operators:* Preserve normalization, $hat(U)^dagger hat(U) = hat(I)$
  - *Projection operators:* $hat(P) = ket(psi) bra(psi)$, satisfy $hat(P)^2 = hat(P)$

  *Operator Algebra:*
  $
    [hat(A) + hat(B), hat(C)] = [hat(A), hat(C)] + [hat(B), hat(C)] hspace [hat(A), hat(B) + hat(C)] = [hat(A), hat(B)] + [hat(A), hat(C)]
  $
  $
    [hat(A) hat(B), hat(C)] = hat(A) [hat(B), hat(C)] + [hat(A), hat(C)] hat(B) hspace [hat(A), hat(B) hat(C)] = [hat(A), hat(B)] hat(C) + hat(B) [hat(A), hat(C)]
  $

  *Time Evolution Operator:*
  $
    hat(U)(t) = e^(-i hat(H) t/hbar) hspace Psi(t) = hat(U)(t) Psi(0)
  $

  *Translation and Rotation Operators:*
  $
    hat(T)(a) = e^(-i hat(p) a/hbar) hspace hat(R)(theta) = e^(-i hat(L) theta/hbar)
  $

  *Parity Operator:*
  $
    hat(Pi) psi(x) = psi(-x) hspace hat(Pi)^2 = hat(I) hspace "eigenvalues:" plus.minus 1
  $

  *Measurement Applications:*
  - Probability of outcome $a_n$: $P(a_n) = abs(braket(phi_n, psi))^2$
  - State after measurement: $ket(psi') = (hat(P)_n ket(psi))/(sqrt(P(a_n)))$
  - Expectation value: $avg(hat(A)) = braket(psi, hat(A) psi) = sum_n a_n P(a_n)$

  *Operator Tricks:*
  - Use ladder operators for efficient calculations: $hat(a)^dagger ket(n) = sqrt(n+1) ket(n+1)$
  - Baker-Campbell-Hausdorff: $e^hat(A) e^hat(B) = e^(hat(A) + hat(B) + 1/2[hat(A), hat(B)] + ...)$
  - For position/momentum: $e^(i hat(p) a/hbar) hat(x) e^(-i hat(p) a/hbar) = hat(x) + a$
  - Completeness: $sum_n ket(n) bra(n) = hat(I)$ (resolution of identity)

]
#section("Commutators", intro: [
  Essential commutation relations for position, momentum, angular momentum, and spin operators.
])[

  $
    &[A, B] = A B - B A\
    &[hat(p)/(2 m), hat(p)] = 0 hspace [hat(x), hat(p)] = i hbar hspace [hat(x), hat(p)_y] = [hat(x), hat(p)_z] = 0 hspace [hat(x), hat(p)_x] = [hat(y), hat(p)_y] = i hbar\
    & [hat(L)_x, hat(L)_y] = i hbar hat(L)_z hspace [hat(L)^2, hat(L)_x] = 0 hspace [hat(L)^2, hat(L)_plus.minus] = 0 hspace [hat(L)_z, hat(L)_plus.minus] = plus.minus hbar hat(L)_plus.minus\
    & [hat(S)_x, hat(S)_y] = i hbar hat(S)_z hspace [hat(S)^2, hat(S)_x] = 0 hspace [hat(L)^2, hat(S) dot hat(L)] = [hat(S)^2, hat(S) dot hat(L)] = 0\
  $

  $
    [hat(L)_z, hat(S) dot hat(L)] = i hbar (hat(S)_x hat(L)_y - hat(S)_y hat(L)_x) hspace [hat(S)_z, hat(S) dot hat(L)] = i hbar (hat(S)_y hat(L)_x - hat(S)_x hat(L)_y)\
  $
]
#section("de Broglie, Heisenberg & Photon Momentum", intro: [
  Fundamental quantum principles: matter wavelength, position-momentum uncertainty, and photon interactions.
])[

  *de Broglie wavelength* (matter waves):
  $
    lambda = h/p = h/(m v)
  $

  *Heisenberg uncertainty principle:*
  $
    Delta x Delta p >= hbar/2
  $

  Cannot simultaneously know exact position and momentum of a particle.

  *Photon momentum and beam deflection:*
  $
    "Single photon:" p = h/lambda = hbar k hspace "where" k = (2 pi)/lambda\
    "N photons absorbed:" Delta p = N hbar k = N h/lambda
  $

  *Applications:*
  - Electron diffraction shows matter waves (de Broglie confirmed)
  - Uncertainty principle limits measurement precision
  - Photon momentum transfer in radiation pressure, laser cooling

]
#section("Hydrogen Atom Fundamentals", intro: [
  Key constants and relationships for hydrogen: Bohr radius, fine structure, Zeeman effect, and virial theorem.
])[

  *Bohr radius* (fundamental length scale):
  $
    a_0 = (4 pi epsilon_0 hbar^2)/(m_e e^2) approx 0.529 times 10^(-10) "m"
  $

  *Fine structure constant* (dimensionless):
  $
    alpha = e^2/(4 pi epsilon_0 hbar c) approx 1/137
  $

  Key relationships:
  $
    alpha = v_1/c hspace "and" hspace a_0 = lambda_c/(2 pi alpha)
  $

  Where $v_1$ is electron speed in first Bohr orbit, $lambda_c = h/(m_e c)$ is Compton wavelength.

  *Energy levels with Zeeman effect:*
  $
    E = -R_E/n^2 + m_l mu_B B
  $

  Where $R_E = 13.6 "eV"$ (Rydberg energy), $n$ is principal quantum number, $m_l$ is magnetic quantum number.

  *Virial theorem* (for $V(r) prop 1/r$):
  $
    avg(V) = 2 avg(E) hspace "and" hspace avg(T) = -avg(E)
  $

  Total energy equals negative of kinetic energy.

]
#section("Wavefunction & Probability", intro: [
  Fundamental quantum description. Born rule connects wavefunction to measurable probabilities.
])[

  *Wavefunction:* $Psi(x, t)$ contains complete information about quantum system.

  *Born rule:* Probability density = $abs(Psi(x, t))^2$

  *Normalization condition:*
  $
    integral abs(Psi)^2 dd(x) = 1
  $

  *State expansion:* Any state can be written as:
  $
    Psi = sum_n c_n phi_n
  $

  Where $phi_n$ are basis states (e.g., energy eigenstates).

]
#section("Quantum Operators", intro: [
  Physical observables represented by mathematical operators. Position, momentum, energy operators.
])[

  *Key operators:*
  $
    hat(x) = x hspace hat(p) = -i hbar pdv(, x) hspace hat(E) = i hbar pdv(, t)
  $

  *Expectation value:*
  $
    avg(O) = integral Psi^* hat(O) Psi dd(x)
  $

  Average measurement outcome for observable $O$.

  *Eigenvalue equation:*
  $
    hat(O) psi = o psi
  $

  Where $o$ is eigenvalue, $psi$ is eigenstate.

]
#section("Quantum Commutators", intro: [
  Mathematical tool expressing uncertainty principle. Position-momentum incompatibility.
])[

  *Commutator definition:*
  $
    [hat(A), hat(B)] = hat(A) hat(B) - hat(B) hat(A)
  $

  *Canonical commutation relation:*
  $
    [hat(x), hat(p)] = i hbar
  $

  Foundation of uncertainty principle.

  *Commutator identities:*
  $
    [hat(A) hat(B), hat(C)] = hat(A) [hat(B), hat(C)] + [hat(A), hat(C)] hat(B)
  $

  *Jacobi identity:*
  $
    [hat(A), [hat(B), hat(C)]] + [hat(B), [hat(C), hat(A)]] + [hat(C), [hat(A), hat(B)]] = 0
  $

]
#section("Schrödinger Equation", intro: [
  Master equation of quantum mechanics. Governs wavefunction time evolution.
])[

  *Time-dependent form:*
  $
    i hbar pdv(Psi, t) = hat(H) Psi
  $

  *Time-independent form* (stationary states):
  $
    hat(H) psi = E psi
  $

  *Free particle solution:*
  $
    psi(x) = A e^(i k x) hspace "where" E = (hbar^2 k^2)/(2m)
  $

  *Infinite square well:*
  $
    psi_n(x) = sqrt(2/a) sin((n pi x)/a) hspace E_n = (n^2 pi^2 hbar^2)/(2 m a^2)
  $

  *Boundary conditions:* $psi$ and $dd(psi)/dd(x)$ must be continuous (unless $V = infinity$).

]
#section("Quantum Tunneling", intro: [
  Particle transmission through classically forbidden barriers. Exponential decay with barrier width.
])[

  *Setup:* Particle with energy $E$ encounters potential barrier of height $V_0$.

  *Scattering case* ($E > V_0$):
  $
    psi_("II")(x) = A cos(k x) + B sin(k x) hspace "where" k = sqrt((2m(E-V_0))/hbar^2)
  $

  *Tunneling case* ($E < V_0$):
  $
    psi_("II")(x) = A e^(-kappa x) + B e^(kappa x) hspace "where" kappa = sqrt((2m(V_0-E))/hbar^2)
  $

  *Transmission probability* (wide barrier):
  $
    T prop exp(-2 kappa a) = exp((-2a)/hbar sqrt(2m(V_0-E)))
  $

  Where $a$ is barrier width.

  *Key insight:* Quantum particles can penetrate classically forbidden regions - probability decreases exponentially with barrier thickness.

]


= Exam Problems

#section("Imaging w/ Sphere", image: image("image-9.png"), intro: [
  Spherical lens: geometry + Snell + resolution. Thick lens, non-paraxial.
])[

  *Setup:* Sphere radius $a$, indices $n_l$ (lens), $n_m$ (medium). Parallel rays → focal pt.

  *(a) Converging:* $n_l > n_m$ (light bends toward normal in denser medium)

  *(b) Thin lens eq. fails:* $1/f = (n_l - n_m)(1/R_1 - 1/R_2)$
  - Thick: diameter = 2a ≠ negligible
  - Large angles: $sin theta != theta$

  *(c) Angle equality:* Isosceles $triangle M R_1 R_2$ → $theta_2 = theta_3$
  Snell chain: $n_m sin theta_1 = n_l sin theta_2 = n_l sin theta_3 = n_m sin theta_4$
  *Result:* $theta_1 = theta_4$

  *(d) Internal angles:* $alpha = 2 theta_2 - theta_1$, $beta = 2 theta_1 - 2 theta_2$

  *(e) Focal length:*
  Exact: $f = a(cos alpha + (sin alpha)/tan beta - 1)$
  Paraxial: $f = (2a(n_l - n_m))/(2 n_m - n_l)$ (becomes constant)

  *(f) Resolution:* Abbé limit $r > lambda/(2 "NA")$
  $"NA" = sin(pi/20) ≈ 0.156$ → $r ≈ 5 μ"m"$

  *Strategy:* Check $n_l$ vs $n_m$, use isosceles triangles, chain Snell, apply paraxial for small angles

]

#section("Quantum Tunneling - Finite Barrier", image: image("image-10.png"), intro: [
  Scattering analysis: particle vs barrier. T/R calculations + resonance conditions.
])[

  *Setup:* Particle energy $E$ vs barrier height $V$, width $a$. Regions: I ($x < 0$), II ($0 < x < a$), III ($x > a$).

  *(a) TISE solutions:* $hat(H) psi = E psi$

  Regions I,III ($V = 0$): $k_1 = sqrt(frac(2m E, hbar^2))$, $psi = A e^(i k_1 x) + B e^(-i k_1 x)$

  Region II ($V ≠ 0$): $k_2 = sqrt(frac(2m(E-V), hbar^2))$, $psi_II = A_II e^(i k_2 x) + B_II e^(-i k_2 x)$

  *(b) Boundary conditions:* $B_("III") = 0$ (no leftward wave in region III)

  *(c) Continuity at boundaries:* $psi$ and $psi'$ continuous. Set $A_("III") = 1$.

  Final amplitudes:
  $
    A_I = frac(e^(i k_1 a), 4 k_1 k_2)[4 k_1 k_2 cos(k_2 a) - 2i(k_2^2 + k_1^2) sin(k_2 a)]\
    B_I = frac(e^(i k_1 a), 4 k_1 k_2) 2i(k_2^2 - k_1^2) sin(k_2 a)
  $

  *(d) Transmission resonance:* $T = 1 <=> B_I = 0 <=> sin(k_2 a) = 0$

  Resonance: $k_2 a = n pi$

  - $E < V$ (tunneling): $k_2 = i kappa_2$ → no resonance
  - $E > V$ (scattering): perfect transmission when $a = n lambda_2/2$

  *Key formulas:*
  $
    T = frac(1, |A_I|^2), hspace R = |frac(B_I, A_I)|^2, hspace T + R = 1
  $

  *Strategy:* Define $k_i$ for each region, apply continuity at boundaries, analyze resonance conditions

]

#section("Hydrogen Atom - Complete Quantum Analysis", intro: [
  Comprehensive hydrogen atom problem covering quantum numbers, probability distributions, angular momentum operators, and superposition dynamics. Essential for quantum mechanics exams.
])[

  *Problem Setup:* Hydrogen wavefunction analysis with given normalized state, angular momentum operations, and magnetic field effects.

  *Part (a): Quantum Number Identification*

  *Given wavefunction:* $psi_(n,l,m)(r) = frac(1, sqrt(8 pi a_0^3)) frac(r, a_0) e^(-r/(2a_0)) sin theta e^(i phi)$

  *Strategy:* Compare exponential term and count radial nodes

  *Principal quantum number* $(n)$:
  - General form: $e^(-r/(n a_0))$
  - Given: $e^(-r/(2a_0))$
  - *Result:* $n = 2$

  *Angular momentum quantum number* $(l)$:
  - *Radial nodes formula:* $n - l - 1$
  - From plot: zero radial nodes
  - *Equation:* $2 - l - 1 = 0 => l = 1$

  *Exam tip:* Always check exponential term for $n$ and count nodes for $l$.

  *Part (b): Most Probable Electron Position*

  *Key concept:* Maximum of radial probability density $P(r) = r^2 |R_(n,l)(r)|^2$

  *Probability density:* $P(r) prop r^2 (frac(r, a_0) e^(-r/(2a_0)))^2 = frac(r^4, a_0^2) e^(-r/a_0)$

  *Substitution:* $x = r/a_0$, so $p(x) prop x^4 e^(-x)$

  *Find maximum:* $frac(d, d x)(x^4 e^(-x)) = (4x^3 - x^4) e^(-x) = 0$

  *Solutions:* $x^3(4 - x) = 0 => x = 0$ (minimum) or $x = 4$ (maximum)

  *Result:* Most likely position is $x = 4$ (i.e., $r = 4a_0$)

  *Part (c): Angular Momentum Lowering Operator*

  *Initial state:* $psi_(2,1,1) = R(r) sin theta e^(i phi)$ (with $m = 1$)

  *Lowering operator:* $hat(L)_- = hat(L)_x - i hat(L)_y$

  *In spherical coordinates:*
  $
    hat(L)_- = hbar e^(-i phi) (-frac(partial, partial theta) + i cot theta frac(partial, partial phi))
  $

  *Apply to angular part:* $sin theta e^(i phi)$
  $
    frac(partial, partial theta)(sin theta e^(i phi)) = cos theta e^(i phi)\
    frac(partial, partial phi)(sin theta e^(i phi)) = i sin theta e^(i phi)
  $

  *Result:*
  $
    hat(L)_- psi_(2,1,1) = -2 hbar R(r) cos theta = psi_(2,1,0)
  $

  *Key insight:* Lowering operator reduces $m$ by 1 and changes angular dependence.

  *Part (d): Expectation Values in Magnetic Field*

  *Superposition state:* $Psi = frac(1, sqrt(6))(i psi_(1,0,0) - 2 psi_(2,1,-1) + psi_(3,2,2))$

  *Probabilities:* $|c_1|^2 = 1/6$, $|c_2|^2 = 4/6$, $|c_3|^2 = 1/6$

  *Energy with Zeeman effect:* $E_(n,m) = -frac(R_e, n^2) + m mu_B B$

  *Energy expectation:*
  $
    avg(E) = frac(1, 6) E_(1,0,0) + frac(4, 6) E_(2,1,-1) + frac(1, 6) E_(3,2,2)
  $
  $
    = frac(1, 6)(-R_e) + frac(4, 6)(-frac(R_e, 4) - mu_B B) + frac{1, 6}(-frac(R_e, 9) + 2 mu_B B)
  $
  $
    = frac(1, 6)(-frac(19, 9) R_e - 2 mu_B B)
  $

  *Angular momentum expectation:*
  $
    avg(L^2) = frac(1, 6) hbar^2 (0)(1) + frac(4, 6) hbar^2 (1)(2) + frac(1, 6) hbar^2 (2)(3) = frac(7 hbar^2, 3)
  $

  *Z-component expectation:*
  $
    avg(L_z) = frac(1, 6) hbar (0) + frac(4, 6) hbar (-1) + frac(1, 6) hbar (2) = -frac(hbar, 3)
  $

  *Part (e): Time Evolution*

  *Time-dependent wavefunction:* Each eigenstate evolves with phase $e^(-i E_k t/hbar)$

  *General form:*
  $
    Psi(r, t) = frac(1, sqrt(6))(i psi_(1,0,0) e^(-i E_(1,0,0) t/hbar) - 2 psi_(2,1,-1) e^(-i E_(2,1,-1) t/hbar) + psi_(3,2,2) e^(-i E_(3,2,2) t/hbar))
  $

  *With energies:*
  $
    Psi(r, t) = frac(1, sqrt(6))(i psi_(1,0,0) e^(i R_e t/hbar) - 2 psi_(2,1,-1) e^(-i(-R_e/4 - mu_B B)t/hbar) + psi_(3,2,2) e^(-i(-R_e/9 + 2 mu_B B)t/hbar))
  $

  *Key Exam Strategies:*

  1. *Quantum number identification:* Use exponential form and node counting
  2. *Probability maxima:* Differentiate radial probability density
  3. *Operator applications:* Know ladder operator effects on quantum numbers
  4. *Superposition expectation values:* Weight eigenvalues by probability amplitudes
  5. *Time evolution:* Apply phase factors $e^(-i E t/hbar)$ to each component

  *Essential Formulas:*
  $
    "Radial nodes:" n - l - 1\
    "Energy levels:" E_n = -frac(R_e, n^2) hspace "Zeeman:" Delta E = m mu_B B\
    "Angular momentum:" L^2 = hbar^2 l(l+1) hspace L_z = hbar m\
    "Expectation value:" avg(A) = sum_i |c_i|^2 A_i
  $

  *Common Pitfalls:*
  - Don't confuse radial nodes with angular nodes
  - Remember to include magnetic field effects in energy
  - Use correct probability weights in superposition calculations
  - Apply time evolution to each eigenstate separately

]

#section("Double-Well Potential - Energy Splitting", image: image("image-11.png"), intro: [
  Quantum particle in double-well: barrier causes energy splitting of degenerate levels. Key for understanding tunneling & parity states.
])[

  *Setup:* Infinite walls at $|x| > b$, finite barrier $V_0$ at $|x| < a$. Even/odd parity solutions.

  *(a) Energy quantization:*

  *Boundary conditions:* $psi(plus.minus b) = 0$ (hard walls)

  *Even solution:* $phi_"even"(x) = A sin[k(x-c)]$ in $a < x <= b$
  At $x = b$: $A sin[k(b-c)] = 0$ → $k(b-c) = n pi$

  *Odd solution:* $phi_"odd"(x) = C sin[k(x-d)]$ in $a < x <= b$
  At $x = b$: $C sin[k(b-d)] = 0$ → $k(b-d) = n pi$

  *Quantized energies:*
  $
    E_n^"even" = (hbar^2 pi^2 n^2)/(2m(b-c)^2), quad E_n^"odd" = (hbar^2 pi^2 n^2)/(2m(b-d)^2)
  $

  *(b) Infinite barrier limit ($V_0 → ∞$):*

  *Inside barrier:* $psi(|x| < a) = 0$ → $B = 0, D = 0$
  *New boundary:* $psi(plus.minus a) = 0$ → $c = a, d = a$

  *Normalization:* Two identical wells, width $(b-a)$
  $A = C = 1/sqrt(b-a)$

  *(c) Finite barrier ($kappa a >> 1$):*

  *Continuity at $x = a$:* $psi$ and $psi'$ continuous

  *Even:* $coth(kappa a) = (k)/(kappa) tan[k(a-c)]$
  *Approximations:* $coth(x) ≈ 1 + 2e^(-2x)$, $tan(y) ≈ y$
  *Result:* $delta_+ = a - c ≈ 1/(kappa + 2e^(-2kappa a))$

  *Odd:* $tanh(kappa a) = (k)/(kappa) tan[k(a-d)]$
  *Approximations:* $tanh(x) ≈ 1 - 2e^(-2x)$
  *Result:* $delta_- = a - d ≈ 1/(kappa - 2e^(-2kappa a))$

  *(d) Energy splitting:*

  *Energy difference:*
  $
    Delta E_(n=1) = E_1^"odd" - E_1^"even" = (hbar^2 pi^2)/(2m) [(1)/((b-d)^2) - (1)/((b-c)^2)]
  $

  *Using* $b-c = (b-a) + delta_+$, $b-d = (b-a) + delta_-$:
  *Approximation:* $(1+x)^(-2) ≈ 1-2x$ for small $x$

  *Final result:*
  $
    Delta E_(n=1) ≈ (hbar^2 pi^2)/(m(b-a)^3) (delta_+ - delta_-) ≈ (4 hbar^2 pi^2)/(m(b-a)^3 kappa) e^(-2kappa a)
  $

  *Parity ordering:* $Delta E > 0$ → *Even state has lower energy*

  *Physical insight:* Tunneling through barrier splits degeneracy. Exponential suppression $prop e^(-2kappa a)$.

  *Key formulas:*
  - $kappa = sqrt(2m(V_0-E))/hbar$ (inside barrier)
  - $k = sqrt(2m E)/hbar$ (outside barrier)
  - Energy splitting $∝ e^(-2kappa a)$ (tunneling signature)

  *Strategy:* Apply boundary conditions systematically, use small parameter expansions, identify tunneling exponentials.

]

#section("X-ray Michelson Interferometer", image: image("image-12.png"), intro: [
  Technical challenges for X-ray interferometry: inefficient mirrors, alignment tolerances, thermal stability. Critical for understanding X-ray optics limitations.
])[

  *Setup:* X-ray wavelength $lambda = 1$ Å, refractive index $n ≈ 1 - delta$ where $delta tilde 10^(-5)$

  *(a) Mirror inefficiency:*

  *Fresnel reflectivity:* $R = ((n-1)/(n+1))^2$ at normal incidence

  *For X-rays:* $n = 1 - delta$
  $R = ((-delta)/(2-delta))^2 ≈ (delta/2)^2 = delta^2/4$

  *Result:* $R ≈ (10^(-5))^2/4 ≈ 2.5 times 10^(-11)$ → virtually no reflection!

  *Physical reason:* $delta > 0$ means X-rays "see" lower optical density → almost complete transmission

  *(b) Bragg back-reflection:*

  *Bragg condition:* $2d sin theta = m lambda$ for constructive interference

  *Back-reflection:* Beam reflects exactly backward → $theta = 90°$
  $2d sin(90°) = m lambda → d = (m lambda)/2$

  *For $lambda = 1$ Å:* $d = 0.5, 1.0, 1.5$ Å (for $m = 1,2,3...$)

  *Strategy:* Use crystal diffraction instead of surface reflection

  *(c) Spatial fringing & alignment:*

  *Misaligned beams:* Small angle $theta$ creates interference fringes

  *Path difference:* $Delta L = x sin theta ≈ x theta$ (small angle)
  *Fringe period:* New fringe every $lambda$ path change
  $x_"period" = lambda/theta$

  *Detector resolution limit:* $x_"period" > x_"res"$
  $lambda/theta > x_"res" → theta < lambda/x_"res"$

  *For $lambda = 10^(-10)$ m, $x_"res" = 50 mu$m:*
  $theta < (10^(-10))/(50 times 10^(-6)) = 2 times 10^(-6)$ rad = 2 microrad

  *Extreme precision required!*

  *(d) Thermal stability:*

  *Thermal expansion:* $Delta L = alpha L Delta T$
  *Stability condition:* $Delta L < lambda/2$ (sub-wavelength stability)

  *Maximum temp difference:*
  $alpha L Delta T < lambda/2 → Delta T < lambda/(2 alpha L)$

  *For $L = 1$ cm, $alpha = 10^(-6)$ per K:*
  $Delta T < (10^(-10))/(2 times 10^(-6) times 0.01) = 0.005$ K = 5 mK

  *Millikelvin stability required!*

  *Key challenges summary:*
  - Reflectivity: $R tilde 10^(-11)$ (use Bragg diffraction instead)
  - Alignment: $< 2 mu$rad precision needed
  - Thermal: $< 5$ mK temperature stability
  - Solution: Crystal optics + extreme environmental control

  *Essential formulas:*
  $
    R_"Fresnel" = ((n-1)/(n+1))^2, quad d_"Bragg" = (m lambda)/(2 sin theta)\
    x_"fringe" = lambda/theta, quad Delta T_"max" = lambda/(2 alpha L)
  $

  *Exam strategy:* Recognize X-ray challenges stem from $n ≈ 1$, use Bragg diffraction, calculate precision requirements from wavelength scale.

]

#section("Statistical Physics - Partitioned Box", image: image("image-13.png"), intro: [
  Microstate counting for indistinguishable particles. Fundamental for entropy calculation & most probable state determination.
])[

  *Setup:* 3 indistinguishable particles in 6-segment box, partition at position $i$. Constraint: 1 particle left, 2 particles right.

  *(a) Microstate counting:*

  *Definition:* Macrostate = partition position $i$, Microstate = specific particle arrangement

  *Left side:* Place 1 particle in $i$ segments → $i$ ways
  *Right side:* Place 2 particles in $(6-i)$ segments → $binom(6-i, 2) = ((6-i)(5-i))/2$ ways

  *Total microstates:* $Omega_i = i times ((6-i)(5-i))/2$

  *Key insight:* Combinatorics for indistinguishable particles → binomial coefficients

  *(b) Entropy calculation:*

  *Boltzmann formula:* $S_i = k_B ln(Omega_i)$

  *For each macrostate:*
  $S_i = k_B ln(i times ((6-i)(5-i))/2)$

  *Note:* Higher $Omega_i$ → higher entropy → more probable state

  *(c) Most probable state:*

  *Fundamental postulate:* All microstates equally probable → macrostate probability $∝ Omega_i$

  *Calculate for each $i$:*
  - $i=1$: $Omega_1 = 1 times (5 times 4)/2 = 10$
  - $i=2$: $Omega_2 = 2 times (4 times 3)/2 = 12$ ← Maximum!
  - $i=3$: $Omega_3 = 3 times (3 times 2)/2 = 9$
  - $i=4$: $Omega_4 = 4 times (2 times 1)/2 = 4$
  - $i=5$: $Omega_5 = 0$ (impossible: 2 particles need ≥2 segments)

  *Total microstates:* $Omega_"total" = 10+12+9+4 = 35$

  *Most probable:* $i=2$ with $P(i=2) = 12/35 ≈ 34%$

  *Physical reason:* Balance between left availability ($i$) and right combinatorics $(6-i$ choose $2)$

  *Key formulas:*
  $
    Omega_i = i binom(6-i, 2), quad S = k_B ln(Omega), quad P_i = Omega_i/Omega_"total"
  $

  *Strategy:*
  1. Count arrangements using combinatorics
  2. Find maximum $Omega_i$ for most probable state
  3. Use $S = k_B ln(Omega)$ for entropy
  4. Remember constraint effects (impossible configurations)

]

#section("Two-Lens Imaging System", image: image("image-14.png"), intro: [
  Compound lens system: converging + diverging lenses. Real image formation, magnification, resolution limits.
])[

  *Setup:* Object at distance $a$ from lens 1 ($f_1 > 0$), lens 2 at distance $b$ from lens 1 ($f_2 < 0$, diverging)

  *(a) Image from lens 1:*

  *Thin lens equation:* $1/a + 1/x_1 = 1/f_1$

  *Solve for $x_1$:*
  $x_1 = (a f_1)/(a - f_1)$

  *Note:* This image becomes object for lens 2

  *(b) Real image conditions:*

  *For lens 2:* Object distance $(b - x_1)$, image distance $x_2$
  $1/(b - x_1) + 1/x_2 = 1/f_2$

  *Solve for $x_2$:* $x_2 = (f_2 (b - x_1))/(b - x_1 - f_2)$

  *Real image condition:* $x_2 > 0$

  *Analysis:* Since $f_2 < 0$ (diverging), need numerator & denominator opposite signs
  - Case 1: $(b - x_1) > 0$ and $(b - x_1 - f_2) < 0$ → impossible
  - Case 2: $(b - x_1) < 0$ and $(b - x_1 - f_2) > 0$ → valid

  *Condition:* $x_1 + f_2 < b < x_1$ (since $f_2 < 0$)

  *(c) Total magnification:*

  *Individual magnifications:*
  - Lens 1: $M_1 = -x_1/a$
  - Lens 2: $M_2 = -x_2/(b - x_1)$

  *Total magnification:* $M_"total" = M_1 times M_2 = (x_1 x_2)/(a(b - x_1))$

  *(d) System resolution:*

  *Abbé criterion:* $delta > lambda/(2 "NA")$

  *Numerical aperture:* $"NA" = sin theta$ (in air, $n = 1$)

  *From geometry:* $sin theta = r_1/sqrt(a^2 + r_1^2)$

  *Resolution limit:*
  $delta > (lambda sqrt(a^2 + r_1^2))/(2 r_1)$

  *Key insight:* First lens aperture limits system resolution

  *Essential formulas:*
  $
    1/s + 1/s' = 1/f, quad M = -s'/s, quad "NA" = sin theta\
    delta_"min" = lambda/(2 "NA"), quad M_"total" = product M_i
  $

  *Strategy:*
  1. Apply thin lens equation sequentially
  2. Check real image conditions (sign analysis)
  3. Multiply individual magnifications
  4. Use first lens for resolution limit

  *Common pitfalls:*
  - Diverging lens: $f < 0$
  - Image 1 → Object 2 distance: $(b - x_1)$
  - Resolution limited by entrance aperture

]

#section("Gaussian Wave Packet Evolution", image: image("image-15.png"), intro: [
  Free particle time evolution: spreading, Fourier transforms, uncertainty principle. Essential for wave mechanics understanding.
])[

  *Setup:* Initial wavefunction $Psi(x, 0) = A e^(-a x^2)$, free particle ($H = p^2/(2m)$)

  *(a) Normalization:*

  *Condition:* $integral_(-infinity)^(infinity) |Psi(x, 0)|^2 d x = 1$

  *Gaussian integral:* $integral_(-infinity)^(infinity) e^(-c x^2) d x = sqrt(pi/c)$

  *Result:* $|A|^2 sqrt(pi/(2a)) = 1 → A = (2a/pi)^(1/4)$

  *(b) Momentum space (Fourier transform):*

  *Definition:* $Psi(p, 0) = 1/sqrt(2pi hbar) integral_(-infinity)^(infinity) Psi(x, 0) e^(-i p x/hbar) d x$

  *Gaussian FT:* $integral e^(-a x^2 - i b x) d x = sqrt(pi/a) exp(-b^2/(4a))$

  *Result:* $Psi(p, 0) = (1/(2pi a hbar^2))^(1/4) exp(-p^2/(4a hbar^2))$

  *(c) Time evolution in momentum:*

  *Free particle:* $i hbar (partial Psi)/(partial t) = (p^2)/(2m) Psi$

  *Solution:* $Psi(p, t) = Psi(p, 0) e^(-i p^2 t/(2m hbar))$

  *With $theta = (2a hbar t)/m$:*
  $Psi(p, t) = (1/(2pi a hbar^2))^(1/4) exp[-(p^2)/(4a hbar^2)(1+i theta)]$

  *(d) Back to position (inverse FT):*

  *Result:* $Psi(x, t) = (2a/pi)^(1/4) 1/sqrt(1+i theta) exp(-(a x^2)/(1+i theta))$

  *Key insight:* Width parameter becomes complex → spreading + phase

  *(e) Probability densities:*

  *Momentum:* $|Psi(p, t)|^2 = |Psi(p, 0)|^2$ (time-independent!)
  $|Psi(p, t)|^2 = 1/sqrt(2pi a hbar^2) exp(-p^2/(2a hbar^2))$

  *Position:* Spreading occurs
  $|Psi(x, t)|^2 = sqrt(2a/pi) 1/sqrt(1+theta^2) exp(-(2a x^2)/(1+theta^2))$

  *(f) Expectation values:*

  *Position variance:* $angle.l x^2 angle.r = (1+theta^2)/(4a)$
  *Momentum variance:* $angle.l p^2 angle.r = a hbar^2$ (constant)

  *Physical meaning:* Position spreads, momentum unchanged

  *(g) Uncertainty principle:*

  *Uncertainties:*
  $sigma_x = sqrt(angle.l x^2 angle.r) = sqrt((1+theta^2)/(4a))$
  $sigma_p = sqrt(angle.l p^2 angle.r) = hbar sqrt(a)$

  *Product:* $sigma_x sigma_p = (hbar/2) sqrt(1+theta^2)$

  *Minimum uncertainty:* At $t=0$ ($theta=0$): $sigma_x sigma_p = hbar/2$
  *General:* $sigma_x sigma_p >= hbar/2$ ✓

  *Spreading time scale:* $t_"spread" ~ m/(a hbar)$

  *Key formulas:*
  $
    theta = (2a hbar t)/m, quad sigma_x(t) = sqrt((1+theta^2)/(4a))\
    sigma_p = "const" = hbar sqrt(a), quad sigma_x sigma_p >= hbar/2
  $

  *Strategy:*
  1. Normalize using Gaussian integrals
  2. Use Fourier transform properties
  3. Apply time evolution operator $exp(-i H t/hbar)$
  4. Track width parameter evolution
  5. Verify uncertainty principle

  *Physical insights:*
  - Free particle momentum conserved → $|Psi(p, t)|^2$ constant
  - Position uncertainty grows linearly in time
  - Minimum uncertainty only at $t=0$
  - Gaussian → Gaussian under FT and time evolution

]

#section("Coherent States - Harmonic Oscillator", image: image("image-17.png"), intro: [
  Quantum states mimicking classical behavior. Eigenstate of lowering operator: $hat(a)|alpha angle.r = alpha |alpha angle.r$.
])[

  *Definition:* Coherent state $|alpha angle.r$ satisfies $hat(a)|alpha angle.r = alpha |alpha angle.r$ where $alpha in CC$

  *(a) Position & momentum expectation values:*

  *Operators in ladder form:*
  $hat(x) = sqrt(hbar/(2m omega))(hat(a)^dagger + hat(a))$
  $hat(p) = i sqrt((hbar m omega)/2)(hat(a)^dagger - hat(a))$

  *Key relations:* $angle.l alpha|hat(a)|alpha angle.r = alpha$, $angle.l alpha|hat(a)^dagger|alpha angle.r = alpha^*$

  *Results:*
  $angle.l hat(x) angle.r = sqrt(hbar/(2m omega))(alpha^* + alpha) = sqrt(hbar/(2m omega)) dot 2 "Re"(alpha)$
  $angle.l hat(p) angle.r = i sqrt((hbar m omega)/2)(alpha^* - alpha) = sqrt((hbar m omega)/2) dot 2 "Im"(alpha)$

  *(b) Energy expectation:*

  *Hamiltonian:* $hat(H) = hbar omega (hat(a)^dagger hat(a) + 1/2)$

  *Calculate:* $angle.l alpha|hat(a)^dagger hat(a)|alpha angle.r = angle.l alpha|hat(a)^dagger|alpha angle.r alpha = alpha^* alpha = |alpha|^2$

  *Result:* $angle.l hat(H) angle.r = hbar omega (|alpha|^2 + 1/2)$

  *Note:* Ground state energy $+ |alpha|^2$ excitation

  *(c) Number state time evolution:*

  *Energy eigenstates:* $hat(H)|n angle.r = E_n |n angle.r$ where $E_n = hbar omega (n + 1/2)$

  *Time evolution:* $|n(t) angle.r = e^(-i E_n t/hbar) |n angle.r = e^(-i omega t (n + 1/2)) |n angle.r$

  *(d) Coherent state time evolution:*

  *Coherent state expansion:* $|alpha angle.r = e^(-|alpha|^2/2) sum_(n=0)^infinity (alpha^n)/sqrt(n!) |n angle.r$

  *Time-evolved state:* $|alpha(t) angle.r = e^(-|alpha|^2/2) sum_(n=0)^infinity (alpha^n)/sqrt(n!) e^(-i omega t (n + 1/2)) |n angle.r$

  *Factor out global phase:* $e^(-i omega t/2) |alpha(t) angle.r = e^(-|alpha|^2/2) sum_(n=0)^infinity ((alpha e^(-i omega t))^n)/sqrt(n!) |n angle.r$

  *Key result:* $|alpha(t) angle.r = e^(-i omega t/2) |alpha e^(-i omega t) angle.r$

  *Eigenvalue evolution:* $alpha(t) = alpha_0 e^(-i omega t)$ (rotation in complex plane)

  *(e) Oscillating expectation values:*

  *For real initial $alpha_0$:* $alpha(t) = alpha_0 e^(-i omega t) = alpha_0 (cos(omega t) - i sin(omega t))$

  *Position:*
  $angle.l hat(x)(t) angle.r = sqrt(hbar/(2m omega)) dot 2 "Re"(alpha(t)) = sqrt((2 hbar)/(m omega)) alpha_0 cos(omega t)$

  *Momentum:*
  $angle.l hat(p)(t) angle.r = sqrt((hbar m omega)/2) dot 2 "Im"(alpha(t)) = -sqrt(2 hbar m omega) alpha_0 sin(omega t)$

  *Classical analogy:* $x_"cl"(t) = A cos(omega t)$, $p_"cl"(t) = -m omega A sin(omega t)$

  *(f) "Classical" quantum state properties:*

  *Key features:*
  - Expectation values follow classical equations of motion
  - Minimum uncertainty state: $Delta x Delta p = hbar/2$
  - Wave packet maintains shape (no spreading)
  - Coherent superposition of all number states
  - Phase space trajectory: circle in $(x,p)$ plane

  *Physical meaning:* Closest quantum analog to classical oscillation

  *Essential formulas:*
  $
    hat(a)|alpha angle.r = alpha |alpha angle.r, quad alpha(t) = alpha_0 e^(-i omega t)\
    angle.l hat(H) angle.r = hbar omega (|alpha|^2 + 1/2), quad Delta x Delta p = hbar/2
  $

  *Strategy:*
  1. Use ladder operator eigenstate property
  2. Apply $hat(a)|alpha angle.r = alpha |alpha angle.r$ consistently
  3. Time evolution → phase rotation of eigenvalue
  4. Extract real/imaginary parts for $x,p$ oscillations
  5. Compare with classical motion

  *Applications:*
  - Laser light states
  - Quantum optics
  - Semiclassical approximations
  - Bridge between quantum/classical mechanics

]


#section("2D Blackbody Radiation",image:image("image-18.png"), intro: [
  Blackbody theory in 2D: classical vs quantum, density of states, ultraviolet catastrophe in reduced dimensions.
])[

  *Setup:* 2D metallic box, area $L^2$, EM modes as harmonic oscillators, temperature $T$

  *(a) Classical mean energy per mode:*
  
  *Equipartition theorem:* Each quadratic degree of freedom → $1/2 k_B T$
  *EM mode:* 2 DOF (kinetic + potential energy)
  
  *Result:* $angle.l epsilon angle.r_c = 2 times 1/2 k_B T = k_B T$

  *(b) Quantum mean energy per mode:*
  
  *Partition function:* $Z = 1/(1 - e^(-beta hbar omega))$ where $beta = 1/(k_B T)$
  
  *Mean energy formula:* $angle.l epsilon angle.r_q = -(partial ln Z)/(partial beta)$
  
  *Calculate:* $ln Z = -ln(1 - e^(-beta hbar omega))$
  $(partial ln Z)/(partial beta) = -(hbar omega e^(-beta hbar omega))/(1 - e^(-beta hbar omega))$
  
  *Result:* $angle.l epsilon angle.r_q = (hbar omega)/(e^(beta hbar omega) - 1)$ (Planck distribution)

  *(c) 2D density of states:*
  
  *Mode spacing:* $k = (pi n_x)/L, (pi n_y)/L$ → grid spacing $(pi/L)^2$ in k-space
  *2 polarizations:* Mode density = $2/(pi/L)^2 = (2L^2)/pi^2$
  
  *Frequency range:* $omega = c k$ → $k in [k, k+d k]$ where $d k = d omega/c$
  *Area in k-space:* First quadrant of annulus = $1/4 times 2pi k d k = (pi k d k)/2$
  
  *Number of modes:* $g(omega) d omega = (2L^2)/pi^2 times (pi k d k)/2 = (L^2 k d k)/pi$
  
  *Substitute $k = omega/c$:* $g(omega) d omega = (L^2 omega d omega)/(pi c^2)$

  *(d) Energy density distributions:*
  
  *General formula:* $rho(omega) d omega = (angle.l epsilon angle.r g(omega) d omega)/A$ where $A = L^2$
  
  *Rayleigh-Jeans (classical):*
  $rho_"RJ"(omega) = (k_B T)/(L^2) times (L^2 omega)/(pi c^2) = (k_B T omega)/(pi c^2)$
  
  *Planck (quantum):*
  $rho_"Planck"(omega) = (hbar omega)/(e^(beta hbar omega) - 1) times omega/(pi c^2) = (hbar omega^2)/(pi c^2 (e^(hbar omega/(k_B T)) - 1))$

  *(e) Ultraviolet catastrophe in 2D:*
  
  *Definition:* Classical theory predicts divergent total energy at high frequencies
  
  *2D Rayleigh-Jeans:* $rho_"RJ"(omega) prop omega$ (linear in $omega$)
  
  *Total energy:* $integral_0^infinity rho_"RJ"(omega) d omega = integral_0^infinity (k_B T omega)/(pi c^2) d omega → infinity$
  
  *Conclusion:* Yes, 2D exhibits UV catastrophe (though less severe than 3D: $omega$ vs $omega^2$)
  
  *Quantum resolution:* Planck distribution → $e^(-hbar omega/(k_B T))$ cutoff at high $omega$

  *Key differences 2D vs 3D:*
  - Density of states: $g(omega) prop omega$ (2D) vs $omega^2$ (3D)
  - Classical divergence: $prop omega$ (2D) vs $omega^2$ (3D)
  - Same quantum resolution via Planck factor

  *Essential formulas:*
  $
    angle.l epsilon angle.r_"classical" = k_B T, quad angle.l epsilon angle.r_"quantum" = (hbar omega)/(e^(hbar omega/(k_B T)) - 1)\
    g(omega) = (L^2 omega)/(pi c^2), quad rho(omega) = angle.l epsilon angle.r g(omega)/L^2
  $

  *Strategy:*
  1. Apply equipartition (classical) vs partition function (quantum)
  2. Count modes in k-space: grid + polarization + geometry
  3. Convert k → $omega$ using dispersion $omega = c k$
  4. Check integral convergence for UV catastrophe
  5. Compare classical divergence vs quantum cutoff

  *Physical insights:*
  - Lower dimensions → reduced density of states
  - UV catastrophe persists but less severe in 2D  
  - Quantum mechanics essential for finite total energy
  - Planck distribution universal (independent of dimension)

]


