#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Group Theory Cheatsheet",
  author: "Denis Titov",
  language: "ENG",
)

= Fourier Transform

#section[Basics][
  $
    hat(f) (ak) = integral_(RR^d) f(ax) exp(-i ak dot ax) dx hspace f(ax) = 1/(2 pi)^d integral_(RR^d) hat(f) (ak) exp(i ak dot ax) dd(k)
  $
]

#section[Flowchart][
  - *If $f$ seperable?*:
    - Try factorization shortcut: $f(ax) = f_1(x_1) f_2(x_2) ... f_d (x_d)$, then $hat(f) (ak) = hat(f)_1 (k_1) hat(f)_2 (k_2) ... hat(f)_d (k_d)$

  - *If $f$ radial?*:
    - $f(ax) = g(abs(x))$

  - *If $f$ real-valued?*:
    - $hat(f) (-k) = overline(hat(f) (k))$, compute only for $k >= 0$
  
  - *If $f$ even*:
    - $hat(f)$ is even, $hat(f) (-k) = hat(f) (k)$, compute only for $k >= 0$
    - If $f$ also real-valued, then $hat(f)$ is real-valued and even as well:
      $
        hat(f) (k) = 2 integral_0^(oo) f(x) cos(k x) dx
      $
  
  - *If $f$ odd*:
    - $hat(f)$ is odd, $hat(f) (-k) = -hat(f) (k)$, compute only for $k >= 0$
    - If $f$ also real-valued, then $hat(f)$ is purely imaginary and odd as well:
      $
        hat(f) (k) = -2 i integral_0^(oo) f(x) sin(k x) dx
      $

  - *If $f in L^1(RR^d)$*:
    - $hat(f)$ bounded and continuous, $hat(f) (k) -> 0$ as $abs(k) -> oo$ (Riemann-Lebesgue lemma)

  - *If $f in L^2(RR^d)$*:
    - $hat(f) in L^2(RR^d)$, Plancherel's theorem: $norm(f)_2 = (2 pi)^(-d/2) norm(hat(f))_2$ with

      $
        norm(f)_2 = sqrt(integral_(RR^d) abs(f(ax))^2 dx) hspace norm(hat(f))_2 = sqrt(integral_(RR^d) abs(hat(f) (k))^2 dd(k))
      $
    - You can estimate energy in different frequency bands by integrating $abs(hat(f) (k))^2$ over those bands, which is useful for analyzing signal properties and filtering applications.

  - *If $f in cal(S) (RR^d)$*:
    - $hat(f) in cal(S (RR^d))$. Everything is smooth and decays faster than any polynomial, so you can use differentiation and integration properties to compute $hat(f)$ for complicated functions by relating them to simpler ones (e.g., $hat(f') (k) = i k hat(f) (k)$, $hat(x f) (k) = i partial_k hat(f) (k)$).

  - *If $f$ is a distribution*:
    - You can extend the Fourier transform to distributions by defining $hat(T) (phi) = T (hat(phi))$ for test functions $phi$, which allows you to analyze generalized functions like the Dirac delta and its derivatives in the frequency domain (e.g., $hat(delta) (k) = 1$, $hat(delta') (k) = i k$).
    - You can solve differential equations in the distributional sense by taking Fourier transforms, which turns differentiation into multiplication by $i k$, making it easier to find solutions that may not be classical functions but still make sense as distributions (e.g., solving $f'' + f = delta$ leads to $hat(f) (k) = 1/(1 - k^2)$, which corresponds to a distributional solution).

]

#section[Identities][
  - *Shift in $x$*:
    $
      f(x - a) hspace => hspace hat(f) (k) e^(-i k dot a)
    $
  - *Modulation*:
    $
      e^(i a dot ax) f(ax) hspace => hspace hat(f) (k - a)
    $
  - *Scaling*:
    $
      f(a x) hspace => hspace 1/abs(a)^d hat(f) (k/a)
    $
  - *Differentiation*:
    $
      partial^alpha_x_j f(ax) hsmall => (i k_j)^alpha hat(f) (ak), hspace x_j f(ax)) hsmall => i partial_k_j hat(f) (ak)
    $
]

#section[Radial Functions][
  Let $f(ax) = g(abs(x))$ be a radial function in $RR^d$. Then its Fourier transform is also radial and can be expressed in terms of the Hankel transform:

  $
    hat(f) (k) = integral_0^(oo) g(r) r^(d-1) (integral_S^(d-1) exp(-i abs(k) r cos theta) dd(Omega)) dd(r)
  $
]

#section[Frequent Functions][
  - *Poly + Gaussian*:
    - Use differentiation properties to express Fourier transform in terms of derivatives of the Gaussian transform, which is well-known and can be computed explicitly.
  - *Compact Support*:
    - Use integration by parts to relate Fourier transform to boundary values of the function and its derivatives, which can simplify calculations for piecewise-defined functions or those with jump discontinuities.
  - *Characteristic Functions*:
    - For indicator functions of intervals or rectangles, compute Fourier transform by integrating over the support, which often leads to sinc functions or products of sinc functions in higher dimensions.
]

= Fourier Series

#section[Basics][
  $
    f(x) = sum_(n=-oo)^(oo) c_n exp((2 pi i n)/L x) hspace c_n = 1/(2 L) integral_(-L)^(L) f(x) exp((2 pi i n)/L x) dx\
    f(x) = a_0/2 + sum_(n=1)^(oo) (a_n cos((2 pi n)/L x) + b_n sin((2 pi n)/L x)\
    a_n = 1/L integral_(-L)^(L) f(x) cos((2 pi n)/L x) dx hspace b_n = 1/L integral_(-L)^(L) f(x) sin((2 pi n)/L x) dx
  $
]

#section[Real vs Complex form][
  - *Use Real Form when*:
    - f(x) has even or odd symmetry.

  - *Use Complex Form when*:
    - f(x) is not easily expressed in terms of sines and cosines.
    - You want to leverage properties of complex exponentials (e.g., Euler's formula).
    - Problem involves convolution, frequency shift or multiplication in the frequency domain, where complex form can simplify calculations.
    - You need to prove properties of coefficients
]

#section[Flowchart: Expansion Framework][
  - *Is function on symmetric interval?*
    - *Yes*: Use Fourier Series with cosine/sine basis.
    - *No*: Do half-range expansion.
  - *Do you see shifts, modulation, derivatives?*
    - *Yes*: Use complex form for easier handling of phase shifts.
  - *If $f$ real-valued?*:
    - In complex form: $c_(-n) = overline(c_n)$, compute only for $n >= 0$
    - In real form: $a_n, b_n in RR$
  - *If function complex-valued?*:
    - Dont assume symmetry, use whichever form is more convenient for the problem
    - If you can split into $f = u + i v$, compute Fourier series for $u$ and $v$ separately using real form, then combine into complex form if needed.
  - *If function is even?*:
    - $f(-x ) = f(x)$, for real form: $b_n = 0$, only cosine terms.
  - *If function is odd?*:
    - $f(-x) = -f(x)$, for real form: $a_n = 0$, only sine terms.
  - *If function has no symmetry?*:
    - You can try $f_e = (f(x) + f(-x))/2$ and $f_o = (f(x) - f(-x))/2$ to extract even and odd parts, then compute Fourier series for each part separately (helpful if $f$ is piecewise defined with different behavior on positive and negative sides).
]

#section[Multidimensional Fourier Series][
  $
    f(ax): A = [-L_i, L_i]^d subset RR^d -> RR hspace abs(A) = product_(i=1)^d 2 L_i hspace ak in ZZ^d\
    f(ax) = sum_(ak in ZZ^d) c_ak exp((2 pi i)/L ak dot ax) hspace c_ak = 1/abs(A) integral_A f(ax) exp(-(2 pi i)/L ak dot ax) dd(ax)
  $
]


= Ordinary Differential Equations

#section[ODEs][
  - *Ordinary Differential Equations (ODEs)*: $f' (t) = p(t) f(t) + q(t)$
    - Use integration factor method: $mu(t) = e^(integral p(t) dt)$
  
  - *Second-Order Linear ODEs*: $f'' (t) + p(t) f' (t) + q(t) f(t) = g(t)$
    - Solve homogeneous part: $f'' + p f' + q f = 0$ to find complementary solution $f_c$
    - Use variation of parameters or undetermined coefficients to find particular solution $f_p$
    - General solution: $f = f_c + f_p$
  
  - *Sturm-Liouville Problems*: with separation of variables, leading to eigenvalue problems for spatial part and ODEs for temporal part, often solved using Fourier series expansions in terms of eigenfunctions.
    - *Dirichlet Boundary Conditions*: $f(0) = f(L) = 0$, eigenfunctions are sine functions.
    - *Neumann Boundary Conditions*: $f'(0) = f'(L) = 0$, eigenfunctions are cosine functions.
]

= Partial Differential Equations

#section[PDEs][
  - *Heat Equation (parabolic)*: $u_t = alpha u_(x x)$
    - Use separation of variables: $u(x,t) = X(x) T(t)$, leading to $X'' + lambda X = 0$ and $T' + alpha lambda T = 0$
    - Solve spatial part with appropriate boundary conditions to find eigenfunctions and eigenvalues, then solve temporal part to get time dependence.
    - On bounded domains, solutions can be expressed as Fourier series in terms of eigenfunctions; on unbounded domains, use Fourier transform to solve for $u(x,t)$ in terms of initial conditions.
  
  - *Wave Equation (hyperbolic)*: $u_(t t) = c^2 u_(x x)$
    - Similar separation of variables approach, leading to $X'' + lambda X = 0$ and $T'' + c^2 lambda T = 0$
    - Solutions involve sines and cosines in space and oscillatory functions in time, with general solution expressed as a superposition of modes determined by initial conditions.
  
  - *Laplace/Poisson Equation (elliptic)*: $u_(x x) + u_(y y) = 0$
    - Laplace equation + boundary conditions (Dirichlet, Neumann, or mixed) leads to harmonic functions, greens functions, poisson kernels.
    - Fundamental sources and delta sources can be used to construct solutions via convolution with the appropriate Green's function, which can often be computed using Fourier transform techniques.
      $
        u(ax) = integral_(RR^d) G(ax - ay) f(ay) dd(ay)
      $
  - *Transport Equation*: $u_t + v dot grad u = 0$
    - Use method of characteristics: along characteristic curves defined by $dx/dt = v$, the solution is constant, so $u(x,t) = u(x - v t, 0)$, which can be expressed in terms of initial conditions.
]

#section[PDE Flowchart][
  - *Identify the PDE family (by highest derivatives)*:
    - *Parabolic (diffusion)*: one time derivative + two space derivatives
      - Examples: $u_t = kappa u_(x x)$, $u_t = Delta u$
    - *Hyperbolic (waves/transport)*
      - Examples: $u_(t t) = c^2 u_(x x)$, $u_t + c u_x = 0$
    - *Elliptic (static potential)*
      - Examples: $Delta u = 0$, $(Delta - a^2) u = f$
  - *Pick the matching branch*:
    - *A) First-order hyperbolic (transport) -> characteristics*:
      - If PDE looks like $u_t + a(x, t) u_x = b(x, t, u)$ (or $u_x + u_y = 0$):
        - Characteristic ODEs: $dx/dt = a(x, t)$, $dv(u, t) = b( dot )$
        - Find invariants (e.g. $x - c t$ if $a = c$ constant)
        - Use initial/boundary data to determine $F("invariant")$
      - Output pattern: $u_t + c u_x = 0 => u(x, t) = F(x - c t)$
      - Quick check: $u_t = -c F'$, $u_x = F'$ so $u_t + c u_x = 0$
    - *Heat/diffusion (parabolic) -> series/transform in space*:
      - *B1) Bounded domain (e.g. $x in (0, L)$) -> separation + eigenfunctions*:
        - Choose basis by BCs:
          - Dirichlet $u(0, t) = u(L, t) = 0$ -> $sin(n pi x / L)$
          - Neumann $u_x(0, t) = u_x(L, t) = 0$ -> $cos(n pi x / L)$
          - Periodic -> $e^(i n x)$
        - Expand: $u(x, t) = sum_n a_n(t) X_n(x)$
        - Mode ODE (heat): $a_n'(t) = -kappa lambda_n a_n(t)$
          - $a_n(t) = a_n(0) e^(-kappa lambda_n t)$, $lambda_n = (n pi / L)^2$
        - Match $u(x, 0) = f(x)$ by Fourier coefficients
        - Output pattern (Dirichlet):
          $
            u(x, t) = sum_(n>=1) b_n e^(-kappa (n pi / L)^2 t) sin(n pi x / L)
          $
        - Checks: BCs satisfied termwise; as $t -> oo$, solution decays to 0 (Dirichlet) or to mean (Neumann)
      - *B2) Whole space ($RR^d$) -> Fourier transform in space*:
        - $hat(u)(k, t) = F_x{u}$, and $F{Delta u} = -|k|^2 hat(u)$
        - Heat ODE: $partial_t hat(u) = -kappa |k|^2 hat(u)$
        - $hat(u)(k, t) = hat(f)(k) e^(-kappa |k|^2 t)$, then invert
        - Output pattern: $u( dot , t) = G_t * f$, with
          $
            G_t(x) = 1/(4 pi kappa t)^(d/2) exp(-|x|^2 / (4 kappa t))
          $
        - Checks: $hat(u)(k, 0) = hat(f)(k)$; smoothing for $t > 0$
      - *B3) Mixed domain (one bounded, one unbounded)*:
        - Use series in bounded variable + FT in unbounded variable
        - Solve ODE in $t$ for each $(n, k)$, then invert/sum
    - *Wave equation (hyperbolic, 2nd order in time)*:
      - *C1) Bounded interval -> separation + eigenfunctions*:
        - Same spatial eigenfunctions as heat, but time ODE differs:
          - $a_n''(t) + c^2 lambda_n a_n(t) = 0$
          - $a_n(t) = A_n cos(c sqrt(lambda_n) t) + B_n sin(c sqrt(lambda_n) t)$
        - Determine $A_n, B_n$ from $u(x, 0)$ and $u_t(x, 0)$
        - Checks: energy conserved (no damping/forcing), oscillatory time dependence
      - *C2) Whole space $RR^d$ -> FT in space*:
        - $hat(u)_(t t) + c^2 |k|^2 hat(u) = 0$, solve per $k$, then invert
    - *Elliptic (Laplace/Poisson/Helmholtz)*:
      - *D1) Bounded domain + boundary data*:
        - Rectangle/interval: separation + sine/cos series
        - Disk/ball: Fourier series in angle / spherical harmonics in 3D
      - *D2) Whole space with forcing/delta*:
        - Example: $(Delta - a^2) u = f$ or $Delta u = delta$
        - FT: $Delta hat(u) = -|k|^2 hat(u)$
        - Solve algebraically: $(|k|^2 + a^2) hat(u) = -hat(f)$
          - $hat(u) = -hat(f) / (|k|^2 + a^2)$, then invert
        - If $f = delta$, then $hat(f) = 1$ -> fundamental solution
  - *Final reconstruction checklist*:
    - Basis matches BCs (sine/cos/exp)
    - Mode ODE correct: heat $a_n' = -lambda a_n$, wave $a_n'' + lambda a_n = 0$
    - Initial conditions fix coefficients uniquely
    - Sanity limits: heat $t -> oo$ smooth + decays; wave oscillates; transport is shifted along characteristics
]

#section[General PDE Flowchart for IVPs/BVPs][
  - *Step 0: Write down the problem data cleanly*:
    - PDE (operator + forcing): $L[u] = F(x, t)$
    - Domain: $x in (0, L)$ vs $x in RR^d$ vs mixed
    - Boundary conditions: Dirichlet / Neumann / periodic / mixed
    - Initial conditions at $t = 0$: $u(x, 0) = f(x)$, maybe $u_t(x, 0) = g(x)$
    - If anything is missing, expect:
      - elliptic -> boundary data only
      - parabolic -> 1 initial condition
      - hyperbolic (2nd order in $t$) -> 2 initial conditions
  - *Step 1: Classify PDE type and choose the main weapon*:
    - *A) Transport / first-order hyperbolic*:
      - $u_t + c u_x = F$ (or $a u_x + b u_y = F$)
      - -> characteristics (reduce PDE to ODE along curves)
    - *B) Heat / diffusion (parabolic)*:
      - $u_t - kappa Delta u = F$
      - -> eigenfunction expansion (bounded) or Fourier transform (whole space)
    - *C) Wave (hyperbolic, 2nd order in time)*:
      - $u_(t t) - c^2 Delta u = F$
      - -> eigenfunction expansion (bounded) or Fourier transform (whole space)
    - *D) Elliptic (Laplace/Poisson/Helmholtz)*:
      - $-Delta u + a^2 u = f$ or $Delta u = f$
      - -> eigenfunction expansion / Green's function / Fourier transform by domain
  - *Step 2: Remove nonhomogeneous BCs (if present)*:
    - If BCs are not homogeneous (e.g. $u(0, t) = A$, $u(L, t) = B$):
      - Find a boundary-fitting $w(x, t)$ that satisfies the BCs
      - Set $u = v + w$, then $v$ has homogeneous BCs
    - Common exam trick
  - *Step 3: Choose spatial basis from BCs (bounded domains)*:
    - On $(0, L)$ for second derivatives in $x$:
      - Dirichlet $v(0, t) = v(L, t) = 0$ -> $X_n = sin(n pi x / L)$
      - Neumann $v_x(0, t) = v_x(L, t) = 0$ -> $X_n = cos(n pi x / L)$
      - Periodic -> $e^(i n pi x / L)$ (or $e^(i n x)$ for $2 pi$-periodic)
    - In 2D rectangles use product bases (e.g. $sin(n pi x / L) sin(m pi y / M)$)
  - *Step 4: Expand solution and forcing in that basis*:
    - $v(x, t) = sum_n a_n(t) X_n(x)$
    - If forcing: $F(x, t) = sum_n F_n(t) X_n(x)$ with
      $F_n(t) = <F( dot , t), X_n> / ||X_n||^2$
    - Orthogonality -> decoupled ODEs for each $a_n(t)$
  - *Step 5: Solve the mode ODEs*:
    - *Heat-type*: $u_t = kappa u_(x x) + F$
      - $a_n'(t) + kappa lambda_n a_n(t) = F_n(t)$
      - Integrating factor:
        $
          a_n(t) = e^(-kappa lambda_n t) (a_n(0) + integral_0^t e^(kappa lambda_n s) F_n(s) ds)
        $
    - *Wave-type*: $u_(t t) = c^2 u_(x x) + F$
      - $a_n''(t) + c^2 lambda_n a_n(t) = F_n(t)$
      - Homogeneous: $cos(omega_n t)$, $sin(omega_n t)$ with $omega_n = c sqrt(lambda_n)$
      - Particular (variation of parameters / time convolution):
        $
          a_n(t) = A_n cos(omega_n t) + B_n sin(omega_n t) + integral_0^t sin(omega_n (t - s)) / omega_n * F_n(s) ds
        $
    - *Transport*: $u_t + c u_x = F$
      - Along $x - c t = xi$: $d/dt u(x(t), t) = F(x(t), t)$
  - *Step 6: Apply initial conditions*:
    - Heat: $a_n(0) = <f, X_n> / ||X_n||^2$
    - Wave: $a_n(0) = <f, X_n> / ||X_n||^2$, $a_n'(0) = <g, X_n> / ||X_n||^2$
  - *Step 7: Reconstruct and sanity-check*:
    - Sum back: $v = sum_n a_n(t) X_n(x)$, then $u = v + w$ if shifted
    - Check BCs termwise and ICs at $t = 0$
    - Qualitative behavior:
      - heat: decay/smoothing for $t > 0$
      - wave: oscillatory, energy-like conservation when $F = 0$
      - transport: propagation at speed $c$
  - *Whole-space version (Fourier transform instead of series)*:
    - If domain is $RR^d$:
      - Fourier transform in space: $u -> hat(u)(k, t)$
      - PDE -> ODE in $t$ for each $k$
      - Solve with ICs and invert transform
    - With forcing $F$, the solution has a Duhamel integral in time (in $k$-space)
]

#section[Techniques][
  - *Separation of Variables*: Assume solution can be written as product of functions, each depending on a single variable, leading to ODEs for each function.
]
