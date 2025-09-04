#import "titlepage.typ": *

// Main IU Paper Template Function
#let iu-paper(
  title: none,
  subtitle: none,
  author: none,
  student-id: none,
  program: "Informatik (B.Sc.)",
  course: "IWSM01",
  tutor: "TBD",
  date: datetime.today(),
  logo: "iu-logo.png",
  show-outline: true,
  bibliography-file: none,
  body,
) = {
  // Document metadata
  set document(title: title, author: author)
  set text(lang: "de")

  // Font configuration (Arial equivalent - Liberation Sans)
  let main-font = "Liberation Sans"
  let body-size = 11pt
  let heading-size = 12pt

  // Colors
  let text-color = black

  // Basic text setup
  set text(
    font: main-font,
    size: body-size,
    fill: text-color,
    bottom-edge: "descender",
  )

  // Paragraph formatting (no indentation, 6pt spacing)
  set par(
    justify: true,
    leading: 0.95em, // 1.5 line spacing equivalent
    spacing: 1em + 6pt, // 6pt between paragraphs as in LaTeX
    first-line-indent: 0pt,
  )

  // Page setup with 2cm margins
  set page(
    paper: "a4",
    margin: (top: 2cm, left: 2cm, right: 2cm, bottom: 2cm),
    numbering: none, // Will be set per section
    number-align: center,
  )

  // Heading configuration (12pt, bold)
  set heading(numbering: "1.1")
  show heading: it => {
    set text(
      font: main-font,
      size: heading-size,
      weight: "bold",
    )
    show: block.with(above: 1.5em, below: 1.5em, sticky: true)
    it
  }

  // Figure and table captions (German abbreviations)
  set figure(numbering: "1")
  set figure.caption(position: top, separator: [ ])

  show figure.where(kind: image): set figure(supplement: [Abb.], kind: "iu-fig")
  show figure.where(kind: raw): set figure(supplement: [Abb.], kind: "iu-fig")
  show figure.where(kind: table): set figure(supplement: [Tab.])

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


  // show outline: set outline(indent: 0em)
  set outline(indent: auto)
  set outline.entry(fill: repeat([.], gap: 0.25em))
  // set outline.entry(fill: line(length: 100%))

  // Block quotes with 1.27cm left indentation
  show quote.where(block: true): it => {
    pad(left: 1.27cm, it)
  }

  // Title page with Roman numbering
  counter(page).update(1)
  set page(numbering: "I")

  iu-titlepage(
    title: title,
    subtitle: subtitle,
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
  pagebreak()
  outline(
    title: [#heading(outlined: true)[Abbildungsverzeichnis]],
    target: figure.where(kind: "iu-fig"),
  )
  pagebreak()
  outline(
    title: [#heading(outlined: true)[Tabellenverzeichnis]],
    target: figure.where(kind: table),
  )
  pagebreak()

  // Main content with Arabic numbering
  counter(page).update(1)
  set page(numbering: "1")

  body

  // Bibliography section
  if bibliography-file != none {
    pagebreak()
    set heading(numbering: none)
    heading([Literaturverzeichnis], level: 1)
    bibliography(bibliography-file, style: "apa-iu.csl", title: none)
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
        v(-0.65em)
        align(
          center,
          source-caption,
        )
      }
    },
    // kind: "iu-fig",
    caption: caption,
  )
}
