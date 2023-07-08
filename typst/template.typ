#let project(
  title: "",
  group: "",
  authors: (),
  logo: none,
  body
) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "New Computer Modern", lang: "pt")
  set heading(numbering: "1.")

  set block(breakable: false, width: 100%)
  
  show heading: it => {
    set block(below: 15pt)
    smallcaps(it)
  }

  // Set paragraph spacing.
  show par: set block(above: 1.2em, below: 1.2em)
  set par(leading: 0.75em)

  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  v(0.6fr)
  if logo != none {
    align(right, image(logo, width: 26%))
  }
  v(9.6fr)

  text(2em, weight: "bold", title)
  v(-0.4cm)

  text(15pt, weight: "bold", group)

  // Author information.
  pad(
    top: 0.7em,
    right: 20%,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(start, strong(author))),
    ),
  )

  v(2.4fr)
  pagebreak()

  // Table of contents.
  align(horizon,
    outline(title: auto, depth: 3, indent: auto)
  )
  
  pagebreak()

  // Main body.
  set par(justify: true)

  body
}
