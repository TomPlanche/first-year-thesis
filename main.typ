#import "colors.typ": *
#import "config.typ": *


#show: conf.with(
    author: (first_name: "Tom", last_name: "Planche"),
    company: "Affluences",
    logo: "assets/affluences_logo.png",
    page-bg: image("assets/page/page.png", width: 100%, height: 100%),
    title: "Rapport d'activités",
    year: datetime.today().year(),
)
