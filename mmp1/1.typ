#import "lib.typ": *
#show: frame-style(styles.boxy)

= Maßtheorie

Die Maßtheorie bildet ein fundamentales Werkzeug der Analysis und liefert die mathematische Grundlage für die Integration komplexer Funktionen. Im Rahmen der Physik ermöglicht sie die präzise Beschreibung von Wahrscheinlichkeitsverteilungen, Energiedichten und anderen messbaren Größen.

== Algebra von Mengen

#definition[Definition][Algebra von Mengen][
  Eine Algebra ist eine Menge von Mengen $cal(A)$ definiert auf einer urspünglichen Menge $X$, welche die folgenden Eigenschaften erfüllt:
  + $X in cal(A)$
  + $A, B in cal(A) => A union B in cal(A)$
  + $A, B in cal(A) => A inter B in cal(A)$
  + $A in cal(A) => A^C in cal(A)$
]

Im Kern lässt uns eine Algebra von Mengen grundlegende Operationen ausführen ohne die Menge zu verlassen.

== $sigma$-Algebra

#definition[Definition][$sigma$-Algebra][
  Sei $cal(F)$ eine $sigma$-Algebra auf der Menge $X$. $cal(F)$ enthält Teilmengen von $X$, wobei folgendes erfüllt sein muss:
  + $X in cal(F)$: Der gesamte Raum kann als messbare Menge betrachtet werden.
  + $A in cal(F) => A^C in cal(F)$: Wenn eine Menge messbar ist, ist auch ihr Komplement messbar.
  + $union_(n=1)^(infinity) A_n in cal(F)$: Eine $sigma$-Algebra ist auch unter abzählbar unendlichen Vereinigungen geschlossen.
  + $inter_(n=1)^(infinity) A_n in cal(F)$: Abgeleitet aus den De Morgan'schen Gesetzen.
]

Eine $sigma$-Algebra ist eine Menge von Mengen, welche uns erlaubt, eine robustere Definition von Integration einzuführen. Messbarkeit verlangt eine $sigma$-Algebra-Struktur, um Mengen eine Größe zuzuweisen.

#remark[
  Funktionen, welche auf einem Maßraum definiert sind, sind nur dann messbar, falls ihre Urbilder aus Borel-Mengen zu einer $sigma$-Algebra zugewiesen werden können.
]

== Borel $sigma$-Algebra

#definition[Definition][Borel $sigma$-Algebra][
  Die Borel $sigma$-Algebra $cal(B)(X)$ ist die kleinste $sigma$-Algebra, welche alle offenen Mengen von dem topologischen Raum $X$ (meist $RR$) enthält.
]

Sie lässt sich bilden aus:
+ Bilde alle offenen Mengen in $X$.
+ Füge alle abzählbaren Vereinigungen der offenen Mengen hinzu.
+ Füge alle abzählbaren Schnitte hinzu.
+ Füge alle Komplemente hinzu.
+ Wiederhole bis keine neuen Mengen gebildet werden können.

#theorem[Satz][
  Damit die Fouriertransformation angewendet werden kann, muss die Funktion messbar sein. Das Lebesgue-Maß erweitert die Borel $sigma$-Algebra um weitere Mengen (aber nicht alle Teilmengen von $RR$).
]

== Borel-Urbilder und Messbarkeit

#lemma[Lemma][Messbarkeit von Funktionen][
  Die Messbarkeit von Funktionen ist entscheidend für ihre Integration und damit für die Anwendung vieler physikalischer Konzepte:
  + Die *Fourier-Transformierte* $hat(f)(k) = integral_RR f(x) e^(-2 pi i k x) dd(x)$
  + Damit das Integral existiert, muss $f$ messbar sein.
  + Messbarkeit von $f$ bedeutet, dass die Mengen von $X$, für die $f(x)$ in eine beliebige *Borel-Menge* fällt, in der *$sigma$-Algebra* enthalten sein müssen.
]

=== Beispiel zur Messbarkeit

#example[
  Um die Messbarkeit von Funktionen zu veranschaulichen:
  + Sei $f: RR -> RR$ überall definiert.
  + Sei Borel-Menge $B = (-1, 1) subset RR$
  + Damit $f$ messbar ist, muss:
  $
  f^(-1)(B) = {x in RR | f(x) in (-1, 1)}
  $
  in der $sigma$-Algebra von $RR$ liegen.
]

#corollary[
  Die Maßtheorie bildet somit die Grundlage für die mathematisch rigorose Behandlung von Integralen und ist damit unverzichtbar für viele Anwendungen in der Physik, insbesondere für die im Folgenden behandelten Fouriermethoden.
]
