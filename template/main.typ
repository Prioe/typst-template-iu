#import "@local/iu:0.0.1": iu-figure, iu-paper

#show: iu-paper.with(
  title: [A Typesetting System to Untangle the Scientific Writing Process],
  author: "John Doe",
  student-id: "123456789",
  program: "Computer Science",
  course: "CS101",
  tutor: "Jane Smith",
  bibliography: bibliography("refs.bib"),
)

= Introduction
Scientific writing is a crucial part of the research process, allowing researchers to share their findings with the wider scientific community. However, the process of typesetting scientific documents can often be a frustrating and time-consuming affair, particularly when using outdated tools such as LaTeX. Despite being over 30 years old, it remains a popular choice for scientific writing due to its power and flexibility. However, it also comes with a steep learning curve, complex syntax, and long compile times, leading to frustration and despair for many researchers @netwok2020 @netwok2022.

== Paper overview
In this paper we introduce Typst, a new typesetting system designed to streamline the scientific writing process and provide researchers with a fast, efficient, and easy-to-use alternative to existing systems. Our goal is to shake up the status quo and offer researchers a better way to approach scientific writing.

By leveraging advanced algorithms and a user-friendly interface, Typst offers several advantages over existing typesetting systems, including faster document creation, simplified syntax, and increased ease-of-use.

To demonstrate the potential of Typst, we conducted a series of experiments comparing it to other popular typesetting systems, including LaTeX. Our findings suggest that Typst offers several benefits for scientific writing, particularly for novice users who may struggle with the complexities of LaTeX. Additionally, we demonstrate that Typst offers advanced features for experienced users, allowing for greater customization and flexibility in document creation.

Overall, we believe that Typst represents a significant step forward in the field of scientific writing and typesetting, providing researchers with a valuable tool to streamline their workflow and focus on what really matters: their research. In the following sections, we will introduce Typst in more detail and provide evidence for its superiority over other typesetting systems in a variety of scenarios.

= Methods <sec:methods>
#lorem(45)

$ a + b = gamma $ <eq:gamma>

#lorem(80)

#iu-figure(
  circle(radius: 15pt),
  caption: [A circle representing the Sun.],
  source-caption: [Quelle: Eigene Darstellung],
) <fig:sun>

In @fig:sun you can see a common representation of the Sun, which is a star that is located at the center of the solar system.

#lorem(120)

#iu-figure(
  table(
    columns: (6em, auto),
    align: (left, right),

    table.header[Planet][Distance (million km)],
    [Mercury], [57.9],
    [Venus], [108.2],
    [Earth], [149.6],
    [Mars], [227.9],
    [Jupiter], [778.6],
    [Saturn], [1,433.5],
    [Uranus], [2,872.5],
    [Neptune], [4,495.1],
  ),
  caption: [The Planets of the Solar System and Their Average Distance from the Sun],
  source-caption: [Quelle: Eigene Darstellung],
) <tab:planets>

In @tab:planets, you see the planets of the solar system and their average distance from the Sun.
The distances were calculated with @eq:gamma that we presented in @sec:methods.

#lorem(240)

#iu-figure(
  ```typst
  #draw(
    rect(0pt, 0pt, 100pt, 50pt, fill: lightgray, stroke: black)
  )
  ```,
  caption: [Drawing a rectangle],
  source-caption: [Quelle: Eigene Darstellung],
)

#lorem(240)
