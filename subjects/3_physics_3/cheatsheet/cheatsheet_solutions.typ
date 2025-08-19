#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Physics Cheatsheet",
  author: "Denis Titov",
  language: "ENG",
)

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

#section("2D Blackbody Radiation", image: image("image-18.png"), intro: [
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

