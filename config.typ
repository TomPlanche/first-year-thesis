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

    // default settings
    set document(author: full-author-name, title: title)

    set page(
        margin: 1.27cm,
        fill: black,
        background: [
            #image(page_bg, height: 100%, width: 100%)
        ],
    )

    set text(
        fill: white,
        font: body-font,
        lang: "fr"
    )

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
