#let cheatsheet-setup(
  title: "",
  author: "",
  language: "",
) = {
  // Import dependencies
  import "lib.typ": *

  // This is the document function optimized for maximum information density
  doc => {
    // Set page properties for maximum content
    set page(
      paper: "a4",
      margin: (top: 0.5cm, bottom: 0.5cm, left: 0.4cm, right: 0.4cm),
      header: [
        #set text(size: 6pt)
        #author #h(1fr) #title
      ],
      numbering: none,
    )

    // Set up columns with custom gutter
    show: columns.with(3, gutter: 0.1cm)

    // Set text properties for maximum density
    set par(justify: true, leading: 0.3em, spacing: 0.3em)
    set heading(numbering: "1.1")
    set text(size: 6pt, lang: language) // Very small text
    show math.equation: set text(size: 5.5pt) // Even smaller math
    show math.equation.where(block: true): set align(left) // Left-align display math


    // Reduce spacing around headings
    show heading.where(level: 1): it => [
      #set text(size: 6pt, weight: "bold")
      #v(0.2em)
      #it
      #v(0.1em)
    ]

    show heading.where(level: 2): it => [
      #set text(size: 5pt, weight: "bold")
      #v(0.15em)
      #it
      #v(0.05em)
    ]

    // Compact definitions and theorems
    let compact_func(content, color: gray) = {
      block(
        width: 100%,
        inset: (x: 2pt, y: 1pt),
        outset: 0pt,
        radius: 1pt,
        fill: color.lighten(90%),
        stroke: (paint: color, thickness: 0.5pt),
      )[
        #set text(size: 6pt)
        #set par(leading: 0.25em)
        #content
      ]
    }

    let title_func(content) = {
      align(center, text(9pt, weight: "bold")[
        #content
      ])
    }

    let author_func(content) = {
      align(center, text(7pt)[
        #content
      ])
    }

    // Override frame definitions for compact display with proper syntax
    let (theorem, lemma, definition, corollary, example, remark, warning, proof) = frames(
      theorem: ("Satz", rgb("#EB8F8F")),
      lemma: ("Lemma", rgb("#F2B675")),
      definition: ("Def", rgb("#7EB6EF")),
      corollary: ("Kor", rgb("#C3A3EC")),
      example: ("Bsp", rgb("#AAB5C2")),
      remark: ("Bem", rgb("#E1E1E1")),
      warning: ("Warn", rgb("#F4A8A8")),
      proof: ("Bew", rgb("#AAB5C2")),
    )

    // Place title, author and abstract with minimal spacing
    place(
      top + center,
      float: true,
      scope: "parent",
      clearance: 0.5em,
    )[
      #title_func[#title]
      #author_func[#author]
      #v(0.3em)
    ]

    // Return the document with all styles applied
    doc
  }
}
