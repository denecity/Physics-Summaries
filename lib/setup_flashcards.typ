// State for card layout
#let card-state = state("flashcard-layout", (:))

#let flashcard-setup(
  card-width: 8.5cm,
  card-height: 5.5cm,
  margin: 0cm,
  show-cut-lines: true,
) = {
  // Import dependencies
  import "lib.typ": *

  // Calculate A4 dimensions
  let a4-width = 21cm
  let a4-height = 29.7cm
  
  // Calculate available space
  let available-width = a4-width - 2 * margin
  let available-height = a4-height - 2 * margin
  
  // Calculate how many cards fit
  let cards-per-row = calc.floor(available-width / card-width)
  let cards-per-col = calc.floor(available-height / card-height)
  let total-cards = cards-per-row * cards-per-col
  
  // Calculate actual grid dimensions
  let grid-width = cards-per-row * card-width
  let grid-height = cards-per-col * card-height
  
  // Use margin as offset (no centering)
  let x-offset = margin
  let y-offset = margin

  // Document function
  doc => {
    // Set page properties
    set page(
      paper: "a4",
      margin: 0cm,
      numbering: none,
    )
    
    // Set text properties
    set text(size: 10pt)
    set par(justify: true)

    // Update card state
    card-state.update((
      card-width: card-width,
      card-height: card-height,
      margin: margin,
      show-cut-lines: show-cut-lines,
      cards-per-row: cards-per-row,
      cards-per-col: cards-per-col,
      x-offset: x-offset,
      y-offset: y-offset,
    ))

    // Return the document (grid will be drawn by render-flashcards)
    doc
  }
}

// Color palette inspired by lib.typ section colors
#let flashcard-colors = (
  rgb("#E3F2FD"), // light blue
  rgb("#E8F5E8"), // light green  
  rgb("#FFF3E0"), // light orange
  rgb("#F3E5F5"), // light purple
  rgb("#E0F2F1"), // light teal
  rgb("#FFF8E1"), // light yellow
  rgb("#FCE4EC"), // light pink
  rgb("#F1F8E9"), // light lime
)

// Helper function to create a single card at specific position
#let create-card(content, layout, x, y, card-num, color: auto) = {
  // Auto-select color if not specified
  let card-color = if color == auto {
    flashcard-colors.at(calc.rem(card-num - 1, flashcard-colors.len()))
  } else {
    color
  }
  
  place(
    top + left,
    dx: x,
    dy: y,
  )[
    #box(
      width: layout.card-width,
      height: layout.card-height,
      fill: card-color,
      radius: 3pt,
      stroke: if layout.show-cut-lines { 
        0.5pt + gray 
      } else { 
        0.3pt + card-color.darken(20%) 
      },
    )[
      #box(
        width: 100%,
        height: 100%,
        inset: 8pt,
      )[
        #align(center + horizon)[
          #set text(size: 9pt)
          #set par(justify: true, leading: 0.4em)
          #content
        ]
      ]
    ]
  ]
}

// State to collect flashcard data
#let flashcard-data = state("flashcard-data", ())

// Function to add a flashcard to the collection
#let flashcard(question: none, answer: none, content: none, color: auto) = context {
  let card-counter = counter("flashcard")
  
  if question != none and answer != none {
    // Question/Answer pair mode - add to collection
    card-counter.step()
    let card-num = card-counter.get().first()
    
    flashcard-data.update(data => {
      data.push((
        type: "qa-pair",
        question: question,
        answer: answer,
        color: color,
        card-num: card-num,
      ))
      data
    })
    
  } else if content != none {
    // Legacy single content mode
    card-counter.step() 
    let card-num = card-counter.get().first()
    
    let layout = card-state.get()
    
    // Calculate position (0-indexed)
    let pos = card-num - 1
    let row = calc.floor(pos / layout.cards-per-row)
    let col = calc.rem(pos, layout.cards-per-row)
    
    // Calculate absolute position
    let x = layout.x-offset + col * layout.card-width
    let y = layout.y-offset + row * layout.card-height
    
    create-card(content, layout, x, y, card-num, color: color)
  }
}

// Helper function to draw grid lines
#let draw-grid(layout, is-even-page: false) = {
  if layout.show-cut-lines {
    // Calculate A4 dimensions
    let a4-width = 21cm
    
    // Calculate grid positioning
    let grid-width = layout.cards-per-row * layout.card-width
    let x-start = if is-even-page {
      // Even page (answers): align to top-right
      a4-width - layout.margin - grid-width
    } else {
      // Odd page (questions): align to top-left
      layout.margin
    }
    
    // Vertical lines
    for i in range(layout.cards-per-row + 1) {
      let x = x-start + i * layout.card-width
      
      place(
        top + left,
        dx: x,
        dy: layout.y-offset,
      )[
        #line(
          start: (0pt, 0pt),
          end: (0pt, layout.cards-per-col * layout.card-height),
          stroke: 0.5pt + gray
        )
      ]
    }
    
    // Horizontal lines
    for i in range(layout.cards-per-col + 1) {
      let y = layout.y-offset + i * layout.card-height
      place(
        top + left,
        dx: x-start,
        dy: y,
      )[
        #line(
          start: (0pt, 0pt),
          end: (grid-width, 0pt),
          stroke: 0.5pt + gray
        )
      ]
    }
  }
}

// Function to render all collected flashcards
#let render-flashcards() = context {
  let layout = card-state.get()
  let data = flashcard-data.get()
  
  if data.len() > 0 {
    // Calculate cards per page
    let cards-per-page = layout.cards-per-row * layout.cards-per-col
    let total-cards = data.len()
    let total-question-pages = calc.ceil(total-cards / cards-per-page)
    
    // Calculate A4 dimensions for proper positioning
    let a4-width = 21cm
    let grid-width = layout.cards-per-row * layout.card-width
    
    // Render question/answer page pairs
    for page-num in range(total-question-pages) {
      if page-num > 0 { pagebreak() }
      
      // Draw grid for this question page (odd page - top left)
      draw-grid(layout, is-even-page: false)
      
      // Render questions for this page
      let start-card = page-num * cards-per-page
      let end-card = calc.min((page-num + 1) * cards-per-page, total-cards)
      
      for card-idx in range(start-card, end-card) {
        let card = data.at(card-idx)
        if card.type == "qa-pair" {
          // Calculate position within this page (0-indexed)
          let pos-in-page = card-idx - start-card
          let row = calc.floor(pos-in-page / layout.cards-per-row)
          let col = calc.rem(pos-in-page, layout.cards-per-row)
          
          // Question position (front side - left aligned)
          let q-x = layout.margin + col * layout.card-width
          let q-y = layout.y-offset + row * layout.card-height
          
          create-card(card.question, layout, q-x, q-y, card.card-num, color: card.color)
        }
      }
      
      // Immediately follow with the corresponding answer page
      pagebreak()
      
      // Draw grid for this answer page (even page - top right)
      draw-grid(layout, is-even-page: true)
      
      // Render answers for this page
      for card-idx in range(start-card, end-card) {
        let card = data.at(card-idx)
        if card.type == "qa-pair" {
          // Calculate position within this page (0-indexed)
          let pos-in-page = card-idx - start-card
          let row = calc.floor(pos-in-page / layout.cards-per-row)
          let col = calc.rem(pos-in-page, layout.cards-per-row)
          
          // Answer position (back side - right aligned, mirrored horizontally)
          let x-start = a4-width - layout.margin - grid-width
          let mirrored-col = layout.cards-per-row - 1 - col
          let a-x = x-start + mirrored-col * layout.card-width
          let a-y = layout.y-offset + row * layout.card-height
          
          create-card(card.answer, layout, a-x, a-y, card.card-num, color: card.color)
        }
      }
    }
  }
}