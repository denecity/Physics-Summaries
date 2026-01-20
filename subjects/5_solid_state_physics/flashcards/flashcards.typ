#import "../../../lib/setup_flashcards.typ": flashcard, flashcard-setup, render-flashcards
#import "../../../lib/lib.typ": *

#show: flashcard-setup(
  card-width: 9cm,
  card-height: 5.5cm,
  margin: 0cm,
  show-cut-lines: true,
  topic: "Solid State",
)

#let blue = rgb("#E3F2FD") // Exam Question
#let yellow = rgb("#FFF8E1") // Concept Question
#let green = rgb("#E8F5E8") // Calculation Question


#flashcard(
  title: "1.1 Crystal: Crystal vs lattice vs basis",
  color: yellow,
  question: [
    + Define crystal, Bravais lattice, and basis (motif).

    + Explain the relation "crystal structure = lattice + basis" with an example.

    + What changes if you keep the lattice but change the basis?
  ],
  answer: [
    + Bravais lattice: infinite set of translation vectors $R = n_1 a_1 + n_2 a_2 (+ n_3 a_3)$. Basis: atoms inside one lattice cell at positions $r_j$. Crystal: the atomic arrangement from placing the basis at every lattice point.

    + Example: same fcc lattice plus different bases gives an fcc metal (one-atom basis) vs NaCl structure (two-atom basis).

    + Diffraction intensities and physical properties can change because internal interference changes, while the translational symmetry stays the same.
  ],
)

#flashcard(
  title: "1.2 Crystal: Unit cell vs primitive cell",
  color: yellow,
  question: [
    + What is a unit cell, and what makes a cell primitive?

    + How do you test primitiveness by counting lattice points or atoms?

    + Why do non-primitive conventional cells still get used?
  ],
  answer: [
    + A unit cell tiles space by translations; a primitive cell contains exactly one lattice point and has minimum area or volume.

    + Count contributions from corners, edges, and faces to total lattice points per cell; primitive cells sum to 1 lattice point.

    + Conventional cells make symmetry obvious (cubic shapes for bcc and fcc), even if they are larger than primitive cells.
  ],
)

#flashcard(
  title: "1.3 Crystal: Primitive vectors and coordinates",
  color: yellow,
  question: [
    + What are primitive vectors $a_i$ and how do you use them to generate the lattice?

    + What is the difference between Cartesian coordinates and lattice coordinates $(u, v, w)$?

    + When do you need to change coordinate or basis descriptions in problems?
  ],
  answer: [
    + $R = n_1 a_1 + n_2 a_2 (+ n_3 a_3)$ generates all lattice points.

    + Cartesian uses x, y, z axes; lattice coordinates expand vectors in $a_i$: $r = u a_1 + v a_2 + w a_3$.

    + When reading geometry from a sketch, converting to reciprocal space, comparing cells, or when basis positions are naturally fractional in the lattice basis.
  ],
)

#flashcard(
  title: "1.4 Crystal: Wigner-Seitz cell",
  color: yellow,
  question: [
    + Define the Wigner-Seitz cell and give the geometric construction.

    + Why is its area or volume equal to the primitive cell area or volume?

    + What is the conceptual advantage of the Wigner-Seitz cell compared to a parallelogram cell?
  ],
  answer: [
    + The Wigner-Seitz cell is the set of points closer to a chosen lattice point than any other; construct it by drawing perpendicular bisectors to vectors to neighboring lattice points.

    + Both are primitive choices: each contains exactly one lattice point and tiles space by translations, so they have the same area or volume.

    + It reflects the lattice symmetry most clearly and is unique up to translations, which helps with symmetry arguments.
  ],
)


#flashcard(
  title: "1.5 Crystal: Counting atoms in a cell",
  color: yellow,
  question: [
    + How do you count atoms per unit cell correctly (corners, edges, faces, interior)?

    + Why is atoms per cell different from lattice points per cell?

    + How does this connect to density and electrons per volume later?
  ],
  answer: [
    + Use sharing fractions: corner 1/8 (3D) or 1/4 (2D), edge 1/4 (3D), face 1/2, interior 1.

    + Lattice points count translation sites; atoms per cell depends on the basis at each lattice point.

    + Mass and electron density use (atoms per cell)/(cell volume) times masses or valence $z$, bridging geometry to carrier density $n$.
  ],
)

#flashcard(
  title: "2.1 Recip. Lattice: What & Why",
  color: yellow,
  question: [
    + Define the reciprocal lattice in words and in a practical physics use sense.

    + Explain what it means that reciprocal lattice vectors $G$ satisfy $e^(i G dot R) = 1$ for all real-space lattice vectors $R$.

    + Explain why the reciprocal lattice is the natural language for diffraction and bandstructure.
  ],
  answer: [
    + The reciprocal lattice is the lattice of wavevectors $G$ that match the periodicity of the real lattice; it labels allowed momentum transfers in diffraction and the periodicity of $E(k)$ in crystals.

    + It means $G dot R = 2 pi$ times an integer. Plane waves with wavevectors $k$ and $k + G$ have the same phase on all lattice sites, so the crystal cannot distinguish them.

    + Diffraction: scattering adds coherently when phase factors align, which is written in $G$. Bands: $E(k)$ is periodic in reciprocal lattice vectors.
  ],
)

#flashcard(
  title: "2.2 Recip. Lattice: Vasis Vectors",
  color: yellow,
  question: [
    + Given real-space primitive vectors $a_1, a_2$ (and $a_3$), what are reciprocal vectors $b_1, b_2$ (and $b_3$) defined to satisfy?

    + Explain the meaning of $a_i dot b_j = 2 pi delta_(i j)$.

    + What does "changing the basis" in reciprocal space usually mean in practice?
  ],
  answer: [
    + They are defined by $a_i dot b_j = 2 pi delta_(i j)$.

    + Each $b_j$ produces a $2 pi$ phase advance along $a_j$ and zero along the other primitive directions.

    + It means expressing vectors either in Cartesian coordinates or in lattice coordinates (components in the $b_i$ basis) and converting cleanly between the two.
  ],
)

#flashcard(
  title: "2.3 Recip. Lattice: Brillouin Zone",
  color: yellow,
  question: [
    + What is a Brillouin zone and how is it related to the reciprocal lattice?

    + What is special about the first Brillouin zone?

    + Why does the Brillouin zone matter for bandstructure and allowed $k$-states?
  ],
  answer: [
    + A Brillouin zone is a Wigner-Seitz cell in reciprocal space: the region closer to one reciprocal lattice point than any other.

    + The first Brillouin zone is the Wigner-Seitz cell around $G = 0$; it is the fundamental domain for $k$ because $k$ and $k + G$ are equivalent.

    + Bandstructure is periodic in $G$, so restricting to the first BZ avoids double counting; zone boundaries correspond to strong Bragg reflection conditions.
  ],
)

#flashcard(
  title: "2.4 Recip. Lattice: Area of the 1BZ",
  color: yellow,
  question: [
    + State the relationship between real-space primitive cell area $A$ (2D) and the first BZ area $A_"BZ"$.

    + Explain why this relationship must be true conceptually.

    + What does this imply if the real-space cell shrinks under pressure?
  ],
  answer: [
    + $A_"BZ" = (2 pi)^2 / A$ in 2D.

    + It preserves state counting: shrinking real space increases reciprocal space area so the number of allowed $k$-states per physical area stays consistent.

    + Smaller $A$ gives larger $A_"BZ"$: the BZ expands.
  ],
)



#flashcard(
  title: "2.5 Recip. Lattice: Bragg Condition",
  color: yellow,
  question: [
    + State Bragg scattering in reciprocal-lattice form: what condition must the momentum transfer satisfy for a peak?

    + Explain the why using constructive interference and phase matching.

    + Connect it to the real-space Bragg law $2 d sin(theta) = n lambda$ conceptually.
  ],
  answer: [
    + Diffraction peaks occur when $q = k_f - k_i = G$ (a reciprocal lattice vector) for elastic scattering.

    + Then phase factors from different unit cells add in phase, so the amplitude sums coherently and the intensity is large.

    + The reciprocal condition $q = G$ is equivalent to the plane-spacing Bragg law; $d$ corresponds to $|G| = 2 pi / d$ up to indexing.
  ],
)

#flashcard(
  title: "2.6 Recip. Lattice: k_i, k_f, q geometry",
  color: yellow,
  question: [
    + Define $k_i$, $k_f$, and $q$.

    + What does elastic scattering imply about their magnitudes?

    + How do you get the scattering angle from $k_i$, $k_f$, and $q$?
  ],
  answer: [
    + $k_i$ is the incident wavevector, $k_f$ the outgoing wavevector, and $q = k_f - k_i$ is the momentum transfer to the crystal.

    + Elastic scattering gives $|k_i| = |k_f| = 2 pi / lambda$.

    + Geometry gives $|q| = 2 |k| sin(theta)$ where $theta$ is half the scattering angle (by convention); equivalently use the triangle formed by $k_i$, $k_f$, and $q$.
  ],
)

#flashcard(
  title: "2.7 Recip. Lattice: Structure factor S(G)",
  color: yellow,
  question: [
    + What is the structure factor and what does it encode about the crystal?

    + How does it separate lattice vs basis information?

    + What changes in $S(G)$ if you shift one sublattice by half a lattice vector?
  ],
  answer: [
    + It is the complex amplitude from the basis inside the unit cell: a sum of phase factors (and form factors) of atoms in the basis at a given $G$.

    + The lattice gives the selection $q = G$; the basis determines how strong that $G$ peak is, including cancellations.

    + Shifting positions changes phases $e^(i G dot r_j)$, which can cause destructive interference and systematic absences for certain $G$.
  ],
)

#flashcard(
  title: "2.8 Recip. Lattice: Intensity I(G)",
  color: yellow,
  question: [
    + What is diffraction intensity in terms of structure factor?

    + Why are some peaks strong, weak, or vanish?

    + How do unequal atomic form factors change extinctions?
  ],
  answer: [
    + Typically $I(G) prop |S(G)|^2$ (times other factors).

    + Basis phase factors can add constructively (strong), partially cancel (weak), or cancel exactly (vanish).

    + Perfect cancellation often requires equal weights; if $f_1 != f_2$, forbidden peaks can become weak but nonzero because cancellation is incomplete.
  ],
)

#flashcard(
  title: "2.9 Recip. Lattice: Scattering Angle",
  color: yellow,
  question: [
    + Given a 2D reciprocal lattice, neutron wavelength $lambda$, and a target peak $(h, k)$, what sequence of steps gives the scattering angle?

    + What is the accessibility condition for seeing that peak?

    + How do you handle the case where multiple $G$ have the same magnitude?
  ],
  answer: [
    + Compute $G = h b_1 + k b_2$, then $|G| = |q|$. Use $|k| = 2 pi / lambda$ and the elastic geometry $|q| = 2 |k| sin(theta)$ to infer $theta$ (then scattering angle $2 theta$ by convention).

    + You need $|G| <= 2 |k|$; otherwise $sin(theta) > 1$ and the peak is inaccessible.

    + Same $|G|$ gives the same scattering angle; intensities can differ via $S(G)$ because direction and basis phases matter.
  ],
)


#flashcard(
  title: "3.1 Electron Gas: n, dens, lattice spacing",
  color: yellow,
  question: [
    + What is electron density $n$ in a metal, and how is it related to "electrons per atom" and lattice spacing $a$?

    + In a simple cubic picture, if you compress the lattice so $a$ decreases, what happens to the ionic density and typically to $n$?

    + Why is $n$ the natural control parameter for free-electron properties?
  ],
  answer: [
    + $n = N/V$: number of conduction electrons per volume. If there are $z$ conduction electrons per atom and atomic density is $n_"ion"$, then $n = z n_"ion"$. For simple cubic, $n_"ion" approx 1/a^3$ so $n approx z/a^3$.

    + Smaller $a$ $->$ larger $n_"ion"$ $->$ typically larger $n$ (if $z$ stays fixed).

    + In the free-electron model, the energy/momentum filling is set by how many k-states are occupied $->$ determined by $n$.
  ],
)

#flashcard(
  title: "3.2 Electron Gas: What is k_F?",
  color: yellow,
  question: [
    + Define the Fermi wavevector $k_F$ physically and geometrically.

    + Give the relation between $k_F$ and electron density $n$ in 3D (include spin).

    + If $n$ increases by a factor of 8, what happens to $k_F$?
  ],
  answer: [
    + $k_F$ is the radius of the occupied k-space sphere at $T = 0$; it sets the largest momentum of occupied electrons.

    + $n = k_F^3/(3 pi^2)$, so $k_F = (3 pi^2 n)^(1/3)$.

    + $k_F prop n^(1/3)$: factor 8 in $n$ gives factor $8^(1/3) = 2$ in $k_F$.
  ],
)

#flashcard(
  title: "3.3 Electron Gas: What is ε_F?",
  color: yellow,
  question: [
    + Define Fermi energy $epsilon_F$ and connect it to $k_F$.

    + Why is $epsilon_F$ usually much larger than $k_B T$ at room temperature in metals?

    + If $n$ increases, how does $epsilon_F$ scale?
  ],
  answer: [
    + $epsilon_F$ is the energy of the highest occupied state at $T = 0$: $epsilon_F = hbar^2 k_F^2/(2m)$.

    + Metals have large $n$, giving large $k_F$ and thus large $epsilon_F$ (eV scale), while $k_B T$ at 300 K is only $approx 0.026$ eV.

    + $epsilon_F prop k_F^2 prop n^(2/3)$.
  ],
)


#flashcard(
  title: "3.4 Electron Gas: n ↔ k_F ↔ ε_F ↔ A_F",
  color: yellow,
  question: [
    Make a chain relating these quantities and describe each scaling with $n$:

    + $k_F(n)$

    + $epsilon_F(n)$

    + $A_F(n)$

    + (d) one measurable consequence of increasing $n$.
  ],
  answer: [
    + $k_F prop n^(1/3)$.

    + $epsilon_F prop n^(2/3)$.

    + $A_F prop k_F^2 prop n^(2/3)$.

    + (d) Example: Hall coefficient magnitude $|R_H| approx 1/(n e)$ decreases (also $g(epsilon_F)$ increases).
  ],
)

#flashcard(
  title: "3.5 Electron Gas: DOS g(ε)",
  color: yellow,
  question: [
    + Define density of states $g(epsilon)$ (and distinguish "per volume" vs "total").

    + Why is DOS central for specific heat and susceptibility?

    + For free electrons in 3D, how does $g(epsilon)$ scale with $epsilon$?
  ],
  answer: [
    + $g(epsilon) d epsilon$ = number of available single-particle states in $[epsilon, epsilon + d epsilon]$. Often use DOS per unit volume.

    + Low-energy excitations depend on how many states are available near $epsilon_F$: low-T properties are controlled by $g(epsilon_F)$.

    + In 3D free-electron gas, $g(epsilon) prop epsilon^(1/2)$.
  ],
)

#flashcard(
  title: "3.6 Electron Gas: DOS at ε_F",
  color: yellow,
  question: [
    + Explain what $g(epsilon_F)$ means physically.

    + Relate $g(epsilon_F)$ to $n$ and/or $epsilon_F$ for a 3D free-electron gas (scaling is enough).

    + If you compress the metal (increase $n$), does $g(epsilon_F)$ increase or decrease?
  ],
  answer: [
    + It is the number of available states per energy (per volume) right at the Fermi level; it controls how many electrons can participate in low-T excitations.

    + For 3D free electrons, $g(epsilon_F) prop epsilon_F^(1/2)$, and since $epsilon_F prop n^(2/3)$, you get $g(epsilon_F) prop n^(1/3)$.

    + It increases with compression (as $n^(1/3)$).
  ],
)

#flashcard(
  title: "3.7 Electron Gas: Specific heat basics",
  color: yellow,
  question: [
    + What is specific heat (difference between $C$ and $c$)?

    + Why is the electron contribution small in classical thinking but linear in $T$ at low T in quantum metals?

    + Why do only electrons near $epsilon_F$ contribute?
  ],
  answer: [
    + Heat capacity $C = dv(Q, T)$; specific heat $c$ is per mass or per mole; often use $C_V$ at constant volume.

    + Classically you'd expect each electron to contribute $approx k_B$, but Pauli blocking allows only a fraction $approx T/T_F$ to be excited $->$ $C_e prop T$.

    + States deep below $epsilon_F$ are fully occupied and cannot change; excitations happen within $approx k_B T$ around $epsilon_F$.
  ],
)

#flashcard(
  title: "3.8 Electron Gas: Low-T C_V and g(ε_F)",
  color: yellow,
  question: [
    + State the key low-T result connecting electronic specific heat to DOS: what's the proportionality?

    + If $g(epsilon_F)$ increases under pressure, what happens to the linear specific heat coefficient $gamma$?

    + Combine with earlier scalings to predict how $gamma$ scales with density $n$ for free electrons.
  ],
  answer: [
    + $C_e = gamma T$ with $gamma prop g(epsilon_F)$ (per volume: $C_e/V prop g(epsilon_F) T$).

    + $gamma$ increases when $g(epsilon_F)$ increases.

    + Since $g(epsilon_F) prop n^(1/3)$, you get $gamma prop n^(1/3)$ (free-electron scaling).
  ],
)

#flashcard(
  title: "4.1 Transport: Drude Framework",
  color: yellow,
  question: [
    + State the Drude picture and the role of collisions.

    + Derive the Drude scaling $sigma prop n tau/m$ conceptually (no algebra grind—just "what balances what").

    + If you double n while halving $tau$, what happens to $rho$ and why?
  ],
  answer: [
    + Electrons are a gas accelerated by E; collisions randomize momentum with timescale $tau$.

    + Steady state drift occurs when field-driven momentum gain is balanced by collision-driven momentum relaxation $->$ $v_d prop tau E/m$ $->$ $j = n e v_d$ $->$ $sigma = n e^2 tau/m$.

    + $rho prop 1/(n tau)$: n×2 and $tau$×(1/2) cancel $->$ $rho$ unchanged.
  ],
)

#flashcard(
  title: "4.2 Transport: Scattering Zoo",
  color: yellow,
  question: [
    + Compare phonon vs defect scattering: what fluctuates (dynamic vs static), what is (roughly) T-dependent, and why.

    + What is Matthiessen's rule in words and as an equation?

    + Give one realistic reason Matthiessen's rule can fail.
  ],
  answer: [
    + Phonons are dynamic lattice vibrations $->$ more at higher T $->$ more scattering; defects are static disorder $->$ weak T dependence.

    + Total scattering adds approximately: $1/tau approx 1/tau_"ph" + 1/tau_"def"$ (equivalently $rho approx rho_"ph" + rho_"def"$).

    + Mechanisms not independent, strong energy dependence of $tau$, anisotropic scattering, bandstructure changes, or quantum/interference effects.
  ],
)

#flashcard(
  title: "4.3 Transport: ρ(T) Story",
  color: yellow,
  question: [
    Sketch/explain a typical metal's $rho(T)$ from $T -> 0$ to high T. Include:

    + what sets the residual resistivity;

    + why phonons "turn off" at low T;

    + why high-T behavior is often ~linear;

    (d) what would happen in an ideal defect-free crystal as $T -> 0$.
  ],
  answer: [
    + Residual $rho_0$ is set by defect/impurity disorder (T-independent-ish).

    + Low T $->$ few phonons $->$ phonon scattering suppressed $->$ $tau$ increases.

    + High T (≳ Debye scale) phonon population grows with T $->$ scattering increases $->$ $rho$ often linear in T.

    (d) With only phonons and no defects, $rho -> 0$ as $T -> 0$.
  ],
)

#flashcard(
  title: "4.4 Transport: Wiedemann–Franz",
  color: yellow,
  question: [
    + State Wiedemann–Franz and explain why the ratio $kappa/(sigma T)$ can become ~constant.

    + What cancels out in a simple Drude/Sommerfeld picture?

    + Give three situations where Wiedemann–Franz might fail, and the physical reason in each.
  ],
  answer: [
    + $kappa/(sigma T) = L$. Same carriers carry heat + charge; both limited by scattering.

    + The same $tau$ (and often similar band parameters) enter both, so $tau$ cancels in the ratio.

    + (i) phonon-dominated $kappa$; (ii) strongly energy-dependent or inelastic scattering; (iii) strong correlations/non-Fermi liquids; (iv) very low T with additional effects—each breaks "same carriers + same scattering controls both" assumption.
  ],
)

#flashcard(
  title: "4.5 Transport: Hall Geometry & Sign",
  color: yellow,
  question: [
    + Describe the Hall setup and explain why a transverse voltage appears.

    + Define the Hall coefficient $R_H$ and explain what its sign tells you.

    + Using physical reasoning (not memorization), explain why $R_H approx -1/(n e)$ for electrons and $+1/(p e)$ for holes in a single-carrier Drude picture.
  ],
  answer: [
    + Current + perpendicular B deflects carriers (Lorentz force) $->$ charge builds up sideways until Hall E-field balances deflection.

    + $R_H = E_y/(j_x B_z)$ (up to sign conventions). Sign indicates dominant carrier type (electron-like vs hole-like).

    + Balancing forces gives transverse field proportional to B and inversely proportional to carrier density; sign follows carrier charge.
  ],
)

#flashcard(
  title: "4.6 Transport: Two-Carrier Hall",
  color: yellow,
  question: [
    + Why is the Hall effect much trickier when both electrons and holes conduct?

    + What determines the net sign of $R_H$ besides concentrations?

    + Give a clear scenario where $R_H$ changes sign with temperature, and explain the mechanism.
  ],
  answer: [
    + Electron and hole Hall responses oppose and can partially cancel.

    + Mobilities (or $tau$/$m^*$) matter strongly: the more mobile species can dominate even if less numerous.

    + In semiconductors: at low T dopants dominate (say electrons $->$ negative $R_H$); at higher T intrinsic carriers rise and holes may become important or dominate mobility-weighted response $->$ $R_H$ can cross through zero and flip sign.
  ],
)

#flashcard(
  title: "5.1 Band structure: Group velocity v_g",
  color: yellow,
  question: [
    + Define group velocity and write its relation to $E(k)$.

    + Why does group velocity determine current and transport?

    + For a cosine band $E(k) = E_0 - 2 t cos(k a)$, what is $v_g(k)$ and where is it zero or maximal?
  ],
  answer: [
    + $v_g = (1/hbar) dv(E, k)$ in 1D.

    + A wavepacket built from nearby k-states moves at $v_g$; electrons near the Fermi level contribute to current via their drift in k-space.

    + $v_g = (1/hbar) (2 t a) sin(k a)$. It is zero at band extrema ($k a = 0, pi$) and maximal near $k a = plus.minus pi/2$.
  ],
)

#flashcard(
  title: "5.2 Band structure: Effective mass from curvature",
  color: yellow,
  question: [
    + Define effective mass $m^*$ in 1D in terms of $E(k)$.

    + Explain physically what large vs small curvature means for acceleration under a force.

    + In what sense is $m^*$ an inertial parameter for Bloch electrons?
  ],
  answer: [
    + $1/m^* = (1/hbar^2) dv(E, k, 2)|_(k_0)$.

    + Large curvature gives small $m^*$ and easy acceleration; small curvature gives large $m^*$ and a sluggish response.

    + Under an applied force, $k$ changes and the band curvature sets how that translates into velocity change, so $m^*$ plays the role of effective inertia in the crystal.
  ],
)

#flashcard(
  title: "5.3 Band structure: Electrons vs holes",
  color: yellow,
  question: [
    + Why is the curvature at the top of the valence band negative, and what does that imply for electron $m^*$ there?

    + What does negative effective mass mean for the response to an electric field?

    + How does the hole picture fix the description?
  ],
  answer: [
    + A maximum has $dv(e, k, 2) < 0$, so the electron effective mass is negative there.

    + Negative mass means the acceleration direction flips relative to the force in the semiclassical equations.

    + Describe transport near the valence top as holes: missing electrons behave like positive charges with positive effective mass $m_h^* > 0$, giving a normal response.
  ],
)


#flashcard(
  title: "5.4 Band structure: Semiclassical EOM",
  color: yellow,
  question: [
    + State the semiclassical equations of motion for Bloch electrons in $E$ and $B$.

    + Explain what part is universal and what part depends on the band.

    + How do electrons vs holes differ in these equations?
  ],
  answer: [
    + $hbar dot(k) = -q (E + v x B)$ and $v = (1/hbar) nabla_k E(k)$.

    + The force law for $dot(k)$ has the Lorentz form; the velocity relation depends on the band dispersion $E(k)$.

    + The sign of charge differs: electrons have $q = -e$ and holes $q = +e$. Near a valence maximum, using holes avoids negative-mass language.
  ],
)

#flashcard(
  title: "6.1 Semicond: Band sketch and gap type",
  color: yellow,
  question: [
    + Describe valence and conduction bands and define the band gap $E_g$.

    + Define direct vs indirect gap in k-space and how you diagnose it from $E(k)$.

    + Why does direct vs indirect matter for optical transitions?
  ],
  answer: [
    + Valence band is the highest mostly filled band; conduction band is the next mostly empty band; the gap is the energy range with no states between valence top and conduction bottom.

    + Direct: valence max and conduction min at the same $k$. Indirect: at different $k$ values, seen by comparing extrema in $E(k)$.

    + Photons carry little momentum, so direct transitions conserve $k$ easily; indirect transitions need a phonon to supply momentum.
  ],
)

#flashcard(
  title: "6.2 Semicond: Chemical potential mu",
  color: yellow,
  question: [
    + Define chemical potential $mu$ and its role in $f(epsilon)$.

    + What does it mean if $mu$ lies in the gap?

    + How do doping and temperature qualitatively shift $mu$?
  ],
  answer: [
    + $mu$ sets equilibrium occupations via Fermi-Dirac: $f(epsilon) = 1/(e^((epsilon - mu)/(k_B T)) + 1)$.

    + There are no states at $mu$; carriers come from thermal tails, giving a few electrons in the conduction band and holes in the valence band.

    + n-type pushes $mu$ up toward $E_c$, p-type pushes $mu$ down toward $E_v$; higher $T$ increases intrinsic carriers and pulls $mu$ toward the intrinsic position.
  ],
)

#flashcard(
  title: "6.3 Semicond: mu far from Bands, Boltz",
  color: yellow,
  question: [
    + What does "mu far from the bands" mean and why is it useful?

    + State the Boltzmann approximation for electrons and holes and the condition for validity.

    + What is the physical meaning of non-degenerate vs degenerate semiconductor?
  ],
  answer: [
    + $mu$ is many $k_B T$ away from band edges, so occupations are very small or very close to 1 and integrals simplify.

    + If $epsilon - mu >> k_B T$, then $f approx e^(-(epsilon - mu)/(k_B T))$ for electrons. If $mu - epsilon >> k_B T$, then $1 - f approx e^(-(mu - epsilon)/(k_B T))$ for holes.

    + Non-degenerate: $mu$ in the gap and Boltzmann applies. Degenerate: $mu$ inside a band, so full Fermi-Dirac is required.
  ],
)

#flashcard(
  title: "6.4 Semicond.: Effective mass meaning",
  color: yellow,
  question: [
    + How do you compute $m^*$ from band curvature in 1D?

    + Why is electron $m^*$ negative at the valence-band maximum, and how do holes fix this?

    + What does small $m^*$ imply for acceleration and mobility?
  ],
  answer: [
    + $1/m^* = (1/hbar^2) dv(E, k, 2)|_(k_0)$.

    + Maxima have negative curvature, giving negative electron $m^*$; describing missing electrons as holes gives positive charge and positive effective mass.

    + Smaller $m^*$ means larger curvature, easier acceleration under forces, and typically higher mobility.
  ],
)

#flashcard(
  title: "6.5 Semicond.: 1D DOS per length",
  color: yellow,
  question: [
    + Define DOS per unit length $g(epsilon)/L$.

    + For a 1D parabolic band, how does $g(epsilon)/L$ depend on energy from the band edge, and what feature is crucial?

    + Contrast the edge behavior in 1D vs 3D.
  ],
  answer: [
    + States available per energy interval per length.

    + $g(epsilon)/L prop 1/sqrt(epsilon - E_"edge")$: it diverges at the edge (a van Hove singularity).

    + 1D diverges at the edge; 3D DOS goes to zero at the edge like $sqrt(epsilon - E_"edge")$.
  ],
)

#flashcard(
  title: "6.6 Semicond.: Carrier dens, intrinsic mu",
  color: yellow,
  question: [
    + Write electron and hole densities per unit length using DOS and $f(epsilon)$; explain why holes use $1 - f$.

    + In the intrinsic case, what condition links $n$ and $p$, and why?

    + Where does $mu$ sit intrinsically, and what shifts it away from exact midgap?
  ],
  answer: [
    + $n/L = integral_(E_c)^(infinity) (g_c/L) f(epsilon) d epsilon$, and $p/L = integral_(-infinity)^(E_v) (g_v/L) (1 - f(epsilon)) d epsilon$ because holes count empty valence states.

    + Intrinsic: $n = p$ because each excitation creates one electron-hole pair and charge neutrality holds.

    + $mu$ lies near midgap, but asymmetry in DOS or effective masses shifts it toward the side with the larger effective DOS prefactor.
  ],
)

#flashcard(
  title: "7.1 Magnet: Heisenberg model",
  color: yellow,
  question: [
    + Write the classical or quantum Heisenberg Hamiltonian and explain what each symbol means.

    + What does the sign of $J$ imply for preferred spin alignment?

    + What changes if you include multiple couplings like $J_1, J_2$?
  ],
  answer: [
    + $H = sum_(<i j>) J_(i j) S_i dot S_j$ (often plus a Zeeman term in a field). $J_(i j)$ is exchange coupling; $S_i$ are spins (quantum operators or classical vectors).

    + $J < 0$ favors parallel alignment (ferromagnet). $J > 0$ favors antiparallel alignment (antiferromagnet).

    + Competing $J$ values can frustrate simple order and produce nontrivial ground states (spirals, 120-degree order), depending on lattice geometry.
  ],
)

#flashcard(
  title: "7.2 Magnet: Susceptibility meaning",
  color: yellow,
  question: [
    + Define magnetic susceptibility $chi$ and distinguish it from magnetization $M$.

    + What does high $chi$ mean physically?

    + In the paramagnetic high-T regime, why is $M$ typically linear in $H$ for small fields?
  ],
  answer: [
    + $chi = dv(M, H)|_(H -> 0)$ (often per volume or per mole). $M$ is the magnetic moment density or response.

    + The system magnetizes easily; spins align strongly with a small field.

    + High T disorder dominates; a small field slightly biases orientations, giving linear response before saturation.
  ],
)

#flashcard(
  title: "7.3 Magnet: Curie-Weiss law",
  color: yellow,
  question: [
    + State the Curie-Weiss law and identify $C$ and $Theta_W$.

    + What is the physical interpretation of $Theta_W$?

    + How does the sign of $Theta_W$ relate to dominant interactions?
  ],
  answer: [
    + $chi(T) = C/(T - Theta_W)$ at sufficiently high $T$. $C$ is the Curie constant and $Theta_W$ is the Weiss temperature.

    + $Theta_W$ is the temperature scale of the effective internal exchange field; it measures net tendency toward collective alignment.

    + $Theta_W > 0$ suggests dominant ferromagnetic correlations; $Theta_W < 0$ suggests dominant antiferromagnetic correlations.
  ],
)

#flashcard(
  title: "7.4 Magnet: Transverse field and canting",
  color: yellow,
  question: [
    + Add a magnetic field term to the Hamiltonian and explain the competition it creates in an AFM.

    + What does field perpendicular to the order mean and why does it cause canting?

    + Qualitatively sketch how magnetization evolves with $H$ from small $H$ to saturation.
  ],
  answer: [
    + Zeeman term: $H_Z = - g mu_B sum_i H dot S_i$. Exchange wants antiparallel alignment; the field wants all moments aligned with $H$.

    + If the AF order is along some axis, a perpendicular field forces spins to tilt toward the field while keeping antiparallel components, producing a canted state.

    + Small $H$: linear increase as the canting angle grows. Larger $H$: moments tilt more. At saturation, all spins align with $H$ and $M$ is maximal.
  ],
)

#flashcard(
  title: "7.5 Magnet: Saturation field H_s",
  color: yellow,
  question: [
    + Define the saturation field $H_s$. What physical event happens at $H_s$?

    + Why does $H_s$ scale with exchange strength and coordination (roughly like $z J$)?

    + Compare $H_s$ for lattices with different $z$, and explain how you would infer $z$ from measurements conceptually.
  ],
  answer: [
    + $H_s$ is the field where the system becomes fully polarized: spins align with $H$ and canting is complete, giving maximum magnetization.

    + The field must overcome exchange energy that resists alignment; more neighbors and stronger $J$ require a larger field to break AF correlations.

    + Higher $z$ gives higher $H_s$ (all else equal). If you know $J$ or $Theta_W$ and measure $H_s$, you can cross-check interaction scales and effective coordination.
  ],
)

#flashcard(
  title: "Exam 1.1: Primitive cell + basis",
  color: blue,
  question: [
    + Consider a 2D crystal with translation vectors $a = (0, 4)$ Å and $b = (5, 0)$ Å. The basis has one identical atom per lattice point.

    + Give a valid choice of primitive vectors $x, y$ (not necessarily equal to $a, b$).

    + Give the basis positions inside that primitive cell.
  ],
  answer: [
    + Path: A common primitive choice is half-sum and half-difference. With one atom type, the basis can be one atom at the origin.

    + Primitive vectors: $x = (a + b)/2$, $y = (a - b)/2$.

    + Basis: one atom, e.g. $r_1 = (0, 0)$.
  ],
)

#flashcard(
  title: "Exam 1.2: WS area + BZ area",
  color: blue,
  question: [
    + Using the lattice from 1.1 and the primitive choice above, find the Wigner-Seitz (primitive) area $A$.

    + Find the first Brillouin zone area $A^*$.
  ],
  answer: [
    + Path: $A = abs(a cross b)/2$ for the primitive choice, then $A^* = (2 pi)^2/A$ in 2D.

    + $|a cross b| = 4 * 5 = 20 Å^2$, so $A = 10 Å^2$.

    + $A^* = (2 pi)^2/10 = 3.95 Å^(-2)$.
  ],
)

#flashcard(
  title: "Exam 1.3: Shifted cell + basis",
  color: blue,
  question: [
    + For a 2D crystal with Bravais lattice generated by $a = (0, 4)$ Å and $b = (5, 0)$ Å, the unit cell contains two identical atoms at $r_1 = (0, 0)$ and $r_2 = (1/3)(a + b)$.

    + Are $a, b$ a primitive choice for the Bravais lattice?

    + Give the basis in fractional coordinates $(u, v)$ with $r = u a + v b$.
  ],
  answer: [
    + Path: If the Bravais lattice is generated by $a, b$, then they are primitive. The basis is the atom positions in fractional coordinates.

    + Primitive? Yes, $a, b$ are primitive.

    + Basis: $r_1 = (0, 0)$, $r_2 = (1/3, 1/3)$.
  ],
)

#flashcard(
  title: "Exam 1.4: Shifted WS + BZ area",
  color: blue,
  question: [
    + For the shifted configuration in 1.3, compute the primitive (WS) area $A$.

    + Compute the BZ area $A^*$.
  ],
  answer: [
    + Path: For a rectangular Bravais lattice, $A = |a cross b| = a b$, then $A^* = (2 pi)^2/A$.

    + $A = 4 * 5 = 20 Å^2$.

    + $A^* = (2 pi)^2/20 = 1.97 Å^(-2)$.
  ],
)

#flashcard(
  title: "Exam 1.5: Diffraction angles + intensity ratio",
  color: blue,
  question: [
    + Neutron diffraction with $lambda = 2.36$ Å, elastic scattering. Use the shifted crystal from 1.3 with basis $r_1 = (0, 0)$, $r_2 = (1/3, 1/3)$ in $a, b$.

    + With $|a^*| = 2 pi/a$, $|b^*| = 2 pi/b$, $a = 4$ Å, $b = 5$ Å, compute $|k_i| = |k_f|$.

    + For $q = (2, 1)$ and $q = (1, 1)$ with $q = h a^* + k b^*$, compute $theta$ using $|q| = 2 |k| sin(theta)$.

    + With $F(q) = sum_j f e^(i q dot r_j)$ and $I prop |F|^2$, compute $I(2,1)/I(1,1)$.
  ],
  answer: [
    + Path: Elastic gives $|k| = 2 pi/lambda = 2.66 Å^(-1)$. Then $|a^*| = 1.571 Å^(-1)$, $|b^*| = 1.257 Å^(-1)$.

    + $|q|_(2,1) = sqrt((2 * 1.571)^2 + (1 * 1.257)^2) approx 3.38$ so $theta approx 39.5^circ$.

    + $|q|_(1,1) = sqrt(1.571^2 + 1.257^2) approx 2.01$ so $theta approx 22.2^circ$.

    + $q dot r_2 = (2 pi/3)(h + k)$ so $F = f(1 + e^(i 2 pi (h + k)/3))$. For (2,1): $h + k = 3$ gives $F = 2f$ so $I prop 4 f^2$. For (1,1): $h + k = 2$ gives $|1 + e^(i 4 pi/3)|^2 = 1$ so $I prop f^2$. Result: $I(2,1)/I(1,1) = 4$.
  ],
)

#flashcard(
  title: "Exam 2a.1: E_F + FS area scaling",
  color: blue,
  question: [
    + A 3D free-electron metal has unit-cell side $a$. Under pressure the side becomes $0.9 a$ with the same electrons per cell.

    + Find $E_(F,B)/E_(F,A)$.

    + Find $S_B/S_A$ where $S$ is Fermi-surface area.
  ],
  answer: [
    + Path: fixed electrons per cell gives $n prop 1/a^3$, so $k_F prop 1/a$, $E_F prop 1/a^2$, and $S prop 1/a^2$.

    + $E_(F,B)/E_(F,A) = (a/(0.9 a))^2 = 1.23$.

    + $S_B/S_A = (a/(0.9 a))^2 = 1.23$.
  ],
)

#flashcard(
  title: "Exam 2a.2: DOS + low-T c_v scaling",
  color: blue,
  question: [
    + Same setup as 2a.1. Find $(nu_B (epsilon_F))/(nu_A (epsilon_F))$ for a 3D free-electron gas.

    + Find $c_(v,B)/c_(v,A)$ at low $T$.
  ],
  answer: [
    + Path: $nu(epsilon_F) prop k_F prop 1/a$ and $c_v prop nu(epsilon_F) T$.

    + $(nu_B (epsilon_F))/(nu_A (epsilon_F)) = a/(0.9 a) = 1.11$.

    + $c_(v,B)/c_(v,A) = 1.11$.
  ],
)

#flashcard(
  title: "Exam 2b.1: Phonon DOS + resistivity",
  color: blue,
  question: [
    + Assume phonon scattering dominates at high $T$ and $tau^(-1) prop N_("phonon")$.

    + If $Theta_D$ is (incorrectly) assumed unchanged by pressure, how does the phonon DOS per volume scale under $a -> 0.9 a$?

    + What is the resistivity ratio $rho_B/rho_A$ at 300 K?
  ],
  answer: [
    + Path: At fixed $omega$, DOS per volume scales like $1/V prop 1/a^3$.

    + $(nu_B (omega))/(nu_A (omega)) = a^3/(0.9 a)^3$.

    + $rho_B/rho_A = 1$ (same, under the stated assumption).
  ],
)

#flashcard(
  title: "Exam 2b.2: Gruneisen + resistivity",
  color: blue,
  question: [
    + Use $(Delta omega)/omega = -gamma (Delta V)/V$ with $gamma = 2$ and $a -> 0.9 a$ so $V -> 0.9^3 V$. Given $Theta_(D,A) = 100$ K.

    + Find $v_B/v_A$.

    + Find $Theta_(D,B)$.

    + Decide which has larger $rho$ at 300 K and compute $rho_A/rho_B$.
  ],
  answer: [
    + Result: $v_B/v_A approx 1.39$.

    + $Theta_(D,B) approx 1.54 Theta_(D,A) = 154$ K.

    + $rho_A/rho_B = Theta_(D,B)/Theta_(D,A) approx 1.54$, so A has higher resistivity.
  ],
)

#flashcard(
  title: "Exam 3.1: Indirect gap + masses",
  color: blue,
  question: [
    + A 1D semiconductor has conduction band $E_(c b)(k)$ with minimum at $k = pi/a$ and $E_(c b) approx E_G + t a^2 (k - pi/a)^2$, and valence band $E_(v b) approx -2 t a^2 k^2$ near $k = 0$.

    + Is the gap direct or indirect?

    + Give the parabolic approximations.

    + Compute $m_(c b)^*$ and $m_(v b)^*$ (hole mass).
  ],
  answer: [
    + Gap: indirect (CB minimum at $pi/a$, VB maximum at 0).

    + Approximations: $epsilon_(c b) approx E_G + t a^2 (k - pi/a)^2$, $epsilon_(v b) approx -2 t a^2 k^2$.

    + Masses: $m_(c b)^* = hbar^2/(2 t a^2)$, $m_(v b)^* = hbar^2/(4 t a^2)$.
  ],
)

#flashcard(
  title: "Exam 3.2: DOS + densities + tau ratio",
  color: blue,
  question: [
    + In the Boltzmann regime, given $nu_(c b)(E) = 1/(pi a t (E - E_G))$ for $E >= E_G$ and $nu_(v b)(E) = 1/(pi a 2 t (-E))$ for $E <= 0$, write expressions for $N_e$ and $N_h$ per length.

    + If $sigma_e = sigma_h$ at high $T$, give $tau_e/tau_h$.
  ],
  answer: [
    + $N_e = (a/(pi t)) k_B T exp((mu - E_G)/(k_B T))$
    and $N_h = (a/(pi 2 t)) k_B T exp(-mu/(k_B T))$.

    + $tau_e/tau_h = (m_e^* / m_h^*)(N_h/N_e) = 2 exp((-2 mu + E_G)/(k_B T))$.
  ],
)

#flashcard(
  title: "Exam 4.1: FM case + Weiss T",
  color: blue,
  question: [
    + Honeycomb-lattice Heisenberg model with $J_1 < 0, hspace J_2 < 0$: describe the ground state.

    + State the ground-state degeneracy idea.

    + Give the Weiss temperature $T_W$.
  ],
  answer: [
    + Ground state: ferromagnetic, all spins aligned.

    + Degeneracy: any global rotation of all spins is also a ground state.

    + $T_W = -((2 J_1 + 4 J_2)/(3 k_B)) S(S + 1)$.
  ],
)

#flashcard(
  title: "Exam 4.2: Competing J_1, J_2",
  color: blue,
  question: [
    + Honeycomb model with $J_1 < 0, hspace J_2 > 0$: describe the ordered ground state qualitatively.

    + Give $T_W$.

    + For a perpendicular field at $T = 0$, give the saturation field $H$.
  ],
  answer: [
    + Ground state: antiferromagnetic-type ordered pattern due to competing couplings.

    + $T_W = -((2 J_1 + 4 J_2)/(3 k_B)) S(S + 1)$.

    + $H = 16 J_2 S g mu_B mu_0$.
  ],
)

#flashcard(
  title: "Exam 5.1: Primitive cell + area + basis",
  color: blue,
  question: [
    + A 2D crystal is spanned by vectors of lengths $a = 6.0$ Å and $b = 4.0$ Å. The unit cell spanned by $a, b$ contains two different atoms.

    + Is the $a, b$ parallelogram a primitive unit cell?

    + What is its area $A$?

    + Give the basis positions (fractional coordinates in the $a, b$ cell).
  ],
  answer: [
    + Path: Primitive if the cell contains exactly one lattice point (with a basis); solution states it is. Area is $A = a b$. Basis positions are given in fractional coordinates.

    + Yes, it is primitive.

    + $A = a b = (6)(4) = 24$ Å^2.

    + $r_1 = (0, 0)$, $r_2 = (1/2, 1/2)$.
  ],
)

#flashcard(
  title: "Exam 5.2: WS area + BZ area",
  color: blue,
  question: [
    + For the same primitive lattice as 5.1, what is the Wigner-Seitz area?

    + What is the first Brillouin zone area $A^*$?
  ],
  answer: [
    + Path: WS cell is a primitive cell, so $A = 24$ Å^2.
    In 2D, $A^* = (2 pi)^2/A$.

    + WS area: $A = 24$ Å^2.

    + BZ area: $A^* = (2 pi)^2/24 = 1.64$ Å^(-2).
  ],
)

#flashcard(
  title: "Exam 5.3: |k| + scattering angles",
  color: blue,
  question: [
    + Neutron diffraction uses $lambda = 2.36$ Å and elastic scattering. Compute $|k_i| = |k_f|$.

    + Compute the scattering angles $theta$ for $q = (2, 1)$ and $q = (1, 1)$ using $|q| = 2 |k| sin(theta)$.

    + For a rectangular reciprocal basis, use $|q(h, k)| = 2 pi sqrt((h/a)^2 + (k/b)^2)$.
  ],
  answer: [
    + Path: Elastic gives $|k| = 2 pi/lambda$.

    + $|k| = 2 pi/2.36 approx 2.66$ Å^(-1).

    + $theta(2, 1) = arcsin((lambda/2) sqrt((2/a)^2 + (1/b)^2)) approx 29.47^circ$.

    + $theta(1, 1) = arcsin((lambda/2) sqrt((1/a)^2 + (1/b)^2)) approx 20.73^circ$.
  ],
)

#flashcard(
  title: "Exam 5.4: Structure factor + intensity",
  color: blue,
  question: [
    + The basis is $r_1 = (0, 0)$, $r_2 = (1/2, 1/2)$ with $F(q) = sum_i f_i e^(i q dot r_i)$ and $I prop |F|^2$.

    + For $q = (2, 1)$ and $q = (1, 1)$, compute $I(2,1)/I(1,1)$ if $f_1 = 2 f_2$.

    + What happens if $f_1 = f_2$?
  ],
  answer: [
    + Path: For $r_2 = (1/2, 1/2)$, the phase factor is $e^(i pi (h + k)) = (-1)^(h + k)$, so $F = f_1 + f_2 (-1)^(h + k)$.

    + $(2,1)$ has $h + k = 3$ odd, so $F(2,1) = f_1 - f_2$. $(1,1)$ has $h + k = 2$ even, so $F(1,1) = f_1 + f_2$.

    + If $f_1 = 2 f_2$: $F(2,1) = f_2$, $F(1,1) = 3 f_2$, so $I(2,1)/I(1,1) = (1/3)^2 = 1/9$.

    + If $f_1 = f_2$: $F(2,1) = 0$, $F(1,1) = 2 f_1$, so $I(2,1)/I(1,1) = 0$.
  ],
)

#flashcard(
  title: "Exam 5.5: New primitive cell + BZ",
  color: blue,
  question: [
    + Now suppose all atoms are identical, so the two-atom pattern gains higher translational symmetry.

    + Is the original $a, b$ parallelogram still primitive?

    + What is the new primitive area $A_1$ and a valid basis?

    + What is the first BZ area $A^*$ in this new primitive choice?
  ],
  answer: [
    + Path: With identical atoms, extra translations can halve the primitive area. New primitive area is $ab/2$, and $A^* = (2 pi)^2/A_1$.

    + No, $a, b$ is not primitive now.

    + $A_1 = ab/2 = 12$ Å^2, with one atom per primitive cell (e.g., $r = (0, 0)$).

    + $A^* = (2 pi)^2/A_1 = 3.29$ Å^(-2).
  ],
)

#flashcard(
  title: "Exam 6.1: Fermi surface area ratio",
  color: blue,
  question: [
    + Two 3D free-electron metals A and B have the same unit cell volume, but $n_B = 2 n_A$.

    + Compare Fermi surface areas $S_A, S_B$ and compute $S_A/S_B$.
  ],
  answer: [
    + Path: $k_F prop n^(1/3)$ and $S prop k_F^2 prop n^(2/3)$.

    + $S_A/S_B = (n_A/n_B)^(2/3) = (1/2)^(2/3) = 2^(-2/3)$.
  ],
)

#flashcard(
  title: "Exam 6.2: DOS + low-T c_v ratio",
  color: blue,
  question: [
    + Compute $(nu_A (epsilon_F))/(nu_B (epsilon_F))$.

    + Compute $c_(v,A)/c_(v,B)$ at $T = 10$ K.
  ],
  answer: [
    + Path: $nu(epsilon_F) prop n^(1/3)$ and $c_v prop nu(epsilon_F) T$.

    + $nu_A/nu_B = (n_A/n_B)^(1/3) = (1/2)^(1/3)$.

    + $c_(v,A)/c_(v,B) = (1/2)^(1/3)$.
  ],
)

#flashcard(
  title: "Exam 6.3: High-T phonon scattering",
  color: blue,
  question: [
    + At high $T$, phonons dominate and $tau^(-1) prop N_("phonon")$.

    + With $Theta_(D,A) = Theta_(D,B) = 100$ K, which metal has higher $rho$ at 300 K? Give $rho_A/rho_B$.

    + If $Theta_(D,B) = 200$ K (A still 100 K), what is the new conclusion and ratio?
  ],
  answer: [
    + Path: Use the solution's phonon-scattering scaling at high $T$.

    + With equal Debye temperatures, $rho_A/rho_B = 2$, so A has higher resistivity.

    + With $Theta_(D,B) = 200$ K, $rho_A/rho_B = 4$ in the solution.
  ],
)

#flashcard(
  title: "Exam 6.4: Defect scattering + kappa",
  color: blue,
  question: [
    + At $T = 5$ K, defect scattering dominates, defect cross section $Q$ is the same, and $rho_A = 2 rho_B$.

    + Find $tau_A/tau_B$, $n_(d,A)/n_(d,B)$, and $kappa_A/kappa_B$ using Wiedemann-Franz.
  ],
  answer: [
    + Path: Use $tau approx 1/(v_F n_d Q)$, $v_F prop n^(1/3)$, $nu(epsilon_F) prop n^(1/3)$, and $kappa prop sigma prop 1/rho$.

    + $tau_A/tau_B = 1$.

    + $n_(d,A)/n_(d,B) = 2^(1/3)$.

    + $kappa_A/kappa_B = rho_B/rho_A = 1/2$.
  ],
)

#flashcard(
  title: "Exam 7.1: Parabolic expansions + masses",
  color: blue,
  question: [
    + Given $E_(c b) = E_G - 2 t_(c b) [cos(k a) - 1]$ and $E_(v b) = 2 t_(v b) [cos(k a) - 1]$ with $t_(c b) = 2 t_(v b) = t$.

    + Expand both bands for small $k$ to second order and extract $m_(c b)^*$ and $m_(v b)^*$ (holes).
  ],
  answer: [
    + Path: $cos(k a) approx 1 - (1/2)(k a)^2$, match $E approx E_0 + hbar^2 k^2/(2 m^*)$.

    + $epsilon_(c b) approx E_G + t a^2 k^2$, $epsilon_(v b) approx -(1/2) t a^2 k^2$.

    + $m_(c b)^* = hbar^2/(2 t a^2)$, $m_(v b)^* = hbar^2/(t a^2)$.
  ],
)

#flashcard(
  title: "Exam 7.2: 1D DOS per length",
  color: blue,
  question: [
    + Using the parabolic approximations, write $nu_(c b)(E)$ and $nu_(v b)(E)$ in the form $prop 1/sqrt("distance to edge")$.
  ],
  answer: [
    + $nu_(c b)(E) = 1/(pi a sqrt(t_(c b) (E - E_G))) = 1/(pi a sqrt(t (E - E_G)))$ for $E >= E_G$.

    + $nu_(v b)(E) = 1/(pi a sqrt(t_(v b) (-E))) = 1/(pi a sqrt((t/2) (-E)))$ for $E <= 0$.
  ],
)

#flashcard(
  title: "Exam 7.3: Carrier densities + mu",
  color: blue,
  question: [
    + In the Boltzmann regime, compute $N_e$ and $N_h$ per length.

    + Find the intrinsic chemical potential $mu$ from $N_e = N_h$.
  ],
  answer: [
    + $N_e = (sqrt(k_B T)/(a sqrt(pi t))) exp((mu - E_G)/(k_B T))$.

    + $N_h = (k_B T/(a sqrt(pi t/2))) exp(-mu/(k_B T))$.

    + Intrinsic: $mu = E_G/2 + (k_B T/2) ln 2$.
  ],
)

#flashcard(
  title: "Exam 8.1: Honeycomb GS + Weiss T",
  color: blue,
  question: [
    + Case A: $J_1 < 0$, $J_2 > 0$. Case B: $J_1 > 0$, $J_2 < 0$.

    + For each case, give a qualitative ground-state description consistent with FM vs AF bonds.

    + Give the Weiss temperature $T_W$ (same functional form for both).
  ],
  answer: [
    + Case A: $J_1$-connected neighbors align, $J_2$-connected neighbors oppose (AFM-type ordered pattern).

    + Case B: $J_1$-connected neighbors oppose, $J_2$-connected neighbors align (another ordered pattern).

    + $T_W = -((J_1 + 2 J_2)/(3 k_B)) S(S + 1)$.
  ],
)

#flashcard(
  title: "Exam 8.2: Perp field saturation",
  color: blue,
  question: [
    + A magnetic field $H$ is applied perpendicular to the ordered spin direction at $T = 0$.

    + For Case A ($J_1 < 0$, $J_2 > 0$), give $H_("sat")$.

    + For Case B ($J_1 > 0$, $J_2 < 0$), give $H_("sat")$.
  ],
  answer: [
    + Case A: $H_("sat") = 8 J_2 S g mu_B mu_0$.

    + Case B: $H_("sat") = 4 J_1 S g mu_B mu_0$.
  ],
)

#render-flashcards()
