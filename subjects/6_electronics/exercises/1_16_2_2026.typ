#import "../../../lib/setup_exercise.typ": exercise-setup
#import "../../../lib/lib.typ": *

#show: exercise-setup(
  name: "Denis Titov",
  course: "Geophysics II",
  ta: "Dr. Stefano Maffei",
  date: "16.02.2026",
  series: "1",
  language: "ENG",
)

+ Assume that the Earths magnetic field is a dipole aligned with the north-south axis. If the angle of inclination is $76 deg$, where are you?

  $
    tan I = 2 cot theta\
    => theta = cot^(-1) (tan I/2) = cot^(-1) (tan 76/2) = 52 deg\
  $

  $90 deg = lambda + theta$. This gives us a latitude of $38 deg$ N.

+ Show that for an axial dipole, for small displacements in latitude at $45 deg$ N the change in inclination is exactly 4/5 the change in latitude.

  $
    tan I = 2 cot theta\
    dv(I, theta) = dv(, theta) tan^(-1) (2 cot theta) = 1/(1 + (2 cot theta)^2) dv((2 cot theta), theta) = - (2 csc^2 theta)/(1 + 4 cot^2 theta)
    \
    evaluated(dv(I, theta))_(45 deg) = evaluated( - (2 csc^2 theta)/(1 + 4 cot^2 theta))_(45 deg) = (2 dot 2)/(1 + 4 dot 1) = - 4/5
  $

  Convert to latitude ($dd(lambda) = - dd(theta)$)

  $
    dv(I, lambda) = dv(I, theta) dv(theta, lambda) = - 4/5 dv(theta, lambda) = 4/5 hspace "with" dv(theta, lambda) = -1
  $

+ The IGRF gives the value $g^0_1 = −29557 "nT"$. What are the maximum and minimum values of the radial field that will be observed at the Earths surface. Give the same values for the horizontal field.

  (International Geomagnetic Reference Field)

  $
    W &= R sum_(n=1)^N sum_(m=0)^n (R/r)^(n+1) (g_n^m cos m phi + h_n^m sin m phi) P_n^m (cos theta) hspace n = 1, m=0\
    &= R (R/r)^2 g_1^0 P_1^0 (cos theta) hspace "since" g_1^0 "is the only non-zero coefficient"\
    &= R^3/r^2 g_1^0 cos theta\
  $

  Given that $g_1^0$ is the only nonzero coefficient, we assume $m=0$ thus $cos m phi = 1$. Assuming we are at the Earths surface: $R = r$, and maximum value of $B_r$ is at the poles where $cos theta = 1$ and minimum value is at the equator where $cos theta = 0$:

  $
    W = R g_1^0 cos theta = -29557 "nT" cos theta\
  $
  
  Now we calculate the gradient of the potential to get the field:

  $
    B_theta = -1/r dv(W, theta) = g_1^0 sin theta hspace B_phi = -1/(r sin theta) dv(W, phi) hspace B_H = sqrt(B_phi^2 + B_theta^2)\
    B_phi = 0 hspace "since" W "does not depend on" phi\
    B_theta = -1/r dv(W, theta) = g_1^0 sin theta\
    => B_H (r = R)= abs(g_1^0) sin theta\
    => max(B_H) = abs(g_1^0) hspace "at" theta = 90 deg "or" lambda = 0 deg ("at the equator")\
    => min(B_H) = 0 hspace "at" theta = 0 deg "or" lambda = 90 deg ("at the poles")
  $