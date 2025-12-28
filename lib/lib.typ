#import "@preview/physica:0.9.5": *
#import "@preview/frame-it:1.1.2": *
#import "@preview/big-todo:0.2.0": *

#let (theorem, lemma, definition, corollary, example, remark, warning, proof) = frames(
  theorem: ("Satz", rgb("#EB8F8F")), // softened ruby — important but readable
  lemma: ("Lemma", rgb("#F2B675")), // soft amber-orange
  definition: ("Definition", rgb("#7EB6EF")), // lighter blue with good contrast
  corollary: ("Corollary", rgb("#C3A3EC")), // muted lilac
  example: ("Example", rgb("#AAB5C2")), // dusty steel blue
  remark: ("Remark", rgb("#E1E1E1")), // very soft gray
  warning: ("Warning", rgb("#F4A8A8")),
  proof: ("Beweis", rgb("#AAB5C2")), // mild coral-pink
)



#let e0 = $epsilon_0$
#let a0 = $a_0$
#let m0 = $mu_0$
#let anabla = $arrow(nabla)$
#let ea = $epsilon.alt$
#let ep = $epsilon$
#let m1 = $-1$
#let id = $bb(1)$
#let circ = $compose$
#let mattyp(x, y) = $"Mat"_(#x times #y)$
#let aut(x) = $"Aut"_(#x)$
#let adj(x) = $#x^\#$
#let prod = $times$
#let prodr = $times.r$
#let prodl = $times.l$
#let oprod = $times.o$
#let oadd = $plus.o$
#let iso = $tilde.equiv$
#let tensor = $oprod$

#let orb = $"Orb"$
#let stab = $"Stab"$

#let upar = $arrow.t$
#let doar = $arrow.b$

#let hspace = $#h(10pt)$

#let aJ = $arrow(J)$
#let aE = $arrow(E)$
#let aB = $arrow(B)$
#let ax = $arrow(x)$
#let ay = $arrow(y)$
#let az = $arrow(z)$
#let aF = $arrow(F)$
#let aa = $arrow(a)$
#let ab = $arrow(b)$
#let ac = $arrow(c)$
#let av = $arrow(v)$
#let ar = $arrow(r)$
#let aS = $arrow(S)$
#let ad = $arrow(d)$
#let aR = $arrow(R)$
#let ap = $arrow(p)$
#let an = $arrow(n)$
#let ak = $arrow(k)$
#let al = $arrow(l)$
#let aA = $arrow(A)$
#let ass = $arrow(s)$
#let amu = $arrow(mu)$
#let am = $arrow(m)$
#let aM = $arrow(M)$
#let af = $arrow(f)$
#let adv = $dot(arrow(v))$
#let addx = $dot.double(arrow(x))$
#let adx = $dot(arrow(x))$
#let aPhi = $arrow(Phi)$
#let aP = $arrow(P)$
#let aH = $arrow(H)$
#let aD = $arrow(D)$


#let SO = $S O$
#let SU = $S U$
#let SO = $S O$
#let Sp = $S p$
#let SG = $S G$
#let SL = $S L$
#let GL = $G L$
#let IO = $I O$
#let gl = $g l$
#let su = $s u$
#let so = $s o$
#let sp = $s p$
#let Ad = $A d$
#let ad = $a d$
#let sl = $s l$

#let Hom = $"Hom"$
#let Ker = $"Ker"$
#let Im = $"Im"$
#let Stab = $"Stab"$
#let tr = $"tr"$
#let span = $"span"$
#let Bij = $"Bij"$
#let End = $"End"$
#let rk = $"rk"$
#let Lie = $"Lie"$

#let einst = $wj$


#let arr(x) = $arrow(#x)$
#let adt(x) = $dot(arrow(#x))$
#let add(x) = $dot.double(arrow(#x))$
#let ddot(x) = $dot.double(#x)$

#let avg(g) = $<#g>$

#let ds2 = $dd(s, 2)$
#let ds = $dd(s)$
#let dt = $dd(t)$
#let dx = $dd(x)$
#let dx3 = $dd(x, 3)$
#let dy = $dd(y)$
#let dz = $dd(z)$

#let invhat(f) = $caron(#f)$
#let over(f) = $overline(#f)$
#let under(f) = $underline(#f)$
#let wave = $square$
#let waved = $square_delta$
#let cross = $crossproduct$



#let gloss = ()


#let colored_section(color: gray.lighten(80%), content) = {
  block(
    width: 100%,
    fill: color,
    inset: 4pt,
    radius: 2pt,
    breakable: true, // This allows the block to break across pages
  )[
    #content
  ]
}

// Define colors for different section numbers (manual list for consistency)
#let section_colors = (
  rgb("#E3F2FD"), // 1 - light blue
  rgb("#E8F5E8"), // 2 - light green
  rgb("#FFF3E0"), // 3 - light orange
  rgb("#F3E5F5"), // 4 - light purple
  rgb("#E0F2F1"), // 5 - light teal
  rgb("#FFF8E1"), // 6 - light yellow
  rgb("#FCE4EC"), // 7 - light pink
  rgb("#F1F8E9"), // 8 - light lime
  rgb("#E8EAF6"), // 11 - light indigo
  rgb("#F9FBE7"), // 12 - light light green
  rgb("#FFF9C4"), // 13 - light light yellow
  rgb("#FFECB3"), // 14 - light amber
  rgb("#FFE0B2"), // 15 - light deep orange
  rgb("#FFCDD2"), // 16 - light red
  rgb("#F8BBD9"), // 17 - light pink variant
  rgb("#E1BEE7"), // 18 - light purple variant
  rgb("#C8E6C9"), // 19 - light green variant
  rgb("#DCEDC8"), // 20 - light light green variant
)

// Main section function: auto-infers number from current level 1 heading
#let section(title, w: 100%, o: false, image: none, iw: 50%, intro: none, content) = {
  context {
    // Get the current level 1 heading number using new Typst 0.13 syntax
    let current_section = counter(heading.where(level: 1)).get().first()

    let color = if current_section <= section_colors.len() {
      section_colors.at(current_section - 1)
    } else {
      gray.lighten(80%) // fallback color
    }

    block(
      width: w,
      fill: color,
      inset: 4pt,
      radius: 2pt,
      breakable: true,
      stroke: if o { 0.3pt + black } else { none },
    )[
      #heading(level: 2)[#title]
      #if image != none and intro != none {
        // Grid layout with image and introduction text
        grid(
          columns: (iw, 1fr),
          column-gutter: 1em,
          align(top)[#image], align(top)[#intro],
        )
        // Main content flows freely below the grid
        v(0.5em)
        content
      } else if intro != none {
        // Just introduction text, no image
        [#intro]
        v(0.5em)
        content
      } else if image != none {
        // Just image, no introduction
        [#image]
        v(0.5em)
        content
      } else {
        content
      }
    ]
  }
}

// Manual section function if you want to override the number
#let section_manual(n, title, w: 100%, o: false, image: none, iw: 50%, intro: none, content) = {
  let color = if n <= section_colors.len() {
    section_colors.at(n - 1)
  } else {
    gray.lighten(80%) // fallback color
  }

  block(
    width: w,
    fill: color,
    inset: 4pt,
    radius: 2pt,
    breakable: true,
    stroke: if o { 0.3pt + black } else { none },
  )[
    #heading(level: 2)[#title]
    #if image != none and intro != none {
      // Grid layout with image and introduction text
      grid(
        columns: (iw, 1fr),
        column-gutter: 1em,
        align(top)[#image], align(top)[#intro],
      )
      // Main content flows freely below the grid
      v(0.5em)
      content
    } else if intro != none {
      // Just introduction text, no image
      [#intro]
      v(0.5em)
      content
    } else if image != none {
      // Just image, no introduction
      [#image]
      v(0.5em)
      content
    } else {
      content
    }
  ]
}

// Spacing shortcuts
#let hfill = box(width: 1fr, move(dy: -0.25em, line(length: 100%, stroke: 0.13pt + black)))  // Flexible horizontal space with thin guideline
