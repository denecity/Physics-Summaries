#let exercise-setup(
  name: "",
  course: "",
  series: "",
  ta: "",
  date: "",
  language: "",
) = {
  // Import dependencies
  import "lib.typ": *

  doc => {
    let header-block = block(
      width: 100%,
      inset: (bottom: 0.6em),
      stroke: (bottom: 0.5pt + black),
    )[
      #set par(spacing: 0.15em)
      #name #hspace #course #hspace Series: #series #hspace #hfill #hspace  #ta #hspace #date
      
    ]

    // Standard paper layout
    set page(
      paper: "a4",
      margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
      header: [#header-block],
      numbering: "1",
    )

    // Text defaults
    set text(size: 11pt, lang: language)
    set par(justify: true)

    doc
  }
}
