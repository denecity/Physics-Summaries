#import "../../../lib/setup_flashcards.typ": flashcard, flashcard-setup, render-flashcards
#import "../../../lib/lib.typ": *

#show: flashcard-setup(
  card-width: 9cm,
  card-height: 5.5cm,
  margin: 0cm,
  show-cut-lines: true,
  topic: "Fourier Theory",
)

#let blue = rgb("#E3F2FD") // Fourier Series
#let green = rgb("#E8F5E8") // Fourier Transform
#let yellow = rgb("#FFF8E1") // PDEs
#let red = rgb("#FFEBEE") // Distributions / Functional Analysis

// Multiple Choice
#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    How do you qualitatively tell elliptic vs parabolic vs hyperbolic?
  ],
  answer: [
    Look at the highest-derivative structure:

    + Elliptic: no time derivative, "steady-state" (Laplace/Poisson). Smooths out; BCs determine everything.
    + Parabolic: first time derivative (heat). Smooths and decays; needs IC + BCs.
    + Hyperbolic: second time derivative (wave). Propagates signals; needs two ICs + BCs.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Dirichlet vs Neumann vs Robin: what changes qualitatively?
  ],
  answer: [
    They pick the eigenfunctions and eigenvalues.

    + Dirichlet (value fixed): sine-like modes; "pinned".
    + Neumann (flux fixed): cosine-like modes; includes constant mode (often).
    + Robin: mix; eigenvalues often come from transcendental equations (tan, etc.).
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    When should you try separation of variables immediately?
  ],
  answer: [
    When the domain is simple (interval/rectangle/box/circle/sphere) and BCs are homogeneous (0 or constant). Then write the solution as a sum of separated eigenmodes.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    What does the heat equation do to initial data?
  ],
  answer: [
    It smooths and kills high frequencies fast. In eigenmode form, each spatial mode decays like
    $
      e^(-kappa lambda t)
    $
    so larger $lambda$ (more oscillations) decays faster.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    What does the wave equation do differently from heat?
  ],
  answer: [
    It propagates and oscillates rather than smoothing. Modes evolve like
    $
      cos(c lambda t), sin(c lambda t)
    $
    so energy moves around instead of dissipating (in the ideal model).
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    What is a key qualitative property of Laplace's equation?
  ],
  answer: [
    Harmonic functions do not have "new" interior maxima or minima (maximum principle). So interior values are controlled by boundary values; solutions are as smooth as the boundary allows.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Qualitatively, what changes when $Delta u = f$ instead of $0$?
  ],
  answer: [
    $f$ acts like a source. Think "particular solution + harmonic correction to fit BCs." Shape is boundary-driven and source-driven.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    What do solutions look like in a rectangular box?
  ],
  answer: [
    A sum of standing-wave product modes (sines/cosines) that match the BCs on each wall. Each mode has an eigenvalue
    $
      lambda = lambda_x + lambda_y (+ lambda_z)
    $
    and time factors (decay/oscillation) depend on the PDE type.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    What is the qualitative trap with Neumann BCs?
  ],
  answer: [
    The constant (zero-eigenvalue) mode often exists.

    + Heat + Neumann: the average temperature can persist (no decay of mean).
    + Poisson + pure Neumann: solvability requires a compatibility condition (net source must balance the boundary flux).
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    With periodic boundaries, what functions naturally appear and what is the qualitative effect?
  ],
  answer: [
    Complex exponentials / Fourier series. You are decomposing into traveling or oscillatory modes with discrete wavenumbers. Great for diffusion or waves on a ring or repeating domain.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Qualitatively, when do Bessel functions show up?
  ],
  answer: [
    When you separate in polar or cylindrical coordinates and the domain has circular symmetry (disk/cylinder). Radial behavior must accommodate the $1/r$ term in the Laplacian, producing Bessel-type radial modes.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    When do spherical harmonics appear, and what do they mean qualitatively?
  ],
  answer: [
    When the domain or BCs involve a sphere (ball, spherical boundary) and you separate angular variables. Spherical harmonics are the angular eigenmodes on the sphere: each $ell$ is an "angular frequency level," with $(2 ell + 1)$ modes $m$. Radial parts pair with $ell$ (for Laplace: $r^ell$, $r^(-(ell + 1))$).
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Consider Laplace's equation $Delta u = 0$ on $(0, L_x) times (0, L_y)$ with $u = 0$ on three sides and $u(x, 0) = f(x)$ on the remaining side. Describe the qualitative separation-of-variables solution.
  ],
  answer: [
    Elliptic. Use separation $u = X(x) Y(y)$. Dirichlet gives sine modes in $x$; $Y$ gives $sinh$ or $sin$ depending on sign. Expand $f$ in a sine series and match coefficients.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    For the Poisson problem $Delta u = f(x, y)$ on a rectangle with pure Neumann BC $partial_n u = 0$ on all sides, state the solvability condition and describe the eigenfunction structure.
  ],
  answer: [
    Need compatibility: $integral_Omega f dd(A) = 0$ (since total flux is zero). Solution is only determined up to an additive constant. Use cosine-cosine eigenfunctions, but treat the zero mode carefully.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Solve Laplace's equation $Delta u = 0$ in a disk $r < R$ with boundary data $u(R, theta) = g(theta)$. Which basis do you use, and what is the radial form?
  ],
  answer: [
    Expand $g(theta)$ in Fourier series $sum (a_m cos(m theta) + b_m sin(m theta))$. Radial parts $r^m$ (finite at $0$) give $u(r, theta) = a_0 + sum_(m >= 1) r^m (...)$.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Solve Laplace's equation in a ball $r < a$ with boundary data $u(a, theta, phi) = F(theta, phi)$. Explain the spherical harmonic expansion and radial dependence.
  ],
  answer: [
    Expand $F = sum_(ell, m) c_(ell m) Y_(ell m)$. Radial behavior for Laplace inside the ball is $r^ell$ (reject $r^(-(ell + 1))$ to avoid blow-up at 0). So $u(r, theta, phi) = sum_(ell, m) c_(ell m) (r / a)^ell Y_(ell m)$.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Solve the 1D heat equation $u_t = kappa u_( x x)$ on $0 < x < L$ with $u(0, t) = u(L, t) = 0$ and $u(x, 0) = f(x)$. What does the separated solution look like?
  ],
  answer: [
    Sine eigenfunctions: $X_n = sin(n pi x / L)$. Time factors decay: $e^(-kappa (n pi / L)^2 t)$. Expand $f$ in a sine series to get coefficients.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    For the 1D heat equation on $0 < x < L$ with Neumann BC $u_x(0, t) = u_x(L, t) = 0$, what changes qualitatively compared to Dirichlet BC?
  ],
  answer: [
    Cosine modes plus the constant $n = 0$ mode. The mean temperature is conserved (no flux), so the solution tends to the spatial average of $f$ as $t -> oo$.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Solve the 2D heat equation $u_t = kappa Delta u$ on $(0, L_x) times (0, L_y)$ with $u = 0$ on the boundary and $u(x, y, 0) = f(x, y)$. What is the separated form and decay rate?
  ],
  answer: [
    Double sine product basis. Mode decay rate uses $lambda_(m n) = (m pi / L_x)^2 + (n pi / L_y)^2$. So $u = sum_(m, n) A_(m n) sin(..) sin(..) e^(-kappa lambda_(m n) t)$.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Solve the 1D wave equation $u_(t t) = c^2 u_(x x)$ on $0 < x < L$ with $u(0, t) = u(L, t) = 0$, $u(x, 0) = f(x)$, and $u_t(x, 0) = g(x)$. What does the modal solution look like?
  ],
  answer: [
    Sine eigenfunctions. Each mode oscillates with $omega_n = c (n pi / L)$. Coeffs from sine series of $f$ and $g$: $A_n cos(omega_n t) + B_n sin(omega_n t)$.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    For the wave equation $u_(t t) = c^2 u_(x x)$ on $0 < x < L$ with $u(0, t) = 0$ and $u_x(L, t) = 0$, how do the eigenvalues change compared to the Dirichlet case?
  ],
  answer: [
    Spatial ODE gives mixed sine/cosine condition -> eigenvalues become half-integers: $k_n = (n + 1 / 2) pi / L$ (typical). Modes $sin(k_n x)$ with time factors $cos(c k_n t)$ and $sin(c k_n t)$ (coefficients from the initial data).
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    For the Helmholtz equation $Delta u + k^2 u = 0$ in a 3D rectangular box with Dirichlet walls, what are the resonance conditions on $k$?
  ],
  answer: [
    Product of sines; eigenvalues $lambda_(n ell m) = (n pi / L_x)^2 + (ell pi / L_y)^2 + (m pi / L_z)^2$. Nontrivial solutions when $k^2 = lambda_(n ell m)$ (discrete allowed $k$).
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Classify the PDE $u_t = kappa u_(x x)$ as elliptic, parabolic, or hyperbolic.
  ],
  answer: [
    Parabolic: the highest derivatives include one time derivative and two spatial derivatives, so it models diffusion (smoothing in time).
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Classify the PDE $u_(t t) = c^2 u_(x x)$ as elliptic, parabolic, or hyperbolic.
  ],
  answer: [
    Hyperbolic: the highest derivatives include a second time derivative, so solutions propagate waves and preserve oscillations.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Classify the PDE $u_(x x) + u_(y y) = 0$ as elliptic, parabolic, or hyperbolic.
  ],
  answer: [
    Elliptic: only spatial second derivatives appear, so it is a steady-state (no time) problem.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Solve the 1D Laplace (steady heat) problem $u_(x x) = 0$ on $0 < x < L$ with $u(0) = A$ and $u(L) = B$.
  ],
  answer: [
    Linear: integrate twice to get $u(x) = C_1 x + C_2$, then apply the boundary values to obtain $u(x) = A + (B - A) x / L$.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Solve the 1D Poisson problem $u_(x x) = 1$ on $0 < x < L$ with $u(0) = u(L) = 0$.
  ],
  answer: [
    Quadratic: integrate twice to get $u(x) = x^2 / 2 + C_1 x + C_2$, then use $u(0) = u(L) = 0$ to fix $C_1, C_2$.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    For the 1D heat equation on $0 < x < L$ with zero Dirichlet ends, describe the long-time limit as $t -> oo$.
  ],
  answer: [
    Goes to $0$ because all sine modes have negative exponential factors, so every nonzero mode decays as $t -> oo$.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    For the 1D heat equation on $0 < x < L$ with zero Neumann ends, describe the long-time limit as $t -> oo$.
  ],
  answer: [
    Goes to the spatial average of the initial condition, since the constant Neumann mode is preserved while all higher cosine modes decay.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    In the wave equation, interpret the initial conditions $u(x, 0)$ and $u_t(x, 0)$ physically.
  ],
  answer: [
    $u(x, 0)$ is the initial displacement of the string, and $u_t(x, 0)$ is its initial velocity profile.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    On the interval $0 < x < L$, which eigenfunction bases correspond to Dirichlet vs Neumann boundary conditions?
  ],
  answer: [
    Dirichlet gives sines (zero at both ends), while Neumann gives cosines plus the constant mode (zero derivative at both ends).
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Consider Laplace's equation on a rectangle with $u = 0$ on three sides and nonzero data on the fourth. What standard separated form is used?
  ],
  answer: [
    Use sines in the direction with zero Dirichlet at both ends, and hyperbolic sines in the other direction to match the nonzero boundary data.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Solve the 1D Helmholtz problem $u_(x x) + k^2 u = 0$ on $0 < x < L$ with $u(0) = u(L) = 0$. What condition on $k$ gives nontrivial solutions?
  ],
  answer: [
    Nontrivial solutions require $k = n pi / L$, giving eigenmodes $sin(n pi x / L)$ that satisfy the Dirichlet endpoints.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    For the Dirichlet Poisson problem $Delta u = f$, what is the standard decomposition of the solution?
  ],
  answer: [
    $u = u_p + u_h$, where $u_p$ satisfies $Delta u_p = f$ and $u_h$ is harmonic, chosen to enforce the boundary data.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    For Laplace or Poisson with pure Neumann BCs, explain the source of non-uniqueness.
  ],
  answer: [
    Additive constants: if only the normal derivative is prescribed on the whole boundary, you can add any constant and still satisfy the BCs.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    In separation of variables for PDEs, when do Bessel functions appear and why?
  ],
  answer: [
    When separating in polar or cylindrical coordinates (disk/cylinder), because the radial ODE includes the $r^(-1) R'$ term, which leads to Bessel equations.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    When solving PDEs on spherical domains or boundaries, when do spherical harmonics $Y_(ell m)$ appear and what role do they play?
  ],
  answer: [
    When separating on spherical domains or boundaries; they are the angular eigenfunctions on the sphere and correspond to harmonic homogeneous polynomials.
  ],
)

#flashcard(
  title: "Fourier Series",
  color: blue,
  question: [
    Even extension shortcut (cosine series). Let $f(x) = x$ on $(0, pi)$. Find the half-range cosine series of $f$ on $(0, pi)$.
  ],
  answer: [
    Even extension gives only cosines. The cosine series is
    $
      f(x) = pi / 2 - (4 / pi) sum_(k=0)^oo cos((2 k + 1) x) / (2 k + 1)^2
    $
    with $a_n = (2 / pi) integral_0^pi x cos(n x) dx = (2 / pi) ((-1)^n - 1) / n^2$.
  ],
)

#flashcard(
  title: "Fourier Series",
  color: blue,
  question: [
    Odd extension shortcut (sine series). Let $f(x) = x$ on $(0, pi)$. Find the half-range sine series on $(0, pi)$.
  ],
  answer: [
    Odd extension gives only sines:
    $
      f(x) = sum_(n=1)^oo 2 (-1)^(n + 1) sin(n x) / n
    $
    since $b_n = (2 / pi) integral_0^pi x sin(n x) dx = 2 (-1)^(n + 1) / n$.
  ],
)

#flashcard(
  title: "Fourier Series",
  color: blue,
  question: [
    Piecewise + parity check. Define $f(x) = |x|$ on $(-pi, pi)$, $2 pi$-periodic. Compute its Fourier series.
  ],
  answer: [
    Even function so $b_n = 0$. Series:
    $
      |x| = pi / 2 - (4 / pi) sum_(k=0)^oo cos((2 k + 1) x) / (2 k + 1)^2
    $
    on $(-pi, pi)$.
  ],
)

#flashcard(
  title: "Fourier Series",
  color: blue,
  question: [
    Square wave with point symmetry. Define $f(x) = sgn(x)$ on $(-pi, pi)$, $2 pi$-periodic. Find its Fourier series.
  ],
  answer: [
    Odd function so only sines, and only odd harmonics survive:
    $
      f(x) = (4 / pi) sum_(k=0)^oo sin((2 k + 1) x) / (2 k + 1)
    $
    on $(-pi, pi)$.
  ],
)

#flashcard(
  title: "Fourier Series",
  color: blue,
  question: [
    Triangular wave via derivative trick. Let $f(x)$ be the $2 pi$-periodic function equal to $f(x) = x$ on $(-pi, pi)$. Find its Fourier series, then deduce the series for $f'(x)$ (away from jumps).
  ],
  answer: [
    Since $f$ is odd,
    $
      f(x) = sum_(n=1)^oo 2 (-1)^(n + 1) sin(n x) / n
    $
    and differentiating termwise gives
    $
      f'(x) = 2 sum_(n=1)^oo (-1)^(n + 1) cos(n x)
    $
    which represents $1$ away from the jump points (with delta spikes at the discontinuities).
  ],
)

#flashcard(
  title: "Fourier Series",
  color: blue,
  question: [
    Choose complex exponential form. Let $f(x) = e^(a x)$ on $(-pi, pi)$, $2 pi$-periodic, with $a in RR$. Compute the complex Fourier coefficients $c_n$.
  ],
  answer: [
    One line:
    $
      c_n = (1 / (2 pi)) integral_(-pi)^pi e^(a x) e^(-i n x) dx
      = (-1)^n (sinh(a pi)) / (pi (a - i n))
    $
    (valid for all integers $n$, including $n = 0$).
  ],
)

#flashcard(
  title: "Fourier Series",
  color: blue,
  question: [
    Shifted even function (phase factors). Let $g(x) = |x - pi / 2|$ on $(0, pi)$, extended evenly to $(-pi, pi)$ and $2 pi$-periodic. Find its Fourier series.
  ],
  answer: [
    Even extension gives a cosine series with a phase factor $cos(n pi / 2)$:
    $
      g(x) = pi / 4 + (2 / pi) sum_(k=0)^oo cos(2 (2 k + 1) x) / (2 k + 1)^2
    $
    (only $n = 4 k + 2$ survive).
  ],
)

#flashcard(
  title: "Fourier Series",
  color: blue,
  question: [
    Parseval check. Let $f(x) = x$ on $(-pi, pi)$, $2 pi$-periodic. Use Parseval to evaluate $sum_(n=1)^oo 1 / n^2$.
  ],
  answer: [
    From $f(x) = sum_(n=1)^oo 2 (-1)^(n + 1) sin(n x) / n$,
    Parseval gives
    $
      (1 / pi) integral_(-pi)^pi x^2 dx = sum_(n=1)^oo (2 / n)^2 = 4 sum_(n=1)^oo 1 / n^2
    $
    so $sum_(n=1)^oo 1 / n^2 = pi^2 / 6$.
  ],
)

#flashcard(
  title: "Fourier Transform",
  color: green,
  question: [
    Even function -> real cosine transform. Compute $F{e^(-a |t|)}(omega)$, $a > 0$.
  ],
  answer: [
    Even function:
    $
      F{e^(-a |t|)}(omega) = 2 integral_0^oo e^(-a t) cos(omega t) dt = 2 a / (a^2 + omega^2)
    $.
  ],
)

#flashcard(
  title: "Fourier Transform",
  color: green,
  question: [
    Odd function -> imaginary sine transform. Compute $F{t e^(-a |t|)}(omega)$, $a > 0$.
  ],
  answer: [
    Odd function, purely imaginary. Use $F{t f} = i d/d(omega) F{f}$:
    $
      F{t e^(-a |t|)}(omega) = i d/d(omega) (2 a / (a^2 + omega^2))
      = -i (4 a omega) / (a^2 + omega^2)^2
    $.
  ],
)

#flashcard(
  title: "Fourier Transform",
  color: green,
  question: [
    Rectangle pulse (sinc) + shifting. Let $f(t) = 1$ for $|t| < T$ and $0$ otherwise. Compute $F{f(t)}(omega)$ and $F{f(t - t_0)}(omega)$.
  ],
  answer: [
    $
      F{f}(omega) = integral_(-T)^T e^(-i omega t) dt = 2 sin(omega T) / omega
    $
    and shifting gives $F{f(t - t_0)}(omega) = e^(-i omega t_0) F{f}(omega)$.
  ],
)

#flashcard(
  title: "Fourier Transform",
  color: green,
  question: [
    Triangle from convolution (sinc squared). Let $g(t) = (f * f)(t)$ where $f$ is the rectangle pulse in Q11. Compute $F{g}$.
  ],
  answer: [
    Convolution becomes product:
    $
      F{g}(omega) = (F{f}(omega))^2 = (2 sin(omega T) / omega)^2
    $
    (a sinc-squared spectrum).
  ],
)

#flashcard(
  title: "Fourier Transform",
  color: green,
  question: [
    Gaussian (complete the square). Compute $F{e^(-a t^2)}(omega)$, $a > 0$.
  ],
  answer: [
    Completing the square gives
    $
      F{e^(-a t^2)}(omega) = sqrt(pi / a) e^(-omega^2 / (4 a))
    $.
  ],
)

#flashcard(
  title: "Fourier Transform",
  color: green,
  question: [
    Modulation (frequency shift). Given $f(t) = e^(-a t^2)$, find $F{e^(i omega_0 t) f(t)}(omega)$.
  ],
  answer: [
    Modulation shifts the spectrum:
    $
      F{e^(i omega_0 t) f(t)}(omega) = F{f}(omega - omega_0)
      = sqrt(pi / a) e^(-(omega - omega_0)^2 / (4 a))
    $.
  ],
)

#flashcard(
  title: "Fourier Transform",
  color: green,
  question: [
    Use Re/Im to avoid two integrals. Compute $F{cos(omega_0 t) e^(-a |t|)}(omega)$ with $a > 0$.
  ],
  answer: [
    Write $cos(omega_0 t) = (1/2) (e^(i omega_0 t) + e^(-i omega_0 t))$ and reuse Q9:
    $
      F{cos(omega_0 t) e^(-a |t|)}(omega)
      = a / (a^2 + (omega - omega_0)^2) + a / (a^2 + (omega + omega_0)^2)
    $.
  ],
)

#flashcard(
  title: "Fourier Series",
  color: blue,
  question: [
    Differentiate a Fourier series. Let $f(x) = x$ on $(-pi, pi)$, $2 pi$-periodic, and let $S(x)$ be its Fourier series. Determine the Fourier series of $f'(x)$ for $x != +- pi$ by differentiating $S(x)$ term-by-term.
  ],
  answer: [
    Hint: Termwise differentiation turns $sin(n x)$ into $n cos(n x)$. Watch that $f'$ has jump or distribution issues at discontinuities.
  ],
)

#flashcard(
  title: "Fourier Theory",
  color: red,
  question: [
    Schwartzraum. Welche der folgenden Funktionen $f$ ist im Schwartzraum $S(R)$?
    (A) $f(x) = 1$.
    (B) $f(x) = 1 / (1 + x^2)$.
    (C) $f(x) = g^(x)$ (Fouriertransformierte) von $g(k) = k^(2023) e^(-k^2)$.
    (D) $f(x) = { 1 - x^2, |x| <= 1; 0, |x| > 1 }$.
  ],
  answer: [
    Richtige Antwort: (C).
  ],
)

#flashcard(
  title: "Fourier Theory",
  color: green,
  question: [
    FT von kompakt getragenen $C^oo$-Funktionen. Sei $f in C^oo(R)$ mit kompaktem Trager. Was ist die starkste allgemein richtige Aussage uber die Fouriertransformierte $hat(f)$?
    (A) $hat(f)$ ist stetig.
    (B) $hat(f)$ ist $C^oo$.
    (C) $hat(f)$ ist $C^oo$ mit kompaktem Trager.
    (D) $hat(f)$ ist die Einschrankung auf $R$ einer holomorphen Funktion auf $C$.
  ],
  answer: [
    Richtige Antwort: (D).
  ],
)

#flashcard(
  title: "Fourier Theory",
  color: red,
  question: [
    Temperierte Distribution. Welche der folgenden Abbildungen auf $S(R)$ ist eine temperierte Distribution?
    (A) $omega[phi] = phi^(0)$.
    (B) $omega[phi] = |phi(0)|$.
    (C) $omega[phi] = (phi(0))^2$.
    (D) $omega[phi] = sum_(j=0)^oo 2^j phi(j)$.
  ],
  answer: [
    Richtige Antwort: (A).
  ],
)

#flashcard(
  title: "Fourier Theory",
  color: red,
  question: [
    Distributionen in $R^3$. Sei $omega = x_1 Delta delta in S'(R^3)$. Was ist richtig?
    (A) $omega = 0$.
    (B) $omega = 2 partial_(x_1) delta$.
    (C) $omega = -2 partial_(x_1) delta$.
    (D) $omega = (partial_(x_2 x_2) + partial_(x_3 x_3)) delta$.
  ],
  answer: [
    Richtige Antwort: (C).
  ],
)

#flashcard(
  title: "Fourier Theory",
  color: blue,
  question: [
    Fourierkoeffizienten gerader Funktionen. Sei $f: R -> R$ reellwertig, gerade und $2 pi$-periodisch. Welche Aussage gilt dann nicht fur die Fourierkoeffizienten $f_n$?
    (A) Alle $f_n$ sind reell.
    (B) $f_n = 0$ fur $n$ ungerade.
    (C) $f_(-n) = bar(f_n)$.
    (D) $f_n = f_(-n)$.
  ],
  answer: [
    Richtige Antwort: (B).
  ],
)

#flashcard(
  title: "Fourier Theory",
  color: blue,
  question: [
    Fourierreihe. Sei $f: R -> R$ die $2 pi$-periodische Fortsetzung der Funktion $(1 / 2) x^2$ auf $(-pi, pi]$. Berechnen Sie die Fourierreihe von $f$.
  ],
  answer: [
    Kurzresultat: $f(x) = pi^2 / 6 + 2 sum_(n=1)^oo (-1)^n cos(n x) / n^2$.
  ],
)

#flashcard(
  title: "Fourier Theory",
  color: blue,
  question: [
    Gleichmassige Konvergenz. Sei $f$ die $2 pi$-periodische Fortsetzung von $(1 / 2) x^2$ auf $(-pi, pi]$. Konvergiert die Fourierreihe gleichmassig gegen $f$? Begrunden Sie.
  ],
  answer: [
    Kurzresultat: Ja. $f$ ist stetig und von beschrankter Variation auf $[-pi, pi]$, daher konvergiert die Fourierreihe gleichmassig.
  ],
)

#flashcard(
  title: "Fourier Theory",
  color: blue,
  question: [
    FReihensumme $sum 1 / n^2$. Sei $f$ die $2 pi$-periodische Fortsetzung von $(1 / 2) x^2$ auf $(-pi, pi]$. Berechnen Sie mittels dieser Fourierreihe $sum_(n=1)^oo 1 / n^2$.
  ],
  answer: [
    Kurzresultat: $sum_(n=1)^oo 1 / n^2 = pi^2 / 6$.
  ],
)

#flashcard(
  title: "Fourier Theory",
  color: red,
  question: [
    Flashcard 1 — Aufgabe 1a (Fouriertransformierte in $L^1$). Fur alle $f in L^1(R^n)$ gilt: (genau eine Aussage ist richtig)
    (A) $f in L^2(R^n)$.
    (B) $|f^(k)| <= |f^(0)|$ fur alle $k in R^n$.
    (C) $lim_(|x|->oo) f(x) = 0$.
    (D) $lim_(|k|->0) f^(k) = f^(0)$.
  ],
  answer: [
    Richtig ist (D): Fur $f in L^1$ ist $hat(f)$ stetig, daher $f^(k) -> f^(0)$ fur $k -> 0$.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Flashcard 2 — Aufgabe 1b (Wellengleichung, Langzeitverhalten). Sei $f in C^oo(R^3)$ mit kompaktem Trager und $u: R x R^3 -> R$ lose
    $c^(-2) partial_t^2 u - Delta u = 0$, $u(0, x) = f(x)$, $partial_t u(0, x) = 0$. Welche Aussage ist richtig? (genau eine)
    (A) $u$ hat kompakten Trager.
    (B) Falls $f(x_0) = 0$, dann ist $u(t, x) = 0$ fur alle $t > 0$ und $|x - x_0| = c t$.
    (C) $lim_(t->oo) u(t, x) = 0$ fur alle $x in R^3$.
    (D) $partial_t u(t, x) = 0$ fur alle $(t, x)$.
  ],
  answer: [
    Richtig ist (C): Fur diese Anfangsdaten gilt $u(t, x) -> 0$ fur $t -> oo$ (fur jedes feste $x$).
  ],
)

#flashcard(
  title: "Fourier Theory",
  color: blue,
  question: [
    Flashcard 3 — Aufgabe 1c (Fourierreihe mit Periode 1). Fur welche Funktion gilt
    $f(x) = sum_(n in ZZ) f_n e^(2 pi i n x)$, $f_n = integral_0^1 f(x) e^(-2 pi i n x) dx$ fur alle $x in R$? (genau eine)
    (A) $f(x) = x - floor(x)$.
    (B) $f(x) = x cos(2 pi x)$.
    (C) $f(x) = cos(pi x)$.
    (D) $f(x) = |sin(pi x)|$.
  ],
  answer: [
    Richtig ist (D): $f(x) = |sin(pi x)|$.
  ],
)

#flashcard(
  title: "Fourier Theory",
  color: red,
  question: [
    Flashcard 4 — Aufgabe 1d (Welche Abbildung ist Distribution?). Welche Abbildung $phi -> omega[phi]$ (mit $phi in S(R)$) definiert eine temperierte Distribution $omega in S'(R)$? (genau eine)
    (A) $omega[phi] = integral_(-oo)^oo phi(x) x^(-2) dx$.
    (B) $omega[phi] = sum_(m=0)^oo phi(m)$.
    (C) $omega[phi] = sum_(m=0)^oo d^m/dx^m phi(0)$.
    (D) $omega[phi] = integral_(-oo)^oo cos(x) |phi(x)| dx$.
  ],
  answer: [
    Richtig ist (B): $omega[phi] = sum_(m=0)^oo phi(m)$. Fur $phi in S$ fallt $phi(m)$ schneller als jede Potenz, die Reihe konvergiert und ist stetig bzgl. Schwartz-Seminormen.
  ],
)

#flashcard(
  title: "Fourier Theory",
  color: green,
  question: [
    Flashcard 9 — Aufgabe 2a (Fouriertransformierte von $e^(-|x|)$). Berechnen Sie $f^(k)$ fur $f(x) = e^(-|x|)$ auf $R$ mit Konvention
    $f^(k) = integral_R f(x) e^(-i k x) dx$.
  ],
  answer: [
    $f^(k) = integral_(-oo)^oo e^(-|x|) e^(-i k x) dx = 1 / (1 + i k) + 1 / (1 - i k) = 2 / (k^2 + 1)$.
  ],
)

#flashcard(
  title: "Fourier Theory",
  color: yellow,
  question: [
    Flashcard 10 — Aufgabe 2b (Poisson-Summenformel). Beweisen Sie mit der Poisson-Summenformel:
    $sum_(n=0)^oo 1 / (n^2 + 1) = (pi coth(pi) + 1) / 2$.
  ],
  answer: [
    Setze $psi := sum_(n in ZZ) e^(-2 pi |n|)$. Poisson liefert
    $psi = (1 / (2 pi)) sum_(n in ZZ) e^(-|x|)^(n) = (1 / (2 pi)) sum_(n in ZZ) 2 / (n^2 + 1)$,
    also $sum_(n in ZZ) 1 / (n^2 + 1) = pi psi$. Mit
    $sum_(n in ZZ) 1 / (n^2 + 1) = 1 + 2 sum_(n=1)^oo 1 / (n^2 + 1)$ folgt
    $sum_(n=0)^oo 1 / (n^2 + 1) = pi psi / 2 + 1 / 2$. Zudem ist
    $coth(pi) = sum_(n in ZZ) e^(-2 pi |n|) = psi$, also $sum_(n=0)^oo 1 / (n^2 + 1) = (pi coth(pi) + 1) / 2$.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Flashcard 11 — Aufgabe 3a (Separation der Variablen, Warmeleitung im Rohr). Sei $V = S_R x [0, l]$ mit $S_R = R / (2 pi R ZZ)$ (Periodizitat in $x$). Fur $T_1 = T_2 = 0$:
    $partial_t u = d Delta u$, $u(t, x, 0) = 0$, $u(t, x, l) = 0$, $u(t, x + 2 pi R, y) = u(t, x, y)$.
    Bestimmen Sie alle Losungen der Form $u(t, x, y) = f(t) g(x) h(y)$.
  ],
  answer: [
    Eigenfunktionen:
    $g(x) = B_n cos(n x / R) + C_n sin(n x / R)$, $n in NN$,
    $h(y) = sin(pi m y / l)$, $m in NN$,
    $f(t) = exp(-d (n^2 / R^2 + pi^2 m^2 / l^2) t)$.
    Also (bis auf Konstanten):
    $u(t, x, y) = (B_n cos(n x / R) + C_n sin(n x / R)) sin(pi m y / l) e^(-d (n^2 / R^2 + pi^2 m^2 / l^2) t)$.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Flashcard 12 — Aufgabe 3b (Stationare Losung und Reduktion). Fur allgemeine $T_1, T_2 >= 0$:
    $partial_t u = d Delta u$, $u(t, x, 0) = T_1$, $u(t, x, l) = T_2$, $u(t, x + 2 pi R, y) = u(t, x, y)$.
    Finden Sie eine zeitunabhangige Losung $u_0(x, y)$. Wie reduziert man damit auf den Fall $T_1 = T_2 = 0$?
  ],
  answer: [
    Eine stationare Losung ist linear in $y$:
    $v(x, y) = (T_2 - T_1) y / l + T_1$ (erfullt $Delta v = 0$ und die Randwerte).
    Dann setzt man $w(t, x, y) := u(t, x, y) - v(x, y)$.
    $w$ erfullt $partial_t w = d Delta w$ mit homogenen Randbedingungen $w(t, x, 0) = w(t, x, l) = 0$.
  ],
)

#flashcard(
  title: "PDEs",
  color: yellow,
  question: [
    Flashcard 13 — Aufgabe 3c (Explizite Losung mit Anfangswert). Sei $T_1 = T_2 = T$. Bestimmen Sie die Losung mit Anfangsbedingung
    $u(0, x, y) = T + 2 cos(4 x / R) sin(pi y / l)$,
    Periodizitat $u(t, x + 2 pi R, y) = u(t, x, y)$.
  ],
  answer: [
    Da nur der Modus $(n, m) = (4, 1)$ vorkommt, ist
    $u(t, x, y) = T + 2 cos(4 x / R) sin(pi y / l) exp(-d (16 / R^2 + pi^2 / l^2) t)$.
  ],
)

#render-flashcards()
