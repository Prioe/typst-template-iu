// IU-specific title page function
#let iu-titlepage(
  title: none,
  subtitle: none,
  author: none,
  student-id: none,
  program: "Informatik (B.Sc.)",
  course: "IWSM01",
  tutor: "TBD",
  date: datetime.today(),
  logo: none,
) = {

  // Title page specific layout
  set page(
    margin: (top: 2cm, left: 2cm, right: 2cm, bottom: 2cm),
    numbering: none,
  )

  // IU Logo positioned at top right
  if logo != none {
    place(top + right, 
      dy: -1cm,
      dx: 1cm,
      image(logo, width: 4cm)
    )
  }

  // Main title page content
  align(center)[
    #v(6cm)
    
    // Main title - large and bold
    #text(size: 24pt, weight: "bold")[
      #title
    ]
    
    #if subtitle != none [
      #v(0.5cm)
      #text(size: 16pt)[#subtitle]
    ]
    
    #v(2cm)
    
    // Document type
    #text(size: 14pt)[
      Hausarbeit
    ]
    
    #v(2cm)
    
    // Author information
    #text(size: 14pt, weight: "bold")[
      #author (#student-id)
    ]
    
    #v(1cm)
    
    // Program and course information
    #text(size: 12pt)[
      #program \
      #course \
      #date.display("[day].[month].[year]")
    ]
    
    #v(3cm)
    
    // Tutor information in a table
    #align(center)[
      #table(
        columns: 2,
        stroke: none,
        align: left,
        [Tutorin:], [#tutor]
      )
    ]
  ]
}
