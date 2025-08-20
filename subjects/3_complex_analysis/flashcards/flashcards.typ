#import "../../../lib/setup_flashcards.typ": flashcard-setup, flashcard, render-flashcards

#show: flashcard-setup(
  card-width: 7cm,
  card-height: 4cm,
  margin: 0cm,
  show-cut-lines: true,
)

// Residue Theory Flashcards - 30 Questions
#flashcard(
  title: "Definition",
  question: [
    What is the residue of a function $f(z)$ at a singularity $z_0$?
  ],
  answer: [
    $text("Res")(f, z_0) = 1/(2 pi i) integral.cont_C f(z) dif z$
    
    where $C$ encircles $z_0$ once counterclockwise.
  ]
)

#flashcard(
  title: "Simple Pole",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    How do you calculate the residue at a simple pole $z_0$?
  ],
  answer: [
    $text("Res")(f, z_0) = lim_(z arrow z_0) (z - z_0) f(z)$
  ]
)

#flashcard(
  title: "Residue Theorem",
  color: rgb("#F3E5F5"), // light purple - theorem
  question: [
    State the Residue Theorem.
  ],
  answer: [
    $integral.cont_C f(z) dif z = 2 pi i sum_(k=1)^n text("Res")(f, z_k)$
    
    Sum over all singularities inside $C$.
  ]
)

#flashcard(
  title: "Order m Pole",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    Formula for residue at pole of order $m$?
  ],
  answer: [
    $text("Res")(f, z_0) = 1/((m-1)!) lim_(z arrow z_0) dif^(m-1)/dif z^(m-1) [(z-z_0)^m f(z)]$
  ]
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Find $text("Res")(1/(z(z-1)), 0)$.
  ],
  answer: [
    $text("Res")(1/(z(z-1)), 0) = lim_(z arrow 0) z dot 1/(z(z-1)) = lim_(z arrow 0) 1/(z-1) = -1$
  ]
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Find $text("Res")(1/(z(z-1)), 1)$.
  ],
  answer: [
    $text("Res")(1/(z(z-1)), 1) = lim_(z arrow 1) (z-1) dot 1/(z(z-1)) = lim_(z arrow 1) 1/z = 1$
  ]
)

#flashcard(
  title: "Partial Fractions",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    Decompose $1/(z(z-1))$ using residues.
  ],
  answer: [
    $1/(z(z-1)) = -1/z + 1/(z-1)$
    
    Coefficients are the residues at each pole.
  ]
)

#flashcard(
  title: "Essential Singularity",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    How do you find the residue at an essential singularity?
  ],
  answer: [
    Expand $f(z)$ in Laurent series around $z_0$:
    $f(z) = sum_(n=-infinity)^infinity a_n (z-z_0)^n$
    
    Then $text("Res")(f, z_0) = a_(-1)$
  ]
)

#flashcard(
  title: "Laurent Series",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    What is the Laurent series of $e^(1/z)$ around $z = 0$?
  ],
  answer: [
    $e^(1/z) = sum_(n=0)^infinity 1/(n! z^n) = 1 + 1/z + 1/(2! z^2) + 1/(3! z^3) + ...$
  ]
)

#flashcard(
  title: "Residue at Infinity",
  color: rgb("#FFF3E0"), // light orange - formula
  question: [
    How do you calculate $text("Res")(f, infinity)$?
  ],
  answer: [
    $text("Res")(f, infinity) = -text("Res")(1/w^2 f(1/w), 0)$
    
    where $w = 1/z$.
  ]
)

#flashcard(
  title: "Sum of Residues",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    What is the sum of all residues (including at $infinity$)?
  ],
  answer: [
    $sum_("all singularities") text("Res")(f, z_k) + text("Res")(f, infinity) = 0$
    
    This includes the residue at infinity.
  ]
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Find $text("Res")(z^2 e^(1/z), 0)$.
  ],
  answer: [
    $z^2 e^(1/z) = z^2 (1 + 1/z + 1/(2! z^2) + 1/(3! z^3) + ...)$
    
    $= z^2 + z + 1/2! + 1/(3! z) + ...$
    
    So $text("Res") = 1/(3!) = 1/6$
  ]
)

#flashcard(
  title: "Rational Functions",
  color: rgb("#FFF8E1"), // light yellow - theory
  question: [
    For $f(z) = P(z)/Q(z)$ with $deg(P) < deg(Q)$, what is $text("Res")(f, infinity)$?
  ],
  answer: [
    $text("Res")(f, infinity) = 0$
    
    Since the degree of numerator is less than denominator.
  ]
)

#flashcard(
  title: "Integration",
  color: rgb("#E0F2F1"), // light teal - application
  question: [
    Evaluate $integral.cont_(|z|=2) 1/(z^2 - 1) dif z$.
  ],
  answer: [
    Poles at $z = plus.minus 1$ (both inside $|z| = 2$)
    
    $text("Res")(1/(z^2-1), 1) = 1/2$, $text("Res")(1/(z^2-1), -1) = -1/2$
    
    Answer: $2 pi i (1/2 - 1/2) = 0$
  ]
)

#flashcard(
  title: "Double Pole",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Find $text("Res")(1/(z-1)^2, 1)$.
  ],
  answer: [
    $text("Res")(1/(z-1)^2, 1) = lim_(z arrow 1) dif/dif z [(z-1)^2 dot 1/(z-1)^2]$
    
    $= lim_(z arrow 1) dif/dif z [1] = 0$
  ]
)

#flashcard(
  title: "Example",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Find $text("Res")(z/(z-1)^2, 1)$.
  ],
  answer: [
    $text("Res")(z/(z-1)^2, 1) = lim_(z arrow 1) dif/dif z [(z-1)^2 dot z/(z-1)^2]$
    
    $= lim_(z arrow 1) dif/dif z [z] = 1$
  ]
)

#flashcard(
  title: "Sine Function",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Find $text("Res")(1/sin(z), 0)$.
  ],
  answer: [
    $sin(z) = z - z^3/3! + ... = z(1 - z^2/3! + ...)$
    
    Simple pole: $text("Res")(1/sin(z), 0) = lim_(z arrow 0) z/sin(z) = 1$
  ]
)

#flashcard(
  title: "Cosine Function",
  color: rgb("#E8F5E8"), // light green - example
  question: [
    Find $text("Res")(1/(z cos(z)), 0)$.
  ],
  answer: [
    $cos(0) = 1 != 0$, so $z = 0$ is a simple pole.
    
    $text("Res")(1/(z cos(z)), 0) = lim_(z arrow 0) 1/cos(z) = 1$
  ]
)

#flashcard(
  question: [
    *Integration by Residues*
    
    Evaluate $integral_(-infinity)^infinity 1/(x^2 + 1) dif x$.
  ],
  answer: [
    *Answer*
    
    Consider $integral.cont_C 1/(z^2 + 1) dif z$ over semicircle.
    
    Pole at $z = i$ (inside): $text("Res") = 1/(2i) = -i/2$
    
    Answer: $2 pi i (-i/2) = pi$
  ]
)

#flashcard(
  question: [
    *Logarithmic Residue*
    
    What is the logarithmic residue formula?
  ],
  answer: [
    *Answer*
    
    $1/(2 pi i) integral.cont_C (f'(z))/(f(z)) dif z = N - P$
    
    where $N$ = number of zeros, $P$ = number of poles inside $C$.
  ]
)

#flashcard(
  question: [
    *Rouché's Theorem*
    
    State Rouché's Theorem.
  ],
  answer: [
    *Answer*
    
    If $|f(z) - g(z)| < |f(z)|$ on $partial D$, then $f$ and $g$ have the same number of zeros in $D$.
  ]
)

#flashcard(
  question: [
    *Branch Cut*
    
    Find $text("Res")(1/sqrt(z), 0)$.
  ],
  answer: [
    *Answer*
    
    $1/sqrt(z) = z^(-1/2)$ has a branch point at $z = 0$.
    
    This is not an isolated singularity, so no residue exists.
  ]
)

#flashcard(
  question: [
    *Exponential*
    
    Find all singularities of $e^z/(z^2 + 4)$.
  ],
  answer: [
    *Answer*
    
    Poles at $z^2 + 4 = 0$, so $z = plus.minus 2i$.
    
    Both are simple poles since $e^z$ is entire.
  ]
)

#flashcard(
  question: [
    *Residue Calculation*
    
    Find $text("Res")(e^z/(z^2 + 4), 2i)$.
  ],
  answer: [
    *Answer*
    
    $text("Res")(e^z/(z^2 + 4), 2i) = lim_(z arrow 2i) (z-2i) e^z/((z-2i)(z+2i))$
    
    $= e^(2i)/(4i) = e^(2i)/(4i)$
  ]
)

#flashcard(
  question: [
    *Jordan's Lemma*
    
    When can you use Jordan's Lemma?
  ],
  answer: [
    *Answer*
    
    For $integral.cont_(C_R) f(z) e^(i alpha z) dif z arrow 0$ as $R arrow infinity$
    
    if $f(z) arrow 0$ uniformly on semicircle and $alpha > 0$.
  ]
)

#flashcard(
  question: [
    *Contour Deformation*
    
    When can you deform a contour?
  ],
  answer: [
    *Answer*
    
    When the function is analytic in the region between the two contours.
    
    The integral value remains unchanged.
  ]
)

#flashcard(
  question: [
    *Maximum Modulus*
    
    State the Maximum Modulus Principle.
  ],
  answer: [
    *Answer*
    
    If $f$ is analytic and non-constant in domain $D$, then $|f(z)|$ attains its maximum on the boundary $partial D$.
  ]
)

#flashcard(
  question: [
    *Example Application*
    
    Evaluate $integral_0^(2pi) 1/(2 + cos theta) dif theta$.
  ],
  answer: [
    *Answer*
    
    Use $z = e^(i theta)$, $cos theta = (z + 1/z)/2$, $dif theta = dif z/(i z)$.
    
    Transform to $integral.cont_(|z|=1) 2/(z^2 + 4z + 1) dot dif z/(i z)$
    
    Answer: $2pi/sqrt(3)$
  ]
)

#flashcard(
  question: [
    *Infinite Products*
    
    How do residues relate to infinite products?
  ],
  answer: [
    *Answer*
    
    For $f(z) = product_(n=1)^infinity (1 - z/a_n)$:
    
    $f'/f = -sum_(n=1)^infinity 1/(z - a_n)$
    
    Residues of $f'/f$ give information about zeros.
  ]
)

#flashcard(
  question: [
    *Cauchy Principal Value*
    
    How do residues help with principal values?
  ],
  answer: [
    *Answer*
    
    For poles on the real axis:
    $"P.V." integral_(-infinity)^infinity f(x) dif x = 2pi i sum_("upper half-plane") text("Res")(f, z_k)$
    
    Plus $pi i times$ sum of residues on real axis.
  ]
)
)

// Render all the collected flashcards
#render-flashcards()
