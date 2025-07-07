#import "lib.typ": *
#show: frame-style(styles.boxy)

= Quickmath

== Eigenschaften

Die Eigenschaften einer Funktion die uns interessieren sind:

+ Stetigkeit
+ Integrierbarkeit $L^1$
+ Integrierbarkeit $L^2$
+ Glattheit $C^infinity$
+ Periodizität
+ Stetige Differenzierbarkeit $C^k$
+ Schwartzraum
+ Hilbertraum
+ Regularität
+ Konvergenz
+ Kompakter Träger
+ Beschränktheit
+ Beschränkte Variation
+ Rotationsinvarianz
+ Distribution
+ Harmonisch
+ Temperierte Distribution
+ Fundamentallösung
+ Greenfunktion



Diese Eigenschaften geben Ausschluss über die Form und Struktur der Fouriertransformation und Fourierreihen und vice versa. Die wichtigsten Implikationen und Zusammenhänge sind:


== Fourierreihen

- *Riemann-Lebesgue-Lemma*
  $f$ stetig, periodisch $=> f_n -> 0$ (Fourierkoeffizienten fallen gegen $0$)

- *Punktweise Konvergenz*
  $f$ stetig, periodisch $=>$ Fourierreihe konvergiert punktweise

- *Gleichmäßige Konvergenz (Dirichlet-Jordan)*
  $f$ stetig, periodisch, beschränkte Variation $=>$ Fourierreihe konvergiert gleichmäßig (Dirichlet-Jordan)

- *Stückweise $C^1$-Funktionen*
  $f$ stückweise $C^1$ $=>$ Fourierreihe konvergiert gleichmäßig auf Intervallen, wo $f$ stetig ist

- *Beschränkte Variation*
  $f$ beschränkte Variation $=>$ Fourierreihe konvergiert punktweise überall

- *Existenz der Fourierreihe*
  $f$ periodisch $=>$ Fourierreihe existiert (im Sinne von Distributionen)

== Fouriertransformation

- *Existenz der Fouriertransformation*
  $f in L^1$ $=>$ Fouriertransformation $hat(f)$ existiert, stetig und fällt gegen $0$

- *Fouriertransformation in $L^2$ (Plancherel)*
  $f in L^2 => hat(f) in L^2$, Plancherel-Formel gilt, Fouriertransformation unitär
  Plancherel-Formel: $norm(hat(f))^2 = norm(f)^2$


- *Abschätzung der Fourierkoeffizienten bei $C^k$*
  $f in C^k => |f_n| <= C/(abs(n)^k)$ (Fourierkoeffizienten fallen schnell ab)

- *Abschätzung der Fouriertransformation bei glatten Funktionen und kompaktem Träger*
  $f$ kompakter Träger, $C^k => hat(f)$ fällt schneller ab als jedes Polynom

- *Schwartzraum*
  $f$ Schwartzfunktion $=> hat(f)$ Schwartzfunktion (Fouriertransformation ist Automorphismus auf Schwartzraum)

- *Rotationsinvarianz*
  $f$ rotationsinvariant $=>$ Fouriertransformation ist auch rotationsinvariant


== Distributionen

- *Distributionen*
  $f$ Distribution $=>$ Fouriertransformation als Distribution definiert

- *Temperierte Distributionen*
  $f$ temperierte Distribution $=>$ Fouriertransformation wohldefiniert im Raum der temperierten Distributionen

- *Analytische Fortsetzbarkeit*
  $f$ kompakter Träger $=> hat(f)$ analytisch fortsetzbar

- *Harmonische Funktionen*
  $f$ harmonisch $=> f$ ist glatt (unendlich oft differenzierbar)

- *Ableitungen und Multiplikation*
  $f$ Distribution mit kompaktem Träger $=> hat(f)$ analytisch $=>$ Ableitungen und Multiplikation mit glatten Funktionen wohldefiniert

- *Fouriertransformation und Ableitung*
  $f$ Distribution $=>$ Ableitungen und Multiplikation mit glatten Funktionen wohldefiniert
  $\hat{f}'(k) = i k \hat{f}(k)$

- *Unschärferelation*
  $f$ und $hat(f)$ können nicht beide kompakten Träger haben (Paley-Wiener, Unschärferelation).

- *Dualität der Fouriertransformation*
  $f$ und $hat(f)$ sind dual zueinander, d.h. die Fouriertransformation ist eine bijektive Abbildung zwischen den Räumen der Funktionen und ihren Fouriertransformationen.




*Zusammenfassend*: Je regulärer und "besser" das Verhalten einer Funktion (z.B. Glattheit, schnelles Abfallen, kompakter Träger), desto besser das Verhalten ihrer Fouriertransformation (z.B. Glattheit, schnelles Abfallen, Regularität) und umgekehrt. Die Fouriertransformation bildet insbesondere den Schwartzraum auf sich selbst ab und ist unitär auf $L^2$.
