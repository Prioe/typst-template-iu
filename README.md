# IU Papers - Typst Templates

This repository provides Typst templates for IU (Internationale Hochschule) academic papers, converted from the original LaTeX templates.

## Directory Structure

```
.
├── lib.typ              # Main IU paper template
├── titlepage.typ        # IU-specific title page
├── references.bib       # Shared bibliography file
├── iu-logo.png         # IU logo (add manually)
├── iwsm01/
│   ├── main.typ        # IWSM01 assignment
│   └── references.bib  # Assignment bibliography
├── dlbingdabd01/
│   ├── main.typ        # Data Science assignment
│   └── references.bib  # Assignment bibliography
└── examples/           # Original examples and references
```

## Features

- **IU-compliant formatting**: Matches official IU paper requirements
- **German language support**: Proper hyphenation and localization
- **Font configuration**: Arial/Liberation Sans, 11pt body, 12pt headings
- **Layout**: A4 with 2cm margins, 1.5 line spacing, 6pt paragraph spacing
- **Automatic page numbering**: Roman for preliminaries, Arabic for content
- **German captions**: Abb./Tab. abbreviations
- **APA bibliography**: Integrated citation support
- **Modular design**: Shared template, individual assignments

## Quick Start

### 1. Add IU Logo

Place your IU logo as `iu-logo.png` in the root directory.

### 2. Create New Assignment

```bash
mkdir my-assignment
cp iwsm01/main.typ my-assignment/
```

### 3. Customize Assignment

Edit `my-assignment/main.typ`:

```typst
#import "../lib.typ": iu-paper, source-caption

#show: iu-paper.with(
  title: "Your Assignment Title",
  author: "Your Name",
  student-id: "Your Student ID",
  course: "Course Code",
  tutor: "Tutor Name",
  logo: "../iu-logo.png",
  bibliography-file: "../references.bib",
)

= Your First Section

Your content here...
```

### 4. Compile

```bash
# From repository root
typst compile --root . my-assignment/main.typ

# Or from assignment directory
cd my-assignment
typst compile --root .. main.typ
```

## Available Templates

### IWSM01 - General Project

- Standard academic paper structure
- Suitable for most IWSM01 assignments
- Located in `iwsm01/main.typ`

### DLBINGDABD01 - Data Science & Big Data Analytics

- Specialized sections for data science projects
- Includes methodology, data analysis, and evaluation sections
- Located in `dlbingdabd01/main.typ`

## Template Features

### Typography

- **Main font**: Liberation Sans (Arial fallback)
- **Body text**: 11pt with 1.5 line spacing
- **Headings**: 12pt bold with proper spacing
- **Paragraphs**: 6pt spacing, no indentation

### Document Structure

- **Title page**: IU logo, student info, course details
- **Table of contents**: Automatic generation
- **Bibliography**: APA style with German adaptations
- **Appendix**: Structured additional materials

### Special Commands

- `source-caption(source)`: Add source attribution below figures
- German figure/table numbering (Abb./Tab.)
- Block quotes with 1.27cm indentation

## Adding Citations

Add entries to `references.bib`:

```bibtex
@article{author2023,
  title={Article Title},
  author={Author, A.},
  journal={Journal Name},
  year={2023}
}
```

Cite in document:

```typst
According to @author2023, ...
```

## Requirements

- Typst compiler (0.11+)
- Liberation Sans or Arial font
- IU logo image file

## Credits

- **Original LaTeX template**: Markus Haug
- **Pandoc adaptation**: Michael Albertz
- **Typst conversion**: Claude Code Assistant

## License

Feel free to share and modify this template, but please give credit where it's due.
