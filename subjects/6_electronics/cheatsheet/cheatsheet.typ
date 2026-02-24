#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Geophysics II Cheatsheet",
  author: "Denis Titov",
  language: "ENG",
)

= Geomagnetism

#section[Magnetic Coordinates and Declination][
  Z Down, X True North, Y East, F Strength, I Inclination, D Declination

  #image("/assets/image-10.png", width: 60%)

  Magnetic north is local and can differ from true north. Influenced by Earth's magnetic field and composition of rocks. Also changes over time. (Henry Gellibrand measured change of $7 deg$ over 54 years in 1635-1689, London).

  - *Geomagnetic Pole*: Intersect of Magnetic Axis with Earth's surface. Symmetric on Northern and Southern hemispheres. Not fixed, moves over time.

  - *Magnetic Dip Pole*: Location where magnetic field is vertical (I = 90 deg). Not symmetric, moves faster than geomagnetic poles. Currently in Arctic Ocean, moving towards Siberia.
]

#section[Magnetism and Dipoles][
  Basic Equations:

  $
    aB_"Wire" = mu_c I/(2 pi r) hspace "around long wire"\
    aB_"2 poles" = mu/(4 pi) (p_1 dot p_2)/r^3 hspace "between 2 magnetic poles"\
    aB = K_m p/r^2 = mu/(4 pi) p/r^2 hspace "magnetic field from unit pole and and distance"\
  $

  - *Earths Magnetic Field*: Measured in the range of nano Tesla (nT) $approx$ 1 Gauss.

  - *Potential of a Pole*: $B_r = -dv(W, r) hspace W = -integral_r^oo aB dot dd(r) hspace W = mu_0/(4 pi) p/r$

    For two poles and a test point: $W = mu/(4 pi) (p/r_+ - p/r_-) = (mu p)/(4 pi) ((r_- - r_+)/(r_- r_+))$ with $r_+ r_- = r^2 - d^2 cos^2 theta approx r^2$, $r_- - r_+ approx 2 d cos theta$ for an observer $r$ far from the poles with pole separation $d$. This is the general form of the potential of a dipole (dipole approximation).

    $
      => W = mu/(4 pi) (cos theta)/r^2 m hspace m = 2 p d hspace "magnetic moment"\
      tan I = 2 cot theta
    $

  - *Dipole Field*: 
    $
      B_r = - dv(W, r) = mu/(4 pi) (2 cos theta)/r^3 m\
      B_theta = -1/r dv(W, theta) = mu/(4 pi) (sin theta)/r^3 m\
      aB = (B_r, B_theta)
    $

    The inclination is the angle between $aB$ and $B_theta$: $tan I = 2 cot theta$
]