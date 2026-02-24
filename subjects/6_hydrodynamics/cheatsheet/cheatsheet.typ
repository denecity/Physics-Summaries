#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Hydrodynamics",
  author: "Denis Titov",
  language: "ENG",
)

Focus on what you are learning.

= Elastic Media

#section[Finite Chain Example][
  Let a chain of masses and springs be given. Let their equilibrium positions be $x = i s$ for $i in NN$ and $l = N s$. Let their displacements from equilibrium be $au_i = (u_(parallel i), au_(perp i))$.

  $
    T = m/2 sum_i dot(u)_i\
    V = sum_(mu  = x,y,z) sum_i K_mu/2 (u_(mu i+1) - u_(mu i))^2\
    L = T - V\ 
    => pdv(L, x) - dv(, t) pdv(L, dot(x)) = 0 = K_mu (u_(mu i+1) - 2 u_(mu i) + u_(mu i-1)) - m ddot(u)_(mu i)
  $

  To describe the system in the continuum limit, we rewrite:
  $
    1/s^2 (u_(mu i+1) - 2 u_(mu i) + u_(mu i-1)) - m/s 1/(s K_mu) ddot(u)_(mu i) = 0\
  $

  And consider $s -> 0$ with fixed $l$. Then $au_i = au(x)$. we arrive at:
  $
    pdv(u_mu(x), x, 2) - rho/tilde(K)_mu pdv(u_mu(x), t, 2) = 0 hspace u_mu(0) = u_mu(l) = 0
  $

  Further calculation yields a new form of the Euler-Lagrange equations:
  $
    pdv(cal(L), au) - dv(, t) pdv(cal(L), (partial_x au)) - dv(, t) pdv(cal(L), (partial_t au)) = 0
  $

  Separation ansatz: $au(x, t) = aA(x) B(t)$.

  $
    => partial^2_x A_mu + k^2 A_mu = 0 hspace partial_t^2 B + omega^2 B = 0 hspace omega = c_mu k\
    => aA(x) = aA_n sin k_n x hspace B(t) = B_(1 n) cos omega_(n mu) t + B_(2 n) sin omega_(n mu) \
    k_n = pi n/l hspace omega_(n mu) = c_mu k_n
  $

  But separation ansatz is not the most general solution. Prof didnt like that.

  We can also propose a more general ansatz using the Fourier transform, because the system is linear:

  $
    m/s^2 ddot(U) - bb(T) M = 0 hspace bb(T) = mat(-2, 1, 0, 0, ...; 1, -2, 1, 0, ...; 0, 1, -2, 1, ...; 0, 0, 1, -2, ...; ..., ..., ..., ..., ...)
  $
]
