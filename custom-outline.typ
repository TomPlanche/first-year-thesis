#let tree-outline(
  symbol-font: "Courier New",
  text-font: "Courier New",
  number-font: "Courier New",
  text-size: 1em,
  line-spacing: 0.4em,  // Line spacing to make box-drawing characters join properly
  max-depth: none,  // Maximum heading level to include (none = all levels)
  use-dots: true,  // Use dots to separate text from page numbers (if false, uses spaces)
) = context {
  let headings = query(selector(heading))

  // Filter by depth if max-depth is specified
  if max-depth != none {
    headings = headings.filter(h => h.level <= max-depth)
  }

  if headings.len() == 0 {
    return []
  }

  // Convert content to plain text
  let content-to-str(c) = {
    // Layout the content and measure it to force text extraction
    let extracted = [#c]
    // Simple approach: just use the content directly in string context
    // Typst will handle the conversion
    str(c.text.body)
  }

  // Actually, better approach - use a locate and capture as plain text
  let content-to-str(c) = {
    if type(c) == str {
      c
    } else if c.has("text") {
      content-to-str(c.text)
    } else if c.has("body") {
      content-to-str(c.body)
    } else if c.has("children") {
      c.children.map(content-to-str).join("")
    } else {
      ""
    }
  }

  // Build tree structure
  let build-tree(headings) = {
    let items = headings.enumerate().map(((i, h)) => (
      idx: i,
      text: h.body,
      level: h.level,
      page: h.location().page(),
      location: h.location(),
      parent: none,
    ))

    items = items.enumerate().map(((i, item)) => {
      let parent-idx = none
      for j in range(i - 1, -1, step: -1) {
        if items.at(j).level < item.level {
          parent-idx = j
          break
        }
      }
      (..item, parent: parent-idx)
    })

    let build-node(idx) = {
      let item = items.at(idx)
      let children = items.enumerate()
        .filter(((i, child)) => child.parent == idx)
        .map(((i, child)) => build-node(i))

      (text: item.text, page: item.page, location: item.location, children: children)
    }

    items.enumerate()
      .filter(((i, item)) => item.parent == none)
      .map(((i, item)) => build-node(i))
  }

  let titles = build-tree(headings)

  let header = "┌"
  for i in range(calc.max(0, titles.len() - 2)) {
    header += "┬"
  }
  if titles.len() > 1 {
    header += "┐"
  }
  header += "\n"

  // Collect all lines with their text and page numbers
  let lines = ()

  let render-child(child, prefix-depth, is-last, ancestor-is-last) = {
    let result = ()
    let line = ""

    for i in range(prefix-depth) {
      line += "│"
    }

    line += "  "

    for was-last in ancestor-is-last {
      line += if was-last { "  " } else { "│ " }
    }

    line += if is-last { "└ " } else { "├ " }

    let text-str = content-to-str(child.text)
    let full-line = line + text-str

    result.push((prefix: line, text: child.text, text-str: text-str, full-line: full-line, page: child.page, location: child.location))

    if child.children.len() > 0 {
      let new-ancestors = ancestor-is-last + (is-last,)
      for (i, grandchild) in child.children.enumerate() {
        let child-lines = render-child(grandchild, prefix-depth, i == child.children.len() - 1, new-ancestors)
        result = result + child-lines
      }
    }

    result
  }

  let nb-top-level = titles.len() - 1

  for (i, title) in titles.enumerate() {
    let prefix-depth = nb-top-level - i
    let line = ""

    for j in range(prefix-depth) {
      line += "│"
    }

    line += "└ "

    let text-str = content-to-str(title.text)
    let full-line = line + text-str

    lines.push((prefix: line, text: title.text, text-str: text-str, full-line: full-line, page: title.page, location: title.location))

    if title.children.len() > 0 {
      for (j, child) in title.children.enumerate() {
        let child-lines = render-child(child, prefix-depth, j == title.children.len() - 1, ())
        lines = lines + child-lines
      }
    }
  }

  // Find max page number to determine padding width
  let max-page = lines.fold(0, (acc, line) => calc.max(acc, line.page))
  let max-page-width = str(max-page).len()

  // Render with clickable links
  block(
    width: 100%,
    inset: 0.5em,
    radius: 0.25em,
    {
      set par(leading: line-spacing, justify: false)
      set text(size: text-size)

      // Header
      text(font: symbol-font)[#raw(header, block: false, lang: none)]

      // Lines with clickable links
      for line in lines {
        // Pad page number with leading spaces to align right
        let page-str = str(line.page)
        let padding = " " * (max-page-width - page-str.len())
        let padded-page = padding + page-str

        // Build the line with clickable text, using 1fr box for dot leaders or spaces to right-align page numbers
        box(width: 100%)[
          #text(font: symbol-font)[#raw(line.prefix, block: false, lang: none)]#link(line.location)[#text(font: text-font)[#line.text]]
          #box(width: 1fr, if use-dots { repeat[.] } else { h(0pt) })
          #text(font: number-font)[#padded-page]
        ]
        linebreak()
      }
    }
  )
}
