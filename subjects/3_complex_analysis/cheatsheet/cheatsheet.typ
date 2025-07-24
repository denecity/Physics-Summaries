#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Complex Analysis Cheatsheet",
  author: "Denis Titov",
  language: "GER",
)

= Holomorphic Functions

A complex function $f(z) = u(x, y) + i v(x,y)$ is holomorphic in a domain $D$ if it is complex differentiable

$
  f'(z_0) = lim_(Delta z -> 0) (f(z_0 + Delta z) - f(z_0)) / Delta z
$

at every point in $D$. We can check this using the Cauchy-Riemann equations:

$
  pdv(u, x) = pdv(v, y) #h(15pt) pdv(u, y) = -pdv(v, x)
$

== Power (Taylor) Series

A holomorphic function $f(z)$ can be represented by a power series in a neighborhood of a point $z_0$:

$
  f(z) = sum_(n=0)^oo a_n (z-z_0)^n #h(15pt) a_n = (f^((n)) z_0) / n! 
$

A function is holomorphic in a region if and only if it is *analytic*, which means it can be represented by a power series in that region. THe series will converge for all $z$ inside the largest disk centered at $z_0$ that does not contain any singularities of $f(z)$.

== Radius of Convergence (Ratio Test)

$
  L = lim_(n -> oo) abs(a_(n+1)) / abs(a_n) => R = 1/L  #h(15pt) L = limsup_(n -> oo) root(n, abs(a_n)) => R = 1/L
$

== Laurent Series

A Laurent series represents a function $f(z)$ in a donut region $D = {z: r_1 < |z - z_0| < r_2}$. That means, it can represent regions that contain a singularity in the center $z_0$.

$
  f(z) = sum_(n=-oo)^oo c_n (z - z_0)^n = sum_(n=0)^oo a_n (z - z_0)^n + sum_(n=1)^oo b_n (z - z_0)^(-n)\
$

The first sum is the Analytic Part and the second the Principal Part. The Analytic Part converges for $|z - z_0| < r_2$ and the Principal Part converges for $|z - z_0| > r_1$. The Laurent series converges in the whole donut region and gives us insight into the type of singularity at $z_0$.

$
  c_n = 1/(2 pi i) integral.cont_C f(z) / (z - z_0)^(n+1) dd(z)
$

where $C$ is a positively oriented contour around $z_0$.

== Classification of Singularities

To get insight into the type of singularity at $z_0$, we have to look at the principal part of the Laurent series:

$
  f(z) = sum_(n=1)^oo b_n (z - z_0)^(-n)\
$

=== Removable Singularity

Removable if the principal part is empty. The value of the function at the singularity can be defined as $a_0$. The Laurent series is of the form:

$
  f(z) = a_0 + a_1 (z - z_0) + a_2 (z - z_0)^2 + ...\
  f(z_0) = a_0\
$

=== Pole of order $m$

A singularity is a pole of order $m$ if  the principal part has a finite number of terms:

$
  f(z) = b_m (z - z_0)^(-m) + ... + b_1 (z - z_0)^(-1) + a_0 + a_1 (z - z_0) + ...\
$

At the singularity, the function goes to infinity. A pole of order $1$ is called a *simple pole*.

=== Essential Singularity

A singularity is an essential singularity if the principal part has infinitely many terms. The *Casorati-Weierstrass theorem* states that in any neighborhood of an essential singularity, the function takes on every complex value.

== Determining Series Representation

To determine series representation, we start from known series 

$
  1/(1 - z) = sum_(n=0)^oo z^n "for" abs(z) < 1\
  e^z = sum_(n=0)^oo z^n / n! forall z\
  sin(z) = sum_(n=0)^oo (-1)^n z^(2n+1) / (2n+1)! forall z ( = Re(e^(i z)) "for" RR)\
  cos(z) = sum_(n=0)^oo (-1)^n z^(2n) / (2n)! forall z ( = Im(e^(i z)) "for" RR)\
  log(1 + z) = sum_(n=1)^oo (-1)^(n+1) z^n / n forall abs(z) < 1\
  log(z) = log(|z|) + i arg(z) "for" z != 0\
$

and manipulate them with

=== Substitution

$
  cos(z^2) = sum_(n=0)^oo (-1)^n (z^2)^(2n) / (2n)! = sum_(n=0)^oo (-1)^n z^(4n) / (2n)!\
$

=== Multiplication, Division, Partial fraction

$
  f(z) = -1/((z-1) (z-2)) = 1/(z-1) - 1/(z-2)\
$

We have to be careful about the radius of convergence. For the first term we have $abs(z) > 1$. We have $abs(1/z) < 1$. We factor out $z$

$
  1/(z - 1) = 1/(z(1-1/z)) = 1/z sum_(n=0)^oo (1/z)^n = sum_(n=0)^oo z^(-n-1)\
$

For the second term we are in the region $abs(z) < 2$. We have $abs(z/2) < 1$. We factor out $-2$.

$
  -1/(z - 2) = 1/(2-z) = 1/(2(1-z/2)) = 1/2 sum_(n=0)^oo (z/2)^n = sum_(n=0)^oo z^n / 2^(n+1)\
$

The Laurent series is the sum of the two series.

=== Differentiation and Integration

$
  f(z) = 1/(1 - z)^2 = dv(, z) 1/(1 - z) = dv(, z) sum_(n=0)^oo z^n = sum_(n=1)^oo n z^(n-1) "for" abs(z) < 1\
$

=== Cauchy Integral Formula

The Cauchy integral formula gives us a way to compute the coefficients of the slaurent series.

== Cauchy Integral Formula

The Cauchy Integral Formula gives us a way to compute the value of a holomorphic function at a point $z_0$ inside a contour $C$:

$
  f(z_0) = 1/(2 pi i) integral.cont_C f(z) / (z - z_0) dd(z) #h(15pt) f^((n)) (z_0) = n!/(2 pi i) integral.cont_C f(z) / (z - z_0)^(n+1) dd(z)\
$

With

$
  c_n = f^((n)) (z_0) / n! = 1/(2 pi i) integral.cont_C f(z) / (z - z_0)^(n+1) dd(z)\ 
$

we can compute the coefficients of the Laurent series.

== Reparametrization of Contours

Reparametrization is the process of changing the parameters of a contour without changing its shape. We have a curve $r(t), t in [a, b]$. We produce a new paremeter $s, t = g(t)$. The new curve is $gamma(s) = r(g(s))$.

For this to be valid the curve must be continuously differentiable and its derivative must not be zero. This leads the curve to be traced smoothly, without any turns in direction.

While the resulting path is identical, quantities like the velocity will change:

$
  dv(gamma, s) = dv(r, t) dv(t, s) = v(t) dot g'(s)\
$

The arc length does not changes with Reparametrization.

== Primitives

Primitive $F$ of a function $f$ is a function such that $F'(z) = f(z)$ for all $z$ in the domain of $f => D$. The *Fundamental Theorem of Calculus* states:

$
  integral_C f(z) dd(z) = F(z_B) - F(z_A) #h(15pt) "Closed Contour" => integral.cont_C f(z) dd(z) = 0\
$

If a function $f(z)$ is holomorphic in a simply connected domain $D$, then it has a primitive in $D$. This means that the integral of $f(z)$ over any closed contour in $D$ is zero.

The keyhole principle helps us to compute integrals over contours that encircle a singularity.

== Liouville Theorem

If a function $f(z)$ is

- Entire (holomorphic everywhere in the complex plane)

- Bounded (there exists a constant $M$ such that $|f(z)| < M$ for all $z$ in the complex plane)

Then $f(z)$ must be *constant*.

== Expanded Liouville Theorem

If a function $f(z)$ is entire and is bounded by  a polynomial, then *$f(z)$ is a polynomial.*

== Limits of Holomorphic Functions (Weierstrass)

Limits of holomorphic functions are holomorphic and the derivatives also converge on every compact subset of the domain.

== Principle of Analytic Continuation

If two holomorphic functions agree on a set with a limit point in their domain, they are equal on the whole connected component of their domain.

Thus if two holomorphic functions $f$ and $g$ agree on a sub-domain $D$ ($f|_D=g|_D$), then $f = g$.

Example:

$
  f(z) = sum_(n=0)^oo z^n, abs(z) < 1\
  g(z) = 1/(1 - z)\
$

Since $f = g$ for $abs(z) < 1$, we have $f(z) = g(z)$ for all $z$ in the connected component of their domain.

We say $g$ is the unique *analytic continuation* of $f$ in the entire complex plane.

= Meromorphic Functions

Meromorphic functions are complex functions that are holomorphic except for isolated poles. They can be represented by Laurent series in a neighborhood of each pole.

They also have the following properties:

- $
    f "holom almost everywhere"\
  $

- $
    "if" f = g/h => g, h "holom and" h(z) != 0 forall z in D
  $

- $
    "Zero order m at" z_0 => f(z) = (z - z_0)^m g(z) => g "holom and" g(z_0) != 0
  $

- $
    "Pole order m at" z_0 => f(z) = g(z)/(z - z_0)^m => g "holom and" g(z_0) != 0
  $

The Valuation Function is the first integer index of the first non-zero coefficient in the Laurent series:

$
  v_p(f) = min {n in ZZ | c_n != 0}\
$

The order of the pole is the negative of the valuation function and the order of the zero is the valuation function.

= Residue Theorem

The residue theorem is a way to evaluate complex integrals by summing the residues of the poles inside the contour.

$
  integral.cont_C f(z) dd(z) = 2 pi i sum_k (Res(f, z_k) dot "Wind"(C, z_k))\
$

We can find the Residue from the Laurent series or from the Cauchy Integral Formula for simple poles:

$
  Res(f, z_0) = c_(-1) = 1/(2 pi i) integral.cont_C f(z) dd(z)\
$

If $f(z) = P(z)/Q(z)$, where $P(z) != 0$ and $Q(z)$ are polynomials, and $Q(z)$ has a simple zero at $z_0$, then the residue is given by:

$
  Res(f, z_0) = P(z_0) / (Q'(z_0))\
$

For a Pole of order $m$ at $z_0$, the residue is given by:

$
  Res(f, z_0) = 1/(m-1)! lim_(z -> z_0) dv(, z, m-1) (f(z) (z - z_0)^m)\
$

For simple pole:

$
  Res(f, z_0) = lim_(z -> z_0) (z - z_0) f(z)\
$

When we take a real integral with a goes through a pole on the real axis, we can form a small clockwise contour around the pole. The contribution from the contour to the entire integral is:

$
  integral_gamma_epsilon f(z) dd(z) = - i pi Res(f, z_0)\
$

== Logarithmic Derivative

$
  f = g dot h\
  log(f(z))' = (f'(z))/f(z) = (g'(z))/g(z) + (h'(z))/h(z)\
  f'(z) = ((g'(z))/g(z) + (h'(z))/h(z)) f(z)\
$

We can use the logarithmic derivative to find the number of zeros and poles of a meromorphic function inside a contour $C$:

$
  1/(2 pi i) integral.cont_C f'(z)/f(z) dd(z) = N - P\
$

where $N$ is the number of zeros and $P$ is the number of poles inside the contour $C$ counted according to their order (multiplicity).

The pole of $f'/f$ is always simple. Thus:

$
  Res(f'/f, z_0) = lim_(z -> z_0) (z - z_0) (f'(z))/f(z)\ 
$

If the result is positive $n$, then $f$ has a zero of order $n$ at $z_0$. If the result is negative $-m$, then $f$ has a pole of order $m$ at $z_0$.

== Rouches Theorem

Rouches Theorem is used to count the number of zeros of a holomorphic function inside a contour $C$.

If $abs(f(z)) > abs(g(z))$ on the closed contour $C$, then $f$ and $f + g$ have the same number of zeros inside $C$ (counted with multiplicity). This is useful for finding the number of zeros of a polynomial in a given region.

Example: How many zeros does $f(z) = z^8 - 5z^3 + z - 2$ have inside the unit circle? We can see that the term $-5 z^3$ dominates on the unit circle, so we can apply Rouches Theorem. This means $-5 z^3$ has the same number of zeros as $f(z)$ inside the unit circle. Since $-5 z^3$ has 3 zeros inside the unit circle, $f(z)$ also has *3 zeros* inside the unit circle.

$
  H(z) = z/(z^5 - 4 z^2 + 2) "inside unit circle"\
  D(z) = z^5 - 4 z^2 + 2\
$

$D$ has 2 zeros inside the unit circle (a zero of order 2 at $z = 0$). Thus $H(z)$ has 2 poles inside the unit circle. To get the precise location of the poles, we can factor the denominator or change the contour around.

== Open Image Theorem

The Open Mapping Theorem states that any non-constant holomorphic function maps an open set to another open set and a connected set to another connected set.

== Maximum Modulus Principle

For a non-constant holomorphic function $f(z)$, the maximum modulus of $f(z)$ on a closed contour $C$ is attained on the boundary of $C$. This means that if $f(z)$ is holomorphic in a domain $D$ and continuous on the closure of $D$, then

$
  max(z in C) abs(f(z)) = max(z in partial C) abs(f(z))
$

If $abs(f)$ attains a local minimum in the interior of $D$, then $f(z)$ is zero at that point.

If the function is guaranteed to be non-zero within the domain, then the minimum modulus must occur on the boundary of the domain.

== Argument Principle

Let $f$ have no zeros or poles on a closed contour $C$.

$
  1/(2 pi i) integral.cont_C (f'(z))/f(z) dd(z) = N - P
$

Where $N$ is the number of zeros and $P$ is the number of poles inside the contour $C$ counted according to their order (multiplicity).

= Homotopy

A homotopy is a continuous deformation between to paths.

== Simply Connected Set

A set is simply connected if every closed curve in the set can be continuously deformed to a point without leaving the set. This means that any two paths in the set can be continuously deformed into each other.

If $f$ is a holomorphic function in a simply connected domain $D$, then the primitive $F$ exists and any contour integral of $f$ over a closed curve in $D$ is zero.

== Complex Logarithm

The complex logarithm is a multi-valued function defined as:

$
  z = r e^(i phi) => log(z) = ln(r) + i(phi + 2 pi k), k in ZZ
$

Because of the periodicity ($2 pi k$), the logarithm is multi-valued. We define the principal branch of the logarithm as the one with $k = 0$ and $phi in (-pi, pi]$ The principal argument is defined as:

$
  log(z) = log(abs(z)) + i arg(z) #h(15pt) arg(z) in (-pi, pi]
$

To make the principal value function continuous, we make a branch cut along the negative real axis. This means we agree not to cross the negative real axis when computing the logarithm with a contour. $z=0$ is then a branch point, as it connects all the branches of the logarithm.

== Complex Exponential

$
  e^z = e^(x + i y) = e^x e^(i y) = e^x (cos(y) + i sin(y))\
  e^(z + 2 pi i) = e^z "periodic"\
$

The complex exponential is an entire function and never zero.

Note:

$
  e^(i z) = cos(z) + i sin(z) 
$

== Complex Exponential Function

$
  z^w = exp(w ln(z)) #h(15pt) z != 0, z, w in CC\
$

Because $log$ is multivalued, $z^w$ is also multivalued. The principal value is with the principal branch of the logarithm. 

== Winding Number

The winding number of a closed curve $C$ around a point $z_0$ is defined as:

$
  W(gamma, z_0) = 1/(2 pi i) integral.cont_gamma dd(z) / (z - z_0)
$

Positive means the path winds counterclockwise around $z_0$, negative means it winds clockwise. Zero means the path does not wind around $z_0$. This just uses the Argument Principle with a function that has a simple pole at $z_0$.

== Roots of unity

The $n$-th roots of unity are the solutions to the equation $z^n = 1$. They are given by:

$
  z_k = e^(2 pi i k / n), k = 0, 1, ..., n-1\
$

= Integrals

== Trigonometric Integrals

Here we relate some real integral of some trigonometric functions to complex integrals through the unit circle. We use:

$
  z = e^(i t), dv(z, t) = i e^(i t) => dd(t) = 1/(i z) dd(z) #h(15pt) cos(t) = (z + 1/z)/2, sin(t) = (z - 1/z)/(2 i)\
$

Example:

$
  integral_0^2pi sin(t)/(2 + sin(t)) dd(t) = integral.cont_(abs(z) = 1) dd(z)/(i z) (z - 1/z)/(2 i (2 + ((z - 1/z)/(2 i)))) = -i integral.cont (z - 1/z)/(z^2 + 4 i z - 1)
$

Then we just use residue thorem

== Half-Circle

If we have an integral of the form:

$
  integral_(-oo)^oo "trig"/"something" dd(t) #h(10pt) "or" #h(10pt)
  integral_(-oo)^oo P(x)/Q(x), deg(Q) >= deg(P) + 2
$

we use a loop $gamma$ above or below the real axis. After expanding to infinity we have to show $integral_gamma = 0$, then the real integral equals the residue theorem result.

Example $integral_RR 1/(x^2 + 1) dd(x)$:

$
  1/(z^2 + 1) = 1/((z - i)(z + i)) = 1/(2 i) (1/(z - i) - 1/(z + i))\
$

The poles are at $z = i$ and $z = -i$. We take the contour $gamma$ above the real axis, which encloses the pole at $z = i$. The residue at $z = i$ is:

$
  R>1=> Res(1/(z^2 + 1), i) = pi\
$

To show that $integral_gamma$ goes to zero:

$
  integral_gamma <= "len"(gamma) dot sup(abs(f)) ,#h(5pt) sup(abs(1/(z^2 + 1))) <= 2/R^2 => integral_gamma <= C/R ->^(R -> oo) 0
$

Thus the real integral evaluates to $pi$.

== Rectangle

If the function has an exponential or trigonometric term, we use a rectangle. We use an example with a rectangle of width $2 alpha$ and height $beta$ and call call the right integral $B$, left $A$ and top $C$.

$
  integral_0^oo (x sin(x))/(x^2 + a^2) dd(x) "symmetric" => = 1/2 integral_(-oo)^oo (x sin(x))/(x^2 + a^2) dd(x)\
  sin(x) = Im(e^(i x)) => integral_0^oo (x Im(e^(i x)))/(x^2 + a^2) dd(x) = 1/2 Im(integral_(-oo)^oo (x e^(i x))/(x^2 + a^2) dd(x))\
  integral.cont_gamma f = sum "res" dot 2 pi i\
$

Now we show that the contour vanishes:

$
  integral_A <= beta C/alpha, integral_B <= beta C/alpha, integral_C <= 2 alpha e^(beta), beta(t) = sqrt(t), alpha(t) = t => 0
$