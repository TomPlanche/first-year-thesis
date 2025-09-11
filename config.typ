/**
 * Configuration file for my MEMOIRE_S2 project.
 *
 * Since heading methods and logic are heavy, I moved them to a separate file.
 */

#import "heading.typ": *

#let conf(
  author: (
      first_name: "Tom",
      last_name: "Planche",
  ),
  cfa_logo: "assets/cfa-numia_logo.png",
  company: (
      name: "Affluences",
      logo: "assets/affluences_logo.png"
  ),
  page_bg: none,
  school: (
      logo: "assets/cnam_logo.svg",
      years: "2025 - 2026",
  ),
  title: "Rapport d'activités",

  body,
) = {
    // VARS
    let body-font = "Zed Plex Mono"
    let title-font = "PP Mondwest"

    let full-author-name = author.first_name + " " + author.last_name

    // default settings (SET)
    set document(author: full-author-name, title: title)
    set figure.caption(separator: [ --- ], position: top)
    set heading(
            numbering: (..nums) => {
                let     level = nums.pos().len()

                let pattern = if level == 1 {
                    "I -"
                } else if level == 2 {
                    "I. I -"
                } else if level == 3 {
                    "I. I .I -"
                } else if level == 4 {
                    "I. I. I. 1 -"
                }

                if pattern != none {
                    numbering(pattern, ..nums)
                }
            }
        )
    show heading: it => it + v(.5em)
    set page(
        background: [
            #image(page_bg, height: 100%, width: 100%)
        ],
        fill: black,
        header: getHeader(full-author-name),
        margin: (
            top: 2.5cm,
            right: 1.5cm,
            bottom: 2cm,
            left: 1.5cm
        ),
        numbering: (..args) => {
          let page-num = args.pos().first()
          if page-num < 3 {
            none
          } else {
            str(page-num)
          }
        },
        number-align: bottom + right,
    )
    set par(justify: true)
    set text(
        fill: white,
        font: body-font,
        lang: "fr"
    )

    let side-padding = .5em;
    show raw.where(block: false) : it => h(side-padding) + box(
        fill: gray.lighten(50%),
        stroke: black,
        outset: (x: .5em, y: .5em),
        radius: 4pt,

        {
            set text(fill: black);

            it
        }
    ) + h(side-padding)

    align(top,
        grid(
            columns: (33.33%, 33.33%, 33.33%),
            rows: 3cm,
            align: (left + horizon, center, right + top),
            none,
            if company.logo != none [
                #image(company.logo, height: 100%)
            ] else [],
            [

                #text(
                    author.first_name + "\n" + author.last_name,

                    font: title-font,
                    size: 24pt
                )
            ]

        )
    )

    align(left  + horizon,
        move(
            dy: -.5cm,
            [
                 #text(
                     title,

                     font: title-font,
                     size: 48pt,
                     weight: 700
                 );

                 #set text(font: body-font);
                 #text(company.name, 30pt);
                 #linebreak();
                 #v(2mm);
                 #text([
                     2ème Année d’École d’Ingénieur au CNAM \
                     Chargé de mission: Proutman Saucissux \
                     Maître de stage: Luis Valdez
                 ], 16pt);

            ]
        )
    )

    align(bottom,
        grid(
            columns: (33.33%, 33.33%, 33.33%),
            rows: 3cm,
            align: (left + bottom, center + bottom, right + bottom),

            [
                #image(school.logo, width: 4cm)
            ],

            [
                #text(
                    school.years,

                    font: body-font,
                    size: 20pt
                )
            ],

            [
                #image(cfa_logo, width: 4cm)
            ],
        )
    );

    pagebreak()
    outline()
    pagebreak()

    body
}
