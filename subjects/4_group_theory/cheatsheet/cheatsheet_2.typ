#import "../../../lib/lib.typ": *
#import "../../../lib/setup_cheatsheet.typ": cheatsheet-setup
#show: frame-style(styles.boxy)

#show: cheatsheet-setup(
  title: "Group Theory Cheatsheet",
  author: "Denis Titov",
  language: "GER",
)

= Gruppen

#section($"Gruppe:" ZZ_n$)[
  $
    ZZ_n = ZZ\/n ZZ #hspace "addition modulo n" #hspace [0], [1], ..., [n-1]\
  $
  Alle irreps sind eindimensional. Konjugationsklassen bestehen aus einzelnen Elementen.

  $omega = exp((2 pi i)/n) #hspace omega^n = 1$

#grid(
  columns: 2,
  column-gutter: 1em,
  character_table(
    (0, 1, 2),
    ($chi_0$, $chi_1$, $chi_2$),
    (1, 1, 1, 1, $omega$, $omega^2$, 1, $omega^2$, $omega^4$),
    group: $ZZ_3$
  ),

  character_table(
    (0, 1, 2, 3),
    ($chi_0$, $chi_1$, $chi_2$, $chi_3$),
    (1, 1, 1, 1, 1, $omega$, $omega^2$, $omega^3$, 1, $omega^2$, $omega^4$, $omega^6$, 1, $omega^3$, $omega^6$, $omega^9$),
    group: $ZZ_4$
  )
)
]
