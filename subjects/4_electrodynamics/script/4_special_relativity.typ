#import "../../../lib/lib.typ": *

= Special Relativity

We will once again work ourselfes up to the basics of special relativity. We remember Galilean transformations and Newtonian physics.

$
  aF = m dot.double(ar)
$

Galinean transformations preserve time and space distances.

== Relativistic distance

$
  Delta s^2 = c^2(t-t') - abs(ax - ax')^2
  dd(s, 2) = c^2 dd(t, 2) - dd(ax, 2)\
  = mat(c dd(t), dd(x^1), dd(x^2), dd(x^3)) mat(1, 0, 0, 0; 0, -1, 0, 0; 0, 0, -1, 0; 0, 0, 0, -1)\
  x^mu = mat(c dd(t); x^1; x^2; x^3)\
  g_(mu nu) = mat(1, 0, 0, 0; 0, -1, 0, 0; 0, 0, -1, 0; 0, 0, 0, -1)\
  dd(s, 2) = g_(mu nu) dd(x^mu) dd(x^nu) = c^2 dd(t, 2) - dd(ax, 2)
$

$dd(s, 2)$ is invariant under Lorentz transformations. This means its the same in all inertial frames. $g_(mu nu)$ is the metrix of the Minkowski space.

$
  x^mu -> x'^mu = Lambda^mu_nu x^nu + c^mu
$

$Lambda^mu_nu$ is the Lorentz transformation matrix. $c^mu$ is a constant vector. They are independent of $x^mu$.

In Einstein summation, we can write:

$
  dd(s, 2) = g_(mu nu) dd(x^mu) dd(x^nu)\
$

This quantity is also called *Proper Time Squared* $dd(s, 2) = dd(tau, 2)$.

We can prove that the above equation:

$
  => x^mu -> x'^mu = Lambda^mu wj_nu x^nu + rho^mu\
$

which is a linear transformation.

$
  ds2 = ds2'\
  => g_(mu nu) dx^mu dx^nu = g_(rho sigma) dx'^rho dx'^sigma\
  = g_(rho sigma) (pdv(x'^rho, x^mu) dx^mu)(pdv(x'^sigma, x^nu) dx^nu)\
  = (g_(rho sigma) pdv(x'^rho, x^mu) pdv(x'^sigma, x^nu)) dx^mu dx^nu\
  => g_(mu nu) pdv(x'^mu, x^rho) pdv(x'^nu, x^sigma) = g_(rho sigma)\
$

Lets differentiate:

$
  pdv(, x^(ea)) [g_(mu nu) pdv(x'^mu, x^rho) pdv(x'^nu, x^sigma)] = pdv(, x^(ea)) g_(rho sigma) = 0\
$

After some comibinations and index changes, we get:

$
  => 2 pdv(x'^mu, x^rho, x^sigma) pdv(x'^nu, x^ea) g_(mu nu) = 0\
$
This resolves to zero because $g$ is just a constant matrix.
$
  dx^mu -> dx'^nu = pdv(x'^nu, x^mu) dx^mu\
$

We expect that there is an inverse. Then:

$
  pdv(x'^nu, x^mu) pdv(x^mu, x'^rho) = delta^(nu rho)\
  => 2 pdv(x'^mu, x^rho, x^sigma) pdv(x'^nu, x^ea) pdv(x^ea, x'^rho) g_(mu nu) = 0\
  => g_(mu nu) pdv(x'^mu, x^rho, x^sigma) = 0\
$

This also uses:

$
  g_(mu nu) dx'^mu dx'^nu = g_(mu nu) dx^rho dx^sigma\
  => g_(mu nu) pdv(x'^mu, x^rho) dx^rho pdv(x'^nu, x^sigma) dx^sigma = g_(mu nu) dx^rho dx^sigma\
  => [g_(mu nu) pdv(x'^mu, x^rho) pdv(x'^nu, x^sigma) - g_(rho sigma)] dx^rho dx^sigma = 0\
  => g_(mu nu) pdv(x'^mu, x^rho) pdv(x'^nu, x^sigma) = g_(rho sigma)\
$

We have proven, that if we go to a new frame, it is linear and constants $Lambda$ and $rho$ do not depend on coordinates.

== Poincare Group

These transformations form a group called the *Poincare group* or *inhomogenious Lorentz group*.

A Group is a set with a product, which is associative, has an identity element and every element has an inverse. The product property is fulfilled by the composition of transformations.

$
  x''^mu = (Lambda_2^mu wj_nu x'^nu + rho_2^mu)\
  = (Lambda_2^mu wj_nu (Lambda_1^nu wj_rho x^rho + rho_1^nu) + rho_2^mu)\
  = Lambda_2^mu wj_nu Lambda_1^nu wj_rho x^rho + Lambda_2^mu wj_nu rho_1^nu + rho_2^mu\
  => Lambda_3^mu wj_rho = Lambda_2^mu wj_nu Lambda_1^nu\
  => rho_3^mu = Lambda_2^mu wj_nu rho_1^nu + rho_2^mu\
  => x''^mu = Lambda_3^mu wj_nu x^nu + rho_3^mu\
$

Now the Lambdas satisfy:

$
  g_(mu nu) overline(Lambda^mu wj_rho) Lambda^nu wj_sigma = g_(rho sigma)\
$

If the above is satisfied by $Lambda_1$ and $Lambda_2$, then it is also satisfied by $Lambda_3$.

$
  g_(mu nu) Lambda_3^mu wj_rho Lambda_3^nu wj_sigma = g_(rho sigma) (Lambda_2^mu wj_alpha Lambda_1^nu wj_rho) (Lambda_2^mu wj_beta Lambda_1^beta wj_sigma)\
  = g_(alpha beta) Lambda_1^alpha wj_rho Lambda_1^beta wj_sigma = g_(rho sigma)\
$

This proves the product rule.

The unity is:

$
  Lambda^mu wj_nu = delta^mu_nu\
  rho^mu = 0\
  => g_(mu nu) delta^mu_rho delta^nu_sigma = g_(rho sigma)\
$

The Poincare group is a group!

== Subgroups

The Poincare group has a subgroup called the *Lorentz group*. This is the set of all transformations with $rho^mu = 0$ (this means no translation).

$
  x^mu -> x'^mu = Lambda^mu wj_nu x^nu\
$

Defining property of the Lambda matrix is:

$
  g_(mu nu) Lambda^mu wj_rho Lambda^nu wj_sigma = g_(rho sigma)\
  det(Lambda^T g Lambda) = det(g)\
  => det(Lambda) = plus.minus 1\
$

The Lambdas $det(Lambda) = 1$ forms a subgroup called the *proper Lorentz group*.

$
  g_(mu nu) Lambda^mu wj_0 Lambda^nu wj_0 = g_(0 0) = 1\
  => (Lambda^0 wj_0)^2 - (Lambda^i wj_0)^2 = 1\
$

We use the convention $mu = 0, 1, 2, 3$, $i= 1, 2, 3$.

$
  => Lambda^0 wj_0 > 1 "or" Lambda^0 wj_0 < -1\
$

The first case is called *time-like* and the second *space-like*. The first one preserves the time direction.

$
  dx'^mu = Lambda^mu wj_nu dx^nu = Lambda^mu wj_0 dx^0\
  => dx'^mu = Lambda^mu wj_0 c dt
  => dt' = Lambda^0 wj_0 c dt\
$

We do not want to reverse the time direction by chooseing other reference frames.

=== Subgroup of the proper Lorentz transformations

$
  det(Lambda) = 1\
  Lambda^0 wj_0 >= 1\
  => (Lambda^0 wj_0)^2 - (Lambda^i wj_0)^2 = g_(0 0) = 1\
  => (Lambda^0 wj_0)^2 >= 1\
$

=== Subgroup of Rotations

$
  RR^T_(3 cprod 3) R_(3 cprod 3) = 1_(3 cprod 3)\
  Lambda^0 wj_0 = mat(1; 0, 0, R)
$

This is a subgroup.

We take two inertial frames $O, O'$.

O: A certain particle is at rest.
O': The same particle is moving with velocity $v$ for $O'$.

What is the connection between

$
  x'^mu = Lambda^mu wj_nu x^nu + rho^mu\
  av = v^i = dv(x'^i, t') = c dv(x'^i, x'^0)\
  dx^nu = {c dt, 0, 0, 0}\
  => dx'^mu = Lambda^mu wj_0 dx^0
$

For $mu = 0$:

$
  dx'^0 = Lambda^0 wj_0 dx^0
$

For $mu = i$:

$
  dx'^i = Lambda^i wj_0 dx^0\
  => v^i/c = Lambda^i wj_0/(Lambda^0 wj_0)\
$

$
  (Lambda^0 wj_0)^2 - (Lambda^i wj_0)^2 = 1\
  => (Lambda^0 wj_0)^2 [1 - Lambda^i wj_0/(Lambda^0 wj_0)] = 1\
  => (Lambda^0 wj_0)^2 [1 - (v^i)^2/c^2] = 1\
  => (Lambda^0 wj_0)^2 = 1/(1 - av^2/c^2)\
  => Lambda^0 wj_0 = gamma = 1/sqrt(1 - av^2/c^2)\
  Lambda^i wj_0 = v^i/c Lambda^0 wj_0\
  => Lambda^i wj_0 = gamma v^i/c\
$

In the simple case of $O, O'$ maintaining parellel axes:

$
  => Lambda^0 wj_i = Lambda^i wj_0 = v^i/c gamma\
  Lambda^i wj_j = delta^i_j + (v^i v^j)/av^2 (gamma - 1)\
  Lambda(av)_(av = 0) = 1\
$

== Time Dilation

Consider a clock at rest in the frame $O$ and moving with velocity $av$ in the frame $O'$.

The proper-time intervall:

$
  ds = mat(c dt, 0, 0, 0)\
  ds' = mat(c dt', dd(ax))\
  => c^2 dt^2 - dd(ax)^2 = c^2 dt'^2 - dd(ax')^2\
  => dt' = dt/sqrt(1 - abs(dd(ax)' /dt')^2)\
  => dt' = gamma dt\
$

For an observer in the frame $O'$, the clock is running slower by exactly:

$
  Delta t' = gamma Delta t = 1/sqrt(1 - av^2/c^2) Delta t\
$

Since light has a frequency, it can function as a clock. The time dilation can be observed by looking at the frequency of light, which also corresponds to its color and energy.

For any moving object, observed from an observer $O'$, the object has a radial component $v_r$ off its velocity $av$.

In frame $O$, where the light is at rest, the light has a frequency $f$ and a wavelength $lambda$.

In frame $O'$, the light has a frequency $f'$ and a wavelength $lambda'$. $omega_0$ is the angular frequency of the light of the moving source.

$
  c Delta t_0 = c Delta t' + v_r Delta t'\
  => Delta t_0 = Delta t' (1 + v_r/c)\
  = gamma (1+v_r/c) Delta t\
  => omega_0 = (2 pi)/(Delta t_0) = omega sqrt(1 - v^2/c^2)/(1 + v_r/c)\
$

The top of the fraction is the relativistic component, the bottom is the classical doppler component.

This allows us to determine how fast objects that emit light move towards or away from us.

== Relativistic Force

We can also define a relativistic force. We have $aF = m dot.double(ar)$. We perform a Lorentz transformation to a different frame $O'$, where $av = 0$.

We introduce a more elegant way that compensates the fact that forces lead to acceleration.

$
  f^mu = m c^2 dv(x^mu, tau, 2)\
  m = "const"
$

$dv(, tau)$ signifies the derivative with respect to proper time $dd(tau, 2) = dd(s, 2)$. This is the 4-vector for the force. Everything besides $x^mu$ is invariant.

$
  f'^mu = m c^2 dv(Lambda^mu wj_nu x^nu + rho^mu, tau, 2)\
  = Lambda^mu wj_nu m c^2 dv(x^nu, tau, 2)\
  => f'^mu = Lambda^mu wj_nu f^nu\
$

At the rest frame $dd(x, 2) = 0 => dd(t, 2) = c^2 dd(t, 2)$. So proper time becomes normal time.

$
  f_("rest")^mu = m dv(x^mu, t, 2)\
  mu = 0 => f_("rest")^0 = m dv(t, t, 2) = 0\
  f_("rest")^i = m dv(x^i, t, 2)\
  => af_("rest") = m dv(ax, tau, 2) = aF_("Newton")\
  => f_("rest")^mu = mat(0; aF_("Newton"))\
$

We transform to another frame $O'$:

$
  f'^mu = Lambda^mu wj_nu f_("rest")^nu\
  f^0 = Lambda^0 wj_nu f_("rest")^nu = Lambda^0 wj_0 f^0_("rest") + Lambda^0 wj_i f_("rest")^i\
  = Lambda^0 wj_i f_("rest")^i\
  = v^i gamma/c f_("rest")^i\
  = gamma (av dot F_("Newton"))/c\
  => f^0 = gamma (av dot F_("Newton"))/c\
  => f^i = Lambda^i wj_mu f_("rest")^mu\
  = Lambda^i wj_0 f^0 + Lambda^i wj_j f_("rest")^j\
  = Lambda^i wj_j f_("rest")^j\
  = delta^i_j + [(gamma -1) (v^i v^j)/v^2] f_("rest")^j\
  = f_("rest")^i + (gamma - 1) v^i/v^2 (av dot f_("rest")^j)\
  => af = F_("Newton") + (gamma - 1) av (av dot F_("Newton"))/v^2\
$

When we write a vector with an arrow, we mean the spacial part $f^i=af, f^mu = mat(f^0, af)^T$.


== Relativistic Time

The Lorentz transformation can not always be inverted. This is because we can not invert $tau(t)$ always. We cannot assume that we have four seperate equations. We take

$
  Omega = g_(mu nu) dv(x^mu, tau) dv(x^nu, tau)
$

This is identical in all reference frames.

$
  f^mu = m dv(x^mu, tau, 2)\
$

If we want to solve this in 4 dimensions, we need to solve the time component. But in the rest frame, the time component is zero.

$
  dv(Omega, tau) = g_(mu nu) dv(x^mu, tau, 2) dv(x^nu, tau) + g_(mu nu) dv(x^mu, tau) dv(x^nu, tau, 2)\
  = 2 g_(mu nu) dv(x^mu, tau, 2) dv(x^nu, tau)\
  = 2/(m c^2) g_(mu nu) (m c^2 dd(x^mu, tau, 2)) dv(x^nu, tau)\
  = 2/(m c^2) g_(mu nu) f^mu dv(x^nu, tau)\
$

Lets compute this in the rest frame:

$
  f_("rest")^mu = mat(0, aF_("Newton"))\
  dv(x^mu, tau) = 1/ (c gamma) dv(x^mu, t)\
  = mat(1; 0)\
  f_("rest")^mu dv(x_("rest")^mu, 2) = 0\
  => g_(mu nu) dv(x^mu, tau) dv(x^nu, tau) = "const"
$

This is one more differential equation with

$
  f^mu = m c^2 dv(x^mu, tau, 2)\
$

This allows us to claculate $x^mu$ not only in relativistic time but also in normal time. This is not very practical, but it is possible.

The generalization of the Lorentz transformation is:

$
  f^mu = m c^2 dv(x^mu, tau, 2)\
$

This transforms exactly like out coordinates.

$
  f'^mu = Lambda^mu wj_nu f^nu\
$

== Momentum

Classically, momentum is defined as:

$
  p^i = m dv(ax^i, t)\
$

In special relativity, it works the same way:

$
  p^mu = m c dv(x^mu, tau)\
$

Where we derive after proper time $tau$.

$
  p'^mu = Lambda^mu wj_nu p^nu\
$

Let's look at each component:

$
  p^0 = m c dv(x^0, tau) = m c dv(t, tau)\
  "recall" dd(tau) = sqrt(c^2 dd(t, 2)) - dd(ax, 2)\
  = c dd(t) sqrt(1- dv(ax, t)^2/c^2)\
  = c dd(t) sqrt(1 - v^2/c^2)\
  => (c dd(t))/gamma = dd(tau)\
  => p^0 = m c^2 dd(t)/(c dd(t)/gamma)\
  => p^0 = m c gamma\
$

The other components are:

$
  p^i = m c dv(x^i, tau)\
  = m c dd(x^i)/(dd(t)) gamma/c\
  => p^i = m gamma dv(x^i, t)\
  => ap = m gamma av\
$

The momentum is a 4-vector.

$
  p^0 = m c (1- v^2/c^2)^(-1/2)\
  approx m c [1 + 1/2 v^2/c^2 + o(v^4)]
  = m c + 1/2 c m v^2 + ...
$

We can see that the second term is the classical kinetic energy.

$
  c p^0 = E_("free particle")
$

Lets solve this for $v^2$ and substitute it into $ap^2$. Then identify $E = c p^0$:

$
  => E^2 = c^2 ap^2 + m^2 c^4
$

THis is the famous *energy-momentum relation*. This can be contrasted against the classical $E = ap^2/(2 m)$ in $c-> infinity$.

All the qualtities we defined so far transform is the same way with $Lambda^mu wj_nu$.

$
  dd(x'^mu) = Lambda^mu wj_nu dd(x^nu)\
  x'^mu = Lambda^mu wj_nu x^nu + rho^mu\
  p^mu = m c dv(x^mu, tau)\
  p'^mu = Lambda^mu wj_nu p^nu\
  f'^mu = Lambda^mu wj_nu f^nu\
$

If an arbitraty object transforms with:

$
  V^mu -> V'^mu = Lambda^mu wj_nu V^nu
$

(like a coordinate intervall), we call it a *contravariant 4-vector*.

== Recap

As a recap, the most important property comes from the invariance of the spacetime interval:

$
  g_(mu nu) Lambda^mu wj_rho Lambda^nu wj_sigma = g_(rho sigma)\
  ds2 = dd(s', 2) = c^2 dd(t', 2) - dd(ax', 2)\
$

The Lorentz transformations are linear transformations of the coordinates of the spacetime and form a group. We call the Proper Lorentz transformations ($det(Lambda) = 1, Lambda^0 wj_0 >= 1$) a "Physical" group:

== Covariant 4-vectors

Some objects naturally want to transform differently. not with $Lambda$, but with $(Lambda^(-1)^mu wj_nu$. They want to transform in the reverse way. They are called *covariant 4-vectors*.

In relativity we have the following types of quantity:

- Covariant vectors
- contravariant vectors
- covariant tensors
- contravariant tensors
- and mixed tensors.

== Vectors and Tensors

We have the metric:

$
  g_(mu nu) = diag(1, -1, -1, -1)\
$

We define the inverse with its defining property:

$
  g^(mu nu) = (g^(-1))_(mu nu)\
  g^(mu rho) g_(rho nu) = delta^mu_nu\
$

It happens, that the inverse of the metric is the metric itself:

$
  g^(mu nu) = g_(mu nu)\
$

Next we will look at the inverse Lorentz transformation. We expect:

$
  Lambda^m1 (av) = Lambda(- av)\
$

We define:

$
  (-Lambda)^mu wj_nu = Lambda_mu wj_nu\
$

This is just a notation to denote the inverse. The inverse of an ovject can be noted by changing the upper to a lower index and vice versa.

$
  Lambda^mu wj_rho Lambda_mu wj^sigma = delta^sigma_rho\
  Lambda_mu wj^nu = g_(mu rho) g^(nu sigma) Lambda^rho wj_sigma\
  Lambda_mu wj^a Lambda_mu wj^b = Lambda^mu wj_sigma (g_(mu rho) g^(beta sigma) Lambda^rho wj_sigma)\
  = g_(beta sigma) (g_(mu rho) Lambda^mu wj_sigma Lambda^rho wj_sigma)\
  = g^(beta sigma) g_(alpha sigma) = delta^beta_alpha\
$

From combining the result with the previous equations

$
  Lambda^0 wj_0 (av) = gamma\
  Lambda^i wj_0 = Lambda^0 wj_i = gamma v^i/c\
  Lambda^i wj_j = delta^i_j + (gamma - 1) (v^i v^j)/av^2\
$

We obtain:

$
  Lambda_mu wj^nu = (Lambda^m1)^mu wj_nu\
  = g_(mu rho) g^(nu sigma) Lambda^rho wj_sigma\
  Lambda_0 wj^0 = g_(0 rho) g^(0 sigma) Lambda^rho wj_sigma = g_(0 0) g^(0 0) Lambda^0 wj_0 = 1\
  => Lambda_0 wj^0 = Lambda^0 wj_0 = gamma (av) = gamma (-av)\
$

Lets look at a more complex component:

$
  Lambda_3 wj^0 = g_(3 rho) g^(0 sigma) Lambda^rho wj_sigma\
  => Lambda_3 wj^0 = Lambda^3 wj_0\
  => Lambda_3 wj^0 = - Lambda^3 wj_0 = - (gamma v^3/c)\
  => Lambda_3 wj^0 (av) = Lambda^0 wj_3 (-av)\
  Lambda_i wj^0 = - Lambda^i wj_0 = Lambda^i wj_0 (-av)\
  Lambda_i wj^j = Lambda^i wj_j\
  = delta^i wj_j + (gamma(av) -1) (v^i v^j)/v^2\
  = delta^i wj_j + (gamma(-av) -1) (-v^i + -v^j)/(-v^2)\
  => Lambda_i wj^j (av) = Lambda^i wj_j (-av)\
$

We conclude:

$
  Lambda_mu wj^nu = (Lambda^m1)^mu wj_nu = g_(mu rho) g^(nu sigma) Lambda^rho wj_sigma\
  = Lambda^mu wj_nu (-av)\
$

So the inverse Lorentz transformation is equivalent to boosting in the opposite velocity.

Let's see what objects transfrom with the inverse Lorentz transformation. We have the derivative:

$
  pdv(, x^mu) -> pdv(, x'^nu) = pdv(x^rho, x'^mu) pdv(, x^rho)\
  = Lambda_mu wj_rho pdv(, x^rho)\
$

Let's justify this:

$
  delta^mu_nu = pdv(x'^mu, x'^nu)\
  = pdv(x'^mu, x^rho) pdv(x^rho, x'^nu)\
  "recall" (dd(x'^mu = Lambda^mu wj_nu dd(x^rho)))\
  = Lambda_mu wj_rho pdv(x^rho, x'^nu)\
  => Lambda_mu wj^alpha Lambda^mu wj_rho pdv(x^rho, x'^nu)\
  => Lambda_nu wj^alpha = delta^alpha_rho pdv(x^rho, x'^nu)\
  => pdv(, x^mu) -> pdv(, x'^nu) = Lambda_mu wj^rho pdv(, x^rho)\
$

The derivative likes to transform with the inverse Lorentz transformation.

This is the opposite of:

$
  dd(x^mu) -> dd(x'^mu) = Lambda^mu wj_nu dd(x^nu)\
$

Every object $underline(U_mu)$:

$
  U_mu -> U'_mu = Lambda_mu wj^nu U_nu
$

is called *covariant vector*.

Covariant vectors have a contravariant dual. In special relativity the dual can be derived like this:

$
  V_mu = g_(mu nu) V^nu\
$

Proof:

$
  V_mu -> V'_mu = g_(mu nu) V'^nu\
  = g_(mu nu) Lambda^nu wj_rho V^rho\
  = g_(mu nu) Lambda^nu wj_rho (g^(rho sigma) V_sigma)\
  = (g^(rho sigma) g_(mu nu) Lambda^nu wj_rho) V_sigma\
  = Lambda_mu wj_sigma V_sigma\
  => V_mu -> V'_mu = Lambda_mu wj_sigma V_sigma\
$

In summary: In special relativity we have coordinates that like to transform with the Lorentz transformation and objects like derivatives that like to transform with the inverse Lorentz transformation. For every covariant vector there is a dual contravariant vector and vice versa and the transformation is the inverse of the original transformation.

$
  V_mu = g_(mu nu) V^nu\
  V^mu = g^(mu nu) V_nu\
$

== Tensors

Tensors hold more than one index

$
  T^(mu_1 mu_2) = T^(mu_1 mu_2) = Lambda^(mu_1) wj_(nu_1) Lambda^(mu_2) wj_(nu_2) T^(nu_1 nu_2)\
  T'_(mu_1 mu_2) = Lambda_(mu_1) wj^(nu_1) Lambda_(mu_2) wj^(nu_2) T_(nu_1 nu_2)\
  T'^(mu_1 mu_2) wj_(nu_1 nu_2) = T^(alpha_1 alpha_2) wj_(alpha_3 alpha_4) Lambda^(mu_1) wj_(alpha_1) Lambda^(mu_2) wj_(alpha_2) Lambda_(nu_1) wj^(alpha_3) Lambda_(nu_2) wj^(alpha_4)\
$

This tells you how to transform a tensor with two contravariant indices and two covariant indices. The transformation is the same as for the coordinates.

Objects are invariant under Lorentz transformations. The action $S$ is an example of an invariant object.

We have to define the *scalar product*:

$
  A dot B = A_mu B^mu\
  = g_(mu nu) A^mu B^nu\
  = g^(mu nu) A_mu B_nu\
  A dot B -> A' dot B' = A'_mu B'^mu\
  = A_mu Lambda_mu wj^nu Lambda^mu wj_rho B^rho = A_nu delta^nu_rho B^rho = A dot B\
$

The Dalembert operator is invariant in every inertial frame:

$
  partial_mu = pdv(, x^mu)\
  partial^mu = g^(mu nu) partial_nu\
  = g^(mu nu) pdv(, x^nu) = pdv(, x_mu)\
  partial_mu = mat(1/c pdv(, t), pdv(, x^1), pdv(, x^2), pdv(, x^3))\
  = mat (1/c pdv(, t), anabla)\
  partial^mu = g^(mu nu) partial_nu = mat(1/c pdv(, t), -anabla)\
$

For a contravariant differential we differentiate with respect to a covariant vector and vice versa. The derivative of a covariant vector is a contravariant vector and vice versa.

$
  partial^2 = partial_mu partial^mu\
  = ... = 1/c^2 pdv(, t, 2) - anabla^2 = wave\
  partial'^2 = partial_rho Lambda_mu wj^rho Lambda^mu wj_sigma partial^sigma\
  = ... = partial^2
$

The Dalembert operator is invariant under Lorentz transformations. This means that the wave equation is invariant under Lorentz transformations.

== Currents and Densities of Electric Charges

We will formulate a 4-vector, that combines the charge density and the current density and can be transformed with the Lorentz transformation.

$
  rho(ax, t) = sum_n q_n delta^((3)) (ax - ar_n (t))\
  aJ(ax, t) = sum_n q_n dv(ar_n, t) delta^((3)) (ax - ar_n (t))\
  J^mu (x^mu) = sum_n q_n dv(x^mu, t) delta^((3)) (x^mu - ar_n (t))\
$

Let's go through the components:

$
  J^0 (x^mu) = sum_n q_n dv((c t), t) delta^((3)) (x^mu - ar_n (t))\
  = c sum_n q_n delta^((3)) (x^mu - ar_n (t))\
  => J^0 = c rho\
  J^i (x^mu) = sum_n q_n dv(x^i, t) delta^((3)) (x^mu - ar_n (t))\
  = sum_n q_n dv(r_n^i, t) delta^((3)) (x^mu 9- ar_n (t))\
  => J^mu = mat(c rho; aJ)
$

We will show, that this transforms like a 4-vector:

$
  J^mu = sum_n q_n dv(x^mu, t) delta^((3)) (ax^mu - ar_n (t))\
  = sum_n q_n integral dd(t') dv(x^mu, t') delta^((3)) (ax^mu - ar_n (t')) delta(c t' - c t) c\
  x^mu = mat(c t', ax)\
  => J^mu = c sum_n q_n integral dd(t') dv(x^mu, t') delta^((4)) (x^mu - r^mu_n (t'))\
  r^mu (t'): r^i = r^i (t'), r^0 = c t'\
  => delta^((4)) (U^mu) -> delta^((4)) (U'^mu) = delta^((4)) (Lambda^mu wj_nu U^nu)\
  = (delta^((4)) (U^nu))/(det(Lambda) = 1) = delta^((4)) (U^nu)\
  "also" c dd(t) = dd(tau) gamma\
  => c dv(t', t') = c dv(tau, tau)
  => J^mu = c sum_n q_n integral dd(tau) dv(x^mu, tau) delta^((4)) (x^mu - r^mu_n (tau))\
  => J^mu -> J'^mu = Lambda^mu wj_nu J^nu\
$

== Energy-Momentum Tensor

Here we will formulate the analogue of the charge density and current density for energy and momentum. This is called the *Energy-Momentum Tensor*.

Assume particles with $P_n^mu = m_n gamma dv(r^mu_n, t)$.

$
  p^0_n = m_n c gamma\
  ap_n = m_n gamma av_n\
$

Energy density:

$
  sum_n P_n^0 delta^((3)) (ax - ar_n (t))\
$

Energy current density:

$
  sum_n P_n^0 dv(ar_n, t) delta^((3)) (ax - ar_n (t))\
$

We can combine these two into a unified 4-vector:

$
  sum_n P_n^mu dv(r_n^nu, t) delta^((3)) (ax - ar_n (t))\
$

Now lets add the momentum for density and current density. For this we will generalize:

$
  T^(mu nu) = sum_n P_n^mu dv(r_n^nu, t) delta^((3)) (ax - ar_n (t))\
$

$nu = mu = 0$ gives us the energy density. $mu = 1, nu = 0$ we get the energy current density in the $x^1$ direction. $mu = 1, nu = 1$ gives us the momentum density in the $x^1$ direction. $mu = 3, nu = 2$ gives us the momentum current density in the $x^3$ direction (dont forget the factor $c$ for the time component).


#image("image.png")

It can also be written as an integral over proper time:

$
  T^(mu nu) = sum_n integral dd(tau) P_n^mu dv(x^nu, tau) delta^((4)) (x^rho - r^rho_n (tau))\
$

In this form, we see, that it is a contravariant tensor of rank 2.

$
  T'^(mu nu) = Lambda^mu wj_rho Lambda^nu wj_sigma T^(rho sigma)\
$

The energy-momentum tensor is symmetric:

$
  dv(x^nu, tau) = m c dv(x^nu, tau)\
  -> delta -> m_n c dv(r_n^nu, tau) 1/(m_n c)\
  = P_n^nu 1/(m_n c)\
  = P_n^nu 1/E_n gamma\
$

Put this into the definition of the energy-momentum tensor:

$
  T^(mu nu) = sum_n P_n^mu P_n^nu 1/E_n gamma delta^((3)) (ax - ar_n (t))\
  = integral dd(tau) P_n^mu P_n^nu 1/E_n delta^((4)) (x^rho - r^rho_n (tau))\
  = T^(nu mu)\
$

We can see, that the energy-momentum tensor is symmetric. This is a consequence of the fact, that the energy and momentum are conserved.

We can use densities and currents for other quantities, like energy-momentum, angular momentum, spin, temperature, etc. The energy-momentum tensor is the most important one.

We can prove, that the tensor is conserved with index notation. Lets look at the continuity equation:

$
  partial_mu J^mu = partial_0 J^0 + partial_i J^i\
  partial_0 = pdv(, x^0) = 1/c pdv(, t)\
  partial_i = pdv(, x^i)\
  (partial_i) = anabla\
  => 1/c pdv(, t) (c rho) + anabla dot aJ\
  => pdv(rho, t) + anabla dot aJ = partial_mu J^mu\
$

Lets show, that this is zero:

$
  partial_i J^i = pdv(, x^i) (sum_n q_n dv(ar_n^i, t) delta^((3)) (ax - ar_n (t)))\
  = sum_n q_n dv(ar_n^i, t) pdv(, x^i) delta^((3)) (ax - ar_n (t))\
  "remember" pdv(, x^i) delta^((3)) (ax - ar_n (t)) = - pdv(, ar_n^i) delta^((3)) (ax - ar_n (t))\
  => partial_i J^i = - sum_n q_n dv(ar_n^i, t) pdv(, ar_n^i) delta^((3)) (ax - ar_n (t))\
  = - sum_n q_n pdv(, t) delta^((3)) (ax - ar_n (t))\
  = - pdv(, t) (sum_n q_n delta^((3)) (ax - ar_n (t)))\
  = - pdv(, t) rho(ax, t)\
  => partial_i J^i = - pdv(, t) rho(ax, t)\
  => pdv(rho, t) + anabla dot aJ = 0\
  => partial_mu J^mu = 0\
$

We will perform analogue calculations for the energy-momentum tensor:

== Conservation of the Energy-Momentum Tensor

$
  T^(mu nu) = sum_n P_n^mu pdv(r_n^nu, t) delta^((3)) (ax - ar_n (t))\
$

What is $partial_nu T^(mu nu)$? We will see, that it is often zero.

$
  pdv(, x^i) T^(mu i) = pdv(, x^i) (sum_n P_n^mu pdv(r_n^i, t) delta^((3)) (ax - ar_n (t)))\
  = sum_n P_n^mu pdv(r_n^i, t) pdv(, x^i) delta^((3)) (ax - ar_n (t))\
  = sum_n P_n^mu pdv(r_n^i, t) (- pdv(, ar_n^i) delta^((3)) (ax - ar_n (t)))\
  = - pdv(, t) (sum_n P_n^mu delta^((3)) (ax - ar_n (t))) + sum_n pdv(P_n^mu, t) delta^((3)) (ax - ar_n (t))\
  = - pdv(, t) T^(mu 0) + sum_n pdv(P_n^mu, t) delta^((3)) (ax - ar_n (t))\
  => pdv(T^(mu 0), t) + pdv(, x^i) T^(mu i)\
  = sum_n pdv(P_n^mu, t) delta^((3)) (ax - ar_n (t))\
  => partial_nu T^(mu nu) = sum_n pdv(P_n^mu, t) delta^((3)) (ax - ar_n (t))\
$

For free particles, the momentum is conserved:

$
  pdv(P_n^mu, t) = 0\
$

Lets assume, that particles interact and change momenta only when they meet at collision points. Assume collisions conserve momentum. Let $G$ be force density.

$
  G^mu = sum_n pdv(P_n^mu, t) delta^((3)) (ax - ar_n (t))\
  = sum_("collisions") delta(ax - ax_("collisions")) pdv(P_n^mu, t)\
  = sum_n pdv(, t) P_n^mu\
  = sum_("col") delta (ax - ax_("col")) pdv(, t) (sum_(n in "col") P_n^mu)\
  = 0
  => partial_nu T^(mu nu) = 0\
$

In summary:

$
  partial_nu T^(mu nu) = G^mu = 0 "often"\
$

$
  partial_nu T^(mu nu) = 0\
  => pdv(, x^0) T^(mu 0) + pdv(, x^i) T^(mu i) = 0\
  => 1/c pdv(, t) integral dd(ax, 3) T^(mu 0) + integral dd(ax, 3) pdv(, x^i) T^(mu i) = 0\
  => P^mu = integral dd(ax, 3) T^(mu 0) = "const"\
  P^mu = integral dd(ax, 3) sum_n P_n^mu pdv(r_n^0, t) delta^((3)) (ax - ar_n (t))\
  = integral dd(ax, 3) sum_n P_n^mu delta^((3)) (ax - ar_n (t))\
  = sum_n P_n^mu = "momentum of all particles"\
$

This implies, that the momentum of all particles is conserved.


== Electrodynamics as a relativistic Theory

$c = e0 = 1$.

Maxwell's equations:

$
  anabla dot aE = rho\
  anabla cross aE + pdv(aB, t) = 0
  anabla dot aB = 0\
  anabla cross aB - pdv(aE, t) = aJ
$

Define a 4x4 matrix:

$
  F^(mu nu) = mat(0, -E^1, -E^2, -E^3; E^1, 0, -B^3, B^2; E^2, B^3, 0, -B^1; E^3, -B^2, B^1, 0)\
$

In short:

$
  F^(i 0) = -E^i\
  F^(i, j) = - epsilon_(i j k) B^k\
$

This matrix is called the *electromagnetic field strength tensor*. It is a contravariant tensor of rank 2.

$
  B^i = -1/2 epsilon^(i j k) F^(j k)\
$

Maxwell's equations can be written in a more compact form:

$
  partial_mu F^(mu nu) = J^nu\
  partial_mu F^(mu 0) = J^0 = rho\
  => partial_0 = F^(0 0) + partial_i F^(i 0) = rho\
  => partial_i F^(i 0) = rho\
  => partial_i E^i = rho => (anabla dot aE = rho)\
  partial_mu F^(mu i) = J^i\
  => partial_0 F^(0 i) + partial_j F^(j i) = J^i\
  => - pdv(E^i, t) + partial_j (epsilon^(j i k) B^k) = J^i\
  => - pdv(E^i, t) + epsilon^(i j k) partial_j B^k = J^i\
  => - pdv(E^i, t) + (anabla cross aB)^i = J^i\
  => anabla cross aB + pdv(aE, t) = aJ\
$

The other two equations are also satisfied. Lets look at the 4-vector potential:

$
  A^mu = mat(Phi, A^1, A^2, A^3)\
  => F^(mu nu) = partial^mu A^nu - partial^nu A^mu\
  aE 0 = - anabla Phi - pdv(aA, t)\
  E^i = - partial_i Phi - partial_0 A^i\
  => F^(i 0) partial^i A^0 - partial^0 A^i\
  partial_mu = mat(pdv(, t, anabla))\
  partial^mu = mat(pdv(, t), -anabla)\
  => F^(i j) = partial^i A^j - partial^j A^i\
  = -1/2 epsilon^(i j k) B^k\
$

Summary:

$
  F^(mu nu) = partial^mu A^nu - partial^nu A^mu\
  partial_mu F^(mu nu) = J^nu\
$

In a new frame:

$
  partial'_mu F'^(mu nu) = J'^nu\
  => partial_rho Lambda_mu wj^rho Lambda^mu wj_sigma F^(sigma nu) = Lambda^nu wj_kappa J^kappa\
  Lambda^nu wj_kappa partial_rho F^(rho kappa)\
  = lambda^nu wj_kappa J^kappa\
  => partial_rho F^(rho nu) = J^nu
$

We can now define the electromagnetic 4-force:

$
  f^mu = q F^(mu nu) dv(x_nu, tau)\
$

=== Summary

$
  A^mu = mat(Phi, aA) "contravariant"\
  A^mu -> A'^mu = Lambda^mu wj_nu A^nu\
  F^(mu nu) = partial^mu A^nu - partial^nu A^mu\
$

We also derived the Maxwell equations in a more compact form:

$
  partial_mu F^(mu nu) = J^nu\
$

== Gauge Invariance

$
  A^mu -> A'^mu = A^mu + partial^mu Chi\
  F^(mu nu) -> F'^(mu nu) = partial^mu A'^nu - partial^nu A'^mu\
  = partial^mu (A^nu + partial^nu Chi) - partial^nu (A^mu + partial^mu Chi)\
  = partial^mu A^nu - partial^nu A^mu = F^(mu nu)\
  A'^mu = A^mu + partial^mu Chi\
  mu = 0 => Phi' = Phi + pdv(Chi, t)\
  mu = i => A'^i = A^i + partial^i Chi = A^i - partial_i Chi\
  => aA' = aA - anabla Chi\
$

Lortenz force in a relativistic transformation:

$
  f^mu = F^(mu nu) dv(x_nu, tau)\
  mu = i => f^i = q F^(i nu) dv(x_nu, tau)\
  = q (F^(i 0) dv(x_0, tau) + F^(i j) dv(x_j, tau))\
  dd(tau) = dd(t)/gamma\
  = gamma q (F^(i 0) dv(x_0, t) - F^(i j) dv(x^j, t))\
$

The minus sign originates from bringing the index up.

$
  = gamma q (E^i - (-epsilon^(i j k) B^k) v^j)\
  = gamma q (E^i + (av cross aB)^i)\
$

This is the Lorentz force caused by the electromagnetic field in a relativistic transformation.

$
  dv(x_nu, tau) = g_(nu mu) dv(x^mu, tau)\
$

Lets look at what the energy-momentum tensor is for a system of particles. For a system of EM fields and particles, we have:

$
  partial_nu T^(mu nu) = G^mu\
  G^mu = sum_n pdv(P_n^mu, t) delta^((3)) (ax - ar_n (t))\
  = sum_n dv(tau, t) pdv(P_n^mu, tau) delta^((3)) (ax - ar_n (t))\
  = sum_n dv(tau, t) f_n^mu delta^((3)) (ax - ar_n (t))\
  G^mu = sum_n dv(tau, t) q_n F^(mu nu) dv(x_nu, tau) delta^((3)) (ax - ar_n (tau))\
  = F^(mu nu) sum_n q_n dv(tau, t) dv(x_nu, tau) delta^((3)) (ax - ar_n (tau))\
  = F^(mu nu) sum_n q_n dv(x_nu, t) delta^((3)) (ax - ar_n (t))\
  = F^(mu nu) J_nu\
  => partial_nu T^(mu nu) = F^(mu nu) J_nu\
$

The right hand side is a total derivative. We have a solution:

$
  T_("em")^(mu nu) = F^(mu rho) F^(rho nu) + 1/4 g^(mu nu) F_(rho sigma) F^(rho sigma)\
$

This is the energy-momentum tensor of the electromagnetic field. It is symmetric and traceless. It is also gauge invariant. The energy-momentum tensor of the electromagnetic field is conserved.

$
  partial_nu T_("em")^(mu nu) = - partial_nu T_("em")^(nu mu)\
  => partial_nu (T^(mu nu) + T_("em")^(mu nu)) = 0\
$

A continuity equation.

We can define:

$
  Theta^(mu nu) = T^(mu nu) + T_("em")^(mu nu)\
  = sum_n (P_n^mu P_n^nu)/E_n delta^((3)) (ax - ar_n (t)) + F^(mu rho) F_rho wj^nu + 1/4 g^(mu nu) F_(rho sigma) F^(rho sigma)\
  partial_nu Theta^(mu nu) = 0\
$

The first term is charges and the second term is the electromagnetic field. This is the total energy-momentum tensor of the system.

What is really conserved is the total energy-momentum tensor:

$
  P^mu = integral dd(ax, 3) Theta^(mu 0)\
  = sum_n P_n^mu + integral dd(ax, 3) F_("em")^(mu 0)\
  = P_("charges")^mu + P_("em")^mu\
$

We call $P_("em")^mu$ the momentum of the electromagnetic field.

$
  P_("em")^mu = integral dd(ax, 3) T_("em")^(mu 0)\
$

$
  mu = 0 => P_("em")^0 = integral dd(ax, 3) T_("em")^(0 0)\
$

Where $T_("em")^(0 0)$ is the energy density of the electromagnetic field.
$
  = F^(0 rho) F_rho wj^0 + 1/4 g^(0 0) F_(rho sigma) F^(rho sigma)\
  = (aE^2 + aB^2)/2
$

This is positive definite. The electromagnetic field has positive energy density.

$
  P_("em")^i = integral dd(ax, 3) T_("em")^(i 0)\
  T_("em")^(i 0) = S^i = (aE cross aB)^i\
$

This vector is called the *Poynting vector*. It describes the energy flux of the electromagnetic field. The Poynting vector is a 3-vector. It's nothing else than the 3-momentum density of the electromagnetic field.

Lets go back to:

$
  partial_nu T_("em")^(mu nu) = - F^(mu nu) J_nu\
  mu = 0 => partial_nu T_("em")^(0 nu) = - F^(0 nu) J_nu\
  => partial_0 T_("em")^(0 0) + partial_i T_("em")^(0 i)\
  = - F^(0 0) J_0 - F^(0 i) J_i\
  => pdv(, t) omega + anabla dot S\
  omega = T_("em")^(0 0) = (aE^2 + aB^2)/2\
  S^i = T_("em")^(0 i) = (aE cross aB)^i\
$

The electromagnetic field carries energy and momentum.

$
  omega = T_("em")^(0 0) = (aE^2 + aB^2)/2\
  aS = T_("em")^(0 i) = (aE cross aB)^i\
$

When added to the energy and momentum of the electrical charges, it is conserved.




















