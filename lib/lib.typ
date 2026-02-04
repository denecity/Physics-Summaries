#import "@preview/physica:0.9.5": *
#import "@preview/frame-it:1.1.2": *
#import "@preview/big-todo:0.2.0": *


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


#let upar = $arrow.t$
#let doar = $arrow.b$

#let hspace = $#h(10pt)$
#let hsmall = $#h(5pt)$
#let hfill = box(width: 1fr, move(dy: -0.25em, line(length: 100%, stroke: 0.13pt + black)))

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
#let aB = $arrow(B)$
#let aC = $arrow(C)$
#let aphi = $arrow(phi)$
#let atheta = $arrow(theta)$
#let aK = $arrow(K)$


#let SO = $S O$
#let SU = $S U$
#let SO = $S O$
#let Sp = $S p$
#let SG = $S G$
#let SL = $S L$
#let GL = $G L$
#let IO = $I O$
#let io = $i o$
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
#let Orb = $"Orb"$
#let Fix = $"Fix"$
#let Mat = $"Mat"$

#let ein = $wj$


#let arr(x) = $arrow(#x)$
#let adt(x) = $dot(arrow(#x))$
#let add(x) = $dot.double(arrow(#x))$
#let ddot(x) = $dot.double(#x)$

#let avg(g) = $angle.l #g angle.r$

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
#let deg = $degree$

#let kg = $"kg"$
#let pc = $"pc"$
#let ly = $"ly"$
#let Mpc = $"Mpc"$
#let sr = $"sr"$
#let Hz = $"Hz"$

#let gloss = ()




// Define colors for different section numbers (curated palette)
#let section_colors = (
  rgb("#DBEAFE"), // 1 - soft sky blue
  rgb("#FEE2E2"), // 2 - blush rose
  rgb("#D1FAE5"), // 3 - mint green
  rgb("#fff6d0"), // 4 - warm cream
  rgb("#ead8ff"), // 5 - lavender
  rgb("#CFFAFE"), // 6 - aqua
  rgb("#FFE4E6"), // 7 - pink
  rgb("#f8eada"), // 8 - peach
  rgb("#d8dffe"), // 9 - periwinkle
  rgb("#BBF7D0"), // 10 - spring green
  rgb("#FECACA"), // 11 - coral
  rgb("#A5F3FC"), // 12 - cyan
  rgb("#DDD6FE"), // 13 - violet
  rgb("#FDE68A"), // 14 - golden
  rgb("#FBCFE8"), // 15 - orchid
  rgb("#99F6E4"), // 16 - teal
  rgb("#FECDD3"), // 17 - salmon
  rgb("#BFDBFE"), // 18 - powder blue
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

#let character_table(
  classes,
  irreps,
  characters,
  class_sizes: none,
  irrep_dims: none,
  group: none,
) = {
  let n_classes = classes.len()
  let n_irreps = irreps.len()

  // Use provided irrep labels
  let irrep_labels = irreps

  // Reshape flat characters array into rows
  let char_rows = ()
  for i in range(n_irreps) {
    let row = ()
    for j in range(n_classes) {
      row.push(characters.at(i * n_classes + j))
    }
    char_rows.push(row)
  }

  // Calculate number of columns
  let n_cols = 1 + n_classes + if irrep_dims != none { 1 } else { 0 }

  // Build class sizes row (if provided) - this comes FIRST
  let size_row = ()
  if class_sizes != none {
    if irrep_dims != none {
      size_row.push([]) // empty cell for dim column
    }
    size_row.push([]) // empty cell for irrep name column
    for sz in class_sizes {
      size_row.push(text(size: 0.85em)[$#sz$])
    }
  }

  // Build header row (conjugacy class names) - this comes SECOND
  let header = ()
  if irrep_dims != none {
    header.push([]) // empty cell for dim column
  }
  // Top-left cell: group name or empty
  if group != none {
    header.push($#group$)
  } else {
    header.push([])
  }
  for cls in classes {
    header.push($#cls$)
  }

  // Build character rows
  let rows = ()
  for (i, chi_row) in char_rows.enumerate() {
    let row = ()
    if irrep_dims != none {
      row.push($#irrep_dims.at(i)$)
    }
    row.push($#irrep_labels.at(i)$)
    for chi in chi_row {
      row.push($#chi$)
    }
    rows.push(row)
  }

  // Build column alignment
  let col_align = if irrep_dims != none {
    (center, left) + (center,) * n_classes
  } else {
    (left,) + (center,) * n_classes
  }

  // Determine header row count
  let header_rows = if class_sizes != none { 2 } else { 1 }

  table(
    columns: n_cols,
    align: col_align,
    stroke: (x, y) => {
      let dim_col = if irrep_dims != none { 1 } else { 0 }
      (
        left: if x <= dim_col { none } else { 0.5pt },
        right: if x == n_cols - 1 { none } else if x < dim_col { none } else { 0.5pt },
        top: if y == 0 { none } else if y == 1 and class_sizes != none { none } else { 0.5pt },
        bottom: if y == header_rows + n_irreps - 1 { none } else if y == 0 and class_sizes != none { none } else {
          0.5pt
        },
      )
    },
    inset: 2pt,
    ..size_row,
    ..header,
    ..rows.flatten(),
  )
}


#let young_tableau(row_lengths, values) = {
  // Ensure row_lengths is an array
  let row_lengths = if type(row_lengths) == array { row_lengths } else { (row_lengths,) }

  let value_idx = 0
  let rows = ()

  // Build each row
  for row_len in row_lengths {
    let row_cells = ()

    // Add cells for this row
    for i in range(row_len) {
      if value_idx < values.len() {
        row_cells.push($#values.at(value_idx)$)
        value_idx += 1
      } else {
        row_cells.push([])
      }
    }

    rows.push(row_cells)
  }

  // Find maximum row length for table columns
  let max_cols = calc.max(..row_lengths)

  // Create table with proper alignment and separators
  let table_rows = ()

  for (idx, row_cells) in rows.enumerate() {
    let padded_row = row_cells

    // Pad row with empty cells if needed
    while padded_row.len() < max_cols {
      padded_row.push([])
    }

    table_rows += padded_row
  }

  // Determine where to place horizontal line (before last row)
  let n_rows = row_lengths.len()

  table(
    columns: max_cols,
    align: center + horizon,
    stroke: (x, y) => {
      let actual_row = y
      let actual_col = x

      // Determine if this cell should have content (within row length)
      let has_content = actual_col < row_lengths.at(actual_row)

      if not has_content {
        return none
      }

      // Draw consistent borders around every cell with content
      (
        left: 0.5pt,
        right: 0.5pt,
        top: 0.5pt,
        bottom: 0.5pt,
      )
    },
    inset: 2pt,
    ..table_rows
  )
}
