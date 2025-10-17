#let tree-outline(
  symbol-font: "Courier New",
  text-font: "Courier New",
  number-font: "Courier New",
  text-size: 1em,
  max-depth: none,  // Maximum heading level to include (none = all levels)
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

      (text: item.text, page: item.page, children: children)
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
    line += content-to-str(child.text)

    result.push((text: line, page: child.page))

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

    line += "└ " + content-to-str(title.text)

    lines.push((text: line, page: title.page))

    if title.children.len() > 0 {
      for (j, child) in title.children.enumerate() {
        let child-lines = render-child(child, prefix-depth, j == title.children.len() - 1, ())
        lines = lines + child-lines
      }
    }
  }

  // Find the maximum line length using grapheme clusters for accurate visual width
  let max-len = 0
  for line in lines {
    let visual-len = line.text.clusters().len()
    if visual-len > max-len {
      max-len = visual-len
    }
  }

  // Build output string with right-aligned page numbers
  let output = header

  for line in lines {
    let visual-len = line.text.clusters().len()
    let padding = max-len - visual-len + 1

    output += line.text

    // Add dots for padding
    for i in range(padding) {
      output += "."
    }

    output += " " + str(line.page) + "\n"
  }

  // Render as raw block with custom font
  // Note: For proper alignment with multiple fonts, all fonts must be monospace
  // with identical character widths. The symbol-font is used as the base.
  block(
    width: 100%,
    inset: 0.5em,
    radius: 0.25em,
    text(
      font: symbol-font,
      size: text-size,
      raw(output, block: true, lang: none)
    )
  )
}
