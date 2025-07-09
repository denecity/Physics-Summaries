#let setup(
  title: "",
  author: "",
  abstract: "",
  language: "",
) = {
  // Import dependencies
  import "lib.typ": *

  // This is the correct way to define a document function that transforms content
  doc => {
    // Set page properties
    set page(
      paper: "a4",
      header: [#author 
      #h(1fr)
      #title
      ],
      numbering: "1",
      columns:2,
    )

    // Set text properties
    set par(justify: true)
    set heading(numbering: "1.1")
    set text(size: 8pt, lang: language)
    show math.equation: set text(size: 8pt)

    let abstract_func(content) = {
      align(center)[
        #box(width: 80%)[
          #align(center)[
            #par(justify: false)[
              #content
            ]]]]}

    let title_func(content) = {
      align(center, text(17pt)[
      *#content*
    ])
    }

    let author_func(content) = {
      align(center, text(12pt)[
      #content
    ])
    }

    // Place title, author and abstract
    place(
      top + center,
      float: true,
      scope: "parent",
      clearance: 2em,
    )[
      #title_func[#title]
      #author_func[#author]
      #abstract_func[#abstract]
      #v(18pt)
    ]
    
    // Return the document with all styles applied
    doc
  }
}