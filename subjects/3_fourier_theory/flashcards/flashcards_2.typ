#import "../../../lib/setup_flashcards.typ": flashcard, flashcard-setup, render-flashcards
#import "../../../lib/lib.typ": *

#show: flashcard-setup(
  card-width: 9cm,
  card-height: 5.5cm,
  margin: 0cm,
  show-cut-lines: true,
  topic: "Fourier",
)

#let blue = rgb("#E3F2FD") // Fourier Series
#let green = rgb("#E8F5E8") // Fourier Transform
#let yellow = rgb("#FFF8E1") // PDEs
#let red = rgb("#FFEBEE") // Distributions / Functional Analysis

#flashcard(
  title: "Definitions",
  color: yellow,
  question: [
    State the basic *Fourier-Theory theorem* (Fourier function properties of integrable functions) and state the *Riemann-Lebesgue lemma* and its consequences.
  ],
  answer: [
    *Fourier-Theory Theorem*: If $f in L^1(RR)$, then its Fourier transform $hat(f)$ is uniformly continuous and vanishes at infinity.

    *Riemann-Lebesgue Lemma*: If $f in L^1(RR)$, then $lim_(abs(k) -> oo) hat(f)(k) = 0$.

    *Consequences*:
    - No function with compact support can have a Fourier transform with compact support (except the zero function).
    - The Fourier transform of an $L^1$ function cannot be identically equal to 1 on any interval of non-zero length.
  ],
)

#flashcard(
  title: "Definitions",
  color: yellow,
  question: [
    Define Hilbert space. What does it need to satisfy? What are the best ways to check if a space is a Hilbert space? What are consequences of being a Hilbert space? Define a Chauchy sequence.
  ],
  answer: [
    A *Hilbert space* is a complete inner product space. It must satisfy:
    - *Linearity*: $iprod(a x + b y, z) = a iprod(x, z) + b iprod(y, z)$
    - *Conjugate symmetry*: $iprod(x, y) = overline(iprod(y, x))$
    - *Positive-definiteness*: $iprod(x, x) >= 0$ with equality iff $x = 0$

    *Ways to check*: Verify inner product properties or Show that every Cauchy sequence converges
    
    *Consequences*: Existence of orthonormal bases, Projection theorem: every vector can be uniquely decomposed into components parallel and orthogonal to a closed subspace.
    *Cauchy sequence*: A sequence $(x_n)$ in a metric space is Cauchy if for every $epsilon > 0$, there exists $N$ such that for all $m, n >= N$, $d(x_n, x_m) < epsilon$.
  ],
)

#flashcard(
  title: "Definitions",
  color: yellow,
  question: [
    Define Schwartz space. What are its properties and why is it important in Fourier theory?
  ],
  answer: [
    The *Schwartz space* $S(RR^n)$ is the space of all infinitely differentiable functions $f: RR^n -> RR$ such that for every multi-indices $alpha$ and $beta$, the seminorms $p_(alpha, beta)(f) = sup_(x in RR^n) |x^alpha partial^beta f(x)|$ are finite.

    *Properties*:
    - Closed under differentiation and multiplication by polynomials.
    - Dense in $L^2(RR^n)$.
    - The Fourier transform maps Schwartz functions to Schwartz functions.

    *Importance*: The Schwartz space provides a convenient setting for Fourier analysis, allowing for smooth functions that decay rapidly at infinity, making them ideal for studying properties of the Fourier transform and distributions.
  ],
)

#flashcard(
  title: "Definitions",
  color: yellow,
  question: [
    How do you read out the degree of differentiability of a function from its fourier coefficients or fourier transform?
  ],
  answer: [
    - *Fourier Series*: If the Fourier coefficients $c_n$ of a periodic function $f$ satisfy $abs(c_n) <= C / abs(n)^m$ for some $C$, then $f$ is $m$ times differentiable.
    If $f$ is $m$ times differentiable,\
    then $abs(c_n) = o(1 / abs(n)^m)$ as $abs(n) -> oo$.

    - *Fourier Transform*: If the Fourier transform $hat(f)(k)$ of a function $f$ satisfies $abs(hat(f)(k)) <= C / abs(k)^m$ for some $C$, then $f$ is $m$ times differentiable. 
    If $f$ is $m$ times differentiable, \
    then $abs(hat(f)(k)) =o(1 / abs(k)^m)$ as $abs(k) -> oo$.
  ],
)

#flashcard(
  title: "Definitions",
  color: yellow,
  question: [
    State Parseval's theorem and explain what its useful for.
  ],
  answer: [
    *Parseval's Theorem*:
    - For Fourier Series: If $f$ is a square-integrable periodic function with Fourier coefficients $c_n$, then $1/T integral_0^T |f(t)|^2 dt = sum_(n=-oo)^oo |c_n|^2$.
    - For Fourier Transform: If $f in L^2(RR^n)$ with Fourier transform $hat(f)$, then $integral_RR^n |f(x)|^2 dx = (1/(2 pi)^n) integral_RR^n |hat(f)(k)|^2 dd(k)$.

    *Usefulness*: It lets you speed up calculations of integrals by switching to the frequency domain, where the function may have a simpler representation.
  ],
)

#flashcard(
  title: "Definitions",
  color: yellow,
  question: [
    State Plancherel's theorem and explain what its useful for.
  ],
  answer: [
    *Plancherel's Theorem*:
    - For Fourier Series: The mapping from a square-integrable periodic function $f$ to its Fourier coefficients $c_n$ is an isometry between $L^2$ space of functions and $l^2$ space of sequences, i.e., $||f||_2^2 = sum_(n=-oo)^oo |c_n|^2$.
    - For Fourier Transform: The Fourier transform is an isometry on $L^2(RR^n)$, i.e., $||f||_2^2 = (1/(2 pi)^n) ||hat(f)||_2^2$.

    *Usefulness*: It speed up calculations of $L^2$ norms by switching to the frequency domain, where the function may have a simpler representation.
  ],
)

#render-flashcards()
