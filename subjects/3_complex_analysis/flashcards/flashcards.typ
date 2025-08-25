#import "../../../lib/setup_flashcards.typ": flashcard, flashcard-setup, render-flashcards

#show: flashcard-setup(
  card-width: 9cm,
  card-height: 5.5cm,
  margin: 0cm,
  show-cut-lines: true,
  topic: "Comp Ana",
)

#let blue = rgb("#E3F2FD") // multiple choice
#let yellow = rgb("#FFF8E1") // Exam Question
#let red = rgb("#FFEBEE") // proof
#let green = rgb("#E8F5E8") // definition

// Multiple Choice
#flashcard(
  title: "Holomorphie",
  color: blue,
  question: [
    Welche Funktion ist nicht Holomorph?

    + $f(z) = z^4 + 4z + 1$

    + $f(x + i y) = (cos x + i sin x) e^y$
    + $f(x+ i y) = x^2 + 2 i x y - y^2$
    + $f(x + i y) = i x^2 + 2 x y - i y^2$
  ],
  answer: [
    $f(x + i y) = i x^2 + 2 x y - i y^2$
  ],
)

// Singularity Analysis
#flashcard(
  title: "Singularitäten",
  color: blue,
  question: [
    Betrachte die Singularität von $f(z) = sin(1/z)/(pi z - 1)^2022$ an der Stelle $z_0 = 1/pi$.

    Was gilt?

    + Die Singularität in $z_0$ ist ein Pol der Ordnung 2021.
    + Die Singularität in $z_0$ ist ein Pol der Ordnung 2022.
    + Die Singularität in $z_0$ ist eine wesentliche Singularität.
    + Keine der drei anderen Aussagen ist wahr.
  ],
  answer: [
    Die Singularität in $z_0$ ist ein Pol der Ordnung 2021.
  ],
)

// Residue Calculation
#flashcard(
  title: "Residuum",
  color: blue,
  question: [
    Das Residuum von $f(z) = z^4 sin(2/z)$ an der Stelle $z = 0$ ist:

    + $0$

    + $4/15$
    + $1/(-5!)$
    + $(2pi i)/(5!)$
  ],
  answer: [
    $4/15$
  ],
)

// Biholomorphism
#flashcard(
  title: "Biholomorphismus",
  color: blue,
  question: [
    Für welche der folgenden offenen Teilmengen $Omega subset CC$ existiert KEIN Biholomorphismus $f : Omega -> D$, wobei $D = {z in CC | |z| < 1}$?

    + $Omega = H = {z in CC | "Im"(z) > 0}$
    + $Omega = CC$
    + $Omega = CC \\ [0,infinity)$
    + $Omega = {z in CC | |z| < 1, "Re"(z) > 0, 0 < "Im"(z) < "Re"(z)}$
  ],
  answer: [
    $Omega = CC$
  ],
)

// Holomorphic Square Root
#flashcard(
  title: "Holomorphe Quadratwurzel",
  color: blue,
  question: [
    Für welche Funktion $f : Omega -> CC$ existiert eine holomorphe Funktion $g : Omega -> CC$ mit $g^2 = f$?

    + $f(z) = z$ auf $Omega = CC \\ {0}$

    + $f(z) = z^3$ auf $Omega = {z in CC | 1 < |z| < 2}$
    + $f(z) = 1/(z^5 - 1)$ auf $Omega = CC \\ [-1,1]$
    + $f(z) = 1/(z^2 - 1)$ auf $Omega = CC \\ [-1,1]$
  ],
  answer: [
    $f(z) = 1/(z^2 - 1)$ auf $Omega = CC \\ [-1,1]$
  ],
)

// Identity Theorem
#flashcard(
  title: "Identitätssatz",
  color: blue,
  question: [
    Sei $Omega subset CC$ offen und zusammenhängend. Welche der folgenden Aussagen ist NICHT hinreichend dafür, dass eine holomorphe Funktion $f : Omega -> CC$ die Nullfunktion ist, d.h., $f(z) = 0$ für alle $z in Omega$?

    + Es gibt ein $a in Omega$ und ein $epsilon > 0$, so dass für alle $z in Omega$ gilt: \
      $|z - a| < epsilon => f(z) = 0$.

    + Für ein $a in Omega$ gilt $f^((n))(a) = 0$ für alle $n = 0,1,2,...$
    + $Omega$ ist beschränkt und $f$ hat unendlich viele Nullstellen.
    + $Omega = CC$ und $|f(z)| < |z|/(1 + |z|)$.
  ],
  answer: [
    $Omega$ ist beschränkt und $f$ hat unendlich viele Nullstellen.
  ],
)

// Meromorphic Extension
#flashcard(
  title: "Meromorphe Fortsetzung",
  color: blue,
  question: [
    Welche der folgenden Funktionen ist NICHT fortsetzbar zu einer meromorphen Funktion $f : CC -> CC$?

    + $f(z) = sin(z)$

    + $f(z) = z^3/(z^4 + 1)$
    + $f(z) = 1/sin(z)$
    + $f(z) = sin(1/z)$
  ],
  answer: [
    $f(z) = sin(1/z)$
  ],
)

// Zeros in Unit Disk
#flashcard(
  title: "Nullstellen",
  color: blue,
  question: [
    Wie viele Nullstellen, mit Vielfachheit gezählt, hat die Funktion $f(z) = 2z + 4z^2 - z$ in der Einheitskreisscheibe $D$?

    + $0$

    + $1$
    + $2$
    + $3$
  ],
  answer: [
    $2$
  ],
)

// MC1 - Holomorphicity in C
#flashcard(
  title: "MC1",
  color: blue,
  question: [
    Which of the following functions is not holomorphic in $CC$?

    + $f(x+ i y) = e^(2x)(cos(2y) + i sin(2y))(y−i x)$

    + $f(x+ i y) = x^2 − y^2 − 2i x y$
    + $f(x+ i y) = (x−y) + i(x+ y) + 2$
    + $f(x+ i y) = (e^y + e^(−y)) cos(x)−i(e^y−e^(−y)) sin(x)$
  ],
  answer: [
    $f(x+ i y) = x^2 − y^2 − 2i x y$

    Since $f(z) = overline(z)^2$.
  ],
)

// MC2 - Contour Integrals
#flashcard(
  title: "MC2",
  color: blue,
  question: [
    Let $f(z) = e^z/(z−2)$. Which of the following statements is not correct? All circles are positively oriented.

    + $integral_(|z|=1) f(z) dif z = 0$

    + $integral_(|z|=3) f(z) dif z = 2π i e^2$
    + $integral_(|z|=3) (f'(z))/(f(z)) dif z = −2π i$
    + $integral_(|z|=1) (f'(z))/(f(z)) dif z = 2π i$
  ],
  answer: [
    $integral_(|z|=1) (f'(z))/(f(z)) dif z = 2π i$

    It should be 0 since $f$ has no zeroes or poles inside $|z| = 1$.
  ],
)

// MC3 - Rouché's Theorem
#flashcard(
  title: "MC3",
  color: blue,
  question: [
    Let $f(z) = z^5 + 8z^3 − z + 12$. How many zeroes does $f$ have inside the disk $Omega = {z in CC : |z| < 2}$?

    + $f$ has exactly 5 zeroes inside $Omega$

    + $f$ has exactly 2 zeroes inside $Omega$
    + $f$ has exactly 3 zeroes inside $Omega$
    + $f$ has exactly 4 zeroes inside $Omega$
  ],
  answer: [
    $f$ has exactly 3 zeroes inside $Omega$

    On $|z| = 2$ we have $|z^5 − z + 12| ≤ 46 < 64 = |8z^3|$. Apply Rouché's Theorem.
  ],
)

// MC4 - Primitives and Simply Connected Domains
#flashcard(
  title: "MC4",
  color: blue,
  question: [
    For which domain $Omega$ does a holomorphic function $f : Omega → CC$ exist such that there is no holomorphic function $F : Omega → CC$ satisfying $F' = f$?

    + $Omega = {z in CC : Im(z) > 0} \\ {i}$

    + $Omega = D \\ {z in CC : Im(z) in [−1/2, 1/2]}$
    + $Omega = D \\ {z in CC : Re(z) > 0}$
    + $Omega = CC$
  ],
  answer: [
    $Omega = {z in CC : Im(z) > 0} \\ {i}$

    Take for instance $f(z) = (z−i)^(−1)$. All other options are simply connected, and hence allow the existence of a primitive.
  ],
)

// MC5 - Polynomial Characterization
#flashcard(
  title: "MC5",
  color: blue,
  question: [
    Which of the following conditions do not imply that the holomorphic function $f = u + i v$ is a polynomial?

    + $|f(z)| < |z|^100$ for $|z| > 100$

    + $(x,y) → u(x + i y)$ defines a polynomial of two variables
    + $f^((k))(1) = 0$ for all $k ≥ 2023$
    + $f$ has finitely many zeros
  ],
  answer: [
    $f$ has finitely many zeros

    This is wrong, just take $f = z e^g$ for any $g in H(CC)$ for instance.
  ],
)

// MC6 - Biholomorphic Equivalence
#flashcard(
  title: "MC6",
  color: blue,
  question: [
    Which $Omega subset CC$ is not biholomorphic to the disk $D = {z in CC : |z| < 1}$?

    + ${z in CC : Re(z) > 1}$

    + $CC$
    + ${z in CC : 0 < Re(z) < Im(z) < 1}$
    + ${z in CC : |z + 2| < 12}$
  ],
  answer: [
    $CC$

    By the Riemann Mapping Theorem.
  ],
)

// Complex Integration - Principal Branch Logarithm
#flashcard(
  title: "Complex Integration",
  color: blue,
  question: [
    Let log be the principal branch of the logarithm. What is the value of $integral_gamma log(z) dif z$ where $gamma : [−π/2,π/2] → CC$ is the curve given by $gamma(t) = e^(i t)$ for $t in [−π/2,π/2]$?

    + $i π$

    + $−2i$
    + $(2−π)i$
    + $i$
  ],
  answer: [
    $−2i$

    $integral_gamma log(z) dif z = − integral_(−π/2)^(π/2) t e^(i t) dif t$

    $= [i t e^(i t)]_(−π/2)^(π/2) − i integral_(−π/2)^(π/2) e^(i t) dif t$

    $= [−e^(i t)]_(−π/2)^(π/2) = −2i$
  ],
)

// Infinite Products Convergence
#flashcard(
  title: "Infinite Products",
  color: blue,
  question: [
    On which open set does the infinite product $product_(n=1)^(+infinity) (1 + z^n)$ define a holomorphic function?

    + ${z in CC | Im(z) > 0}$

    + $D_1(0)$
    + $CC$
    + ${z in CC | 0 < Re(z) < 1}$
  ],
  answer: [
    $D_1(0)$

    We must have $|z| < 1$ for convergence.
  ],
)

// Principal Branch Square Root
#flashcard(
  title: "Square Root Branch",
  color: blue,
  question: [
    Let $U = {z in CC | z ∈ ∉ ]−∞,0]}$ and let $f in H(U)$ be the principal branch of the square root. Which assertion is not true?

    + $f'(z) = 1/(2 f(z))$ for all $z in U$

    + $f$ is injective
    + $f$ defines a conformal equivalence from $U$ to ${z in CC | Re(z) > 0}$
    + $f(i) = (−1 + i)/√2$
  ],
  answer: [
    $f(i) = (−1 + i)/√2$

    Since $((-1 + i)/√2)^2 = -i ≠ i$.
  ],
)

// Holomorphic Functions on Unit Disk
#flashcard(
  title: "Unit Disk Properties",
  color: blue,
  question: [
    Let $f in H(D_1(0))$. Which of the following is true:

    + If $f(0) = 0$ and $f'(0) = 0$, then $f$ is constant

    + The function $f$ is bounded
    + There are only finitely many values of $z$ such that $f(z) = 0$
    + The radius of convergence of the Taylor series of $f$ at $1/2$ is at least $1/4$
  ],
  answer: [
    The radius of convergence of the Taylor series of $f$ at $1/2$ is at least $1/4$

    The radius must be at least the distance to the boundary of the domain.
  ],
)

// Simply Connected Domains
#flashcard(
  title: "Simply Connected",
  color: blue,
  question: [
    Which of the following open sets is simply connected:

    + $U_1 = {z in CC | |z| > 1, −2 < Re(z) < 2, −3 < Im(z) < 4}$

    + $U_2 = {z in CC | z = r e^(i t) "with" r > 0, −π/4 < t < π/4}$
    + $U_3 = {z in CC | z^2 ≠ 1}$
    + $U_4 = {z in CC | Im(z) ≠ 0}$
  ],
  answer: [
    $U_2 = {z in CC | z = r e^(i t) "with" r > 0, −π/4 < t < π/4}$

    This is a sector, which is simply connected.
  ],
)

// Constant Function Conditions
#flashcard(
  title: "Function Constancy",
  color: blue,
  question: [
    Let $f in H(D_1(0))$. Which condition does not imply that $f$ is constant?

    + $|f(z)| ≤ |f(i/2)|$ for all $z in D_1(0)$

    + $integral_gamma (f(w))/((w−1/4)^k) dif w = 0$ for all integers $k ≥ 1$, where $gamma$ is the circle of radius $1/10$ centered at $1/4$
    + $f(i/n) = 1$ for all integers $n ≥ 2$
    + $|f(z)| < 1$ for all $z in D_1(0)$ and $f(0) = f'(0) = 0$
  ],
  answer: [
    $|f(z)| < 1$ for all $z in D_1(0)$ and $f(0) = f'(0) = 0$

    The function $z^2$ satisfies all these conditions but is not constant.
  ],
)

// Primitive Existence
#flashcard(
  title: "Primitive Existence",
  color: blue,
  question: [
    On which open set does the function $f(z) = e^z/(1−z^3)$ have a primitive?

    + $U = CC$

    + $U = {z in CC | z^3 ≠ 1}$
    + $U = {z in CC | Re(z) > 2}$
    + $U = {z in CC | z ∉ ]−∞,0]}$
  ],
  answer: [
    $U = {z in CC | Re(z) > 2}$

    This domain is simply connected and avoids the poles of $f$.
  ],
)

// Complex Derivative Definition
#flashcard(
  title: "Complex Derivative",
  color: green,
  question: [
    What is the limit definition of the derivative of a complex function $f$ at a point $z_0$?
  ],
  answer: [
    The derivative $f'(z_0)$ is defined as the limit, if it exists:

    $f'(z_0) = lim_(z → z_0) (f(z) - f(z_0))/(z - z_0)$

    A function is holomorphic on an open set $U$ if this limit exists for all $z_0 in U$.
  ],
)

// Cauchy-Riemann Equations
#flashcard(
  title: "Cauchy-Riemann Equations",
  color: green,
  question: [
    If $f(x + i y) = u(x,y) + i v(x,y)$, what are the Cauchy-Riemann equations?
  ],
  answer: [
    For $f$ to be holomorphic, its real part $u$ and imaginary part $v$ must be differentiable and satisfy:

    $(partial u)/(partial x) = (partial v)/(partial y)$ and $(partial u)/(partial y) = -(partial v)/(partial x)$
  ],
)

// Line Integral Definition
#flashcard(
  title: "Line Integral",
  color: green,
  question: [
    How do you define the line integral of a function $f$ along a piecewise $C^1$ curve $gamma: [a,b] → CC$?
  ],
  answer: [
    The line integral is defined as:

    $integral_gamma f(z) dif z = integral_a^b f(gamma(t)) gamma'(t) dif t$
  ],
)

// Fundamental Theorem of Calculus
#flashcard(
  title: "Primitive Integration",
  color: green,
  question: [
    If a continuous function $f$ on an open set $U$ has a primitive $F$ (i.e., $F' = f$), what is the value of the integral $integral_gamma f(z) dif z$ for a curve $gamma$ from $z_a$ to $z_b$?
  ],
  answer: [
    The integral depends only on the endpoints:

    $integral_gamma f(z) dif z = F(gamma(b)) - F(gamma(a)) = F(z_b) - F(z_a)$

    If $gamma$ is a closed curve, the integral is 0.
  ],
)

// Cauchy's Integral Formula
#flashcard(
  title: "Cauchy's Integral Formula",
  color: green,
  question: [
    What is Cauchy's Integral Formula?
  ],
  answer: [
    Let $f$ be holomorphic on an open set $U$ and $gamma$ be a positively oriented simple closed curve whose interior is in $U$. For any $z$ inside $gamma$:

    $f(z) = 1/(2π i) integral_gamma (f(w))/(w - z) dif w$
  ],
)

// Cauchy's Formula for Derivatives
#flashcard(
  title: "Cauchy's Derivative Formula",
  color: green,
  question: [
    What is Cauchy's Integral Formula for Derivatives?
  ],
  answer: [
    Under the same conditions as Cauchy's Integral Formula, the $n$-th derivative at $z_0$ is given by:

    $f^((n))(z_0) = (n!)/(2π i) integral_gamma (f(w))/((w - z_0)^(n+1)) dif w$
  ],
)

// Cauchy's Estimates
#flashcard(
  title: "Cauchy's Estimates",
  color: green,
  question: [
    What are Cauchy's Estimates?
  ],
  answer: [
    If $f$ is holomorphic in a disk $D_R(z_0)$ and $|f(z)| ≤ M$ for all $z$ on the circle $|z - z_0| = R$, then:

    $|f^((n))(z_0)| ≤ (n! M)/R^n$
  ],
)

// Liouville's Theorem
#flashcard(
  title: "Liouville's Theorem",
  color: green,
  question: [
    What does Liouville's Theorem state?
  ],
  answer: [
    If a function $f$ is holomorphic on the entire complex plane $CC$ (i.e., it is an entire function) and is bounded, then $f$ must be constant.
  ],
)

// Identity Theorem
#flashcard(
  title: "Identity Theorem",
  color: green,
  question: [
    What is the Principle of Analytic Continuation (or Identity Theorem)?
  ],
  answer: [
    If $U$ is a connected open set, and $f, g in H(U)$ agree on a set of points that has a limit point in $U$, then $f(z) = g(z)$ for all $z in U$.
  ],
)

// Morera's Theorem
#flashcard(
  title: "Morera's Theorem",
  color: green,
  question: [
    What does Morera's Theorem state?
  ],
  answer: [
    If $f$ is a continuous function on an open set $U$ and the integral of $f$ over the boundary of every triangle in $U$ is zero, then $f$ is holomorphic in $U$.
  ],
)

// Simple Pole Residue
#flashcard(
  title: "Simple Pole Residue",
  color: green,
  question: [
    How do you calculate the residue of a function $f$ at a simple pole $z_0$?
  ],
  answer: [
    If $z_0$ is a simple pole, the residue is:

    $"Res"_(z_0)(f) = lim_(z → z_0) (z - z_0) f(z)$
  ],
)

// General Pole Residue
#flashcard(
  title: "General Pole Residue",
  color: green,
  question: [
    What is the general formula for the residue of a function $f$ at a pole of order $k$ at $z_0$?
  ],
  answer: [
    For a pole of order $k ≥ 1$, the residue is:

    $"Res"_(z_0)(f) = 1/((k-1)!) lim_(z → z_0) (dif^(k-1))/(dif z^(k-1)) [(z - z_0)^k f(z)]$
  ],
)

// Residue Theorem
#flashcard(
  title: "Residue Theorem",
  color: green,
  question: [
    What is the Residue Theorem?
  ],
  answer: [
    Let $f$ be holomorphic in a simply connected domain $U$ except for a finite set of isolated singular points ${z_1, ..., z_n}$. For any simple closed curve $gamma$ in $U$ enclosing these points:

    $integral_gamma f(z) dif z = 2π i sum_(k=1)^n "Res"_(z_k)(f)$
  ],
)

// Argument Principle
#flashcard(
  title: "Argument Principle",
  color: green,
  question: [
    What is the formula for the Logarithmic Derivative (Argument Principle)?
  ],
  answer: [
    Let $f$ be a meromorphic function on a domain $U$ with no zeros or poles on a simple closed curve $gamma$. Then:

    $1/(2π i) integral_gamma (f'(z))/(f(z)) dif z = N - P$

    where $N$ is the number of zeros and $P$ is the number of poles of $f$ inside $gamma$, counted with multiplicity.
  ],
)

// Rouché's Theorem
#flashcard(
  title: "Rouché's Theorem",
  color: green,
  question: [
    What does Rouché's Theorem state?
  ],
  answer: [
    Let $f$ and $g$ be holomorphic inside and on a simple closed curve $gamma$. If $|g(z)| < |f(z)|$ for all $z$ on $gamma$, then $f$ and $f + g$ have the same number of zeros inside $gamma$.
  ],
)

// Maximum Modulus Principle
#flashcard(
  title: "Maximum Modulus Principle",
  color: green,
  question: [
    What is the Maximum Modulus Principle?
  ],
  answer: [
    If $f$ is a non-constant holomorphic function on a bounded, connected open set $U$, then $|f|$ cannot attain its maximum value at any point inside $U$. The maximum must occur on the boundary $partial U$.
  ],
)

// Open Mapping Theorem
#flashcard(
  title: "Open Mapping Theorem",
  color: green,
  question: [
    What does the Open Mapping Theorem state?
  ],
  answer: [
    If $f$ is a non-constant holomorphic function on a connected open set $U$, then the image $f(U)$ is also an open set in $CC$.
  ],
)

// Gamma Function Definition
#flashcard(
  title: "Gamma Function",
  color: green,
  question: [
    What is the integral definition of the Gamma function, $Gamma(z)$?
  ],
  answer: [
    For $"Re"(z) > 0$, the Gamma function is defined by the integral:

    $Gamma(z) = integral_0^infinity t^(z-1) e^(-t) dif t$
  ],
)

// Gamma Function Functional Equation
#flashcard(
  title: "Gamma Functional Equation",
  color: green,
  question: [
    What is the fundamental functional equation for the Gamma function?
  ],
  answer: [
    The functional equation is:

    $Gamma(z+1) = z Gamma(z)$
  ],
)


// Euler Product Formula
#flashcard(
  title: "Euler Product Formula",
  color: green,
  question: [
    What is the Euler product formula for the Riemann Zeta function?
  ],
  answer: [
    For $"Re"(s) > 1$, the zeta function can be expressed as a product over all prime numbers $p$:

    $zeta(s) = product_("p prime") 1/(1 - p^(-s))$
  ],
)

// Infinite Products Convergence
#flashcard(
  title: "Infinite Products Holomorphic",
  color: green,
  question: [
    What condition on a sequence of functions $(a_n(z))$ ensures their infinite product defines a holomorphic function?
  ],
  answer: [
    If each $a_n(z)$ is holomorphic on an open set $U$ and the series $sum_(n=1)^infinity |a_n(z)|$ converges uniformly on all compact subsets of $U$, then $f(z) = product_(n=1)^infinity (1 + a_n(z))$ is holomorphic on $U$.
  ],
)

// Homotopy Invariance
#flashcard(
  title: "Homotopy Invariance",
  color: green,
  question: [
    What is the Homotopy Invariance Theorem?
  ],
  answer: [
    If two closed curves $gamma_0$ and $gamma_1$ are homotopic in an open set $U$, then for any function $f$ that is holomorphic in $U$:

    $integral_(gamma_0) f(z) dif z = integral_(gamma_1) f(z) dif z$
  ],
)

// Primitive Existence Condition
#flashcard(
  title: "Primitive Existence",
  color: green,
  question: [
    When does a holomorphic function $f in H(U)$ always have a primitive?
  ],
  answer: [
    A holomorphic function $f$ has a primitive on an open set $U$ if and only if the integral of $f$ over every closed curve in $U$ is zero. This is guaranteed if $U$ is simply connected.
  ],
)

// Winding Number Definition
#flashcard(
  title: "Winding Number",
  color: green,
  question: [
    What is the definition of the winding number of a closed curve $gamma$ around a point $z_0$?
  ],
  answer: [
    The winding number, which counts how many times $gamma$ loops around $z_0$, is given by the integer value:

    $W_gamma(z_0) = 1/(2π i) integral_gamma (dif z)/(z - z_0)$
  ],
)

// General Residue Formula
#flashcard(
  title: "General Residue Formula",
  color: green,
  question: [
    What is the General Residue Formula using winding numbers?
  ],
  answer: [
    Let $f$ be holomorphic on $U$ except for a set of poles $S_f$. For any closed curve $gamma$ in $U \ S_f$ that is null-homotopic in $U$:

    $integral_gamma f(z) dif z = 2π i sum_(z_k in S_f) W_gamma(z_k) "Res"_(z_k)(f)$
  ],
)

// Conformal Equivalence
#flashcard(
  title: "Conformal Equivalence",
  color: green,
  question: [
    What is a conformal equivalence (or biholomorphism)?
  ],
  answer: [
    A conformal equivalence between two open sets $U$ and $V$ is a bijective holomorphic function $f: U → V$. Its inverse $f^(-1)$ is also holomorphic.
  ],
)

// Riemann Mapping Theorem
#flashcard(
  title: "Riemann Mapping Theorem",
  color: green,
  question: [
    What does the Riemann Mapping Theorem state?
  ],
  answer: [
    Every non-empty, simply connected open subset of $CC$ which is not all of $CC$ is conformally equivalent to the open unit disk $D = {z in CC : |z| < 1}$.
  ],
)

// Schwarz's Lemma
#flashcard(
  title: "Schwarz's Lemma",
  color: green,
  question: [
    What does Schwarz's Lemma state?
  ],
  answer: [
    Let $f: D → D$ be a holomorphic map with $f(0) = 0$. Then:

    1. $|f(z)| ≤ |z|$ for all $z in D$
    2. $|f'(0)| ≤ 1$

    Equality holds in either statement if and only if $f(z) = e^(i θ) z$ for some constant $θ in RR$.
  ],
)

// Disk Automorphisms
#flashcard(
  title: "Disk Automorphisms",
  color: green,
  question: [
    What is the general form of an automorphism of the unit disk $D$?
  ],
  answer: [
    Any automorphism $f: D → D$ (a conformal equivalence from the disk to itself) is of the form:

    $f(z) = e^(i θ) (z - a)/(1 - overline(a) z)$

    for some $θ in RR$ and $a in D$.
  ],
)

// Exam Question 2 - Contour Integration
#flashcard(
  title: "Contour Integration Exam",
  color: yellow,
  question: [
    Compute the integral of $f(z) = e^z/(z^2 + 1)$ along the circle of radius 3 centered at $i$, oriented clockwise.
  ],
  answer: [
    *Step 1:* Find singularities: Poles at $z = i$ and $z = -i$ (both simple poles).

    *Step 2:* Check which poles are inside $|z - i| = 3$:
    - For $z = i$: $|i - i| = 0 < 3$ (inside)
    - For $z = -i$: $|-i - i| = |-2i| = 2 < 3$ (inside)

    *Step 3:* Calculate residues:
    - $"Res"_i(f) = lim_(z → i) (z - i) (e^z)/((z - i)(z + i)) = e^i/(2i)$
    - $"Res"_(-i)(f) = lim_(z → -i) (z + i) (e^z)/((z - i)(z + i)) = e^(-i)/(-2i)$

    *Step 4:* Apply residue theorem (clockwise orientation):
    $integral_gamma f(z) dif z = -2π i (e^i/(2i) + e^(-i)/(-2i)) = -2π i (e^i - e^(-i))/(2i) = -2π sin(1)$
  ],
)

// Exam Question 3a - Unit Circle Integral
#flashcard(
  title: "Unit Circle Integral",
  color: yellow,
  question: [
    Compute $integral_gamma 1/((z - a)(z - 1/a)) dif z$ where $gamma$ is the unit circle and $|a| ≠ 1$.
  ],
  answer: [
    The function has simple poles at $z = a$ and $z = 1/a$.

    *Case 1:* $|a| < 1$
    - Only pole $z = a$ is inside unit circle
    - $"Res"_a(f) = 1/(a - 1/a) = a/(a^2 - 1)$
    - Integral: $2π i dot a/(a^2 - 1) = (2π i a)/(a^2 - 1)$

    *Case 2:* $|a| > 1$
    - Only pole $z = 1/a$ is inside unit circle
    - $"Res"_(1/a)(f) = 1/(1/a - a) = a/(1 - a^2)$
    - Integral: $2π i dot a/(1 - a^2) = -(2π i a)/(a^2 - 1)$
  ],
)

// Exam Question 3b - Real Integral Evaluation
#flashcard(
  title: "Real Integral from Contour",
  color: yellow,
  question: [
    Find $integral_0^(2π) 1/(1 + a^2 - 2a cos(t)) dif t$ for $0 < a < 1$.

    *Result from 3a: For $|a| < 1$, we have $integral_(|z|=1) 1/((z-a)(z-1/a)) dif z = (2π i a)/(a^2 - 1)$*
  ],
  answer: [
    *Step 1:* Convert to contour integral using $z = e^(i t)$, $dif t = (dif z)/(i z)$, $cos(t) = (z + 1/z)/2$:

    $integral_0^(2π) 1/(1 + a^2 - 2a cos(t)) dif t = integral_(|z|=1) 1/(1 + a^2 - a(z + 1/z)) dot (dif z)/(i z)$

    *Step 2:* Simplify denominator:
    $1 + a^2 - a(z + 1/z) = (z^2 - (1 + a^2)/a z + 1)/z$

    *Step 3:* Note that $z^2 - (1 + a^2)/a z + 1 = a(z - a)(z - 1/a)$

    *Step 4:* Apply previous result:
    $1/a dot 1/i integral_(|z|=1) 1/((z-a)(z-1/a)) dif z = 1/(a i) dot (2π i a)/(a^2 - 1) = (2π)/(1 - a^2)$
  ],
)

// Exam Question 4a - Holomorphic Function
#flashcard(
  title: "Holomorphic Verification",
  color: yellow,
  question: [
    For $f(z) = e^(i e^(2π i z))$, show it's holomorphic and find its derivative.
  ],
  answer: [
    *Holomorphicity:* $f(z)$ is a composition of entire functions:
    - $z ↦ 2π i z$ (entire)
    - $w ↦ e^w$ (entire)
    - $u ↦ i u$ (entire)
    - $v ↦ e^v$ (entire)

    Therefore $f(z)$ is entire (holomorphic on $CC$).

    *Derivative:* Using chain rule:
    $f'(z) = e^(i e^(2π i z)) dot (i e^(2π i z)) dot (2π i) = -2π e^(2π i z) e^(i e^(2π i z))$
  ],
)

// Exam Question 4b - Bounded on Lines
#flashcard(
  title: "Boundedness on Lines",
  color: yellow,
  question: [
    For $f(z) = e^(i e^(2π i z))$, show $|f(z)|$ is bounded on the lines $"Re"(z) = 0$ and $"Re"(z) = 1$.
  ],
  answer: [
    *On $"Re"(z) = 0$:* Let $z = i y$
    $f(i y) = e^(i e^(2π i dot i y)) = e^(i e^(-2π y))$

    Since $e^(-2π y)$ is real, the exponent $i e^(-2π y)$ is purely imaginary.
    Therefore $|f(i y)| = 1$ (bounded).

    *On $"Re"(z) = 1$:* Let $z = 1 + i y$
    $f(1 + i y) = e^(i e^(2π i(1 + i y))) = e^(i e^(2π i) e^(-2π y)) = e^(i e^(-2π y))$

    Again, $e^(-2π y)$ is real, so the exponent is purely imaginary.
    Therefore $|f(1 + i y)| = 1$ (bounded).
  ],
)

// Exam Question 4c - Unbounded on Strip
#flashcard(
  title: "Unbounded on Strip",
  color: yellow,
  question: [
    For $f(z) = e^(i e^(2π i z))$, show $|f(z)|$ is unbounded on the strip $A = {z in CC : 0 ≤ "Re"(z) ≤ 1}$.
  ],
  answer: [
    Consider the path $z = 3/4 + i y$ within the strip.

    $f(3/4 + i y) = e^(i e^(2π i(3/4 + i y))) = e^(i e^(i 3π/2) e^(-2π y)) = e^(i(-i) e^(-2π y)) = e^(e^(-2π y))$

    Therefore: $|f(3/4 + i y)| = e^(e^(-2π y))$

    As $y → -∞$: $e^(-2π y) → +∞$, so $e^(e^(-2π y)) → +∞$

    Since this path lies within the strip $A$, the function $|f(z)|$ is unbounded on $A$.
  ],
)

// Exam Question 5 - Monotonicity of Integral
#flashcard(
  title: "Integral Monotonicity",
  color: yellow,
  question: [
    Let $f in H(CC)$ be a non-zero entire function. Define $I(r) = integral_0^(2π) |f(r e^(i t))| dif t$. Show that $I(r)$ is non-decreasing on $[0, +∞)$.
  ],
  answer: [
    *Step 1:* For fixed $s > 0$ where $f$ has no zeros on $|z| = s$, define:
    $F(z) = integral_0^(2π) f(z e^(i t)) k(t) dif t$ where $k(t) = (f(s e^(i t)))/|f(s e^(i t))|$
    *Step 2:* $F$ is entire (by Morera's theorem and Fubini).
    *Step 3:* $F(s) = integral_0^(2π) |f(s e^(i t))| dif t = I(s)$
    *Step 4:* For any $z$: $|F(z)| ≤ integral_0^(2π) |f(z e^(i t))| |k(t)| dif t = I(|z|)$
    *Step 5:* By maximum modulus principle, for $s' > s$:
    $|F(s)| ≤ max_(|z|=s') |F(z)| ≤ I(s')$
    *Step 6:* Therefore $I(s) ≤ I(s')$ when $f$ is non-zero on $|z| = s$.
    *Step 7:* Since zeros are isolated, this extends to all $s_1 < s_2$ by continuity.
  ],
)


)

// HS21 Exam Question 2a - Real Integral with Trigonometric Functions
#flashcard(
  title: "Real Integral with cos(3t)",
  color: yellow,
  question: [
    Calculate the real integral $integral_0^(2π) (cos(3t))/(5 - 4cos(t)) dif t$.
  ],
  answer: [
    *Step 1:* Convert to contour integral using $z = e^(i t)$:
    - $dif t = (dif z)/(i z)$, $cos(t) = (z + 1/z)/2$, $cos(3t) = (z^3 + 1/z^3)/2$
    *Step 2:* Transform integral:
    $1/(2i) integral_(|z|=1) (z^3 + 1/z^3)/(5 - 2(z + 1/z)) dot (dif z)/z$
    *Step 3:* Simplify integrand:
    $f(z) = (-2z^3(z^6 + 1))/((z - 2)(z - 1/2))$
    *Step 4:* Find poles inside unit circle:
    - $z = 0$ (order 3), $z = 1/2$ (simple pole)
    *Step 5:* Calculate residues:
    $"Res"_(1/2)(f) = 64/25$,
    $"Res"_0(f) = -21/8$ (using formula for pole of order 3)
    *Step 6:* Apply residue theorem:
    $π("Res"_0 + "Res"_(1/2)) = π(-21/8 + 64/25) = π/12$
  ],
)

// HS21 Exam Question 2b - Improper Real Integral
#flashcard(
  title: "Improper Integral with Even Function",
  color: yellow,
  question: [
    Calculate the integral $integral_0^∞ x^2/(x^4 + x^2 + 1) dif x$.
  ],
  answer: [
    *Step 1:* Use symmetry: $integral_0^∞ f(x) dif x = 1/2 integral_(-∞)^∞ f(x) dif x$
    *Step 2:* Find poles of $f(z) = z^2/(z^4 + z^2 + 1)$:
    Roots of $z^4 + z^2 + 1 = 0$ are non-real sixth roots of unity
    *Step 3:* Poles in upper half-plane:
    - $z_1 = e^(i π/3) = 1/2 + i sqrt(3)/2$
    - $z_2 = e^(i 2π/3) = -1/2 + i sqrt(3)/2$
    *Step 4:* Calculate residues using $"Res"_(z_0) P(z)/Q(z) = P(z_0)/Q'(z_0)$:
    - $"Res"_(z_1)(f) = 1/4 - i sqrt(3)/4$
    - $"Res"_(z_2)(f) = -1/4 - i sqrt(3)/4$
    *Step 5:* Sum residues: $-i sqrt(3)/2$
    *Step 6:* Apply residue theorem:
    $1/2 dot 2π i dot (-i sqrt(3)/2) = (π sqrt(3))/3$
  ],
)

// HS21 Exam Question 2c - Contour Integral
#flashcard(
  title: "Contour Integral on Circle",
  color: yellow,
  question: [
    Calculate $integral_γ (e^(z^2))/(z(z-6)) dif z$ where $γ(t) = 2 + 3e^(2π i t)$.
  ],
  answer: [
    *Step 1:* Analyze contour: Circle centered at $z_0 = 2$ with radius $R = 3$
    *Step 2:* Find poles of $f(z) = (e^(z^2))/(z(z-6))$:
    Simple poles at $z = 0$ and $z = 6$
    *Step 3:* Check which poles are inside:
    - $z = 0$: $|0 - 2| = 2 < 3$ (inside)
    - $z = 6$: $|6 - 2| = 4 > 3$ (outside)
    *Step 4:* Calculate residue at $z = 0$:
    $"Res"_0(f) = lim_(z → 0) z dot (e^(z^2))/(z(z-6)) = (e^0)/(0-6) = -1/6$
    *Step 5:* Apply residue theorem:
    $integral_γ f(z) dif z = 2π i dot (-1/6) = -π i/3$
  ],
)

// HS21 Exam Question 3a - Holomorphic Maps Existence
#flashcard(
  title: "Holomorphic Map: ℂ → 𝔻",
  color: yellow,
  question: [
    Does a non-constant holomorphic map $f: CC → DD$ exist?
  ],
  answer: [
    *Answer:* No.

    *Proof:* A holomorphic map from $CC$ to the bounded unit disk $DD$ would be a bounded entire function. By Liouville's Theorem, any bounded entire function must be constant.

    Therefore, no non-constant holomorphic map $f: CC → DD$ can exist.
  ],
)

// HS21 Exam Question 3b - Upper Half-Plane to Disk
#flashcard(
  title: "Holomorphic Map: ℍ → 𝔻",
  color: yellow,
  question: [
    Does a non-constant holomorphic map $f: HH → DD$ exist?
  ],
  answer: [
    *Answer:* Yes.

    *Example:* The Cayley transform $f(z) = (z - i)/(z + i)$ is a biholomorphism from the upper half-plane $HH$ to the unit disk $DD$.

    This map is:
    - Holomorphic on $HH$
    - Maps $HH$ bijectively onto $DD$
    - Non-constant
  ],
)

// HS21 Exam Question 3c - Complex Plane minus Point
#flashcard(
  title: "Holomorphic Map: ℂ → ℂ\\{i}",
  color: yellow,
  question: [
    Does a non-constant holomorphic map $f: CC → CC without {i}$ exist?
  ],
  answer: [
    *Answer:* Yes.

    *Example:* $f(z) = e^z + i$

    *Explanation:*
    - The range of $e^z$ is $CC without {0}$
    - Therefore, the range of $f(z) = e^z + i$ is $CC without {i}$
    - The function is entire (holomorphic on all of $CC$) and non-constant

    This is consistent with Picard's Little Theorem: an entire function can omit at most one point from its range.
  ],
)

// HS21 Exam Question 3d - Disk to Disk with Derivative Condition
#flashcard(
  title: "Holomorphic Map: 𝔻 → 𝔻 with f'(0)",
  color: yellow,
  question: [
    Does a non-constant holomorphic map $f: DD → DD$ with $f'(0) = 1 + i$ exist?
  ],
  answer: [
    *Answer:* No.

    *Proof:* By Schwarz's Lemma, any holomorphic map $f: DD → DD$ with $f(0) = 0$ must satisfy $|f'(0)| ≤ 1$.

    More generally, for any holomorphic map $f: DD → DD$, we have $|f'(0)| ≤ 1$.

    Here: $|f'(0)| = |1 + i| = sqrt(1^2 + 1^2) = sqrt(2) > 1$

    This contradicts Schwarz's Lemma, so no such map can exist.
  ],
)

// HS21 Exam Question 4a - Laurent Series in Annulus
#flashcard(
  title: "Laurent Series: 0 < |z| < 1",
  color: yellow,
  question: [
    Find the Laurent series for $f(z) = 1/z + 1/(1-z) + 1/(2-z)$ in the annulus $0 < |z| < 1$.
  ],
  answer: [
    *Step 1:* Expand each term using geometric series:
    - $1/z$ (already Laurent term)
    - $1/(1-z) = sum_(n=0)^∞ z^n$ (since $|z| < 1$)
    - $1/(2-z) = 1/2 dot 1/(1-z/2) = 1/2 sum_(n=0)^∞ (z/2)^n$ (since $|z/2| < 1/2 < 1$)

    *Step 2:* Combine series:
    $f(z) = 1/z + sum_(n=0)^∞ z^n + 1/2 sum_(n=0)^∞ (z/2)^n$

    *Step 3:* Simplify:
    $f(z) = 1/z + sum_(n=0)^∞ (1 + 1/(2^(n+1))) z^n$
  ],
)

// HS21 Exam Question 4b - Laurent Series centered at z=1
#flashcard(
  title: "Laurent Series: 0 < |z-1| < 1",
  color: yellow,
  question: [
    Find the Laurent series for $f(z) = 1/z + 1/(1-z) + 1/(2-z)$ in the annulus $0 < |z-1| < 1$.
  ],
  answer: [
    *Step 1:* Center at $z = 1$, let $w = z - 1$:
    - $1/z = 1/(1+w) = sum_(n=0)^∞ (-1)^n w^n$ (since $|w| < 1$)
    - $1/(1-z) = -1/w$ (Laurent term)
    - $1/(2-z) = 1/(1-w) = sum_(n=0)^∞ w^n$ (since $|w| < 1$)

    *Step 2:* Combine in terms of $(z-1)$:
    $f(z) = -1/(z-1) + sum_(n=0)^∞ ((-1)^n + 1)(z-1)^n$

    *Step 3:* Simplify using $(-1)^n + 1 = 2$ when $n$ even, $0$ when $n$ odd:
    $f(z) = -1/(z-1) + 2 sum_(k=0)^∞ (z-1)^(2k)$
  ],
)

// HS21 Exam Question 4c - Laurent Series in outer annulus
#flashcard(
  title: "Laurent Series: 1 < |z-2| < 2",
  color: yellow,
  question: [
    Find the Laurent series for $f(z) = 1/z + 1/(1-z) + 1/(2-z)$ in the annulus $1 < |z-2| < 2$.
  ],
  answer: [
    *Step 1:* Center at $z = 2$, let $w = z - 2$:
    - $1/(2-z) = -1/w$ (Laurent term)
    - $1/z = 1/(2+w) = 1/2 dot 1/(1+w/2) = 1/2 sum_(n=0)^∞ (-1)^n (w/2)^n$ (since $|w/2| < 1$)
    - $1/(1-z) = -1/(1+w) = -1/w sum_(n=0)^∞ (-1/w)^n = sum_(n=0)^∞ (-1)^(n+1) w^(-n-1)$ (since $|1/w| < 1$)

    *Step 2:* Express in terms of $(z-2)$:
    The series combines terms with positive and negative powers of $(z-2)$.

    *Result:* Mixed Laurent series with both positive and negative power terms.
  ],
)

// HS21 Exam Question 5a - Injective Entire Function
#flashcard(
  title: "Injective Entire Function: Part (a)",
  color: yellow,
  question: [
    Let $f: CC → CC$ be injective entire with $f(0) = 0$. Show $|f(z)| ≥ ε$ for $|z| ≥ r > 0$.
  ],
  answer: [
    *Proof:* Use the Open Mapping Theorem and injectivity.

    *Step 1:* Since $f$ is non-constant entire, by the Open Mapping Theorem, $f(B_r(0))$ is an open set.

    *Step 2:* Since $f(0) = 0$, there exists $ε > 0$ such that $B_ε(0) ⊂ f(B_r(0))$.

    *Step 3:* Since $f$ is injective, if $|z| ≥ r$, then $f(z) ∉ f(B_r(0))$.

    *Step 4:* Therefore, $f(z) ∉ B_ε(0)$, which means $|f(z)| ≥ ε$.
  ],
)

// HS21 Exam Question 5b - Pole at Origin
#flashcard(
  title: "Injective Entire Function: Part (b)",
  color: yellow,
  question: [
    Using result from part (a), show $g(z) = f(1/z)$ has a pole at $z = 0$.

    *From part (a): For injective entire $f$ with $f(0) = 0$, we have $|f(z)| ≥ ε$ for $|z| ≥ r > 0$.*
  ],
  answer: [
    *Proof:* Eliminate other types of singularities.

    *Not removable:* If removable, then $lim_(w → ∞) f(w)$ would exist, making $f$ bounded. By Liouville's Theorem, $f$ would be constant, contradicting injectivity.

    *Not essential:* If essential, by Casorati-Weierstrass Theorem, we can find $z_n → 0$ with $g(z_n) → 0$. Setting $w_n = 1/z_n → ∞$, we get $f(w_n) → 0$, contradicting part (a) which shows $|f(w)| ≥ ε$ for large $|w|$.

    *Conclusion:* The singularity must be a pole.
  ],
)

// HS21 Exam Question 5c - Linear Function
#flashcard(
  title: "Injective Entire Function: Part (c)",
  color: yellow,
  question: [
    Using results from parts (a) and (b), show $f(z) = c z$ for some $c ≠ 0$.

    *From part (a): For injective entire $f$ with $f(0) = 0$, we have $|f(z)| ≥ ε$ for $|z| ≥ r > 0$.*

    *From part (b): $g(z) = f(1/z)$ has a pole at $z = 0$.*
  ],
  answer: [
    *Proof:* Use growth estimates and polynomial structure.

    *Step 1:* Since $f(1/z)$ has a pole of order $k ≥ 1$ at $z = 0$, this implies $f(w)$ grows like $|w|^k$ as $|w| → ∞$.
    *Step 2:* By Cauchy's estimates, this growth condition implies that all derivatives $f^((n))(z) = 0$ for $n > k$.
    *Step 3:* Therefore, $f$ is a polynomial of degree $k$.
    *Step 4:* For a polynomial to be injective on $CC$, its degree must be $1$.
    *Step 5:* Since $f(0) = 0$ and $f$ has degree $1$, we have $f(z) = c z$ for some constant $c$.

    *Step 6:* Since $f$ is non-constant, $c ≠ 0$.
  ],
)

// Additional Exam Question 2a - Removable Singularity
#flashcard(
  title: "Removable Singularity Analysis",
  color: yellow,
  question: [
    Let $f(z) = (e^(2i z) - 1 - 2i z)/z^2$. Show $f(z)$ has a removable singularity at $z = 0$.
  ],
  answer: [
    *Step 1:* Expand the numerator as Taylor series around $z = 0$:
    $e^(2i z) - 1 - 2i z = (1 + 2i z + (2i z)^2/2! + (2i z)^3/3! + ...) - 1 - 2i z$
    *Step 2:* Simplify:
    $= (2i)^2/2! z^2 + (2i)^3/3! z^3 + ... = sum_(n=2)^∞ (2i z)^n/n!$
    *Step 3:* Substitute into $f(z)$:
    $f(z) = 1/z^2 sum_(n=2)^∞ (2i z)^n/n! = sum_(n=2)^∞ (2i)^n/n! z^(n-2)$
    *Step 4:* Reindex with $m = n-2$:
    $f(z) = sum_(m=0)^∞ (2i)^(m+2)/(m+2)! z^m = -2 - (4i)/3 z + ...$
    *Conclusion:* Since the Laurent series has no negative powers, the singularity is removable.
  ],
)

// Additional Exam Question 2b - Semicircle Integral Limit
#flashcard(
  title: "Semicircle Integral Limit",
  color: yellow,
  question: [
    For $f(z) = (e^(2i z) - 1 - 2i z)/z^2$ and $gamma_R$ the upper semicircle from $-R$ to $R$, show $lim_(R → ∞) integral_(C_R) f(z) dif z = 2π$.
  ],
  answer: [
    *Step 1:* Rewrite $f(z) = e^(2i z)/z^2 - 1/z^2 - (2i)/z^2$
    *Step 2:* Analyze each integral on semicircle $C_R$:
    *For* $integral_(C_R) e^(2i z)/z^2 dif z$:
    On $C_R$, $|e^(2i z)| = |e^(-2R sin(t))| ≤ 1$
    By ML-inequality: $|integral| ≤ 1/R^2 · π R = π/R → 0$
    *For* $integral_(C_R) -1/z^2 dif z$:
    $= [-1/z]_(-R)^R = -1/R - (-1/(-R)) = 2/R → 0$
    *For* $integral_(C_R) -(2i)/z^2 dif z$:
    Parametrize $z = R e^(i t)$: $integral_0^π -(2i)/(R^2 e^(2i t)) · i R e^(i t) dif t = integral_0^π 2 dif t = 2π$
    *Step 3:* Total limit: $0 + 0 + 2π = 2π$
  ],
)

// Additional Exam Question 2c - Real Integral Deduction
#flashcard(
  title: "Real Integral from Contour",
  color: yellow,
  question: [
    Using the previous results, deduce that $integral_(-∞)^∞ (sin(x)/x)^2 dif x = π$.

    *Given: $lim_(R → ∞) integral_(C_R) f(z) dif z = 2π$ where $f(z) = (e^(2i z) - 1 - 2i z)/z^2$*
  ],
  answer: [
    *Step 1:* Since $f(z)$ is entire (removable singularity), by Cauchy's theorem:
    $integral_(gamma_R) f(z) dif z = integral_(-R)^R f(x) dif x + integral_(C_R) f(z) dif z = 0$
    *Step 2:* Taking limit as $R → ∞$:
    $integral_(-∞)^∞ f(x) dif x + 2π = 0 ⟹ integral_(-∞)^∞ f(x) dif x = -2π$
    *Step 3:* Take real part of the integral:
    $"Re" integral_(-∞)^∞ (e^(2i x) - 1 - 2i x)/x^2 dif x = integral_(-∞)^∞ (cos(2x) - 1)/x^2 dif x = -2π$
    *Step 4:* Use identity $1 - cos(2x) = 2sin^2(x)$:
    $integral_(-∞)^∞ (-2sin^2(x))/x^2 dif x = -2π$
    *Step 5:* Simplify:
    $integral_(-∞)^∞ (sin(x)/x)^2 dif x = π$
  ],
)

// Additional Exam Question 3a - Poles and Orders
#flashcard(
  title: "Poles and Orders Analysis",
  color: yellow,
  question: [
    For $f(z) = 1/(z(z^2-1)cos(i π z/2))$, find all poles and their orders.
  ],
  answer: [
    *Step 1:* Poles occur where the denominator is zero.

    *From* $z(z^2-1) = 0$:
    - Simple poles at $z = 0, 1, -1$

    *From* $cos(i π z/2) = 0$:
    - Need $i π z/2 = π/2 + k π$ for $k ∈ ZZ$
    - This gives $z = -i(2k+1)$ for $k ∈ ZZ$
    - Simple poles at $z = -i, -3i, -5i, i, 3i, 5i, ...$

    *Step 2:* Check orders:
    All factors in denominator are simple (first order), so all poles are of order 1.
    *Final answer:* Simple poles at $z = 0, ±1$ and $z = -i(2k+1)$ for all $k ∈ ZZ$.
  ],
)

// Additional Exam Question 3b - Contour Integral with Winding Numbers
#flashcard(
  title: "Contour Integral with Winding",
  color: yellow,
  question: [
    Compute $integral_γ f(z) dif z$ for $f(z) = 1/(z(z^2-1)cos(i π z/2))$ using winding numbers.

    *Given winding numbers: $W_γ(-1) = +1$, $W_γ(0) = +1$, $W_γ(1) = -1$, $W_γ(i) = +2$*
  ],
  answer: [
    *Step 1:* Calculate residues at relevant poles:

    *At* $z = 0$: $"Res"_0(f) = lim_(z → 0) z · 1/(z(z^2-1)cos(i π z/2)) = 1/((-1)·1) = -1$
    *At* $z = 1$: $"Res"_1(f) = 1/(2·cos(i π/2)) = 1/(2cosh(π/2))$
    *At* $z = -1$: $"Res"_(-1)(f) = 1/((-2)·cos(-i π/2)) = 1/(2cosh(π/2))$
    *At* $z = i$: $"Res"_i(f) = 1/(i(i^2-1)) · 1/(-sin(-π/2)·(i π/2)) = 1/π$

    *Step 2:* Apply generalized residue theorem:
    $integral_γ f(z) dif z = 2π i sum_k W_γ(z_k) "Res"_(z_k)(f)$
    *Step 3:* Calculate:
    $= 2π i [1·(-1) + 1·1/(2cosh(π/2)) + (-1)·1/(2cosh(π/2)) + 2·1/π]$
    $= 2π i [-1 + 2/π] = -2π i + 4i$
  ],
)

// Additional Exam Question 4a - Zero Inside Unit Disk
#flashcard(
  title: "Entire Function with Constant Modulus",
  color: yellow,
  question: [
    Let $f: CC → CC$ be non-constant entire with $|f|$ constant on the unit circle. Prove $f$ must have a zero inside the unit disk $DD$.
  ],
  answer: [
    *Proof by contradiction:*
    *Step 1:* Assume $f(z) ≠ 0$ for all $z ∈ DD$.
    *Step 2:* Then $h(z) = 1/f(z)$ is holomorphic in $DD$.
    *Step 3:* Since $|f(z)| = κ$ (constant) on $|z| = 1$, we have $|h(z)| = 1/κ$ on the boundary.
    *Step 4:* By Maximum Modulus Principle applied to $f$:
    Since $|f|$ achieves its maximum on the boundary, $|f(z)| ≤ κ$ in $DD$.
    *Step 5:* This implies $|h(z)| ≥ 1/κ$ in $DD$.
    *Step 6:* By Maximum Modulus Principle applied to $h$:
    Since $|h|$ achieves its maximum on the boundary, $|h(z)| ≤ 1/κ$ in $DD$.
    *Step 7:* Combining: $|h(z)| = 1/κ$ everywhere in $DD$, so $h$ and $f$ are constant.
    *Contradiction:* $f$ was assumed non-constant.
  ],
)

// Additional Exam Question 4b - Blaschke Factor Construction
#flashcard(
  title: "Blaschke Factor Function",
  color: yellow,
  question: [
    If $z_0$ is the unique zero of order $k$ in $DD$, show $g(z) = f(z) ((z-z_0)/(1-z overline(z_0)))^k$ is constant.
  ],
  answer: [
    *Step 1:* Analyze the Blaschke factor $((z-z_0)/(1-z overline(z_0)))^k$:
    - Has a zero of order $k$ at $z = z_0$
    - On $|z| = 1$: $|z-z_0|/|1-z overline(z_0)| = 1$
    *Step 2:* Since $f(z)$ has a zero of order $k$ at $z_0$, the function $g(z)$ is holomorphic and non-zero in $DD$.
    *Step 3:* On the boundary $|z| = 1$:
    $|g(z)| = |f(z)| · |((z-z_0)/(1-z overline(z_0)))^k| = κ · 1^k = κ$
    *Step 4:* Since $g$ is holomorphic in $DD$ and $|g|$ is constant on the boundary, by Maximum Modulus Principle, $|g|$ must be constant throughout $DD$.
    *Step 5:* A holomorphic function with constant modulus must be constant.
    *Conclusion:* $g(z) ≡ α$ for some constant $α$.
  ],
)

// Additional Exam Question 4c - Linear Form
#flashcard(
  title: "Entire Function Linear Form",
  color: yellow,
  question: [
    Using the previous result, show that $f(z) = α z^k$ for some $α ∈ CC$.
  ],
  answer: [
    *Step 1:* From part (b), we have:
    $g(z) = f(z) ((z-z_0)/(1-z overline(z_0)))^k = α$
    *Step 2:* Therefore:
    $f(z) = α ((1-z overline(z_0))/(z-z_0))^k$
    *Step 3:* Since $f$ is entire, it cannot have poles anywhere in $CC$.
    *Step 4:* The expression $((1-z overline(z_0))/(z-z_0))^k$ has a pole of order $k$ at $z = z_0$ unless this pole is canceled.
    *Step 5:* For $f$ to be entire with no poles, we need $z_0 = 0$.
    *Step 6:* Setting $z_0 = 0$:
    $f(z) = α ((1-0)/(z-0))^k = α z^(-k)$

    But this contradicts $f$ being entire. We need to reconsider the Blaschke factor.

    *Correction:* With $z_0 = 0$: $f(z) = α z^k$.
  ],
)

// Additional Exam Question 5a - Not Removable Singularity
#flashcard(
  title: "Non-removable Singularity",
  color: yellow,
  question: [
    Let $f$ be holomorphic in ${z: 0 < |z| < 2}$ with $f(1/n) = n^2$ and $f(-1/n) = n^3$ for all $n ∈ ZZ^+$. Show 0 is not a removable singularity.
  ],
  answer: [
    *Proof:* A removable singularity requires the function to be bounded in a punctured neighborhood.

    *Step 1:* Consider the sequence $z_n = 1/n → 0$ as $n → ∞$.

    *Step 2:* We have $f(z_n) = f(1/n) = n^2$.

    *Step 3:* Therefore $|f(z_n)| = n^2 → ∞$ as $n → ∞$.

    *Step 4:* Since $f$ is unbounded in every punctured neighborhood of 0, the singularity cannot be removable.

    *Conclusion:* The singularity at $z = 0$ is not removable.
  ],
)

// Additional Exam Question 5b - Essential Singularity
#flashcard(
  title: "Essential Singularity Proof",
  color: yellow,
  question: [
    Using the previous result, show 0 is an essential singularity for the function with $f(1/n) = n^2$ and $f(-1/n) = n^3$.
  ],
  answer: [
    *Step 1:* We know from part (a) that 0 is not removable. We need to show it's not a pole either.
    *Step 2:* Assume for contradiction that $f$ has a pole of order $k ≥ 1$ at $z = 0$.
    *Step 3:* Then $lim_(z → 0) z^k f(z)$ must exist and be a non-zero finite constant.
    *Step 4:* Test along sequence $z_n = 1/n$:
    $lim_(n → ∞) (1/n)^k f(1/n) = lim_(n → ∞) n^(-k) · n^2 = lim_(n → ∞) n^(2-k)$
    For this to be finite and non-zero: $2 - k = 0 ⟹ k = 2$
    *Step 5:* Test along sequence $z_n' = -1/n$:
    $lim_(n → ∞) (-1/n)^k f(-1/n) = lim_(n → ∞) (-1)^k n^(-k) · n^3 = lim_(n → ∞) (-1)^k n^(3-k)$
    For this to be finite and non-zero: $3 - k = 0 ⟹ k = 3$
    *Step 6:* We get $k = 2$ and $k = 3$ simultaneously, which is impossible.
    *Conclusion:* Since 0 is neither removable nor a pole, it must be an essential singularity.
  ],
)

#render-flashcards()
