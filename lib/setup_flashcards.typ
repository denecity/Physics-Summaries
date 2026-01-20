// Constants
#let A4_WIDTH = 21cm
#let A4_HEIGHT = 29.7cm
#let CARD_RADIUS = 12pt
#let CARD_INSET = 9pt
#let CARD_FONT_SIZE = 9pt
#let CARD_TITLE_SIZE = 11pt
#let LINE_LEADING = 0.4em
#let GRID_STROKE = 0.5pt + gray
#let CARD_STROKE = 0.3pt
#let TITLE_COLUMN_GUTTER = 10pt
#let TITLE_MAX_WIDTH_RATIO = 0.7

// State for flashcard system
#let flashcard-state = state("flashcard-system", (
  layout: (:),
  cards: (),
))

// Validation function
#let validate-dimensions(card-width, card-height, margin) = {
  let available-width = A4_WIDTH - 2 * margin
  let available-height = A4_HEIGHT - 2 * margin

  if card-width > available-width or card-height > available-height {
    panic("Card dimensions too large for page with given margin")
  }

  let cards-per-row = calc.floor(available-width / card-width)
  let cards-per-col = calc.floor(available-height / card-height)

  if cards-per-row == 0 or cards-per-col == 0 {
    panic("Card dimensions too large - no cards fit on page")
  }

  (cards-per-row, cards-per-col)
}

#let flashcard-setup(
  card-width: 8.5cm,
  card-height: 5.5cm,
  margin: 0cm,
  content-margin: 8pt,
  show-cut-lines: true,
  topic: none,
) = {
  // Import dependencies
  import "lib.typ": *

  // Validate dimensions and calculate layout
  let (cards-per-row, cards-per-col) = validate-dimensions(card-width, card-height, margin)
  let cards-per-page = cards-per-row * cards-per-col

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

    // Update flashcard state with layout and empty cards array
    flashcard-state.update((
      layout: (
        card-width: card-width,
        card-height: card-height,
        margin: margin,
        content-margin: content-margin,
        show-cut-lines: show-cut-lines,
        cards-per-row: cards-per-row,
        cards-per-col: cards-per-col,
        cards-per-page: cards-per-page,
        x-offset: margin,
        y-offset: margin,
        topic: topic,
      ),
      cards: (),
    ))

    // Return the document
    doc
  }
}

// Color palette - configurable through setup in future
#let DEFAULT_FLASHCARD_COLORS = (
  rgb("#E3F2FD"), // light blue
  rgb("#E8F5E8"), // light green
  rgb("#FFF3E0"), // light orange
  rgb("#F3E5F5"), // light purple
  rgb("#E0F2F1"), // light teal
  rgb("#FFF8E1"), // light yellow
  rgb("#FCE4EC"), // light pink
  rgb("#F1F8E9"), // light lime
)

// Calculate card position within a page
#let calc-card-position(card-index, cards-per-row) = {
  let row = calc.floor(card-index / cards-per-row)
  let col = calc.rem(card-index, cards-per-row)
  (row, col)
}

// Calculate absolute position for a card
#let calc-card-coordinates(row, col, layout, is-even-page: false) = {
  let grid-width = layout.cards-per-row * layout.card-width
  let grid-height = layout.cards-per-col * layout.card-height

  // Calculate available space (accounting for margins)
  let available-width = A4_WIDTH - 2 * layout.margin
  let available-height = A4_HEIGHT - 2 * layout.margin

  // Center the grid horizontally and vertically
  let x-start = layout.margin + (available-width - grid-width) / 2
  let y-start = layout.margin + (available-height - grid-height) / 2

  let x = x-start + col * layout.card-width
  let y = y-start + row * layout.card-height
  (x, y)
}

// Helper function to create a single card at specific position
#let create-card(content, layout, x, y, card-num, color: auto, title: none) = {
  // Auto-select color if not specified
  let card-color = if color == auto {
    DEFAULT_FLASHCARD_COLORS.at(calc.rem(card-num - 1, DEFAULT_FLASHCARD_COLORS.len()))
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
      radius: CARD_RADIUS,
      stroke: if layout.show-cut-lines {
        GRID_STROKE
      } else {
        CARD_STROKE + card-color.darken(20%)
      },
    )[
      #if title != none [
        // Title at the top with topic and card number
        #align(center)[
          #box(
            inset: (top: 6pt, bottom: 4pt, left: 8pt, right: 8pt),
          )[
            #set text(size: CARD_TITLE_SIZE, weight: "bold")
            #grid(
              columns: (1fr, auto, 1fr),
              column-gutter: TITLE_COLUMN_GUTTER,
              align: (left, center, right),
              [
                // Topic on the left
                #if layout.topic != none [
                  #set text(size: 8pt, weight: "regular")
                  #layout.topic
                ]
              ],
              [
                // Title in the center
                #box(
                  width: layout.card-width * TITLE_MAX_WIDTH_RATIO,
                )[
                  #align(center)[#title]
                ]
              ],
              [
                // Card number on the right
                #set text(size: 8pt, weight: "regular")
                #card-num
              ],
            )
          ]
        ]
        // Content below title with full margin, using remaining space
        #align(center + horizon)[
          #box(
            inset: (top: 0pt, bottom: layout.content-margin, left: layout.content-margin, right: layout.content-margin),
          )[
            #set text(size: CARD_FONT_SIZE)
            #set par(justify: true, leading: LINE_LEADING)
            #content
          ]
        ]
      ] else [
        // No title - center content with full margin
        #align(center + horizon)[
          #box(
            inset: layout.content-margin,
          )[
            #set text(size: CARD_FONT_SIZE)
            #set par(justify: true, leading: LINE_LEADING)
            #content
          ]
        ]
      ]
    ]
  ]
}

// Function to add a flashcard to the collection
#let flashcard(question: none, answer: none, content: none, title: none, color: auto) = context {
  let card-counter = counter("flashcard")

  if question != none and answer != none {
    // Question/Answer pair mode - add to collection
    card-counter.step()
    let card-num = card-counter.get().first() + 1 // 1-indexed

    flashcard-state.update(state => {
      let new-cards = state.cards
      new-cards.push((
        type: "qa-pair",
        question: question,
        answer: answer,
        title: title,
        color: color,
        card-num: card-num,
      ))
      (
        layout: state.layout,
        cards: new-cards,
      )
    })
  } else if content != none {
    // Legacy single content mode - render immediately
    card-counter.step()
    let card-num = card-counter.get().first()

    let state = flashcard-state.get()
    let layout = state.layout

    // Calculate position (0-indexed)
    let pos = card-num - 1
    let (row, col) = calc-card-position(pos, layout.cards-per-row)
    let (x, y) = calc-card-coordinates(row, col, layout, is-even-page: false)

    create-card(content, layout, x, y, card-num, color: color, title: title)
  }
}

// Helper function to draw grid lines
#let draw-grid(layout, is-even-page: false) = {
  if layout.show-cut-lines {
    let grid-width = layout.cards-per-row * layout.card-width
    let grid-height = layout.cards-per-col * layout.card-height

    // Calculate available space (accounting for margins)
    let available-width = A4_WIDTH - 2 * layout.margin
    let available-height = A4_HEIGHT - 2 * layout.margin

    // Center the grid horizontally and vertically
    let x-start = layout.margin + (available-width - grid-width) / 2
    let y-start = layout.margin + (available-height - grid-height) / 2

    // Vertical lines
    for i in range(layout.cards-per-row + 1) {
      let x = x-start + i * layout.card-width

      place(
        top + left,
        dx: x,
        dy: y-start,
      )[
        #line(
          start: (0pt, 0pt),
          end: (0pt, grid-height),
          stroke: GRID_STROKE,
        )
      ]
    }

    // Horizontal lines
    for i in range(layout.cards-per-col + 1) {
      let y = y-start + i * layout.card-height
      place(
        top + left,
        dx: x-start,
        dy: y,
      )[
        #line(
          start: (0pt, 0pt),
          end: (grid-width, 0pt),
          stroke: GRID_STROKE,
        )
      ]
    }
  }
}

// Render cards for a single page
#let render-page-cards(cards, layout, start-index, end-index, is-even-page: false) = {
  for card-idx in range(start-index, end-index) {
    let card = cards.at(card-idx)
    if card.type == "qa-pair" {
      // Calculate position within this page (0-indexed)
      let pos-in-page = card-idx - start-index
      let (row, col) = calc-card-position(pos-in-page, layout.cards-per-row)

      if is-even-page {
        // Answer position (mirrored horizontally)
        let mirrored-col = layout.cards-per-row - 1 - col
        let (a-x, a-y) = calc-card-coordinates(row, mirrored-col, layout, is-even-page: true)
        create-card(card.answer, layout, a-x, a-y, card.card-num, color: card.color, title: "Answer")
      } else {
        // Question position
        let (q-x, q-y) = calc-card-coordinates(row, col, layout, is-even-page: false)
        create-card(card.question, layout, q-x, q-y, card.card-num, color: card.color, title: card.title)
      }
    }
  }
}

// Function to render all collected flashcards
#let render-flashcards() = context {
  let state = flashcard-state.get()
  let layout = state.layout
  let cards = state.cards

  if cards.len() > 0 {
    let total-cards = cards.len()
    let total-question-pages = calc.ceil(total-cards / layout.cards-per-page)

    // Render question/answer page pairs
    for page-num in range(total-question-pages) {
      if page-num > 0 { pagebreak() }

      // Calculate card range for this page
      let start-card = page-num * layout.cards-per-page
      let end-card = calc.min((page-num + 1) * layout.cards-per-page, total-cards)

      // Draw grid and render questions for this page
      draw-grid(layout, is-even-page: false)
      render-page-cards(cards, layout, start-card, end-card, is-even-page: false)

      // Immediately follow with the corresponding answer page
      pagebreak()
      draw-grid(layout, is-even-page: true)
      render-page-cards(cards, layout, start-card, end-card, is-even-page: true)
    }
  }
}
