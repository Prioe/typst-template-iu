# typst-template-iu

This is a Typst template for IU (Internationale Hochschule) academic papers with
IU-compliant formatting, German language support, and APA bibliography style.

## Usage

> Proper installation is not yet supported. Clone this repository to
> `~/.local/share/typst/packages/local/iu/0.0.1` for the example usage to work.

Alternatively, clone this repository and customize the template in the
`template/` directory.

## Configuration

This template exports the `iu-paper` function with the following named
arguments:

- `title`: The paper's title as content.
- `author`: The author's name as content.
- `student-id`: Student ID as content.
- `program`: Study program (defaults to "Informatik (B.Sc.)").
- `course`: Course code (defaults to "IWSM01").
- `tutor`: Tutor name (defaults to "TBD").
- `date`: Date as datetime (defaults to today).
- `logo`: IU logo as image (defaults to image("iu-logo.png")).
- `bibliography`: The result of a call to the `bibliography` function or `none`.

The function also accepts a single, positional argument for the body of the
paper.

The template will initialize your package with a sample call to the `iu-paper`
function in a show rule. If you want to change an existing project to use this
template, you can add a show rule like this at the top of your file:

```typ
#import "@local/iu:0.0.1": iu-paper, iu-figure

#show: iu-paper.with(
  title: [Ein Satzsystem zur Entwirrung des wissenschaftlichen Schreibprozesses],
  author: "Max Mustermann",
  student-id: "123456789",
  program: "Informatik",
  course: "INF101",
  tutor: "Dr. Anna Schmidt",
  bibliography: bibliography("refs.bib"),
)

// Your content goes below.
```
