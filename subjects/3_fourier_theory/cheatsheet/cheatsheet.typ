#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Fourier Analysis Cheatsheet",
  author: "Denis Titov",
  language: "ENG",
)

= Boundary Conditions

#section("Dirichlet Boundary Conditions")[
  1. *Dirichlet*:

  $
    laplace u = f in Omega hspace u = g in partial Omega\
  $

  When actual soution is given on the boundary. 
  
  Often boundary solution is Zero: then solve with sine series.
]

#section("Neumann Boundary Conditions")[
  2. *Neumann*:

  $
    laplace u = f in Omega hspace pdv(u, n) = h in partial Omega\
  $

  When flux (normal derivative) is given on the boundary. In sphericals notation with $hat(r)$ is used, in cartesian $hat(n)$.
]

= PDEs

#section("Heat Equation (Parabolic)")[
  $
    partial_t u = d laplace u\
  $

  Fourier Transform solution:

  $
    u(x, t) = (u_0 * G_t)(x) hspace G_t(x) = (4 pi alpha t)^(-n/2) exp(-abs(x)^2/(4 alpha t))\
  $
]

#section("Wave Equation (Hyperbolic)")[
  $
    pdv(u, t, 2) = c^2 laplace u\
  $

  Fourier Transform solution:

  $
    u(x, t) = (u_0 * K_t)(x) + (v_0 * L_t)(x)\
  $

  where $K_t, L_t$ are given by their Fourier transforms:

  $
    hat(K_t)(k) = cos(c |k| t) hspace hat(L_t)(k) = sin(c abs(k) t)/(c abs(k))\
  $
]

#section("Laplace Equation  (Elliptic)")[
  $
    laplace u = 0\
  $

  Fourier Transform solution:

  $
    hat(u)_k = A_k exp(abs(k) y) + B_k exp(-abs(k) y) = A_k cosh(abs(k) y) + B_k sinh(abs(k) y)\
  $

  where $A_k, B_k$ are determined from boundary conditions.
]

#section("Poisson Equation (Elliptic)")[
  $
    laplace u = f\
  $

  Fourier Transform solution:

  $
    hat(u)(k) = hat(f)(k)/(-|k|^2) hspace "for" k != 0\
  $
]