#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Quantum Electronics",
  author: "Denis Titov",
  language: "ENG",
)

= Maxwells Equations 

#section[Maxwells in Vacuum][
  $
    div aE = 0\
    div aB = 0\
    curl aE = - partial_t aB\
    curl aB = mu_0 epsilon_0 partial_t aE + mu_0 aJ\
    c = 1/sqrt(mu_0 epsilon_0)\
    "continuity equation" div aj + partial_t rho = 0\
  $
]

#section[Microscopic Maxwells in Medium][
  - *Maxwells in Medium*: 
    $
      div aE = rho/epsilon_0\
      div aB = 0\
      curl aE = - partial_t aB\
      curl aB = mu_0 aj + mu_0 epsilon_0 partial_t aE\
    $

  - *Problems and Scales*:
    #image("/assets/image-13.png")

    But most of the time our wavelengths are much larger than the atomic scale, so we can use the macroscopic Maxwell equations ($5 angstrom$ vs $5000 angstrom$) after all...


  - *Separation of Contributions*:
    We differentiate between free and bound charges and currents. This eliminates the exlicit dependence of bound charges and bound currents.

    $
      rho = rho_f + rho_b\
      aj = aj_f + aj_b\
      => aD = epsilon_0 aE + aP hspace "Electric Flux Density / Displacement Field"\
      => rho_b = - div aP hspace "Polarization Density"\
      => div aD = epsilon_0 div aE + div aP = rho_f\

      => aH = 1/mu_0 aB - aM hspace "Magnetic Field Vector"\
      => curl aM = aj_b - pdv(aP, t) hspace "Magnetization Density"\
      => curl aH = aj_f + epsilon_0 pdv(aD, t)\
    $
]

#section[Macroscopic Maxwells][
  - *Macroscopic Quantities*:

    #image("/assets/image-14.png", width: 40%)

    $
      q_R = integral rho(ar') dd(ar') hspace "Total Charge"\
      ap_R= integral (ar' - aR) rho(ar') dd(ar') hspace "Electric Dipole Moment"\
      ai_R = integral aj(ar') dd(ar') hspace "Total Current"\
      am_R = 1/2 integral (ar' - aR) cross aj(ar') dd(ar') hspace "Magnetic Dipole Moment"\
    $

  - *Approximations*:
    $
      rho_f = q_R/V hspace aP = ap_R/V hspace aj_f = ai_R/V hspace aM = am_R/V\
    $

  - *Maxroscopic Maxwells Equations*:
    $
      rho_b = - div aP hspace curl aM = aj_b - pdv(aP, t)\
      aD = epsilon_0 aE + aP hspace aH = 1/mu_0 aB - aM\
      div aD = rho_f hspace div aB = 0\
      curl aE = - partial_t aB hspace curl aH = aj_f + epsilon_0 partial_t aD\
    $

  - *Approximations and Assumptions*:
    - *$aP(aE), aM(aB)$*: Good for most cases, violation requires magnetoelectric coupling, easy to repair.

    - *$aP, aM$ are local*: This is the *local approximation*, which is good for most cases, but can be violated in some cases (e.g. spatial dispersion). Equivalent to long wavelength approximation.

    - *$aP, aM$ do not depend on absolute location (homogeneity)*: This is the *homogeneity approximation*, which is good for most cases, but can be violated in some cases (e.g. spatial dispersion).

    - *$aP, aM$ depends on immediate values of $aE, aB$ (no memory)*: This is the *instantaneous approximation*, which is good for most cases, but can be violated in some cases (e.g. temporal dispersion). Equivalent to low frequency approximation. Means *No Dispersion*. Often terrible assumption, but can be repaired by introducing a frequency dependence.

    - *$aP, aM$ are linear in $aE, aB$*: This is the *linearity approximation*, which is good for most cases, but can be violated in some cases (e.g. nonlinear optics). Equivalent to low intensity approximation. Means *No Nonlinearity*. Often terrible assumption, but can be repaired by introducing a nonlinearity. Also means the only polarization is the electric dipole polarization, and the only magnetization is the magnetic dipole magnetization, with no external field the material is non-polarized and non-magnetized.

    - *$aP, aM$ are parallel to $aE, aB$*: This is the *isotropy approximation*, which is good for most cases, but can be violated in some cases (e.g. anisotropic materials). Equivalent to isotropic approximation. Means *No Anisotropy*. Often terrible assumption, but can be repaired by introducing an anisotropy.

  - *Susceptibility*:
    $
      P(ar, t) = epsilon_0 chi E(ar, t) hspace M(ar, t) = chi_M H(ar, t)\

      epsilon = 1 + chi hspace "Dielectric Constant"\
      mu = 1 + chi_M hspace "Relative Permeability"\
      => aD = epsilon_0 epsilon aE hspace aB = mu_0 mu aH\
    $
]

#section[Wave Equation][
  - *Wave Equation*:
    $
      curl (curl aE) = - partial_t (curl aB) = - mu mu_0  partial_t (curl aH) = - mu mu_0 pdv(aD, t, 2)\
      = grad (div aE) - laplacian aE\
      => laplacian aE - mu mu_0 epsilon epsilon_0 pdv(aE, t, 2) = 0\
      => laplacian aE - 1/nu^2 pdv(aE, t, 2) = 0\
      "with" nu = 1/sqrt(mu mu_0 epsilon epsilon_0) "refraction index" n = c/nu = sqrt(mu epsilon)\
      curl(curl aB)) = mu mu_0 epsilon epsilon_0 pdv(aB, t, 2)\
      => laplacian aB - 1/nu^2 pdv(aB, t, 2) = 0\
    $

  - *Reflactive Index*:
    In absence of absorbtion, $n$ is real and positive. In presence of absorption, $n$ is complex with positive real part and negative imaginary part. In semiconductors, $n$ can be purely imaginary, which means the wave is evanescent and does not propagate.

  - *Plane Waves*:
    $
      aE(ar, t) = aE_0 cos(omega t - ak dot ar + phi) hspace aD = epsilon_0 epsilon aE\
      aE perp ak\
      "with" curl aE = - partial_t aB => aH_0 = sqrt((epsilon_0 epsilon)/(mu_0 mu)) hat(k) cross aE_0 = 1/Z hat(k) cross aE_0\
    $

    $Z$ is optical impedance. In vacuum: $Z_0 = sqrt(mu_0/e0) = 337 Omega$.

  $
    omega = 2 pi nu hspace T = 1/nu hspace nu_p = c/n hspace k_n = omega/nu_p = k n hspace k_n = (2 pi)/lambda_n = k n hspace lambda_n = lambda/n\
  $
]

#section[Polarization][
  - *Polarization*:
    $
      aE(ar, t) = aE_0 hat(x) cos(omega t - ak dot ar + phi) hspace "Linear Polarization"\
    $

    #image("/assets/image-15.png")

    $
      aE(ar, t) = aE_0 hat(x) cos(omega t - ak dot ar) + aE_0 hat(y) sin(omega t - ak dot ar) hspace "Circular Polarization"\

      aE(ar, t) = aE_0 hat(x) cos(omega t - ak dot ar) + aE_0 hat(y) sin(omega t - ak dot ar + phi) hspace "Elliptical"\
    $

    Diagonal polarization is a special case of elliptical polarization with no relative phase shift. For circular polarization, the electric field vector rotates in a circle, and for linear polarization $phi = pi/2, 3pi/2$

  
]   
