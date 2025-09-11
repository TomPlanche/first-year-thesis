#let conf(
  author: (
      first_name: "John",
      last_name: "Doe",
  ),
  company: "",
  logo: none,
  page-bg: none,
  title: "",
  year: datetime.today().year(),

  body,
) = {
    // VARS
    let body-font = "Zed Plex Mono"
    let title-font = "PP Mondwest"

    // default settings
    set page(
        margin: 1.27cm,
        fill: black
        // background: page-bg,
    )

    set text(
        fill: white,
        font: body-font,
        lang: "fr"
    )

    grid(
        columns: (33.33%, 33.33%, 33.33%),
        rows: 3cm,
        align: (left + horizon, right + horizon),
        box(
            height: 100%,
            width: 100%,
        ),
        box(
            height: 100%,
            width: 100%,
            if logo != none [
                #align(center + horizon,
                    image(logo, height: 100%)
                )
            ] else []
        ),
        box(
            height: 100%,
            width: 100%,

            align(right + top,
                [
                    #set text(font: title-font, size: 24pt);

                    #author.first_name \ #author.last_name
                ]
            )
        )
    )

    v(1em) // Add some space after the header
}
