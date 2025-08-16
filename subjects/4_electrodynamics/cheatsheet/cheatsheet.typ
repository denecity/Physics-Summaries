#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Elektrodynamik Cheatsheet",
  author: "Denis Titov",
  language: "GER",
)

// Define color scheme for different topics
#let maxwell-color = rgb("#E3F2FD")     // Light blue for Maxwell equations
#let electro-color = rgb("#FFF3E0")     // Light orange for electrostatics
#let magneto-color = rgb("#E8F5E8")     // Light green for magnetostatics
#let waves-color = rgb("#F3E5F5")       // Light purple for waves
#let relativity-color = rgb("#FFF8E1")  // Light yellow for relativity
#let matter-color = rgb("#FCE4EC")      // Light pink for matter
#let math-color = rgb("#F1F8E9")        // Light lime for math/vector analysis

= Maxwell-Gleichungen

#rect(fill: maxwell-color, width: 100%, inset: 8pt)[
#definition[Maxwell-Gleichungen (Vakuum)][
  $anabla dot aE = rho/epsilon_0$, $anabla dot aB = 0$
  $anabla times aE + (diff aB)/(diff t) = 0$, $anabla times aB - mu_0 epsilon_0 (diff aE)/(diff t) = mu_0 vec(j)$
  
  Kontinuitätsgleichung: $partial_t rho + anabla dot vec(j) = 0$
  
  Lichtgeschwindigkeit: $c^2 = 1/(mu_0 epsilon_0)$
]
]

#rect(fill: maxwell-color, width: 100%, inset: 8pt)[
#definition[Lorentz-Kraft][
  $aF = q(aE + arrow(v) times aB)$
]
]

#rect(fill: maxwell-color, width: 100%, inset: 8pt)[
#definition[Induktionsgesetz][
  $Delta U_(partial A) = -(diff Psi)/(diff t)$, wobei $Psi = integral_(A) aB dot d arrow(A)$
]
]

= Vektoranalysis

#rect(fill: math-color, width: 100%, inset: 8pt)[
#definition[Wichtige Sätze][
  Gauss: $integral_V anabla dot aF d V = integral_(partial V) aF dot d arrow(sigma)$
  
  Stokes: $integral_(partial S) arrow(f) dot d arrow(s) = integral_S anabla times arrow(f) dot d arrow(A)$
  
  Green'sche Identitäten:
  $integral_V (phi Delta psi + anabla phi dot anabla psi) = integral_(partial V) phi anabla psi dot arrow(n) d x$
  
  $integral_V (phi Delta psi - psi Delta phi) = integral_(partial V) (phi anabla psi - psi anabla phi) dot arrow(n) d y$
]
]

#rect(fill: math-color, width: 100%, inset: 8pt)[
#definition[Vektoridentitäten][
  $anabla times (anabla F) = 0$, $anabla dot (anabla times arrow(A)) = 0$
  
  $anabla times (anabla times arrow(A)) = anabla(anabla dot arrow(A)) - Delta arrow(A)$
  
  $anabla dot (F arrow(A)) = (anabla F) dot arrow(A) + F anabla dot arrow(A)$
  
  Grassmann: $arrow(a) times (arrow(b) times arrow(c)) = (arrow(a) dot arrow(c))arrow(b) - (arrow(a) dot arrow(b))arrow(c)$
  
  Spatprodukt: $arrow(a) dot (arrow(b) times arrow(c)) = arrow(b) dot (arrow(c) times arrow(a)) = arrow(c) dot (arrow(a) times arrow(b))$
  
  $(arrow(a) times arrow(b)) dot (arrow(c) times arrow(d)) = (arrow(a) dot arrow(c))(arrow(b) dot arrow(d)) - (arrow(a) dot arrow(d))(arrow(b) dot arrow(c))$
]
]

#rect(fill: math-color, width: 100%, inset: 8pt)[
#definition[Levi-Civita-Symbol][
  $(arrow(A) times arrow(B))_k = epsilon_(i j k) A_i B_j$
  
  $sum_(i=1)^3 epsilon_(i j k) epsilon_(i l m) = delta_(j l) delta_(k m) - delta_(j m) delta_(k l)$
  
  $sum_(i,j=1)^3 1/2 epsilon_(i j k) epsilon_(i j l) = delta_(k l)$
]
]

#rect(fill: math-color, width: 100%, inset: 8pt)[
#definition[Delta-Distribution][
  $-Delta 1/||arrow(x)|| = 4pi delta^3(arrow(x))$
  
  $integral_(-infinity)^(+infinity) (d omega)/(2pi) e^(i omega t) = delta(t)$
]
]

= Elektrostatik

#rect(fill: electro-color, width: 100%, inset: 8pt)[
#definition[Coulomb-Kraft][
  $arrow(F)_i = sum_(j=1, j != i)^N (q_i q_j (arrow(x)_i - arrow(x)_j))/(4pi epsilon_0 ||arrow(x)_i - arrow(x)_j||^3)$
]
]

#rect(fill: electro-color, width: 100%, inset: 8pt)[
#definition[Potential][
  Kontinuierlich: $phi(arrow(x)) = integral d y^3 rho(arrow(y))/(4pi epsilon_0 ||arrow(x) - arrow(y)||)$
  
  Diskret: $phi(arrow(x)) = sum_(i=1)^N q_i/(4pi epsilon_0 ||arrow(x) - arrow(x)_i||)$
  
  Für $aE$ gilt: $aE = -anabla phi(arrow(x))$
]
]

#rect(fill: electro-color, width: 100%, inset: 8pt)[
#definition[Poisson-Gleichung][
  $-Delta phi(arrow(x)) = rho(arrow(x))/epsilon_0$
]
]

#rect(fill: electro-color, width: 100%, inset: 8pt)[
#definition[Energie][
  Diskret: $W = sum_(i != j=1)^N (q_i q_j)/(8pi epsilon_0 ||arrow(x)_i - arrow(x)_j||)$
  
  Kontinuierlich: $W = integral d arrow(x)^3 integral d arrow(y)^3 (rho(arrow(x))rho(arrow(y)))/(8pi epsilon_0 ||arrow(x) - arrow(y)||)$
  
  $W = -1/2 epsilon_0 integral d arrow(x)^3 Delta phi(arrow(x)) phi(arrow(x)) = 1/2 epsilon_0 integral d arrow(x)^3 aE^2$
]
]

#rect(fill: electro-color, width: 100%, inset: 8pt)[
#definition[Kugelkoordinaten][
  $r = sqrt(x^2 + y^2 + z^2)$, $theta = arccos(z/r)$, $phi = arctan(y/x) + pi Theta(-x) "sign"(y)$
  
  $x = r sin theta cos phi$, $y = r sin theta sin phi$, $z = r cos theta$
  
  $Delta = (partial^2)/(partial r^2) + 2/r (partial)/(partial r) + 1/r^2 [(partial^2)/(partial theta^2) + cot theta (partial)/(partial theta) + 1/(sin^2 theta) (partial^2)/(partial phi^2)]$
]
]

#rect(fill: electro-color, width: 100%, inset: 8pt)[
#definition[Multipolentwicklung][
  $1/||arrow(x) - arrow(x)'|| = sum_(l=0)^infinity (r'^l)/(r^(l+1)) P_l(cos gamma)$ für $r' < r$
  
  Multipolmomente: $Q_(l,m) = integral d r' r'^(l+2) Y_(l,m)^*(theta', phi') rho(r', theta', phi')$
  
  $phi(arrow(x)) = (1)/(4pi epsilon_0) sum_(l,m) Q_(l,m) (2l+1)/(r^(l+1)) Y_(l,m)(theta, phi)$
]
]

#rect(fill: electro-color, width: 100%, inset: 8pt)[
#definition[Dipol][
  Monopol: $Q = integral d arrow(x)^3 rho(arrow(x))$
  
  Dipol: $arrow(P) = integral d arrow(x)^3 rho(arrow(x)) arrow(x)$
  
  Quadrupol: $R_(i j) = integral d arrow(x)^3 rho(arrow(x))(3x_i x_j - delta_(i j) arrow(x)^2)$
  
  $phi(arrow(x)) = Q/(4pi epsilon_0 ||arrow(x)||) + (arrow(P) dot arrow(x))/(4pi epsilon_0 ||arrow(x)||^3) + sum_(i,j=1)^3 R_(i j) (x_i x_j)/(4pi epsilon_0 ||arrow(x)||^5) + ...$
]
]

= Randwertprobleme

#rect(fill: electro-color, width: 100%, inset: 8pt)[
#definition[Green'sche Funktion][
  Eigenschaften von $G(arrow(x), arrow(y))$:
  $Delta_x G(arrow(x), arrow(y)) = -delta^3(arrow(x) - arrow(y))$, $Delta_y G(arrow(x), arrow(y)) = -delta^3(arrow(x) - arrow(y))$
  
  Symmetrisch: $G(arrow(x), arrow(y)) = G(arrow(y), arrow(x))$
]
]

#rect(fill: electro-color, width: 100%, inset: 8pt)[
#definition[Dirichlet-Randbedingung][
  $Delta phi = 0$, $phi = omega$ für $arrow(x) in partial V$
  
  $G(arrow(x), arrow(y)) = 0$ falls $arrow(y) in partial V$, $arrow(n) dot anabla_y G(arrow(x), arrow(y)) = -delta^2(arrow(x) - arrow(y))$ falls $arrow(x), arrow(y) in partial V$
]
]

#rect(fill: electro-color, width: 100%, inset: 8pt)[
#definition[Neumann-Randbedingung][
  $Delta phi = 0$, $-arrow(n) dot anabla phi = nu$ für $arrow(x) in partial V$
  
  $arrow(n) dot anabla_y G(arrow(x), arrow(y)) = -F(arrow(y))$ für $arrow(y) in partial V$, wobei $integral_(partial V) d arrow(y)^2 F(arrow(y)) = 1$
]
]

#rect(fill: electro-color, width: 100%, inset: 8pt)[
#definition[Potential durch Green][
  $phi(arrow(x)) = 1/epsilon_0 integral_V d arrow(y)^3 G(arrow(x), arrow(y)) rho(arrow(y))$ falls $arrow(x) in.not partial V$
  
  $- integral_(partial V) d arrow(y)^2 arrow(n) dot anabla_y G(arrow(x), arrow(y)) omega(arrow(y)) - integral_(partial V) d arrow(y)^2 G(arrow(x), arrow(y)) nu(arrow(y))$
]
]

#rect(fill: electro-color, width: 100%, inset: 8pt)[
#definition[Beispiele][
  Punktladung $V = RR^3$: $G(arrow(x), arrow(y)) = 1/(4pi ||arrow(x) - arrow(y)||)$
  
  Halbraum $V = {(x,y,z) | z > 0}$: $G(arrow(x), arrow(y)) = 1/(4pi epsilon_0) [1/(||arrow(x) - arrow(y)||) - 1/(||arrow(x) - arrow(y)'||)]$
  
  Kugel $V =$ Außenraum leitende Kugel: $G(arrow(x), arrow(y)) = -1/(4pi) [1/(||arrow(x)||) times ||arrow(y)||/(||arrow(x) - arrow(y)'||)]$ mit $arrow(y)' = ||arrow(y)||^2/arrow(y)$, $alpha = ||arrow(y)||/R^2$
]
]

= Magnetostatik

#rect(fill: magneto-color, width: 100%, inset: 8pt)[
#definition[Biot-Savart-Gesetz][
  Stromschleife: $aB(arrow(x)) = (mu_0 I)/(4pi) integral_C (d arrow(y) times (arrow(x) - arrow(y)))/(||arrow(x) - arrow(y)||^3)$
  
  Stromdichte: $aB(arrow(x)) = (mu_0)/(4pi) integral d arrow(y)^3 (vec(j)(arrow(y)) times (arrow(x) - arrow(y)))/(||arrow(x) - arrow(y)||^3)$
]

#definition[Vektorpotential][
  $aB = anabla times arrow(A)$, $arrow(A)(arrow(x)) = (mu_0)/(4pi) integral d arrow(y)^3 vec(j)(arrow(y))/(||arrow(x) - arrow(y)||)$
]

#definition[Eichtransformation][
  Falls $aB = anabla times arrow(A) => aB = anabla times arrow(A)'$ mit $arrow(A)' = arrow(A) + anabla Lambda$
  
  Coulomb-Eichung: $anabla dot arrow(A) = 0$
  
  Axiale Eichung: $arrow(n) dot arrow(A) = 0$, $arrow(n)$ fest
]

#definition[Poisson-Gleichung für Coulomb-Eichung][
  $Delta arrow(A) = -mu_0 vec(j)$ Lösung wie in Elektrostatik.
]

#definition[Feldenergie][
  $W = 1/2 integral d arrow(x)^3 integral d arrow(y)^3 (mu_0 vec(j)(arrow(x)) dot vec(j)(arrow(y)))/(4pi ||arrow(x) - arrow(y)||) = 1/(2mu_0) integral d arrow(x)^3 aB^2$
  
  $W = 1/2 integral d arrow(x)^3 arrow(A)(arrow(x)) dot vec(j)(arrow(x))$
]

#definition[Approximation Vektorpotential][
  Taylor von $arrow(A)$ in $arrow(x)$ bei $anabla dot vec(j) = 0$ liefert:
  
  $arrow(A)(arrow(x)) = (mu_0)/(4pi) integral d arrow(y)^3 vec(j)(arrow(y))/(||arrow(x) - arrow(y)||) + ... approx (mu_0)/(4pi ||arrow(x)||^3) arrow(m) times arrow(x)$
  
  Dipolmoment: $arrow(m) = 1/2 integral d arrow(x)^3 arrow(x) times vec(j)$ allgemein
  
  $arrow(m) = I dot arrow(A)$ für $I$ um Fläche $A$
]

#definition[Kraft und Drehmoment][
  Kraft: $aF = integral d arrow(x)^3 vec(j) times aB$
  
  Drehmoment diskret: $d aF = I d arrow(x) times aB(arrow(x))$
  
  kontinuierlich: $arrow(M) = integral d arrow(x)^3 arrow(x) times (vec(j)(arrow(x)) times aB(arrow(x)))$
  
  Ampère-Gesetz: $aF = I integral_C d arrow(x) times aB(arrow(x))$
]

#definition[Magnetisches Dipolmoment][
  $arrow(M) = arrow(m) times aB$
]

= Stromkreise

#definition[Spule][
  $aB = (mu_0 N I)/l arrow(e)_z$, $W = (pi mu_0 R^2 N^2 I^2)/(2l)$, $U = -N dot(Psi)$
]

#definition[Induktivität][
  $dot(Psi) U_1 = -L_12 dot(I)_2$, $L_12 = (pi mu_0 R^2 N_1 N_2)/l$, $L = (pi mu_0 R^2 N^2)/l$
  
  $W = sum_(j,k) 1/2 L_(k j) I_j I_k$
]

#definition[Stromkreise][
  $U = R I$, $U = L dot(I)$, $dot(U) = Q/C$
  
  Impedanzen: $Z_R = R$, $Z_L = i omega L$, $Z_C = 1/(i omega C)$
]

#definition[Kapazitätskonstanten][
  $phi(arrow(x)) = sum_(i=1)^N U_i Gamma_i(arrow(x))$ mit $Gamma_i(arrow(x)) = delta_(i j)$ für $arrow(x) in partial L_j$ wobei $L_j$ ein Leiter.
  
  $W = 1/2 sum_(i,j=1)^N C_(i j) U_i U_j$ mit $C_(i j) = epsilon_0 integral_L d arrow(x)^3 anabla Gamma_i dot anabla Gamma_j$
  
  $W = 1/2 epsilon_0 integral_L d arrow(x)^3 anabla dot (phi anabla phi) = 1/2 sum_(i=1)^N U_i Q_i$ mit $Q_i = sum_(j=1)^N C_(i j) U_j$
]

= Erhaltungsgrößen & Symmetrien

#definition[Ladungserhaltung][
  $partial_t rho + anabla dot vec(j) = 0 => Q(t) = "const"$
]

#definition[Satz von Poynting][
  $partial_t w + anabla dot arrow(S) = -aE dot vec(j)$ mit $w$ Energiedichte, $arrow(S) = 1/mu_0 aE times aB$
]

#definition[Maxwellscher Spannungstensor][
  $anabla dot aB = "const" =>$ Maxwellscher Spannungstensor
  
  $T_(j k) = epsilon_0 (E_j E_k - 1/2 delta_(j k) aE^2) + 1/mu_0 (B_j B_k - 1/2 delta_(j k) aB^2)$
  
  Impuls: $dot(arrow(pi)) + arrow(f) = anabla dot arrow(T) <=> partial_t pi_k + f_k = sum_(j=1)^3 partial_j T_(j k)$
  
  Impuls: $arrow(pi) = epsilon_0 mu_0 arrow(S)$, $arrow(f)$ Kraftdichte, $arrow(T)$ Spannungstensor
]

= Statik in Materie

#definition[Elektrische Verschiebung][
  $arrow(D) = epsilon_0 aE + arrow(P) = epsilon aE$ mit $epsilon = epsilon_0 epsilon_r$, $epsilon_r = 1 + chi_e$
  
  Grenzflächen stetige Felder: $D_⟂$, $E_||$, $B_⟂$, $H_||$
]

#definition[Magnetische Verschiebung][
  Materie mit Magnetisierung $arrow(M)$:
  $aB = mu_0 (arrow(H) + arrow(M)) = mu arrow(H)$ mit $mu = mu_0 mu_r$, $mu_r = 1 + chi_m$
]

#definition[Maxwell-Gleichungen in Materie][
  $anabla dot arrow(D) = rho_"frei"$, $anabla dot aB = 0$
  
  $anabla times arrow(H) - partial_t arrow(D) = vec(j)_"frei"$, $anabla times aE + partial_t aB = 0$
  
  Energie und Impuls: $w = 1/2 arrow(H) dot aB + 1/2 aE dot arrow(D)$, $arrow(pi) = arrow(D) times aB$
  
  $T_(i j) = D_i E_j + B_i H_j - 1/2 delta_(i j) (aE dot arrow(D) + arrow(H) dot aB)$
  
  Poynting-Vektor: $arrow(S) = aE times arrow(H)$
]

#definition[Ohmsches Gesetz][
  $vec(j) = sigma aE$
]

#definition[Telegraphengleichung][
  Tritt an stelle der Wellengleichung falls $vec(j) = sigma aE$:
  $Delta aE - mu epsilon partial_t^2 aE - mu mu_0 sigma partial_t aE = 0$
  
  mit $-k^2 + omega^2/c^2 + i omega mu_0 sigma = 0$
]

= Spezielle Relativitätstheorie

#definition[Lorentz-Transformation][
  $Lambda$ ist Lorentzt. $<=> Lambda eta Lambda^T = eta <=> eta_(rho sigma) Lambda^mu_rho Lambda^nu_sigma = eta^(mu nu)$
  
  mit $eta = "diag"(-1, +1, +1, +1)$
  
  Boost: $Lambda^mu_rho = mat(gamma, gamma arrow(beta)^T; gamma arrow(beta), bb(1)_3 + gamma^2 arrow(beta) arrow(beta)^T/(1+gamma))$
  
  $gamma = 1/sqrt(1 - arrow(beta)^2)$, $arrow(beta) = arrow(v)/c$
]

#definition[Boost in x][
  $Lambda_x = mat(gamma, gamma beta_x; gamma beta_x, gamma)$, $Lambda_(2D) = mat(gamma, gamma beta_x, 0; gamma beta_x, gamma, 0; 0, 0, 1)$
]

#definition[Additionstheorem][
  $Lambda(arrow(v)) = Lambda(arrow(v)_1) Lambda(arrow(v)_2)$
  
  $v = (v_1 + v_2)/(1 + v_1 v_2/c^2)$ für $arrow(v) || arrow(v)_1 || arrow(v)_2$
]

#definition[Feldtransformationen][
  E-Feld: $aE' = gamma aE + gamma arrow(v) times aB - gamma^2/(c^2(1+gamma)) (aE dot arrow(v)) arrow(v)$
  
  B-Feld: $aB' = gamma aB - gamma/c^2 arrow(v) times aE - gamma^2/(c^2(1+gamma)) (aB dot arrow(v)) arrow(v)$
]

#definition[Ableitung Transformation][
  Sei $x'^nu = Lambda^nu_mu x^mu$ es gilt $partial/(partial x'^mu) psi(arrow(x)(arrow(x)')) = Lambda^nu_mu partial/(partial x^nu) psi(arrow(x))$
  
  also folgt $partial'_mu = Lambda^nu_mu partial_nu$
]

#definition[Vierer-Vektoren][
  Ort: $x^mu = (c t, arrow(x))$, Impuls: $p^mu = m/(sqrt(1-v^2/c^2)) partial/(partial tau) arrow(x)(t)$
  
  falls $v = "const" => p^mu = m gamma (c, arrow(v))$
]

#definition[MWG][
  $eta^(mu nu) partial_mu F_(nu rho) = mu_0 J_rho$ Sym.: $F_(mu nu) = -F_(nu mu)$
  
  hom. MWG: $partial_mu F_(nu rho) + partial_nu F_(rho mu) + partial_rho F_(mu nu) = 0$
  
  Potentiale: $phi(arrow(x), t) = q/(4pi epsilon_0 r_k)$, $arrow(A)(arrow(x), t) = (mu_0 q arrow(v))/(4pi r_k)$
  
  wobei: $r(arrow(x), t) = ||arrow(x) - arrow(y)(s)||$, $arrow(n)(arrow(x), t) = (arrow(x) - arrow(y)(s))/r$
  
  $arrow(v) = dot(arrow(y))(s)$, $k(arrow(x), t) = 1 - (arrow(n) dot arrow(v))/c$, $t' = s(arrow(x), t)$
  
  Felder $aE, aB$: Ableitungen $partial s/partial t = 1/k$, $partial s/partial arrow(x) = -arrow(n)/(c k)$
]

#definition[Energie-Impuls-Tensor][
  $T^(mu nu) = -1/mu_0 [F^(mu rho) F^nu_(space rho) + 1/4 eta^(mu nu) F_(rho sigma) F^(rho sigma)]$
  
  $T^00 = -1/2 epsilon_0 aE^2 - 1/(2mu_0) aB^2$
  
  $T^(0i) = T^(i 0) = 1/c S_i = 1/(mu_0 c) epsilon_(i j k) E_j B_k$, $forall i, j >= 1$
  
  $T^(i j) = T^(j i) = epsilon_0 (E_i E_j - 1/2 delta_(i j) aE^2) + 1/mu_0 (B_i B_j - 1/2 delta_(i j) aB^2)$
  
  Eigenschaften: $"tr"(T^(mu nu)) = 0$ $T^(mu nu) = T^(nu mu)$,
  
  Kontinuitätsgl.: $partial^mu T_(mu nu) = -J_rho F^rho_(space nu)$
]

#definition[Lorentz-Kraft][
  $K^mu = -q/m F^(mu nu) p_nu$
  
  Leistung: $c dot(p)_0 = q aE dot arrow(v) = arrow(v) dot arrow(p)$
]

= Wellengleichung

#definition[Anfangswertproblem][
  Quellefrei: Wir fordern $rho = 0, vec(j) = 0 => square aE = square aB = 0$.
  
  für ein Skalarfeld $psi$ mit $square psi = 0$ und Anfangsbedingungen $psi(arrow(x), 0) = psi_0(arrow(x))$, $partial_t psi(arrow(x), 0) = dot(psi)_0(arrow(x))$ erhalten wir als Lösung:
  
  $psi(arrow(x), t) = integral d arrow(y)^3 (partial_t D(arrow(x) - arrow(y)) psi_0(arrow(y)) + D(arrow(x) - arrow(y), t) dot(psi)_0(arrow(y)))$
  
  für $D$ gilt: $square D = 0$, $D(arrow(x), 0) = 0$, $partial_t D(arrow(x), 0) = delta^3(arrow(x))$
  
  $D(arrow(x), t) = cases(delta(r - c t)/(4pi r), t >= 0, -delta(r + c t)/(4pi r), t <= 0)$
]

#definition[Lösung mit Quellen][
  skalares Feld $psi$ für welches $square psi = -rho$ gelten soll. Wir erhalten:
  
  $psi(arrow(x), t) = integral d arrow(y)^3 integral d s G(arrow(x) - arrow(y), t - s) rho(arrow(y), s) + psi_"hom"(arrow(x), t)$
  
  für $G$ gilt: $square G = -delta^3(arrow(x)) delta(t)$ wir wählen
  
  $G = G_"ret" = D$, $t >= 0 => G_"ret"(arrow(x), t) = delta(r - c t)/(4pi r)$
]

#definition[Retardierte Potentiale][
  in der Lorentzeichung gilt $square phi = -rho/epsilon_0$, $square arrow(A) = -mu_0 vec(j)$
  
  letzter Abschnitt impliziert: $phi(arrow(x), t) = 1/(4pi epsilon_0) integral d arrow(y)^3 rho(arrow(y), t - ||arrow(x) - arrow(y)||/c)/||arrow(x) - arrow(y)||$
  
  $arrow(A)(arrow(x), t) = mu_0/(4pi) integral d arrow(y)^3 vec(j)(arrow(y), t - ||arrow(x) - arrow(y)||/c)/||arrow(x) - arrow(y)||$
]

#definition[Freie Wellengleichung][
  Lösung für freie Felder: falls $rho = 0, vec(j) = 0 => square aE = 0, square aB = 0$
  
  Monochromat. Welle: $aE = "Re"(arrow(E)_0 e^(i arrow(k) dot arrow(x) - i omega t))$, $arrow(B)_0 = omega/k times arrow(E)_0$
  
  $psi(arrow(x), t) = A_0 exp(i arrow(k) dot arrow(x) - i omega t) => square psi = 0$
  
  es gilt $anabla psi = i arrow(k) psi$, $partial_t psi = -i omega psi$, $omega^2 = c^2 arrow(k)^2$
  
  reell: $psi(arrow(x), t) = B_1 cos(arrow(k) dot arrow(x) - omega t) + B_2 sin(arrow(k) dot arrow(x) - omega t)$
  
  Linearkombinationen: $square Psi_i = 0$ $forall i => square sum_i Psi_i = 0$
]

#definition[Kugelwelle][
  $Psi(arrow(x), t) = 1/r psi(r, t)$
  
  Wellen-GL: $square Psi = 0 <=> (partial_r^2 - 1/c^2 partial_t^2) psi(r, t) = 0$
  
  Monochromatisch: $Psi prop 1/r exp(i arrow(k) dot arrow(x) - i omega t)$
  
  Energie, Impuls: $w prop 1/r^2$, $arrow(S) prop 1/r^2 arrow(n)$, $arrow(pi) = 1/c^2 arrow(S)$
]

= Erzeugung El.-Mag. Wellen

#definition[Inhomogene MWG][
  $-square phi - partial_t 1/c^2 (partial_t phi + anabla dot arrow(A))/epsilon_0 = rho/epsilon_0$
  
  $-square arrow(A) + anabla 1/c^2 (partial_t phi + anabla dot arrow(A)) = mu_0 vec(j)$
]

#definition[Coulomb-Eichung][
  $anabla dot arrow(A) = 0 => Delta phi = -rho/epsilon_0$, $-square arrow(A) + anabla 1/c^2 partial_t phi = mu_0 vec(j)$
]

#definition[Lorentz-Eichung][
  $anabla dot arrow(A) + 1/c^2 partial_t phi = 0 => -square phi = rho/epsilon_0$, $-square arrow(A) = mu_0 vec(j)$
]

#definition[Eichtrafos][
  $aB = anabla times arrow(A)$, $aE = -anabla phi - partial_t arrow(A)$
  
  $arrow(A)' = arrow(A) + anabla Lambda$, $phi' = phi - partial_t Lambda$ sind äquivalent.
]

#definition[Strahlung oszillierender Ströme][
  für statische $arrow(F)(arrow(x))$ gilt $F(arrow(x), t) = "Re"(arrow(F)(arrow(x)) e^(-i omega t))$
  
  für $arrow(A)$ folgt: $arrow(A)(arrow(x)) = arrow(A)_"as"(arrow(x)) + O(e^(i k r)/r^2)$ mit
  
  $arrow(A)_"as"(arrow(x)) = integral d arrow(y)^3 (mu_0 vec(j)(arrow(y)))/(4pi r) e^(i k r - i arrow(k) dot arrow(y))$ wobei $k = omega/c$
  
  $aE, aB$: $aB = i k times arrow(A) + O(e^(i k r)/r^2)$
  
  $aE = i k/c (arrow(A) - arrow(n)(arrow(n) dot arrow(A))) + O(e^(i k r)/r^3)$, $arrow(n) = arrow(x)/||arrow(x)||$
  
  Energie, Imp: $angle.l w angle.r = k^2/(2mu_0) (||arrow(A)||^2 - |arrow(n) dot arrow(A)|^2) + O(1/r^2)$
  
  $angle.l arrow(S) angle.r = 1/(2mu_0) "Re"(aE times aB^*) = c arrow(n) angle.l w angle.r + O(1/r^3)$
  
  $angle.l arrow(T) angle.r = -arrow(n) arrow(n)^T angle.l w angle.r + O(1/r^3)$
]

#definition[Leistung][
  $P = integral d^2 Omega r^2 arrow(n) dot arrow(S) = (c k^2 r^2)/(2mu_0) integral d^2 Omega (||arrow(A)_"as"||^2 - |arrow(n) dot arrow(A)_"as"|^2)$
  
  $arrow(n) dot arrow(S) = (c k^2 r^2)/(2mu_0) (||arrow(A)_"as"||^2 - |arrow(n) dot arrow(A)_"as"|^2) + O(1/r)$
]

#definition[Streuquerschnitt][
  $(d^2 sigma)/(d^2 Omega) = r^2 (d^2 P_"aus"/"d"^2 Omega)/(d^2 P_"ein"/"d"^2 Omega)$
]

#definition[Strahlung Multipol][
  Taylor von $arrow(A)_"as"(arrow(x))$ führt zu:
  
  $arrow(A)_"as"(arrow(x)) = (mu_0 e^(i k r))/(4pi r) (-i k c arrow(P) - i k arrow(M) times arrow(n) - 1/6 k^2 c arrow(R) arrow(n) + ...)$
  
  wobei $arrow(P)$ Dipol, $arrow(M)$ mag. Dipol, $arrow(R)$ el. Quadrupol
]

#definition[Beschleunigte Punktladung][
  Strahlungszone $d << r << lambda => arrow(A) approx integral d arrow(y)^3 (mu_0 vec(j)(arrow(y)))/(4pi ||arrow(x) - arrow(y)||)$
]

#definition[Beispiel: Dipol][
  $arrow(A)_"as"(arrow(x)) = (-i k c mu_0)/(4pi r) arrow(P) e^(i k r)$
]

= Elektrodynamik in Materie

#definition[Maxwellgl. in Materie][
  $anabla dot arrow(D) = rho_"frei"$, $anabla dot aB = 0$
  
  $anabla times arrow(H) - partial_t arrow(D) = vec(j)_"frei"$, $anabla times aE + partial_t aB = 0$
  
  Impuls, Energie: $w = 1/2 arrow(H) dot aB + 1/2 aE dot arrow(D)$, $arrow(pi) = arrow(D) times aB$
  
  $T_(i j) = D_i E_j + B_i H_j - 1/2 delta_(i j) (aE dot arrow(D) + arrow(H) dot aB)$
  
  Poynting-Vektor: $arrow(S) = aE times arrow(H)$
]

#definition[H, D Felder][
  $arrow(D) = epsilon aE = epsilon_r epsilon_0 aE$, $aB = mu arrow(H) = mu_r mu_0 arrow(H)$
  
  Brechungsindex: $c' = c/n$, mit $n = sqrt(mu_r epsilon_r)$
]

#definition[Dispersion][
  $D(omega) = epsilon_0 epsilon_r E(omega)$
  
  $||arrow(k)|| = omega n(omega)/c <=> omega = omega(||arrow(k)||)$
]

= Wellenoptik

#definition[Fraunhofer-Beugung][
  $psi(arrow(x)) prop k(cos alpha_1 - cos alpha_2) (e^(i k(r_1 + r_2)))/(r_1 r_2) integral d arrow(y)^2 e^(i k(arrow(e)_1 + arrow(e)_2) dot arrow(y))$
]

#definition[Snelliussche Gesetz][
  $sin(alpha_1)/sin(alpha_3) = n_3/n_1$
]

#definition[TEM Welle][
  E-Feld ist parallel zur Grenzfläche
  
  $E_1 + E_2 = E_3$, $||B_n|| = n/c |E_n|$
  
  $cos alpha_1 E_1 - cos alpha_1 E_2 = n_3/n_1 cos alpha_3 E_3$
  
  $n = n_3/n_1$
  
  $E_2 = (cos alpha_1 - n cos alpha_3)/(cos alpha_1 + n cos alpha_3) E_1$, $E_3 = (2 cos alpha_1)/(cos alpha_1 + n cos alpha_3) E_1$
  
  $R = ||E_2||^2/||E_1||^2$, $T = (n cos alpha_3 ||E_3||^2)/(cos alpha_1 ||E_1||^2)$
]

#definition[TMM Welle][
  B-Feld ist parallel zur Grenzfläche
  
  $B_1 + B_2 = B_3$, $||E_n|| = n c |B_n|$
  
  $cos alpha_1 B_1 - cos alpha_2 B_2 = 1/n_3 cos alpha_3 B_3$
  
  $B_2 = (n cos alpha_1 - cos alpha_3)/(n cos alpha_1 + cos alpha_3) B_1$
  
  $B_3 = (2n cos alpha_1)/(n cos alpha_1 + cos alpha_3) B_1$
  
  $R = ||B_2||^2/||B_1||^2$, $T = (cos alpha_3 ||B_3||^2)/(n cos alpha_1 ||B_1||^2)$
]

#definition[Brewster-Winkel][
  falls $alpha_1 = n_3/n_1 => $ TM $R = 0$
]

= Wellenleiter

#definition[Eigenschaften][
  Phasengeschwindigkeit: $v_0 = omega/||arrow(k)||$
  
  Gruppengeschwindigketi: $v_g = (d omega)/(d ||arrow(k)||)$
]

#definition[Wellenleiter][
  Durch Gebiet $A$ beschrieben. Am Rand handelt es sich um einen idealen Leiter.
  
  Eigenschaften: $arrow(n) times aE = 0$, $arrow(n) dot aB = 0$
  
  $arrow(E)^3 = (aE, e)$, $arrow(B)^3 = (aB, b)$ wobei $b, e$ entlang der Z-Achse von der Form $e = exp(i k z - i omega t)$, $b = exp(i k z - i omega t)$
  
  DGL: $aE, aB, b, e$ lösen: $Delta Psi = -lambda Psi$ mit $lambda = omega^2/c^2 - k^2$
  
  E Feld $aE$ bestimmt die anderen Felder durch: $e = k/(i lambda) anabla times aE$
  
  $b = -1/omega anabla_2 dot aE$, $aB = -i/omega aE times arrow(k) + k/omega anabla_2 (anabla_2 dot aE)$
  
  Rand: auf $partial A$ gilt: $e = 0$, $arrow(n) dot aE = 0$, $arrow(n) times aB = 0$, $arrow(n) dot aB = 0$
  
  Randwertprob.: $aE = -lambda aE$, $arrow(n) dot aE|_(partial A) = 0$, $anabla_2 dot aE|_(partial A) = 0$
]

#definition[TE- und TM-Moden][
  $T E: e = 0$, $T M: b = 0$ durch $aE = i k (anabla e)/lambda + i omega/lambda (anabla times b)$, $aB = -i omega/lambda (anabla times e) + i k (anabla b)/lambda$
  
  sind alle Felder gegeben. $e$ oder $b$ lösen die DGL.
  
  $T E <=> $ Dirichlet: $Delta b = -lambda b$, $arrow(n) dot anabla b(arrow(y)) = 0$, $arrow(y) in partial A$,
  
  $T M <=> $ Neumann: $Delta e = -lambda e$, $e(arrow(y)) = 0$, $arrow(y) in partial A$
]

#definition[Kavitäten][
  Wellenleiter mit der endlichen Länge $d$. Dies führt zur Voraussetzung dass $k_z = plus.minus (pi n)/d$.
]

= Polarisation

#definition[Polarisation][
  $arrow(n)$ Richtung der Welle. Es gilt: $arrow(n) dot aE = arrow(n) dot aB = 0$, $aB = arrow(n) times aE/c$
  
  für $arrow(e)_1 perp arrow(e)_2$, $perp arrow(n)$ gilt $arrow(n) times arrow(e)_(1,2) = plus.minus arrow(e)_(2,1)$
]

#definition[Lineare Polarisation][
  $aE = E_0 arrow(e)_1 exp(i arrow(k) dot arrow(x) - i omega t)$
  
  $aB = 1/c E_0 arrow(e)_2 exp(i arrow(k) dot arrow(x) - omega t)$, $omega = ||arrow(k)|| c$
  
  $aE, aB in RR => aE = E_0 arrow(e)_1 cos(arrow(k) dot arrow(x) - omega t)$, $aB = 1/c E_0 arrow(e)_2 cos(arrow(k) dot arrow(x) - omega t)$
  
  Energie und Impuls: $arrow(S) = epsilon_0 c E_0^2 arrow(n) cos^2(arrow(k) dot arrow(x) - omega t)$, $arrow(pi) = 1/c^2 arrow(S)$, $arrow(T) = -c arrow(n) arrow(pi)^T$
]

#definition[Zirkulare Polarisation][
  $omega = ||arrow(k)|| c$
  
  $aE = E_0 (arrow(e)_1 + exp(i phi) arrow(e)_2) exp(i(arrow(k) dot arrow(x) - omega t))$
  
  $aB = E_0/c (arrow(e)_2 - exp(i phi) arrow(e)_1) exp(i(arrow(k) dot arrow(x) - omega t))$
  
  reelle Wellen:
  $aE = E_0 (arrow(e)_1 cos(arrow(k) dot arrow(x) - omega t) - arrow(e)_2 sin(arrow(k) dot arrow(x) - omega t))$
  
  $aB = E_0/c (arrow(e)_1 sin(arrow(k) dot arrow(x) - omega t) + arrow(e)_2 cos(arrow(k) dot arrow(x) - omega t))$
  
  Energie und Impuls: $arrow(S) = epsilon_0 c E_0^2 arrow(n)$, $arrow(pi) = 1/c^2 arrow(S)$
]

#definition[Elliptische Polarisation][
  $aE = (E_1 arrow(e)_1 + E_2 exp(i phi) arrow(e)_2) exp(i(arrow(k) dot arrow(x) - omega t))$
  
  $aB = E_1/c arrow(e)_2 - E_2 e^(i phi)/c arrow(e)_1 exp(i(arrow(k) dot arrow(x) - omega t))$, $omega = ||arrow(k)|| c$
]


