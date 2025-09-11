#let buildMainHeader(mainHeadingContent, author) = {
    [
        #smallcaps(mainHeadingContent) #h(1fr) #author
        #line(length: 100%, stroke: white)
    ]
}

#let buildSecondaryHeader(mainHeadingContent, secondaryHeadingContent, author) = {
    [
        #smallcaps(mainHeadingContent) #h(1fr) secondaryHeadingContent #h(1fr)  #author
        #line(length: 100%, stroke: white)
    ]
}

#let isAfter(secondaryHeading, mainHeading) = {
    let secHeadPos = secondaryHeading.location().position()
    let mainHeadPos = mainHeading.location().position()
    if (secHeadPos.at("page") > mainHeadPos.at("page")) {
    return true
    }
    if (secHeadPos.at("page") == mainHeadPos.at("page")) {
    return secHeadPos.at("y") > mainHeadPos.at("y")
    }
    return false
}

#let getHeader(author) = {
    context {
    // if we are on the first and second pages, we don't have any header
    // so we return an empty header
    if (here().page() <= 2) {
        return []
    }

    // Find if there is a level 1 heading on the current page
    let nextMainHeading = query(selector(heading).after(here())).find(headIt => {
        headIt.location().page() == here().page() and headIt.level == 1
    })

    if (nextMainHeading != none) {
        return buildMainHeader(nextMainHeading.body, author)
    }

    // Find the last previous level 1 heading -- at this point surely there's one :-)
    let lastMainHeading = query(selector(heading).before(here())).filter(headIt => {
        headIt.level == 1
    }).last()

    // Find if the last level > 1 heading in previous pages
    let previousSecondaryHeadingArray = query(selector(heading).before(here())).filter(headIt => {
        headIt.level > 1
    })

    let lastSecondaryHeading = if (previousSecondaryHeadingArray.len() != 0) {previousSecondaryHeadingArray.last()} else {none}

    // Find if the last secondary heading exists and if it's after the last main heading
    if (lastSecondaryHeading != none and isAfter(lastSecondaryHeading, lastMainHeading)) {
        return buildSecondaryHeader(lastMainHeading.body, lastSecondaryHeading.body, author)
    }

    return buildMainHeader(lastMainHeading.body, author)
    }
}
