#import "titlepage.typ": *

// Main IU Paper Template Function
#let iu-paper(
  title: none,
  author: none,
  student-id: none,
  program: "Informatik (B.Sc.)",
  course: "IWSM01",
  tutor: "TBD",
  date: datetime.today(),
  logo: image("iu-logo.png"),
  // The result of a call to the `bibliography` function or `none`.
  bibliography: none,
  body,
) = {
  set document(title: title, author: author)
  set text(lang: "de")

  let main-font = "Arial" // Alternative: "Liberation Sans"
  let body-size = 11pt // iu-requirement: 11pt
  let heading-size = 12pt // iu-requirement: 12pt
  // https://practicaltypography.com/line-spacing.html -> 1.5 line spacing -> 175%
  let leading = 0.75em // iu-requirement: 1.5 line spacing
  let spacing = leading + 6pt // iu-requirement: 6pt spacing between paragraphs

  let text-color = black

  set text(
    font: main-font,
    size: body-size,
    fill: text-color,
    // Emulate Word's line spacing: https://github.com/typst/typst/issues/4224#issuecomment-2755913480
    top-edge: 1em, 
    bottom-edge: 0em
  )

  set par(
    justify: true, // iu-requirement: justified
    leading: leading,
    spacing: spacing,
    first-line-indent: 0pt,
    linebreaks: "optimized",
  )

  set page(
    paper: "a4",
    margin: (top: 2cm, left: 2cm, right: 2cm, bottom: 2cm), // iu-requirement: 2cm margins
    numbering: none, // Will be set per section
    number-align: center,
  )

  set heading(numbering: "1.1")
  show heading: it => {
    set text(
      font: main-font,
      size: heading-size,
      weight: "bold",
    )
    show: block.with(above: spacing, below: spacing, sticky: true)
    it
  }

  // Figure and table captions (German abbreviations)
  set figure(numbering: "1")
  set figure.caption(position: top, separator: [ ])

  show figure.where(kind: image): set figure(supplement: [Abb.], gap: leading)
  show figure.where(kind: raw): set figure(supplement: [Abb.], gap: leading)
  show figure.where(kind: "iu-figure"): set figure(supplement: [Abb.], gap: leading)
  show figure.where(kind: table): set figure(supplement: [Tab.], gap: leading)

  set math.equation(numbering: "1", supplement: [Gl.]) // iu-requirement: Not specified, set to match figures/tables
  set heading(supplement: [Kap.]) // iu-requirement: Not specified, set to match figures/tables

  // Default table style
  show table.cell.where(y: 0): strong
  set table(
    align: left,
    inset: (x: 8pt, y: 5pt),
    stroke: (_, y) => (
      top: if y <= 1 { 1pt } else { 0pt },
      bottom: 1pt,
    ),
  )

  show footnote.entry: set text(size: 10pt) // iu-requirement: 10pt for footnotes

  show quote.where(block: true): set pad(left: 1.27cm) // iu-requirement: 1.27cm indent for block quotes

  set outline(indent: auto)
  set outline.entry(fill: repeat([.], gap: 0.25em))

  set std.bibliography(title: [Literaturverzeichnis], style: "/apa-iu.csl")

  // Title page with Roman numbering
  counter(page).update(1)
  set page(numbering: "I")

  iu-titlepage(
    title: title,
    author: author,
    student-id: student-id,
    program: program,
    course: course,
    tutor: tutor,
    date: date,
    logo: logo,
  )

  pagebreak()
  outline(
    title: [Inhaltsverzeichnis],
  )

  // „Ein Tabellenverzeichnis muss ab drei Tabellen und ein Abbildungsverzeichnis ab drei Abbildungen aufgeführt werden“
  context {
    if query(figure.where(kind: "iu-figure")).len() >= 3 {
      pagebreak()
      outline(
        title: [#heading(outlined: true)[Abbildungsverzeichnis]],
        target: figure.where(kind: "iu-figure"),
      )
    }
    if query(figure.where(kind: table)).len() >= 3 {
      pagebreak()
      outline(
        title: [#heading(outlined: true)[Tabellenverzeichnis]],
        target: figure.where(kind: table),
      )
    }
  }
  pagebreak()

  // Main content with Arabic numbering
  counter(page).update(1)
  set page(numbering: "1")

  body

  // Bibliography section
  if bibliography != none {
    pagebreak()
    set heading(numbering: none)
    bibliography
  }
}

#let iu-figure(
  body,
  caption: none,
  source-caption: none,
) = {
  figure(
    {
      body
      if source-caption != none {
        v(-0.75em)
        align(
          center,
          source-caption,
        )
      }
    },
    kind: "iu-figure",
    caption: caption,
  )
}
