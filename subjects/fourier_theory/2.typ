#import "lib.typ": *
#show: frame-style(styles.boxy)

= Fourierreihen

Saite:
$
pdv(u(t,x),t,2) = pdv(u(t,x),x,2)\
u(t,0) = u(t,pi) = 0\
u(t,x) = sin(k x) (a cos(k t) + b sin(k t))\
k = 1, 2, 3
$
Ist die allgemeine Lösung der Wellengleichung $=>$ Superpositionsprinzip

== Die Fourierreihe

Periode L>0. Ist eine Funktion $f(x), e in RR$ mit

$
f(x) = sum_(n=-infinity)^(infinity) f_n e^((2 pi i n x)/L), f_n in CC\
f(x+L) = f(x) forall x
$
Die Fourierreihe ist automatisch eine periodische Funktion. 


== Welche $f$ kann man so als Fourierreihe darstellen?

$
f(x) = f_0 + (f_1 e^((2 pi i n x) / L) + ...)
$
Dabei it $f_0$ konstant und der rest Sinuswellen. Das heisst bei Integration über gesamte Periode gehen alle Sinuswellen zu Null und nur $f_0$ bleibt übrig:
$
1/L integral_0^L e^((2 pi i n x)/L) dd(x) = cases(1 "if" n=0, 0 "if" n != 0) 
$

#theorem[Satz][
  Seien $f_n in CC$ so, dass $sum_(n=-infinity)^(infinity) abs(f_n) < infinity$, dann:
  + Die Fourierreihe $f(x) = sum_(n in ZZ) f_n e^((2 pi i x)/L)$ konvergiert absolut (weil exponential immer 1 und absolut von $f_n$ beschränkt) und gleichmässig gegen eine L-periodische, stetige Funktion.
  + Umgekehrt gilt:
    $
    f_n = 1/l integral_0^L f(x) e^(-(2 pi i n x)/L) dd(x)
    $
]

*Beweis gleichmässige Konvergenz:*
$
f_N(x) = sum_(n=-N)^N f_n e^((2 pi i n x)/L)\
sup_(x in RR)(abs(f(x) - f_N(x))) = sup_(x in RR)abs(sum_(abs(n)>N) f_n e^((2 pi i n x)/L))\
<= sup_(x in RR) sum_(abs(n)>N) abs(f_n e^((2 pi i n x)/L)) <= sum_(abs(n)>N) abs(f_n) -> 0, N -> infinity
$

*Beweis Fourierkoeffizient:*

Bei gleichmässiger Konvergenz kann man Grenzwerte und Integration vertauschen:
$
1/L integral_0^L f(x) e^(-(2 pi i n x)/L) dd(x)\
= sum_(n in ZZ) 1/L integral_0^L f_n e^((2 pi i n x)/L) e^(-(2 pi i n x)/L) dd(x)\
= sum_(n in ZZ) 1/L f_n integral_0^L e^(-(2 pi i (n-m) x)/L) dd(x) = f_m\
$
weil sich das integral für $n!=m$ auscancelt.

*Beispiel:*

$
f(x) = sum_(n in ZZ) 2^(-abs(n)) e^(i n x), x in RR\
f_n = 2^(-abs(n)\
sum_(n in ZZ) 2^(-abs(n)) = 3 < infinity
$

*Gegenbeispiel:*

Sägezahnfunktion:
$
f(x) = 1/2 - x (x <= x <= 1), "1-Periodisch"
$
Wenn $f = sum f_n e^((2 pi i n x)/L)$ und 
$
f_n = integral_0^1 e^(2 pi i n x) dd(x) = cases(0 "if" n=0, 1/(2 pi i n) "if" n != 0)
$
Die Koeffizienten fallen ab aber die Summe konvergiert nicht.

#theorem[Satz][Riemann-Lebesgue-Lemma][
   sei $f: RR -> CC$ L-Periodisch, Stetig
   $
   f_n = 1/L integral_0^L f(x) e^(-(2 pi i n x)/L) dd(X)
   $
   Dann gilt $abs(f_n) ->^(n-> infinity) 0$
]
Das liegt daran, dass wenn man die Funktion mit einer sehr schnell oszillierenden Funktion multipliziert, werden benachbarte punkte von einander subtrahiert (schnelle sozillation). Da die ursprüngliche Funktion stetig ist werden sehr ähnliche Werte subtrahiert:

*Beweis:*

$
forall a in RR:\
f_n = 1/L integral_a^(a+l) f(x) e^(-(2 pi i n x)/L) dd(x)
$
Die integrierte Funktion ist L-Periodisch. Daher kommt, egal was $a$ ist, das gleiche Ergebnis raus.
$
x = y + a => 1/L integral_0^L f(y+a) e^(-(2 pi i n y)/L) e^(-(2 pi i n a)/L) dd(y)\
$
zweiter exponentialterm ist eine phasenverschiebung bei
$
a = L/(2n)\
e^(-(2 pi i n a)/L) = -1\
=> f_n = - 1/L integral_0^L f(x + L/(2n)) e^(-(2 pi i n x)/L) dd(x)\
$
Nun haben wir zwei Ausdrücke für $f_n$. Damit diese gleich sind müssen sie sehr klein sein weil $f(x) - f(x + L/(2n)) approx 0$:
$
f_n = 1/2(f_n + f_n) = 1/(2 L) integral_0^L (f(x) -f(x + L/(2n)) e^(-(2 pi i n x)/L)) dd(x)\
$
$f$ ist stetig auf $[-L, 2L]$ (beschränkt, abgeschlossen) $=>$ gleichmässig stetig.\
Sei $epsilon >0 exists N in NN$ sodass $x in [0,L] => abs(f(x)-f(x + L/(2n))) < epsilon forall abs(n) >= N$.\
Also gilt für $abs(n) >= N$:
$
abs(f_n) <= 1/(2L) integral_0^1 epsilon dd(x) = epsilon/2
$
*Wenn n gross genug ist, ist der Fourierkoeffizient beliebig klein. Für stetige Funktionen fallen die Fourierkoeffizienten ab.*

#theorem[Satz][
  $f: RR -> CC$ L-Periodisch und $f in C^k(RR)$ also $f$ ist k-mal stetig differenzierbar. Dann gilt:
  $
  abs(n)^k abs(f_n) ->^(abs(n) -> infinity) 0\
  abs(f_n) <= C/(abs(n)^k)
  $
  Für glatte Funktionen fallen die Koeffizienten exponentiell ab.
]

*Beweis:*

Für $n != 0$:
$
e^(-(2 pi i n x)/L) = (-L/(2 pi i n))^k dv(, x, k) (e^(-(2 pi i n x)/L))\
=> f_n = 1/L (-L/(2 pi i n))^k integral_0^L f(x) dv(,x,k) (e^(-(2 pi i n x)/L)) dd(x)\
"Integration" = 1/L (1/(2 pi i n))^k integral_0^L f(x) (e^(-(2 pi i n x)/L)) dd(x)\
$
Die Randterme verschwinden, da $f$ und der Rest L-Periodisch sind.
$
= L^k/(2 pi i)^k 1/(n^k) (f^((k)))_n cases("n-the fourierkoeffizient", "von" f^((k)) "d.h. stetig")\
=> abs(n^k f_n) -> 0
$

#theorem[Satz][Umgekehrt][
  Wenn $abs(f_n) <= c/(abs(n)^(k+2)) forall n in ZZ$, dann ist $f(x) = sum f_n e^(-(2 pi i n x)/L)$ periodisch und $f in C^k(RR)$
]

== Wiederherstellung der Funktion

L-Periodische Funktion $f: RR -> CC$, Fourierkoeffizienten $f_n$. Kann man $f$ aus $f_n$ wiederherstellen?

Vielleicht:
$
f(x) = sum f_n e^((2 pi i n x)/L)
$
In vielen fällen funktioniert das aber nicht. Wir betrachten die *Partialsummen* um das zu überprüfen.

$
(S_N f)(x) = sum_(-N)^N f_n e^((2 pi i n x)/L)\
= sum_(-N)^N (1/L integral_0^L f(y) e^(-(2 pi i n y)/L) dd(y)) e^((2 pi i n x)/L)\
= 1/L integral_0^l f(y) sum_(-N)^N e^((2 pi i n (x-y)/L) dd(y)\
= 1/L integral_0^L f(y) D_N ((x-y)/L) dd(y)\
$
wobei 
$
D_N(t) = sum_(-N)^N e^(2 pi i n t)
$
*Dirichlet-Kern*. Sie sieht für hohe N wie eine Kastenfunktion aus. Wir integrieren also nur einen betrag wenn x und y nahe an einander sind.

$
(S_N f)(x) = 1/L integral_0^L f(y) D_N (x-y)/L dd(y)
$

== Eigenschaften vom Dirichletkern

#theorem[Satz][Eigenschaften vom Dirichletkern][
  $
  D_N(t) = D_N(t+1)\
  integral_0^1 D_N(t) dd(t) = 1\
  D_N(t) = cases(sin(pi(2N+1)t)/sin(pi t) "for" t in RR\\ZZ, 2N+1 "for" t in ZZ)
  $
]
*Beweis Integral:*
$
integral_0^1 D_N(t) dd(t) = 0"-ter Fourierkoeffizient"\
"Koeff von" D_N = 1
$
*Beweis Cases:*
$
D_N(t) = sum _(n=0)^(2N) e^(2 pi i (n-N)t) = e^(-2 pi i N t) sum e^(2 pi i t)^n\
= e^(-2 pi i N t) (e^(2 pi i t(2N+1))-1)/(e^(2 pi i t)-1)\
= (e^(2 pi i (N + 1/2) t) - e^(-2 pi i (N + 1/2) t))/(e^(pi i t) - e^(-pi i t)) = (2 i sin(2 pi (N + 1/2) t))/(2 pi sin(pi t))
$

#theorem[Satz][
  $
  f in C^1(RR) "L-Periodisch"\
  f_n = 1/L integral_0^1 f(x) e^(-(2 pi i n x)/L) dd(x)\
  => forall x in RR: f(x) = lim_(N -> infinity) (S_N f)(x) = lim_(N->infinity) sum_(n=-N)^N f_n e^((2 pi i n x)/L)
  $
  Also kann man jede einfach differenzierbare Funktion als Fourierreihe schreiben.
]

*Beweis:*

Wir gucken uns die Differenz an und hoffen wir finden ne Abschätzung $-> 0$.
$
(S_N f)(s) - f(x) = 1/L integral_0^L f(y) D_N (x-y)/L dd(y) -f(x)\
"Benutze:" 1/L integral_0^1 D_N (x-y)/L dd(y) approx 1\
= 1/L integral_0^L (f(y) - f(x)) D_N (x-y)/L dd(y)\
= 1/L integral_0^L (f(y)-f(x))/sin(pi (x-y)/L) sin(pi (2 N + 1)) (x-y)/L dd(y)\
F_x(y) = (f(y)-f(x))/sin(pi (x-y)/L)\
$
Dieser Grenzwert existiert und ist endlich. Dann ist $F_x:RR -> CC$ stetig (LHopital) und 2L-Periodisch.
$
(S_N f)(x) - f(x) = 1/L integral_0^L F_x(y) sin(pi (2 N + 1) (x-y)/L) dd(y)\
= 1/(2L) integral_0^(2L) F_x(y) sin(pi (2 N + 1) (x-y)/L) dd(y)\
...
$

*Interessante Funktionen:*

$
f(x) = 1/2 - x, 0 <= x <= 1
$
Der Satz kann nicht angewendet werden. Also obwohl wir die Fourierkoeffizienten ausrechnen können, wissen wir nicht ob die Fourierfunktion gegen diese Funktion konvergiert.

#lemma[Lemma][Beschränkte Variation][
  $f:[0,L]-> CC$ ist von beschränkter Variation, falls $forall V < infinity$ sodass $forall n in NN: 0 = x_0 < x_1 < x_n = L$ (Unterteilungen), die Sprünge der Funktion summiert kleiner als V:
  $
  sum_(i=0)^(n-1) abs(f(x_(i+1)) - f(x_i)) <= V
  $
]

*Beispiele:*

+ Jede differenzierbare Funktion ist von beschränkter Variation: $V=integral_0^L abs(f'(x)) dd(x)$
+ Jede stückweise stetig-differenzierbare Funktion, da die Stücke einzeln von beschränkter Variation sind.

#theorem[Satz][Dirichlet-Jordan Kriterium][
  Sei $f:RR -> CC$ L-Periodisch, von beschränkter Variation auf $[0,L]$.\
  Sei $(S_N f)(x) = sum_(n=-N)^(N) f_n e^((2 pi i n x)/L)$.\
  Dann:
  + $lim_(N->infinity) (S_N f)(x) = 1/2 (f(x-0) + f(x+0))$
    Wert am Grenzwert ist Durchschnitt von den Grenzwerten.
  + Ist $f$ an jedem Punkt eines abgeschlossenen Intervalls $I$ stetig, so gilt $(S_N f)(x)$ konvergiert gleichmässig zu $f(x)$ auf $I$
]

*Beispiel:* Sägezahnfunktion

$
f(x) = 1/2 - x, 0 <= x < 1, "L-Periodisch"\
(S_N f)(x) = cases(1/2-x "for" 0 < x < 1, 0 "for" x=0\, 1)\
$

Die Partialsummen sind glatt und können also die Sägezahnfuntion nicht richtig abbilden. Sie konvergieren also nicht gleichmässig., denn der Grenzwert von stetigen Funktionen kann nicht unstetig sein.

== Gibbs Phänomen

#theorem[Satz][Gibbs Phänomen][
  Konvergenz nahe einer Sprungstelle ist nicht gleichmässig. Das Gibbs Phänomen beschreibt wie sehr die Sprungstelle $x_0$ sich von der Partialsumme unterscheidet.
  $
  f(x_0 plus.minus 0) = c plus.minus h
  $
  $c$ ist dabei der durchschnitt der beiden Seiten und h die entfernung zu den beidseitigen Grenzwerden. So erreicht $(S_N f)$ nahe $x_0$ die werte $c plus.minus 1.18 h$ (*für alle Fälle*). D.h. die Sprunghöhe von Partialsummen ist $approx 2 dot 1.18 h$.
]

==== Beweis

Sei Sägezahnfunktion. 
$
f_n = cases(1/(2 pi i n)/2\,n != 0, 0\, n=0)\
g_N(x)=(S_N f)(x) - f(x) \
= sum_(n=-N; n != 0)^N = 1/(2 pi i n) e^(2 pi i n x) - (1/2 - x), 0 <= x < 1\
$
Maximum von $g_N(x)$ für kleine $x>0$.
$
g'_N(x) = sum e^(2 pi i n x) + 1 = sum_(-N)^N e^(2 pi i n x)\
= D_N(x) = sin(pi(2N+1)x)/sin(pi x)\
$

Erste positive Nullstelle von $D_N(x)$:
$
x_0 = 1/(2N + 1)
$

D.h. das maximum wir immer näher an die Sprungstelle der Funktion gehen.

$
g_N(x_0) = g_N(0+) + integral_0^x_0 g_N'(x) dd(x)\
= (0-1/2) + integral_0^(1/(2N+1)) sin(pi(2N+1)x)/sin(pi x) dd(x)\
x = y/(2N+1)\
= -1/2 + integral_0^1 sin(pi y)/sin((pi y)/(2N+1)) 1/(2N+1) dd(y)\
= -1/2 + integral_0^1 sin(pi y)/(pi y) ((pi y)/(2N+1))/sin((pi y)/(2N+1)) dd(y) \
$
Der zweite Faktor geht zu 1 weil für kleine Zahlen $x/sin(x) approx x/x = 1$.
$
= -1/2 integral_0^1 sin(pi y)/(pi y) dd(y) approx 0.0895
$
Daher die 9% $=>$ 18% beidseitig. Also erreicht die Partialsumme für $N -> infinity$ den Wert $(S_N f)(x_0) = f(x_0) + 0.0895 = 0.5 + 0.0895$. Der Sprung ist also $1 + 2 dot 0.0895 approx 1.18$.

==  Satz von Fejer

#theorem[Satz][Satz von Fejer][
  Sei $f in C^0(RR)$, L-Periodisch.
  $
  (sigma_N f)(x) = 1/N sum_(n=0)^(N-1) (S_N f)(x)\
  = 1/N sum_(n=0)^(N-1) sum_(m = -n)^(n) f_m e^((2 pi i n x)/L)
  $
  Dann konvergiert $sigma_N f(x) -> f(x)$ gleichmässig.

  *Korollar:*
  Sei $f in c^0(RR)$, L-Periodisch. Dann gibt es ein *trigonometrisches Polynom* 
  $
  g(x) = "endliche Fourierreihe" \
  "(Linearkombination von endlich vielen" e^((2 pi i n x)/L)")"
  $
  sodass $abs(f(x) - g(x)) < epsilon forall x in RR$. Das bedeutet, dass man eine beliebige stetige Funktion gleichmässig durch trigonometrische Funktion approximieren können.
]

==== Beweis

Für grosse $N$ gilt $abs(f(x) - (sigma_N f)(x)) < epsilon forall x in RR$. Setzen wir $g = sigma_N f$.

== Fourierreihen von reelwertigen Funktionen

$f:RR -> RR$, L-Periodisch.
$
macron(f_n) = 1/L integral_0^L f(x) e^(-(2 pi i n x)/L) dd(x)\
=> f_n = f_(-n)\
=> sum_(n in ZZ) f_n e^((2 pi n x)/L) "reel"
$

So kann man an den Fourierkoeffizienten ablesen ob eine Funktion reelwertig ist. Dann kann man die Funktion anstatt mit Exponentialen mit trigonometrischen Funktionen ausdrücken.

$
f_n = 1/2 (a_n - i b_n), a_n, b_n in RR\
f_(-n) = 1/2 (a_n + i b_n)\
f(x) = 1/2 a_0 + sum_(n=1)^(infinity) 1/2 (a_n - i b_n)(cos((s pi n x)/L) + i sin((2 pi n x)/L))\
+ sum_(n=1)^(infinity) 1/2 (a_n - i b_n)(cos((s pi n x)/L) - i sin((2 pi n x)/L))\
= 1/2 a_0 + sum_(n=1)^(infinity) a_n cos((2 pi n x)/L) + b_n sin((2 pi n x)/L) = f(x)\
a_n = f_n + f_(-n) = 2/L integral_0^L f(x) cos((2 pi n x)/L) dd(x)\
b_n = 2/L integral_0^L f(x) sin((2 pi n x)/L) dd(x)
$

=== Konvergenzen und Implikationen review
 
$
abs(f_n) <= c/(1+abs(n))^(k+2) => f in C^k\
f in C^k => abs(f_n) <= c/(1+abs(n))^k
$

== Poissonsche Summenformel

#theorem[Satz][
  Sei $f:RR -> CC exists c$ sodass
  $
  abs(f(x)), abs(f^(x)) <= c/(1 + abs(x)^2) forall x in RR
  $

  Sei
  
  $
  hat(f)(k) = integral_(-infinity)^(infinity) f(x) e^(i x k) dd(x)\
  => sum_(n in ZZ) f/(n L) = sum_(n in ZZ) 1/L hat(f)((2 pi n)/L)
  $
]

=== Beispiel

$
f(x) = e^(-abs(x))\
=> sum_(n=-infinity)^(infinity) 1/(1+n^2) = pi (e^(2 pi) + 1)/(e^(2 pi) -1)
$

#lemma[Lemma][
  $
  g(x) = sum_(n in ZZ) f(x + n L)\
  $
  Dann ist g stetig differenzierbar und L-Periodisch.
]

=== Beweis

Zeige gleichmässige Konvergenz der Reihe für z.B. $x in [0, L]$. Für die Summe über $n in ZZ, abs(n)> N$:
$
sum_(n in ZZ, abs(n)>N) abs(f(x + n L)) <= sum_(abs(N) > N) c/(1+abs(x + n L)^2)\
abs(x + n L ) >= (abs(n)-1) <= sum_(j >=N) c/(1 + (j L)^2)\
<= (2 c)/L^2 sum_(j=N)^(infinity) 1/j^2 ->^(N->infinity) 0\
$

Gleichmässige Konvergenz von: $sum_(n in ZZ) f'(x + n L)$ erfüllt die gleiche Abschätzung.

Wenn man eine Folge von funktionen haben, welche gleichmässig gegen eine Grenzfunktion U konvergieren und die Ableitungen gegen $V$, dann ist $U$ stetig differentierbar. Auch $U'_n -> V$. Die Summe der $f$'s selbst ($f$) ist dann selber stettig differentierbar.

Wir wissen also:
$
g(x) = sum_(n in ZZ) g_n e^((2 pi i n x)/L)\
g_n = 1/L integral_0^L g(x) e^(-(2 pi i n)/L) dd(x)\
= sum_(k in ZZ) 1/L integral_0^1 f(x + k L ) e^(-(2 pi i n x)/L) dd(x)\
y = x + k L\
= sum_(k in ZZ) 1/L integral_(k L)^((k +1) L) f(y) e^(-(2 pi i n y)/L) dd(y)\
= 1/L integral_(-infinity)^(infinity) f(y) e^(-(2 pi i n y)/L) dd(y)\
=1/L hat(f)((2 pi n)/L)
=> g_n = 1/L hat(f)((2 pi n)/L)\
"Schlussfolgerung:"\
sum_(n in ZZ) f(x + n l) = g(x) = sum g_n e^((2 pi i n x)/L) = sum_(n in ZZ) 1/L hat(f)((2 pi n)/L) e^((2 pi i n x)/L)
$

Der Beweis folgt aus $x=0$.

== Wärmeleitung auf Ring

Ring parametrisiert mit $x in RR\/L ZZ$, Umfang $L$. Temperatur $u(t,x), t>= 0, x in RR \/ L ZZ$ also $u(t,x)$ L-Periodisch in $x in RR$.

== Wärmeleitungsgleichung (WLG)

$
pdv(u,t)(t, x) = D pdv(u, x, 2)(t,x)\
D > 0 "Konstante Temperaturleitfähigkeit"
$

$x,t$ reskalieren: $L=2 pi, D = 1$

Anfangsbedingung: $u(0,x) = f(x)$

$
"Zu lösen:" cases(pdv(u,t)(t, x) = D pdv(u, x, 2)(t,x)\, t>= 0, u(0,x) = f(x), x in RR \/ 2 pi ZZ)
$

#theorem[Satz][
  Sei $f in C^2(RR\/2 pi ZZ)$. Dann hat das AWP (Anfangswertproblem) eine eindeutige Lösung $u(t,x)$:
  + $u in C^0([0, infinity) crossproduct RR\/ 2 pi ZZ) inter C^(infinity)((0, infinity) crossproduct RR\/ 2 pi ZZ)$. Das heisst $u(x,t)$ ist am Anfang stetig und bei $t>0$ unendlich oft stetig differenzierbar.
  + $u(t,x) ->^(t->infinity) 1/(2 pi) integral_0^(2 pi) f(y) dd(y)$  konvergiert gleichmässig.
  + $u(t,x) = sum_(n in ZZ) f_n e^(-n^2 t) e^(i n x)$
]
 
=== Beweis

+ Eindeutigkeit. Was ist $u$?§

Angenommen, wir haben Lösung $u$. Für $t>=0$ ist dann $u(t, dot) in C^1 (RR\/2 pi ZZ)$. Da $C^1$ kann ich die Funktion als Fourier ausdrücken:
$
u(x,t) = sum_(n in ZZ) u_n (t) e^(i n x)\
u_n (t) = 1/(2 pi) integral_0^(2 pi) u(t,x) e^(-i n x) dd(x)
$
Was erfüllen diese Koeffizienten?
+ $u_n (0) = 1/(2 pi) integral_0^(2 pi) f(x) e^(-i n x) dd(x) = f_n$
+ Ausserdem 
  $
1/(2 pi) integral_0^(2 pi) u(t,x) e^(-i n x) dd(x) ->^(t arrow.br 0) 1/(2 pi) integral_0^(2 pi) u(0, x) e^(-i n x) dd(x)
$
  $=> u_n (t)$ ist stetig an $t=0$.
+ Selbes argument gibt stetigkeit für alle $t_0>= 0$

  Am ende wird $u_n$ eine einfache Differentialgleichung erfüllen:

+ $u_n in c^(infinity)((o, infinity))$
  Wir zeigen $C^1$:
  $
  (u_n (t + h) - u_n (t))/h = 1/(2 pi) integral_0^(2 pi) (u_n (t + h) - u_n (t))/h e^(-i n x) dd(x)\
  "Integrand": ->^(h->0) pdv(u,t) (t,x) "gleichmässig"\
  ->^(h->0) 1/(2 pi) integral_0^(2 pi) pdv(u,t) (t,x) e^(-i n x) dd(x) "stetig in" t>0\
  => pdv(u_n,t) = u'_n (t) = (pdv(u,t))_n
  $

Nun mit der Wärmeleitgleichung:
$
u'_n(t) = (pdv(u,t) (t, dot))_n = (pdv(u, x,2)(t, dot))_n
$
Der Fourierkoeffizent der Ableitung einer Funktion: $(dv(f,x))_n = i n f_n$. Wenn man die Fourierkoeffizienten einer Funktion weiss, kann man die Koeffizienten der Ableitung durch Multiplikation bestimmen.
$
... = 1/(2 pi) integral_0^(2 pi) u(t,x) dv(,x,2) (e^(-i n x)) dd(x)\
= -n^2 u_n(t)
$

Also impliziert die Partielle WLG ein System aus einfachen DV:
$
u'_n (t) = -n^2 u_n(t)\
u_n (0) = f_n
$
*Entkoppelt!*

Diese DV's sind *Eindeutig* lösbar: 
$

u(t,x) = sum_(n in ZZ) u_n (t) e^(i n x) = sum_(n in ZZ) f_n e^(-n^2 t) e^(i n x), t >= 0\
u_n (t) = e^(-n^2 t) f_n
$

Wir sind also in der Lage die Wärmefunktion durch ihre Fourierkoeffizienten darzustellen. Nun müssen wir noch zeigen, dass wir diese Gleichung aus lösen können.

Behauptung: Diese beiden Gleichungen definieren eine Lösung des AWP der Klasse $C^0([0,infinity) crossproduct RR\/ 2 pi ZZ) inter C^infinity (...)$.

Warum sollte die Verteilung aber *sofort* glatt werden? Je regulärer die Funktion ist, desto schneller fallen die Fourierkoeffizienten ab (in dem Fall fallen die Koeffizienten mit $e^(-n^2 t)$ ab).

+ $u$ ist wohldefiniert:
  $
  abs(u_n (t)) = abs(f_n) e^(-n^2 t) <= abs(f_n) <= C/(1+n^2)
  $
  Letzter Schritt kommt aus $f in C^2$
  $
  => sum_(n in ZZ) C/(1 + n^2) < infinity
  $
  Also ist $x |-> u(t,x)$ stetig.

+ Anfangsdatum:
  $
  u(0,x) = sum_(n in ZZ) u_n(0) e^(i n x) = sum_(n in ZZ) f_n e^(i n x) = f(x)
  $

+ Löst Differentialgleichung in $t>0$:
  $
  t>0: abs(u_n (t)) = abs(f_n) e^(-n^2 t) <= C_(k,t)/(1+abs(n)^(k+2))\
  => u(t, dot) in C^k (RR\/ 2 pi ZZ) forall k in NN_0
  $
  Das heisst die Funktion ist glatt in $t$.
  $
  pdv(u,x,2)(t,x) = sum_(k in ZZ) u_n (t) dv(,x,2) e^(i n x)\
  = sum_(n in ZZ)  u_n (t) (-n^2) e^(i n x)
  = sum_(n in ZZ) u'_n (t) e^(i n x)
  $

  $
  "Using:" pdv(u,x) (t,x) =  sum u_n (t) dv(,x) e^(i n x)\
  => g_n (x) = sum_(abs(j) <= n) u_j (t) e^(i j x) ->^("gl.") u(t,x)\
  g'_n (x) = sum_(abs(j) <= n) u_j (t) dv(,x) e^(i j x) = sum_(abs(j) <= n) i j u_j (t) e^(i j x)\
  "Aber:" sum_(j in ZZ) abs(j u_j (t)) < infinity\
  => "konvergiert" g'_n "gleichmässig gegen:" \
  h(x) = sum_(j in ZZ) i j u_j (t) e^(i j x)\
  => pdv(u,x) = h
  $

  Nun müssen wir noch zeigen dass die räumliche und zeitliche Ableitung mit unserer Lösung übereinstimmt (Wärmeleitgleichung). Es soll gelten: $pdv(u,x) = sum u_n' (t) e^(i n x)$.

  Für (neues) $h$ die Differenzquotienten berechnen und gucken, dass dieser konvergiert: $lim_(h arrow.br 0) (u(t+h, x) - u(t,x))/h = sum_(n in ZZ) u'_n (t) e^(i n x)$.

=== Lösung

$
u(t,x) = sum_(n in ZZ) f_n e^(-n^2 t) e^(i n x) = 1/(2 pi) integral_0^(2 pi) f(y) K(t,x-y) dd(y)\
K(t,x) = sum(n in Z) e^(-n^2 t) e^(i n x) bold("Jacobi-Theta-Funktion")
$

Dies ist eine Faltung mit $K$. $K$ definiert eine stetige Ausbreitung eines Impulses mit Periode.

== Satz: Impulsfuktion $K$

#theorem[Satz][
  Für $t > 0 => K(t,x) > 0$. 
  
   Dann $f(x)>= 0 forall x => u(x,t) >= 0 forall t >= 0, x$ 
]

==== Beweis

Poisson:
$
2 pi sum_(n in ZZ) h(x+2 pi n) = sum_(n in ZZ) hat(h) (n) e^(i n x)\
$

Wir wollen $h(x)$ finden, sodass $hat(h) (n) = e^(-n^2 t)$.

