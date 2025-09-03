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
  logo: none,
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
    fill: text-color
  )

  // Paragraph formatting (no indentation, 6pt spacing)
  set par(
    justify: true,
    leading: 0.65em,  // 1.5 line spacing equivalent
    spacing: 6pt,     // 6pt between paragraphs as in LaTeX
    first-line-indent: 0pt,
  )

  // Page setup with 2cm margins
  set page(
    paper: "a4",
    margin: (top: 2cm, left: 2cm, right: 2cm, bottom: 2cm),
    numbering: none,  // Will be set per section
    number-align: center,
  )

  // Heading configuration (12pt, bold)
  set heading(numbering: "1.")
  show heading: set text(
    font: main-font,
    size: heading-size,
    weight: "bold"
  )
  
  // Spacing for headings
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(1em)
    it
    v(0.5em)
  }
  
  show heading.where(level: 2): it => {
    v(1em)
    it
    v(0.3em)
  }
  
  show heading.where(level: 3): it => {
    v(0.8em)
    it
    v(0.3em)
  }

  // Figure and table captions (German abbreviations)
  set figure(numbering: "1")
  show figure.where(kind: image): set figure.caption(separator: [: ])
  show figure.where(kind: table): set figure.caption(separator: [: ])
  
  // German figure names
  show figure.where(kind: image): it => {
    show figure.caption: cap => [
      #text(weight: "bold")[Abb. #it.counter.display(it.numbering)]: #cap.body
    ]
    it
  }
  
  show figure.where(kind: table): it => {
    show figure.caption: cap => [
      #text(weight: "bold")[Tab. #it.counter.display(it.numbering)]: #cap.body
    ]
    it
  }

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

  // Table of contents with Roman numbering
  if show-outline {
    pagebreak()
    outline(
      title: [Inhaltsverzeichnis],
      indent: auto,
    )
    pagebreak()
  }

  // Main content with Arabic numbering
  counter(page).update(1)
  set page(numbering: "1")

  body

  // Bibliography section
  if bibliography-file != none {
    pagebreak()
    set heading(numbering: none)
    heading([Literaturverzeichnis], level: 1)
    bibliography(bibliography-file, style: "apa")
  }
}

// Source caption command (equivalent to LaTeX \sourcecaption)
#let source-caption(source) = {
  v(-0.5em)
  align(center)[
    #text(size: 0.9em, style: "italic")[Quelle: #source]
  ]
  v(0.3em)
}
