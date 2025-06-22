#import "@preview/physica:0.9.5": *
#import "@preview/frame-it:1.1.2": *
#import "@preview/big-todo:0.2.0": *


#let (theorem, lemma, definition, corollary, example, remark, warning, proof) = frames(
    theorem: ("Satz", rgb("#EB8F8F")),            // softened ruby — important but readable
    lemma: ("Lemma", rgb("#F2B675")),          // soft amber-orange
    definition: ("Definition", rgb("#7EB6EF")),// lighter blue with good contrast
    corollary: ("Corollary", rgb("#C3A3EC")),  // muted lilac
    example: ("Example", rgb("#AAB5C2")),      // dusty steel blue
    remark: ("Remark", rgb("#E1E1E1")),        // very soft gray
    warning: ("Warning", rgb("#F4A8A8")),
    proof: ("Beweis", rgb("#AAB5C2")),      // mild coral-pink
  )



#let e0 = $epsilon_0$
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
#let oprod = $times.circle$
#let oadd = $plus.circle$
#let iso = $tilde.equiv$

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

#let Hom = $"Hom"$
#let Ker = $"Ker"$
#let Im = $"Im"$
#let Stab = $"Stab"$
#let tr = $"tr"$
#let span = $"span"$
#let Bij = $"Bij"$
#let End = $"End"$
#let rk = $"rk"$


#let arr(x) = $arrow(#x)$
#let adt(x) = $dot(arrow(#x))$
#let add(x) = $dot.double(arrow(#x))$

#let avg(g) = $<#g>$

#let ds2 = $dd(s,2)$
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