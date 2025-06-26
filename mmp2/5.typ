#import "lib.typ": *
#show: frame-style(styles.boxy)

= Eigenwertprobleme mit Symmetrie

== Eigenwerte und Eigenvektoren

Sei $rho: G -> GL(V)$ eine Darstellung der Gruppe $G$ und $A:V -> V$. Wir wollen $A$ diagonalisieren. Wir suchen $rho(g) A = A rho(g) forall g in G$.

Also $A in Hom_G(V, V)$. Ein Beispiel davon findet man in der Quantentheorie. In dem Fall wär $A$ der Hamiltonoperator und $rho(g)$ die Zeitentwicklung. Dann ist $V$ ein Hilbertraum.

Frage: Was bringt uns die Symmetrie um $A$ zu diagonalisieren? Was können wir über die Eigenwerte und Eigenvektoren von $A$ sagen durch die Symmetrie?

Wir kennen den Spezialfall: Falls unsere Darstellung $rho$ irreduzibel. Über das Lemma von Schur 2 $=>A = c id_V =>$ alle Eigenwerte von $A$ gleich, jedes $v in V, v!=0$ ist ein Eigenvektor.

#theorem[Satz][
  Sei $rho: G -> GL(V)$ eine endlichdimensionale, komplexe Datstellung einer endlichen Gruppe $G$ (geht auch für kompakte Gruppen, wir müssen nur vollständig reduzieren können).

  Sei $ A: V -> V$ eine diagonalisierbare lineare Abbildung, so dass $rho(g) A = A rho(g)$ für alle $g in G$ gilt.

  Sei $V iso V_1 oadd ... oadd V_n$ eine Zerlegung in irreduzible, invariante Unterräume. Dann hat $A$ höchstens $n$ verschiedene Eigenwerte und in einer geeigneten Basis gilt, dass $A$ Diagonalform hat:

  $
    diag(lambda_(1 1), ..., lambda_(1 n), lambda_(2 1), ..., lambda_(2 n), ..., lambda_(n 1), ..., lambda_(n n))
  $ 
]

Beweis:

Seien $E_1, ..., E_m$ die Eigenräume von $A$ mit den Eigenwerten $mu_1, ..., mu_m$. $A$ ist diagonalisierbar:

$
  V = E_1 oadd ... oadd E_m\
  forall g in G, v in E_j: A rho(g) v =  rho(g) A v = mu_j rho(g) v\
  => rho(g) v in E_j
$

$=>$ die $E_j$ sind invariante Unterräume.

Zerlege die Darstellungen $E_j$ seperat in irreduzible Unterdarstellungen:

$
  => V = V'_1 oadd ... oadd V'_n'\
  rho|_(V'_j) "irreduzibel"\
  => A|_(V'_j) = c_j id_{V'_j}\
$

$=>$ Es gilt $n = n'$ und die Dimensionen $dim(V'_1), ..., dim(V'_n)$ sind gleich der Dimensionen der $dim(V_1, ..., V_n)$ bis auf eine Permutation.

Man kann annehmen $V_j = V'_j$. Wähle eine Basis von $V$ als Vereinigung von Basen von $V_1, ..., V_n$. Dann ist wegen above $A$ automatisch diagonal in dieser Basis und alle Basiselemente von $V_j$ sind Eigenvektoren zum gleichen Eigenwert.

Bemerkung:

Sei $V iso W_1, ... , W_k$ die Zerleigung von $V$ in isotypische Komponenten. Also für $(rho_1, V_1), ..., (rho_k, V_k)$ die irreduziblen Darstellungen von $G$ mit $W_j iso V_j oadd ... oadd V_j$ mit Vielfachheit $n_j$ an $V_j$. $n_j = (chi_j, chi_rho)$.

Es gilt für $A in Hom_G(V, V)$:

$
  A: V -> V\
  forall g in G rho(g) A = A rho(g)\
$

Dann ist $A$ diagonalisierbar und in der Basis von $V$ mit Basisvektoren $v_{j i}$ für $i = 1, ..., n_j$ ist $A$ diagonal.

Beweis:

1. Zerlege die Darstellung $V$ in isotypische Komponenten. Zu jeder irreduziblen Darstellung von $G$ gibt es eine isotypische Komponente $W_j$ mit Vielfachheit $n_j$.

  $
  V = W_1 oadd ... oadd W_k\
  $

  Schreibe $A$ in Blockform:

  $
    A = (A_(i j))_(i j) in mattyp(k, k)\
    "mit" A_(i j): W_j -> W_i\
  $

2. Schreibe:

  $
    W_i = V_i oadd ... oadd V_i "vielfachheit" n_i\
  $

  Aber das ist nicht eindeutig. Schreibe $A_(i j)$ in Blockform bezüglich dieser Zerlegung:

  $
    A_(i j) = (A_(i j, p q))_(p q) in mattyp(n_i, n_j)\
    "mit" A_(i j, p q): V_j -> V_i\
  $

  In Blockschreibweise:

  $
    rho(g) = diag(rho_1 (g), ..., rho_1 (g), rho_2 (g), ..., rho_2 (g), ..., rho_k (g), ..., rho_k (g))\
  $

  Mit Blöcken $n_1, ..., n_k$.

  Wir schauen uns wieder $rho (g) A = A rho(g)$ an. Das heißt:

  $
    forall i, j, p, q, forall g in G:\
    rho_i (g) A_(i j, p q) = A_(i j , p q) rho_j (g)\
  $

  $
    => A_(i j, p q) in Hom_G(V_j, V_i)\
  $

  Wir benutzen das Lemma von Schur 2:

  Angenommen $V_i != V_j$, dann ist die Abbildung $A_(i j, p q) = 0$. Ist $V_i = V_j$, dann ist $A_(i j, p q) = c_(i j, p q) id_{V_i}$.

  $
    => A = diag(A_(1 1), ..., A_(k k))\
    A_(i i) = (a_(i, l m) id_(V_i))_(l m) in mattyp(n_i, n_i)\
  $

  Wir können es auch so schreiben:

  $
    W_i iso V_i oadd ... oadd V_i = = V_i oprod C^(n_i)\
    A_(i i) = id_(V_i) oprod a_i\
    a_i = (a_(i, l m))_(l m) in mattyp(n_i, n_i) in End(CC^n) 
  $

Die Diagonalisierung von $A$ ist also zurückgeführt auf die Diagonalisierung der Matrizen der $n_i prod n_i$ Matrizen $a_i$.

Spezialfall:

Seien alle $n_i in {0, 1}$. Sei $rho: G -> GL(V)$ eine Darstellung der endlichen Gruppe $G$ und $A in Hom_G(V, V)$.

Sei $V = U_1 oadd ... oadd U_n$ eine Zerlegung in irreduzible, invariante Unterräume, sodass $rho|_(U_i) != rho|_(U_j)$ für $i != j$.

Dann gilt:

$
  A U_i subset U_i\
  "und"\
  A|_(U_i) = lambda_i id_(U_i)\
$

Beispiel:

Diagonalisiere $A = mat(a, b, b; b, a, b; b, b, a)$. Wir haben viel Symmetrie.

Es gilt $rho(sigma) A = A rho(sigma) forall sigma in S_3$, mit $rho: S_3 -> GL(C^3)$ durch Permutation der Basisvektoren.

$
  rho(sigma) e_i = e_(sigma(i))\
$

Wir haben schon gesehen $rho iso rho_"triv" oadd rho_2$, wobei $rho_2$ die 2-dimensionale irreduzible Darstellung ist. Da die beiden Darstellungen inäquivalent sind, ist der Satz anwendbar.

$
  V = CC^3 = span(mat(1; 1; 1)) oadd span(mat(1; -1; 0), mat(0; 1; -1))
$

$=>$ Die Basisvektoren sind Eigenvektoren. Die Eigenwerte bestimmt man durch Anwendung:

$
  A mat(1; 1; 1) = (a + 2b) mat(1; 1; 1)\
  => lambda_1 = a + 2b\
  A mat(1; -1; 0) = (a - b) mat(1; -1; 0)\
  => lambda_2 = a - b
$

Beispiel: Schwingung von Molekülen:

Welche Schwingungsfrequenzen gibt es und mit welchen Amplituden schwingen die Atome?

#image("image-1.png")











