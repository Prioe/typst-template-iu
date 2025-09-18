#import "@local/iu:0.0.1": iu-figure, iu-paper

#show: iu-paper.with(
  title: [Ein Satzsystem zur Entwirrung des wissenschaftlichen
    Schreibprozesses],
  author: "Max Mustermann",
  student-id: "123456789",
  program: "Informatik",
  course: "INF101",
  tutor: "Dr. Anna Schmidt",
  bibliography: bibliography("refs.bib"),
)

= Einleitung
Wissenschaftliches Schreiben ist ein entscheidender Bestandteil des
Forschungsprozesses und ermöglicht es Forschern, ihre Erkenntnisse mit der
breiteren wissenschaftlichen Gemeinschaft zu teilen. Der Satzprozess
wissenschaftlicher Dokumente kann jedoch oft eine frustrierende und
zeitaufwändige Angelegenheit sein, insbesondere bei der Verwendung veralteter
Werkzeuge wie LaTeX. Obwohl es über 30 Jahre alt ist, bleibt es aufgrund seiner
Leistungsfähigkeit und Flexibilität eine beliebte Wahl für wissenschaftliches
Schreiben. Es bringt jedoch auch eine steile Lernkurve, komplexe Syntax und
lange Kompilierzeiten mit sich, was bei vielen Forschern zu Frustration und
Verzweiflung führt @netwok2020 @netwok2022.

== Überblick über die Arbeit
In dieser Arbeit stellen wir Typst vor, ein neues Satzsystem, das darauf
ausgelegt ist, den wissenschaftlichen Schreibprozess zu optimieren und Forschern
eine schnelle, effiziente und benutzerfreundliche Alternative zu bestehenden
Systemen zu bieten. Unser Ziel ist es, den Status quo zu erschüttern und
Forschern einen besseren Weg für wissenschaftliches Schreiben anzubieten.

Durch den Einsatz fortschrittlicher Algorithmen und einer benutzerfreundlichen
Oberfläche bietet Typst mehrere Vorteile gegenüber bestehenden Satzsystemen,
einschließlich schnellerer Dokumentenerstellung, vereinfachter Syntax und
erhöhter Benutzerfreundlichkeit.

Um das Potenzial von Typst zu demonstrieren, haben wir eine Reihe von
Experimenten durchgeführt, die es mit anderen beliebten Satzsystemen,
einschließlich LaTeX, vergleichen. Unsere Ergebnisse deuten darauf hin, dass
Typst mehrere Vorteile für wissenschaftliches Schreiben bietet, insbesondere für
Anfänger, die möglicherweise mit den Komplexitäten von LaTeX kämpfen. Zusätzlich
zeigen wir, dass Typst erweiterte Funktionen für erfahrene Benutzer bietet, die
eine größere Anpassung und Flexibilität bei der Dokumentenerstellung
ermöglichen.

Insgesamt glauben wir, dass Typst einen bedeutenden Schritt nach vorne im
Bereich des wissenschaftlichen Schreibens und Satzes darstellt und Forschern ein
wertvolles Werkzeug zur Optimierung ihres Arbeitsablaufs bietet, damit sie sich
auf das konzentrieren können, was wirklich wichtig ist: ihre Forschung. In den
folgenden Abschnitten werden wir Typst detaillierter vorstellen und Belege für
seine Überlegenheit gegenüber anderen Satzsystemen in verschiedenen Szenarien
liefern.

= Methoden <sec:methods>
#lorem(45)

$ a + b = gamma $ <eq:gamma>

#lorem(80)

#iu-figure(
  circle(radius: 15pt),
  caption: [Ein Kreis, der die Sonne darstellt.],
  source-caption: [Quelle: Eigene Darstellung],
) <fig:sun>

In @fig:sun sehen Sie eine übliche Darstellung der Sonne, die ein Stern ist, der
sich im Zentrum des Sonnensystems befindet.

#lorem(120)

#iu-figure(
  table(
    columns: (6em, auto),
    align: (left, right),

    table.header[Planet][Entfernung (Millionen km)],
    [Merkur], [57,9],
    [Venus], [108,2],
    [Erde], [149,6],
    [Mars], [227,9],
    [Jupiter], [778,6],
    [Saturn], [1.433,5],
    [Uranus], [2.872,5],
    [Neptun], [4.495,1],
  ),
  caption: [Die Planeten des Sonnensystems und ihre durchschnittliche Entfernung
    zur Sonne],
  source-caption: [Quelle: Eigene Darstellung],
) <tab:planets>

In @tab:planets sehen Sie die Planeten des Sonnensystems und ihre
durchschnittliche Entfernung zur Sonne. Die Entfernungen wurden mit @eq:gamma
berechnet, die wir in @sec:methods vorgestellt haben.

#lorem(240)

#iu-figure(
  ```typst
  #draw(
    rect(0pt, 0pt, 100pt, 50pt, fill: lightgray, stroke: black)
  )
  ```,
  caption: [Zeichnen eines Rechtecks],
  source-caption: [Quelle: Eigene Darstellung],
)

#lorem(240)
