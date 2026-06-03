#import "@local/clean-cnam-template:1.6.7": *

#import "@preview/glossy:0.9.0": *
#import "@preview/orchid:0.1.0": generate-link

#import "custom-outline.typ": *
#import "glossary.typ": my-glossary

// Custom glossary theme with clickable links
#let theme-table-glossary = (
  section: (title, body) => {
    set text(font: "Zed Plex Mono", size: 0.9em)
    body
  },
  group: (name, index, total, body) => {
    if name != "" {
      [#no-numbering()
=== #name]
    }
    table(
      columns: (30%, 1fr),
      inset: 6pt,
      stroke: 0.5pt + luma(180),
      align: (left, left),
      table.header(
        [*Terme*], [*Definition*],
      ),
      ..body.flatten()
    )
    v(1em)
  },
  entry: (entry, index, total) => {
    // entry.label creates the anchor for linking
    let term = if entry.long != none and entry.long != entry.short {
      [*#entry.short* #entry.label : #entry.long]
    } else {
      [*#entry.short* #entry.label]
    }
    let desc = if entry.description != none { entry.description } else { [] }
    (term, desc)
  }
)

#let main-color = "#0B2630"
#let print = false

#show: clean-cnam-template.with(
    author: (
        mail: "tomplanche@icloud.com",
        name: "Tom Planche",
        orcid: "0009-0005-6032-3201"
    ),
    colors: (
        main: main-color,
    ),
    fonts: (
        default: (name: "Zed Plex Sans", weight: 400),
        inline-raw: (name: "Monaspace Krypton", weight: 400),
        title: (name: "Monaspace Krypton", weight: 700),
    ),
    cover: (
        title: (
            text: "Rapport d'activité: Affluences",

            align: left,
            font: "Monaspace Krypton",
            weight: 700,
        ),
        subtitle: (
            text: "Première année d'alternance",

            align: left,
            font: "Monaspace Krypton",
            size: 18pt,
            weight: 700,
        ),
        subsubtitle: (
            text: "Maître d’apprentissage: Luis Valdez\nTuteur Enseignant: Faten Atigui",

            align: right,
            font: "Monaspace Krypton",
            size: 12pt,
            weight: 400,
        ),
        second-logo: (
            dx: 5pt,
            image: image("./assets/affluences_logo.png"),
            scale: .8,
        ),
    ),
    logo: image("./assets/cnam_logo.svg"),
    outline-code: tree-outline(
        symbol-font: "Monaspace Krypton",
        text-font: "Monaspace Krypton",
        number-font: "Monaspace Krypton",
        text-size: 1.35em,
        max-depth: 2,
        color: main-color,
        exclude-children: ("Glossaire",),
    ),
    print: print,
    start-date: none,
    year: 2025
)

// Fonction pour créer un terme cliquable vers le glossaire
// Modes: "short" (défaut), "long", "both", "pl" (pluriel)
#let g(key, mode: "short") = {
  let entry = my-glossary.at(key, default: none)
  if entry != none {
    let display = if mode == "long" and entry.at("long", default: none) != none {
      entry.long
    } else if mode == "both" and entry.at("long", default: none) != none {
      entry.long + " (" + entry.short + ")"
    } else if mode == "pl" {
      entry.short + "s"
    } else {
      entry.short
    }
    // Créer un lien vers le label spécifique du terme (gloss-key)
    let target-label = label("gloss-" + key)
    link(target-label)[#text(fill: rgb("0B607E"))[#if print { display } else { underline[#display] }]#super[#text(size: 0.6em, fill: rgb("0B607E"))[G]]]
  } else {
    [*#key*]
  }
}

#let affluences-link = link("https://affluences.com/fr/")[Affluences]

#show: init-glossary.with(my-glossary)

#no-numbering()
= Remerciements

Avant de commencer la lecture de ce mémoire, je tiens à adresser mes sincères remerciements aux personnes qui ont contribué au bon déroulement de mon année d'alternance et à la réalisation de ce document.

Je souhaite tout d'abord remercier l'entreprise #affluences-link pour m'avoir accueilli. J'ai particulièrement apprécié l'environnement de travail agréable et la liberté qui m'a été accordée dans le choix de mes outils de développement, me permettant de travailler dans des conditions optimales. Je remercie également l'ensemble de mes collègues pour leur accueil et la bonne ambiance générale.

Mes remerciements s'adressent tout particulièrement à mon maître d'apprentissage, Luis Valdes. Sa disponibilité constante, ses conseils avisés et son accompagnement m'ont été précieux tout au long de l'année. Son management bienveillant, alliant confiance et soutien, m'a permis de m'épanouir tant dans l'entreprise que dans mes missions.

Je remercie également Micaël Pais Novo, CTO, pour sa disponibilité et la confiance qu'il m'a témoignée, me permettant de travailler en autonomie tout en sachant que je pouvais compter sur son aide.

Enfin, je souhaite exprimer ma gratitude à mes collègues pour leur aide précieuse. Merci à Jean-Charles Moussé pour son soutien sur le projet `app-api` et à Raphaël Galmiche pour son aide sur les déploiements.

#no-numbering()
= Introduction

Ce rapport dresse le bilan de mon expérience en entreprise au cours de l'année scolaire 2025-2026.
Ce parcours s'inscrit dans le cadre de ma formation d'ingénieur en informatique et systèmes d'information,
réalisée en alternance au sein de l'École d’Ingénieur du Conservatoire National des Arts et Métiers (#link("https://ecole-ingenieur.cnam.fr/", [EI-CNAM])).

J'ai donc intégré en alternance l'équipe #g("backend") d'#link(<affluences>)[Affluences], une entreprise française innovante spécialisée dans
la gestion de l'affluence et l'optimisation des flux de visiteurs.
Cette année représentait pour moi une toute nouvelle aventure : mes premiers mois au sein de la société, une immersion complète dans un environnement professionnel exigeant et stimulant.
J'intègre la partie *Internal Services* en tant que *développeur* #g("backend").

== Affluences <affluences>

#affluences-link est une entreprise française fondée en 2014, aujourd'hui leader européen de la mesure et de la prévision d'affluence en temps réel. Avec plus de *10 ans d'expertise*, sa mission est de transformer la gestion des flux de visiteurs en une expérience fluide et optimisée, tant pour les établissements que pour leurs usagers.

L'entreprise affiche des résultats impressionnants : *1 800 établissements clients* répartis à travers l'Europe, une application mobile notée *4,8/5* utilisée par plus d'*un million de personnes*, et *13 millions de consultations mensuelles*. Elle a réalisé une levée de fonds de 4 millions d'euros en 2020 et compte parmi ses clients des institutions de renom comme le Musée du Louvre, la Tour Eiffel, la SNCF et l'Université de Cambridge.

Sa force réside dans une solution technologique complète et intégrée, qui combine des capteurs #g("iot") propriétaires pour la collecte de données, des algorithmes prédictifs pour anticiper les pics d'activité, et des plateformes de communication multi-canaux pour informer les utilisateurs en temps réel. L'entreprise déploie ses solutions sur *huit secteurs verticaux* distincts : bibliothèques et médiathèques, musées et lieux culturels, universités et smart campus, collectivités et smart cities, transports publics, espaces naturels, entreprises et smart buildings, retail et événements.

L'équipe technique d'une cinquantaine de collaborateurs est organisée en pôles spécialisés : *Data* (traitement des flux de données en temps réel), *Computer Vision* (algorithmes d'#g("iot", mode: "long") avec intelligence artificielle), *Infra* (infrastructure et sécurité), *Web* (interfaces utilisateur), et *Service* (#g("api", mode: "pl") et #g("microservices")). L'entreprise s'appuie sur un stack technologique moderne incluant #g("nodejs") et #g("nestjs") pour le #g("backend"), #g("kafka") pour le streaming de données, #g("airflow") et #g("argoworkflow") pour l'orchestration des workflows, #g("kubernetes") pour l'orchestration de conteneurs, et #g("datadog") pour le monitoring des applications. L'équipe a récemment adopté une architecture #g("monorepo") pour certains projets, améliorant la modularité et la maintenance. L'organisation suit une méthodologie #g("agile") avec des sprints de 2 semaines.

C'est au sein de cette #g("scaleup") innovante, qui promeut une culture d'autonomie et d'actionnariat salarié universel, que j'ai eu l'opportunité de réaliser mon alternance.

= Environnement de Travail

Mon alternance s'est déroulée au sein d'un environnement de travail stimulant, caractérisé par une forte culture d'entreprise et une organisation agile et moderne. Cette section détaille les conditions de travail, l'environnement technique, et les méthodologies qui régissent le quotidien au sein de la société.

== Conditions de travail et intégration

L'environnement de travail au sein de l'entreprise se distingue par une culture fondée sur la confiance, l'autonomie et la prise d'initiative. Avec une équipe d'une cinquantaine de personnes, l'organisation conserve une hiérarchie aplatie qui favorise la communication directe et la collaboration.

Un aspect particulièrement marquant est son modèle d'actionnariat salarié universel : chaque employé est actionnaire, ce qui aligne les intérêts de tous sur le succès collectif de l'entreprise. La transparence est également une valeur clé, avec une communication ouverte sur les résultats et la stratégie de l'entreprise.

L'intégration des nouveaux arrivants, et notamment des alternants, est facilitée par un système de mentorat et des perspectives d'évolution interne concrètes, illustrées par des parcours comme celui du Lead Mobile, qui a débuté en tant que stagiaire.

#no-numbering()
=== Environnement technique et outils

Son écosystème technique est riche et moderne, conçu pour supporter une plateforme traitant des millions d'utilisateurs et des centaines de millions de points de données annuellement.

#no-numbering()
==== Stack technique principale

L'architecture #g("backend") repose sur une approche #g("microservices"), utilisant principalement #g("nodejs") et *Python* pour le traitement des données. La communication asynchrone entre les services est assurée par #g("kafka"). Côté #g("frontend"), les applications web s'appuient sur #g("angular"), tandis que l'application mobile a été développée avec #g("flutter"), le framework cross-platform de Google.

#no-numbering()
==== Langages et frameworks

L'équipe de développement maîtrise un large éventail de langages et frameworks pour répondre aux besoins spécifiques de chaque partie de la plateforme :
- *#g("backend") :* #g("nodejs"), Python.
- *#g("frontend") :* JavaScript/#g("typescript") avec #g("angular"), #g("graphql") pour les #g("api", mode: "pl").
- *Mobile :* Dart avec #g("flutter"), avec une expérience passée sur le natif (Swift/Kotlin).

#no-numbering()
==== Infrastructure et déploiement

L'infrastructure est hébergée sur le #g("cloud") français OVHcloud pour garantir la conformité #g("rgpd"). L'architecture distribuée s'appuie sur la conteneurisation avec #g("docker"), probablement orchestrée par #g("kubernetes"). Les bases de données suivent une approche multi-modèle, combinant probablement des bases de données relationnelles (#g("sql")), #g("nosql") (pour les séries temporelles des capteurs) et un cache en mémoire comme #g("redis") pour les données temps réel.

#no-numbering()
==== Architecture logicielle : Clean Architecture

Tous les #g("microservices") développés en interne suivent un pattern *Clean Architecture* rigoureux, qui impose une séparation stricte des responsabilités entre les couches logicielles. L'objectif est d'isoler la logique métier de toute dépendance technique (base de données, framework HTTP, messagerie), rendant le code testable et évolutif indépendamment de son infrastructure.

#no-numbering()
===== Structure en couches

Chaque service est organisé selon une arborescence de modules reproductible :

#code(
    ```text
    src/
    ├── core/
    │   └── repositories/
    │       └── device.repository.ts            # Interface IDeviceRepository
    └── modules/
        └── devices/
            ├── entities/                       # Entités TypeORM (mapping BD)
            │   └── device.entity.ts
            ├── models/                         # Modèles métier internes
            │   └── device.model.ts
            ├── adapters/                       # Conversion entité ↔ modèle
            │   └── device.adapter.ts
            ├── repositories/                   # Implémentation MySQL
            │   └── device-mysql.repository.ts
            ├── services/                       # Logique métier pure
            │   └── device.service.ts
            └── controllers/                    # Exposition REST
                └── device.controller.ts
    ```,
    text-style: (
        // font: "Departure Mono",
        font: "Monaspace Krypton",
        size: 8pt
    )
)

#no-numbering()
===== Abstraction des repositories

Les interfaces de repository sont définies dans `core/`, sans aucune dépendance à un moteur de base de données. La couche service ne connaît que ces contrats :

#code(
    ```typescript
    export interface IDeviceRepository {
        findById(deviceId: number): Promise<Device | null>;
        findByApiKey(apiKey: string): Promise<Device | null>;
        save(device: CreateDeviceParams): Promise<Device>;
    }
    ```,
    filename: "core/repositories/device.repository.ts",
    lang: none,
    text-style: (
        font: "Monaspace Krypton",
        size: 8pt,
        weight: 400
    )
)

L'implémentation concrète, qui dépend de TypeORM et MySQL, vit dans `repositories/` et implémente ce contrat :

#code(
    ```typescript
    @injectable()
    export class DeviceMysqlRepository implements IDeviceRepository {
        constructor(
            @inject(DEVICE_ENTITY_REPO) private repo: Repository<DeviceEntity>,
        ) {}

        async findById(deviceId: number): Promise<Device | null> {
            const entity = await this.repo.findOne({ where: { deviceId } });

            return entity ? DeviceAdapter.toDomain(entity) : null;
        }
    }
    ```,
    filename: "modules/devices/repositories/device-mysql.repository.ts",
    lang: none,
    text-style: (
        font: "Monaspace Krypton",
        size: 8pt,
        weight: 400
    )
)

Cette indirection permet de substituer l'implémentation MySQL par une implémentation en mémoire lors des tests unitaires, sans modifier une seule ligne de la logique métier.

#no-numbering()
===== Ségrégation des types : Entités, Modèles et DTOs

Une distinction rigoureuse est maintenue entre trois catégories de types qui ne doivent jamais se mélanger :

#definition(title: "Trois catégories de types")[
  - *Entités (#g("orm"))* : reflètent fidèlement la structure de la base de données. Décorées avec les annotations TypeORM (`@Entity`, `@Column`), elles ne sortent jamais de la couche infrastructure.
  - *Modèles métier* : types internes au #g("microservice"), indépendants de tout moteur de persistance. Ce sont eux qui transitent dans la couche service et définissent le langage ubiquitaire du domaine.
  - *#g("dto", mode: "pl")* : types à la frontière de l'#g("api"). Définis pour les corps de requête et les réponses REST, ils sont décorés pour la validation (`class-validator`) et la documentation Swagger. Ils ne contiennent aucune logique métier.
]


#figure(
    image("./assets/d2/data_flow_through_layers.svg"),
    caption: "Flux de données à travers les couches"
)

#no-numbering()
===== Adapters

Les adapters sont des classes utilitaires statiques qui assurent la conversion bidirectionnelle entre les couches. Ils constituent la seule couche du code où deux types de représentations différents se côtoient :

#code(
    ```typescript
    export class DeviceAdapter {
        static toDomain(entity: DeviceEntity): Device {
            return {
                deviceId:      entity.deviceId,
                identifier:    entity.identifier,
                apiKey:        entity.apiKey,
                isBlacklisted: entity.blacklist,
                revokedAt:     entity.revokedAt ?? null,
                revokedReason: entity.revokedReason ?? null,
            };
        }

        static toResponseDto(model: Device): DeviceResponseDto {
            return {
                id:         model.deviceId,
                identifier: model.identifier,
                revoked:    model.revokedAt !== null,
            };
        }
    }
    ```
)

Ce pattern garantit que la forme des données en base de données ne dicte jamais la forme des objets métier, et vice-versa. Chaque couche peut évoluer indépendamment : renommer une colonne en base n'impacte que l'entité et son adapter, jamais la logique service ni les #g("dto", mode: "pl").

#no-numbering()
===== Bénéfices observés

En pratique, cette architecture apporte trois avantages concrets au sein des équipes :

#example(title: "Apports de la Clean Architecture")[
  1. *Testabilité* : les services peuvent être testés unitairement en injectant un repository en mémoire, sans base de données réelle.
  2. *Indépendance technologique* : passer de MySQL à PostgreSQL pour un service revient à écrire une nouvelle implémentation du repository, sans toucher à la logique métier.
  3. *Lisibilité* : un développeur qui rejoint le projet sait immédiatement où se trouve chaque type de code grâce à la structure prévisible des modules.
]

#no-numbering()
==== Outils de productivité

Conformément à la culture d'autonomie, les développeurs ont la liberté de choisir leurs outils de travail, que ce soit leur système d'exploitation (OS) ou leur environnement de développement intégré (IDE), leur permettant de travailler dans des conditions de confort optimales.

#no-numbering()
==== Sécurité et accès aux ressources

La sécurité est une priorité absolue. La plateforme est entièrement conforme au #g("rgpd", mode: "long"), avec des mesures strictes d'anonymisation des données, de limitation de la durée de conservation et de chiffrement (#g("ssl")).
En complément de cette conformité, l'entreprise est actuellement en démarche pour obtenir la certification #g("iso27001"), la norme internationale de référence pour les systèmes de management de la sécurité de l'information, afin de formaliser et d'attester de la robustesse de ses processus.

#no-numbering()
==== Observabilité et monitoring

Le suivi de la plateforme en production est assuré par plusieurs outils. #g("sentry") est utilisé pour le tracking d'erreurs en temps réel. Une solution d'#g("apm", mode: "long") et un système de logging centralisé sont également en place pour superviser la performance des #g("microservices") et faciliter le débogage.

#no-numbering()
==== Outils collaboratifs

La collaboration est facilitée par la structure plate de l'entreprise et l'utilisation d'outils de communication modernes. Les réunions régulières comme les "Moments Affluences" et la transparence générale sur les objectifs permettent à chacun de comprendre sa contribution à la vision globale.

#no-numbering()
==== Gestion des déploiements et workflow Git

Les déploiements sont automatisés via un pipeline de #g("cicd", mode: "both") et s'appuient sur un workflow Git structuré qui régit aussi bien le développement quotidien que le processus de publication des versions.

#no-numbering()
===== Branches de fonctionnalité

Tout développement (nouvelle fonctionnalité, correction de bug ou refactoring) fait l'objet d'une branche dédiée créée depuis `main`. La convention de nommage suit le format `<type>/<description-courte>`, et inclut systématiquement le numéro de ticket ou d'epic Jira associé, par exemple :

#code(
    ```text
    feat/app-service_first-version_INT-3713
    feat/INT-1234_app-service
    fix/attendance-stats-timeout_INT-987
    refactor/device-repository-abstraction_INT-1056
    ```,
    numbering: false
)

La présence du ticket dans le nom de branche permet aux outils d'intégration (Jira, GitLab) de lier automatiquement la branche à son ticket, et offre une visibilité immédiate sur le contexte de chaque développement sans avoir à consulter l'historique des commits.

Une fois les développements terminés, une *Pull Request* est ouverte pour une revue de code par au moins un autre développeur avant fusion dans `main`. Cette pratique garantit la cohésion du code et le partage de connaissances au sein de l'équipe.

#no-numbering()
===== Commits conventionnels

Tous les commits doivent respecter la spécification *Conventional Commits*. Le format impose un type, un périmètre optionnel et une description courte : `<type>(<périmètre>): <description courte>`


#example(title: "Exemples de commits")[
  ```text
  feat(devices): add PATCH endpoint for partial device update
  fix(attendance): resolve timeout on 30-day period queries
  chore(deps): bump @affluences/commons to 2.4.1
  refactor(app-versions): extract pagination to shared utility
  test(devices): add unit tests for DeviceAdapter
  ci: update GitLab pipeline to Node 20
  ```
]

Les types principaux reconnus sont `feat` (nouvelle fonctionnalité), `fix` (correction de bug), `chore` (maintenance), `refactor`, `test`, `docs` et `ci`.

Chaque commit référence également le ticket Jira correspondant, ajouté en fin de description avec le préfixe `#`. Le projet Jira de l'équipe *Internal Services* utilise le préfixe `INT` :

#example(title: "Référencement du ticket Jira")[
  ```text
  feat(devices): add PATCH endpoint for partial device update #INT-1234
  fix(attendance): resolve timeout on 30-day period queries #INT-987
  chore(deps): bump @affluences/commons to 2.4.1 #INT-1056
  ```
]

Cette pratique assure la traçabilité bidirectionnelle entre le code et les tickets : depuis l'historique git, on retrouve le contexte fonctionnel de chaque changement ; depuis Jira, on accède directement aux commits et aux pull requests associés.

Ces règles ne reposent pas sur la bonne volonté des développeurs : elles sont *mécaniquement enforced* par un hook pre-commit via *commitlint*. Le fichier `.commitlintrc.json` à la racine du dépôt définit les contraintes :

#code(
    ```json
    {
        "rules": {
            "scope-empty": [2, "never"],
            "type-enum": [2, "always", [
                "feat", "fix", "docs", "refactor",
                "test", "revert", "quality", "chore", "init"
            ]],
            "subject-case": [0]
        },
        "parserPreset": {
            "parserOpts": {
                "headerPattern": "^(\\w*)(?:\\(([^)]*)\\))?:\\s(.*)\\s([A-Z]+-[0-9]+)$",
                "headerCorrespondence": ["type", "scope", "subject", "ticket"]
            }
        }
    }
    ```,
    text-style: (font: "Monaspace Krypton", size: 8pt)
)

La `headerPattern` est la pièce centrale : elle valide que chaque message respecte le format `<type>(<scope>): <description> <TICKET-ID>`, et extrait les quatre composants (`type`, `scope`, `subject`, `ticket`) pour les outils en aval. Un commit sans scope ou sans référence de ticket est *rejeté* avant même d'être créé.

Cette convention rend l'historique git directement lisible et sert de base à la génération automatique des changelogs lors des publications.

#pagebreak()
#no-numbering()
===== Branches de release et publication avec release-it

Le processus de publication s'appuie sur des *branches de release* dédiées, nommées `release/<version>` (ex : `release/1.2.3`). Ces branches concentrent tous les commits de publication générés automatiquement par l'outil *release-it*, qui orchestre l'ensemble du cycle de vie d'une version.

#my-block(
    content-align: left,
    title: "Phases de publication d'une version",
    width: 100%
)[
  *Phase 1 : Release Candidate*

  Une première version candidate est générée depuis la branche de release (`1.2.3-rc.0`). *release-it* met à jour les fichiers `package.json`, génère un `CHANGELOG` partiel depuis les commits conventionnels et crée le tag git `v1.2.3-rc.0`. Cette RC est déployée en environnement de staging pour validation fonctionnelle.

  *Phase 2 : Release définitive*

  Après validation, la version finale `1.2.3` est publiée. *release-it* génère le `CHANGELOG` complet, crée le tag `v1.2.3`, publie le package sur le registry npm interne de la société, puis la branche `release/1.2.3` est fusionnée dans `main`.
]

*release-it* orchestre automatiquement les étapes suivantes à chaque publication :

- Validation que le dépôt est propre (pas de modifications non commitées)
- Calcul du prochain numéro de version selon les règles du #g("semver", mode: "long") et des commits conventionnels
- Mise à jour de `package.json` et `package-lock.json`
- Génération ou mise à jour du fichier `CHANGELOG.md`
- Création du commit de release et du tag git signé
- Publication sur le registry npm interne

Ce processus garantit une traçabilité complète des livraisons : chaque version déployée correspond à un tag git précis, et son contenu est documenté dans le changelog généré automatiquement depuis les commits conventionnels.

#figure(
  image("./assets/d2/git_workflow.svg", width: 100%),
  caption: [Workflow Git : cycle de développement et de publication des versions]
)

#no-numbering()
=== Organisation du travail en mode #g("agile")

#no-numbering()
==== Méthodologie de développement

L'entreprise a adopté une approche de développement #g("agile") rythmée par des #g("sprint", mode: "pl") de deux semaines. Bien qu'un framework spécifique comme #g("scrum") ne soit pas formellement appliqué dans toute sa rigueur, l'organisation du travail s'articule autour de cycles de développement itératifs et de rituels hebdomadaires bien établis.

Parmi ces rituels, on retrouve :
- Le `suivi-services`, qui se tient chaque lundi à 10h30. Cette réunion permet à chaque membre de l'équipe de partager ses avancées et les points de blocage éventuels.
- La `weekly tech`, qui a lieu le vendredi à 10h30. Ce point synchronise l'ensemble des équipes techniques (#g("backend"), #g("frontend"), mobile, data) et assure que chacun est informé des progrès et des défis des autres pôles.

Cette organisation, combinée à des équipes cross-fonctionnelles, permet de livrer de la valeur en continu tout en maintenant une forte cohésion et une bonne circulation de l'information au sein du département technique.

#no-numbering()
==== Pipeline #g("cicd")

Le pipeline de #g("cicd") est au cœur de la méthodologie de développement. Il automatise la compilation, les tests et le déploiement du code, garantissant ainsi une haute qualité et une grande vélocité.

#no-numbering()
==== Versionnage sémantique

L'équipe de développement suit les conventions du #g("semver", mode: "long") pour gérer les versions de ses applications et services. Cela permet de communiquer clairement l'impact des changements (corrections de bugs, nouvelles fonctionnalités, changements cassants) aux autres équipes et aux utilisateurs de l'#g("api").

#no-numbering()
==== Architecture orientée services

L'architecture #g("microservices") permet de découpler les différentes parties de la plateforme. Chaque service est responsable d'une fonctionnalité métier spécifique et peut être développé, déployé et mis à l'échelle indépendamment des autres. #g("kafka") joue un rôle crucial en permettant à ces services de communiquer de manière asynchrone et fiable.

#figure(
  image("./assets/d2/microservices_architecture.svg", width: 100%),
  caption: [Topologie des services internes et de leur communication]
)

#no-numbering()
==== Standards de qualité

La qualité est assurée par une combinaison de revues de code systématiques, de tests automatisés (unitaires, intégration) intégrés au pipeline de #g("cicd"), et d'un monitoring proactif en production. La robustesse de l'architecture est conçue pour supporter une charge élevée tout en garantissant une haute disponibilité.

#no-numbering()
==== Sécurité #g("docker")

L'utilisation de #g("docker") suit les meilleures pratiques de sécurité, notamment l'utilisation d'images de base minimalistes et vérifiées, la gestion des secrets en dehors des images, et potentiellement l'analyse des images pour détecter des vulnérabilités connues.

#no-numbering()
==== Onboarding et documentation

L'intégration des nouveaux membres est une priorité. Le mentorat par des membres plus expérimentés de l'équipe est une pratique courante. La culture du partage de connaissances est également encouragée, notamment via le blog technique de l'entreprise qui sert de documentation sur les choix d'architecture et les défis techniques rencontrés.

#no-numbering()
==== Communication et collaboration

La communication est fluide et directe grâce à la hiérarchie aplatie. Les équipes cross-fonctionnelles travaillent en étroite collaboration au quotidien. Les outils de messagerie instantanée et de gestion de projet viennent supporter ces échanges.

== Conclusion partielle

Cet environnement de travail est celui d'une #g("scaleup") technologique mature, qui a su conserver l'agilité et l'esprit d'initiative d'une startup tout en mettant en place des processus robustes pour garantir la qualité, la sécurité et la scalabilité de sa plateforme. La culture d'entreprise, axée sur l'autonomie, la transparence et l'intéressement collectif, constitue un atout majeur pour attirer et retenir les talents.

= Missions

== Optimisation de requête

#no-numbering()
=== Contexte et problématique

#no-numbering()
==== Le service `stats-service`

`stats-service` est un #g("microservice") dédié à l'agrégation de données statistiques pour la plateforme Affluences. Il expose une #g("api") #g("graphql") construite avec *GraphQL Yoga* et *Type-GraphQL*, et interroge une base MySQL distincte (`stats`) contenant l'historique des mesures de capteurs. Son rôle est de fournir aux tableaux de bord les métriques d'affluence en temps réel et sur des périodes passées : occupations, temps d'attente, entrées et sorties.

La table centrale est `stats.histories`, dont la clé primaire composite est `(measuring_set_id, record_datetime_utc)`. Chaque ligne représente un relevé horodaté pour un ensemble de capteurs (*measuring set*), et stocke ses valeurs dans une colonne #g("json") `data_points` (champs `occupancy`, `waiting_time`, `entries`, `exits`, etc.). Un *measuring set* regroupe les capteurs associés à un site donné ; la relation `site_id -> measuring_set_id` est gérée par le service `sensors-service`.

#no-numbering()
==== La requête `getAttendanceStatsForAPeriod`

La requête #g("graphql") `getAttendanceStatsForAPeriod` prend en entrée un `siteId` et une plage temporelle (`fromDatetimeUtc`, `toDatetimeUtc`), et retourne les valeurs minimales et maximales d'occupation et de temps d'attente pour cette période. Elle alimente directement les graphiques de synthèse des dashboards clients.

Le flux d'exécution suit la chaîne suivante :

#figure(
    image("./assets/d2/stats_service_flow.svg", width: 100%),
    caption: [Chaîne d'exécution de `getAttendanceStatsForAPeriod`]
)

Cette requête présentait des problèmes de performance critiques pour les plages de dates supérieures à un mois. Les requêtes prenaient plus de 90 secondes pour des périodes de 30 jours et crashaient complètement pour des requêtes sur une année entière.

#no-numbering()
==== Symptômes observés:

- Requêtes sur 30 jours : *90+ secondes*
- Requête sur 1 an : *Timeout* (crash complet)
- Dégradation exponentielle avec l'augmentation de la période
- Impact négatif sur l'expérience utilisateur des dashboards


#no-numbering()
=== Analyse technique de la cause racine

Le problème résidait dans l'architecture des requêtes du `AttendanceStatsRepository`, qui filtraient les données par `site_id` en utilisant l'extraction #g("json") :

#code(
    ```sql
    WHERE JSON_EXTRACT(h.contextual_data, "$.site_id") = :siteId
      AND h.record_datetime_utc BETWEEN :from AND :to
      AND JSON_EXTRACT(h.data_points, "$.occupancy") IS NOT NULL
    ```
)

#no-numbering()
==== Limitations de l'approche initiale

- Impossibilité d'utiliser l'index de clé primaire `(measuring_set_id, record_datetime_utc)`
- Nécessité d'un parcours complet de la table (#g("fulltablescan"))
- Parsing #g("json") pour chaque ligne de la table
- Performance dégradant de manière exponentielle avec la taille de la période

=== Solution architecturale

L'optimisation a consisté à inverser la stratégie de requêtage pour exploiter l'indexation existante de la base de données.

#figure(
  image("./assets/d2/query_plan_comparison.svg", width: 100%),
  caption: [Comparaison des plans d'exécution avant et après l'optimisation]
)


Au lieu de requêter directement par `site_id` (stocké dans un champ #g("json")), la solution procède en deux étapes :

1. *Récupération des measuring set IDs* via le `SensorsInternalHttpRepository`
2. *Requête par `measuring_set_id`* (colonne indexée) au lieu de `site_id` (champ #g("json"))

Cette approche ajoute un appel #g("api") léger (~10-20ms) mais transforme la requête base de données de $O(n)$ en $O(log n)$.

#figure(
  image("./assets/d2/query_optimization_sequence.svg", width: 90%),
  caption: [Diagramme de séquence de la stratégie d'optimisation en deux étapes]
)

=== Modifications techniques implémentées

#no-numbering()
==== Refactoring du contrôleur

Avant ce refactoring, `AttendanceStatsController` était une classe ordinaire sans décorateur, instanciée manuellement à l'intérieur du resolver. Cela impliquait que la `SensorsInternalRepository` devait être construite ou passée explicitement à chaque point d'usage, sans aucune gestion du cycle de vie.

Le passage à un composant géré par le conteneur #g("ioc") *Inversify* s'effectue en trois temps :

1. Le décorateur `@injectable()` signale au conteneur que la classe peut être instanciée et câblée automatiquement.
2. Les dépendances (ici `SensorsInternalRepository`) sont déclarées en paramètre de constructeur ; Inversify les résout seul au démarrage.
3. L'enregistrement `inSingletonScope()` dans `app.module.ts` garantit une unique instance partagée pour toute la durée de vie du service, évitant de recréer le client HTTP à chaque requête.

// #pagebreak()

#code(
    ```typescript
    @injectable()
    export class AttendanceStatsController {
        constructor(private sensorsRepository: SensorsInternalRepository) {}

        private async getMeasuringSetIdsForSite(siteId: number): Promise<string[]> {
            const measuringSets = await this.sensorsRepository.getMeasuringSets({
                siteIds: [siteId],
            });

            return measuringSets.map(ms => ms.measuringSetId);
        }
    }
    ```
)

#no-numbering()
==== Optimisation des requêtes repository

Les signatures de méthodes ont été modifiées pour accepter des `measuring_set_ids` :

#code(
    ```typescript
    public static async getMinMaxOccupancy(
        measuringSetIds: string[],
        fromDatetimeUtc: string,
        toDatetimeUtc: string
    ): Promise<{ maxOccupancy: number; minOccupancy: number } | null>
    ```
)

Les requêtes SQL ont été optimisées pour exploiter l'index :

#code(
    ```sql
    WHERE h.measuring_set_id IN (:...measuringSetIds)
      AND h.record_datetime_utc BETWEEN :from AND :to
      AND h.data_points -> "$.occupancy" IS NOT NULL
    ```
)

#no-numbering()
===== Améliorations techniques

- Utilisation de l'index de clé primaire
- Remplacement de `JSON_EXTRACT()` par l'opérateur `->` (plus lisible)
- Ajout de vérifications de nullité pour les tableaux vides
- Binding TypeORM d'arrays avec la syntaxe `:...array` pour les clauses `IN`


#no-numbering()
==== Injection de dépendances

L'enregistrement dans le conteneur et le câblage avec le resolver sont symétriques :

#code(
    ```typescript
    // app.module.ts
    serviceContainer.bind<AttendanceStatsController>(AttendanceStatsController)
        .toSelf()
        .inSingletonScope();

    // AttendanceStatsResolver.ts
    @injectable()
    export class AttendanceStatsResolver {
        constructor(private attendanceStatsController: AttendanceStatsController) {}
    }
    ```
)

Le resolver déclare simplement avoir besoin d'un `AttendanceStatsController` ; le conteneur se charge de lui fournir l'instance singleton déjà câblée avec sa `SensorsInternalRepository`. Aucune des deux classes ne sait comment l'autre est construite.

Ce découplage présente un avantage concret pour les tests unitaires : il suffit de lier `SensorsInternalRepository` à une implémentation fictive dans le conteneur de test pour isoler entièrement la logique du controller, sans modifier une ligne de code de production.

#no-numbering()
=== Résultats et impact

- Gains de performance mesurés

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: (left, right, right, center),
  [*Métrique*], [*Avant*], [*Après*], [*Amélioration*],
  [Requête sur 30 jours], [90+ secondes], [40 ms], [×2 250],
  [Requête sur 1 an], [Crash (timeout)], [220 ms], [∞],
  [Opération DB], [#g("fulltablescan")], [#g("indexseek")], [-],
  [Comportement], [Dégradation exp.], [Performance linéaire], [-],
)

#no-numbering()
=== Explication des optimisations clés

#no-numbering()
==== Exploitation de l'index composite

La table `stats.histories` possède une clé primaire composite `(measuring_set_id, record_datetime_utc)`. En base de données relationnelle, une clé primaire est automatiquement indexée via un #g("btree", mode: "both"). Cet index peut être vu comme un annuaire trié : chercher une entrée revient à naviguer dans l'arbre plutôt qu'à feuilleter toutes les pages. La complexité passe de $O(n)$ (lire toutes les lignes) à $O(log n)$ (descendre l'arbre).

Pour qu'un index composite soit utilisé, la requête doit filtrer en commençant par la *première colonne* de l'index. Ici, `measuring_set_id IN (...)` satisfait cette condition : MySQL identifie directement les feuilles de l'arbre correspondant aux measuring sets demandés. La clause `record_datetime_utc BETWEEN` exploite ensuite la *seconde colonne* pour affiner la plage temporelle à l'intérieur de chaque partition de measuring set.

Le problème de la requête d'origine était précisément que `JSON_EXTRACT(h.contextual_data, "$.site_id")` n'est pas une colonne, mais une expression calculée. MySQL ne peut pas indexer une expression dynamique sans colonne générée explicite, et doit donc évaluer cette extraction pour *chaque ligne de la table* avant de filtrer : c'est le #g("fulltablescan").

#definition(title: [#g("fulltablescan") vs #g("indexseek")])[
  - *#g("fulltablescan")* : MySQL lit séquentiellement toutes les pages disque de la table pour trouver les lignes correspondantes. Sur une table de plusieurs millions de lignes, cela représente des gigaoctets de lecture, indépendamment du nombre de résultats attendus.
  - *#g("indexseek")* : MySQL descend le #g("btree") de l'index et accède directement aux pages pertinentes. Seules les données nécessaires sont lues. Le coût est proportionnel au nombre de résultats, pas à la taille totale de la table.
]

#no-numbering()
==== Trade-off et analyse coût-bénéfice

La stratégie en deux étapes introduit un appel reseau supplementaire, ce qui peut sembler contre-intuitif. L'analyse chiffree justifie ce choix :

#my-block(
    content-align: left,
    title: "Analyse coût-bénéfice",
    width: 100%
)[
  #table(
    columns: (2fr, 1fr, 1fr),
    align: (left, right, right),
    [*Operation*], [*Avant*], [*Après*],
    [Appel HTTP `getMeasuringSets`], [absent], [~10-20 ms],
    [Requête SQL (30 jours)], [90+ secondes], [~20-30 ms],
    [Requête SQL (1 an)], [timeout], [~200 ms],
    [*Total (1 an)*], [*crash*], [*~220 ms*],
  )
]

L'appel HTTP vers `sensors-service` retourne une liste de quelques dizaines d'identifiants : la reponse est petite, le service est interne au reseau prive, et la latence est negligeable au regard des 90 secondes economisees. C'est un cout fixe et previsible, independant de la periode interrogee.

A l'inverse, le parsing JSON ligne par ligne croissait lineairement avec le volume de donnees : plus la periode etait longue, plus la table etait parcourue en entier, et plus le temps d'execution explosait. Pour une requete annuelle, la table entiere devait etre lue, parsee et filtree, saturant a la fois le CPU du serveur MySQL et ses I/O disque.

#no-numbering()
=== Impact en production

Cette optimisation a permis de :

- Rendre les dashboards réactifs pour des statistiques annuelles en temps réel
- Réduire drastiquement la charge sur la base de données
- Éliminer les erreurs de timeout pour les requêtes multi-mois
- Améliorer significativement l'expérience utilisateur avec des réponses instantanées

#no-numbering()
=== Conformité aux patterns existants

L'optimisation suit le même pattern déjà utilisé avec succès dans :
- `app/modules/attendance/infrastructure/record-history-mysql.repository.ts`
- `app/modules/attendance/services/attendance.service.ts`

La solution réutilise l'infrastructure existante (`SensorsInternalHttpRepository`) et respecte le pattern repository utilisé dans l'ensemble du codebase.

#no-numbering()
=== Enseignements techniques

#no-numbering()
==== Leçons clés

1. *Conscience des index* : Toujours concevoir les requêtes autour des index disponibles
2. *Prudence avec les colonnes #g("json")* : Le filtrage sur des champs #g("json") empêche l'utilisation d'index
3. *Requêtes en deux étapes* : Ajouter une étape de lookup légère peut être plus rapide qu'une requête unique non optimisée
4. *Mesurer systématiquement* : L'amélioration de `x2 250` a été validée par des mesures en production réelle
5. *Suivre les patterns existants* : La solution réutilise l'architecture établie du projet

#no-numbering()
==== Concepts techniques approfondis

- *Index composites* : Compréhension du fonctionnement de `(measuring_set_id, record_datetime_utc)`
- *TypeORM array binding* : Syntaxe `:...array` pour les clauses `IN`
- *Opérateurs #g("json") MySQL* : Utilisation de `->` au lieu de `JSON_EXTRACT()`
- *#g("di")* : Patterns #g("ioc") pour améliorer testabilité et maintenabilité


*Date de réalisation* : Octobre 2025 \
*Statut* : [OK] Deployé en production et valide avec du trafic reel

#pagebreak()
== Création du `app-service`

#no-numbering()
=== Contexte et objectifs

Dans le cadre de la gestion des applications mobiles de la société, la plateforme repose sur des *millions d'appareils* enregistrés (smartphones iOS et Android).
Ces appareils communiquent avec le backend via une clé #g("api") qui sert à les authentifier et à les autoriser. Jusqu'alors, la logique de gestion de ces appareils était dispersée dans d'autres services.

J'ai eu comme objectif de créer un nouveau #g("microservice") dédié, nommé `app-service`, afin de centraliser tout ce qui touche à la gestion des appareils et des versions applicatives.
Ce service est destiné à être consommé principalement par `app-api`.

Les responsabilités attendues étaient :
- Enregistrement d'un nouvel appareil.
- Mise à jour des informations d'un appareil (token Firebase, dernière version, etc.).
- Vérification de l'autorisation d'un appareil (clé #g("api") valide, liste noire).
- Gestion de l'historique des versions de l'application.

Cette première version avait pour périmètre la mise en place de la *base du projet* : connexion à la base de données, définition des entités, et exposition d'une #g("api") REST.

#no-numbering()
=== Contraintes techniques

La contrainte principale était l'*échelle* : la table `psn.appareils` contient des millions de lignes. Toute décision d'architecture (indexation, pagination, requêtes) devait tenir compte de cette volumétrie.

La stack choisie est *NestJS* avec *TypeORM* pour l'accès à la base *MySQL*, en suivant les conventions du projet (`@affluences/commons`). Le service expose une #g("api") REST versionnée (v1).

#no-numbering()
=== Architecture mise en place

Le service suit le pattern *Clean Architecture* adopté en interne, avec une séparation claire entre :

- `core/` : interfaces/abstractions (contrats de repository)
- `modules/<feature>/entities/` : entités TypeORM (mapping base de données)
- `modules/<feature>/models/` : modèles métier et DTOs de l'#g("api")
- `modules/<feature>/adapters/` : conversion entité ↔ modèle
- `modules/<feature>/repositories/` : implémentation MySQL du repository
- `modules/<feature>/services/` : logique métier
- `modules/<feature>/controllers/` : exposition REST

Deux modules ont été créés : `DevicesModule` et `AppVersionsModule`.

#no-numbering()
=== Entités et tables

#no-numbering()
==== `DeviceEntity` : table `psn.appareils`

L'entité représente un appareil enregistré :

#code(
    ```typescript
    @Entity('appareils', { schema: 'psn', database: 'psn' })
    @Unique('cle_UNIQUE', ['apiKey'])
    @Unique('identifieur_UNIQUE', ['identifier', 'revokedAt'])
    export class DeviceEntity {
        @PrimaryGeneratedColumn({ type: 'int', name: 'appareil_id' })
        deviceId!: number;

        @Column('varchar', { name: 'identifieur', nullable: false, length: 255 })
        identifier!: string;

        @Column('varchar', { name: 'cle', nullable: false, length: 255, unique: true })
        apiKey!: string;

        @Column('varchar', { name: 'operating_system', ... })
        operatingSystem!: string;

        @Column('tinyint', { name: 'blacklist', ...
            transformer: new BoolTinyIntTransformer() })
        blacklist!: boolean;

        @Column('varchar', { name: 'firebase_token', nullable: true, length: 255 })
        firebaseToken?: string | null;

        @Column('datetime', { name: 'revoked_at', nullable: true })
        revokedAt?: Date | null;

        @Column('enum', { name: 'revoked_reason', enum: RevokedReason, nullable: true })
        revokedReason?: RevokedReason | null;
        // ...
    }
    ```
)

Deux contraintes d'unicité garantissent l'intégrité : la clé #g("api") est globalement unique, et l'identifiant d'appareil est unique parmi les appareils non révoqués (la combinaison `identifier + revokedAt` est unique, ce qui permet d'avoir plusieurs entrées historiques révoquées pour un même identifiant).

#no-numbering()
==== `AppVersionEntity` : table `psn.app_version_history`

L'entité représente une version de l'application mobile :

#code(
    ```typescript
    @Entity('app_version_history', { schema: 'psn', database: 'psn' })
    @Unique('build_UNIQUE', ['build', 'appIdentifier'])
    export class AppVersionEntity {
        @PrimaryGeneratedColumn({ type: 'int', name: 'app_version_history_id' })
        appVersionHistoryId!: number;

        @Column('varchar', { name: 'app_identifier' })
        appIdentifier!: string;

        @Column('varchar', { name: 'version_identifier' })
        versionIdentifier!: string;

        @Column('double', { name: 'build', default: 0 })
        build!: number;

        @Column('bit', { name: 'expired', transformer: new BoolBitTransformer() })
        expired!: boolean;

        @Column('bit', { name: 'available', transformer: new BoolBitTransformer() })
        available!: boolean;

        @Column('bit', { name: 'beta_build', transformer: new BoolBitTransformer() })
        betaBuild!: boolean;
    }
    ```
)

#figure(
  image("./assets/d2/app_service_er.svg", width: 85%),
  caption: [Schéma des tables gérées par `app-service`]
)

#no-numbering()
=== Endpoints REST exposés

- Devices : `/v1/devices`

#table(
    columns: (auto, auto, 1fr),
    align: (left, left, left),
    [*Méthode*], [*Chemin*], [*Description*],
    [`GET`],   [`/v1/devices`],            [Liste paginée avec filtres (deviceId, apiKey, identifier, isRevoked)],
    [`GET`],   [`/v1/devices/:deviceId`],  [Récupération d'un appareil par son ID],
    [`POST`],  [`/v1/devices`],            [Création d'un nouvel appareil],
    [`PATCH`], [`/v1/devices/:deviceId`],  [Mise à jour partielle d'un appareil],
)

- App Versions : `/v1/app-versions`

#table(
    columns: (auto, auto, 1fr),
    align: (left, left, left),
    [*Méthode*], [*Chemin*], [*Description*],
    [`GET`], [`/v1/app-versions`], [Liste paginée des versions avec filtres (type, version, build, available)],
)

La pagination est gérée via le package partagé `@affluences/commons/pagination` qui expose un objet `Paginated<T>`.

#no-numbering()
=== Points techniques notables

#no-numbering()
==== Gestion de la révocation

Un appareil peut être révoqué (banni) sans être supprimé physiquement. Les champs `revokedAt` et `revokedReason` permettent de tracer la révocation tout en conservant l'historique. La contrainte d'unicité sur `(identifier, revokedAt)` permet d'avoir plusieurs entrées pour un même identifiant physique (un téléphone réinstallant l'application), tant qu'une seule n'est pas révoquée.

#no-numbering()
==== Transformateurs de types MySQL

La base de données utilise des types `TINYINT` et `BIT` pour les booléens. Des transformateurs TypeORM (`BoolTinyIntTransformer`, `BoolBitTransformer`) assurent la conversion transparente vers des `boolean` TypeScript, évitant les erreurs de type à l'échelle de millions de lignes.

#no-numbering()
==== Bootstrap et middlewares

Le service est initialisé avec un ensemble de middlewares communs issus de `@affluences/commons/router` :
- Compression des réponses
- Parsing des vraies IPs (proxies)
- Injection d'un identifiant de requête (`requestId`)
- Exposition de métriques Prometheus (`/metrics`)

L'*OpenTelemetry* (OTel) est initialisée *avant* l'import de NestJS, conformément aux exigences de l'instrumentation automatique.

#no-numbering()
=== Résultat

Le service `app-service` a été mergé et déployé en environnement d'intégration et de staging. Il constitue le socle sur lequel les fonctionnalités de vérification d'autorisation des appareils seront construites dans les prochains tickets.

*Date de réalisation* : Octobre à Novembre 2025 \
*Statut* : [OK] Mergé sur `main`, `staging` et en production

= Annexes

== Rona : automatiser les commits

=== Présentation

En parallèle de mon travail chez Affluences, j'ai développé et maintenu #link("https://github.com/rona-rs/")[Rona], un outil en ligne de commande écrit en *Rust* dont l'objectif est de rationaliser le workflow Git quotidien. Le projet est open source, publié sur #link("https://crates.io/crates/rona")[crates.io] et distribué via Homebrew.

Rona a été conçu avant mon arrivée chez Affluences pour simplifier les opérations Git répétitives. Cependant, c'est l'expérience au sein de l'équipe *Internal Services* (avec ses conventions strictes de commits, ses tickets Jira et son hook *commitlint*) qui a véritablement motivé le développement de la fonctionnalité centrale : le système de champs personnalisables dans `.rona.toml`.

=== Fonctionnalités principales

#my-block(
    content-align: left,
    title: "Fonctionnalités de Rona",
    width: 100%
)[
  - *Staging intelligent* (`rona -a`) : ajout de fichiers au staging avec exclusion de patterns, fonctionnel depuis n'importe quel sous-répertoire du dépôt.
  - *Génération de message de commit* (`rona -g`) : sélection interactive du type de commit, puis ouverture de l'éditeur configuré ou saisie directe en terminal (`-i`).
  - *Commit et push* (`rona -c -p`) : commit depuis le fichier `commit_message.md`, avec détection automatique de la signature GPG.
  - *Synchronisation de branche* (`rona sync`) : mise à jour d'une branche depuis `main` par merge ou rebase.
  - *Complétions shell* : support Bash, Fish, Zsh et PowerShell.
]

=== Système de configuration

Rona suit une hiérarchie de configuration à deux niveaux :

- `~/.config/rona.toml` : configuration globale, appliquée à tous les projets.
- `.rona.toml` : configuration locale au projet, qui prend la priorité sur la configuration globale.

La clé `template` permet de définir le format exact du message de commit via des variables (`{commit_type}`, `{message}`, `{branch_name}`, etc.) et des blocs conditionnels (`{?ticket}...{/ticket}`) pour gérer les champs optionnels.

La fonctionnalité `[[extra_fields]]` permet de déclarer des champs supplémentaires affichés lors de la génération interactive. Chaque champ peut être pré-rempli automatiquement depuis la sortie d'une commande shell ou depuis le nom de la branche courante grâce à une expression régulière.

=== Configuration adaptée à Affluences

La partie `[[extra_fields]]` a été conçue en grande partie pour répondre aux besoins d'Affluences : extraire automatiquement le numéro de ticket `INT-XXXX` depuis le nom de la branche, et suggérer le scope depuis l'historique git récent. Le `.rona.toml` suivant produit des commits conformes au format imposé par le `.commitlintrc.json` de l'équipe :

#code(
    ```toml
    editor = "zed"
    commit_types = ["feat", "fix", "docs", "refactor", "test", "revert", "quality", "chore", "init"]

    # Produit: feat(devices): add PATCH endpoint #INT-1234
    template = "{commit_type}{?scope}({scope}){/scope}: {message}{?ticket} #{ticket}{/ticket}"

    field_order = ["scope", "message", "ticket"]

    # Scope suggéré depuis les 20 derniers commits
    [[extra_fields]]
    name = "scope"
    prompt = "Scope"
    kind = "select"
    required = true
    prefetch.source = "command"
    prefetch.command = "git log -20 --pretty=format:%s"
    prefetch.extract_regex = "\\w+\\((?P<value>[^)]*)\\):"
    prefetch.deduplicate = true

    # Ticket extrait automatiquement du nom de branche (ex: feat/INT-1234_app-service)
    [[extra_fields]]
    name = "ticket"
    prompt = "Ticket Jira"
    kind = "text"
    required = false
    validation = "^[A-Z]+-[0-9]+$"
    prefetch.source = "branch"
    prefetch.extract_regex = "[A-Z]+-[0-9]+"
    ```,
    text-style: (font: "Monaspace Krypton", size: 7.5pt)
)

Sur une branche nommée `feat/app-service_first-version_INT-3713`, une session `rona -g -i` se déroule ainsi :

#code(
    ```text
    $ Select commit type
    > feat

    $ Scope
    > devices
      app-versions
      (none)
      Other (enter manually)

    $ Message
    > add PATCH endpoint for partial device update

    $ Ticket Jira (INT-3713)
    > INT-3713
    ```
)

Ce qui produit directement :

#code(
    ```text
    feat(devices): add PATCH endpoint for partial device update #INT-3713
    ```
)

Le message est conforme au pattern de la `headerPattern` du `.commitlintrc.json` et sera accepté par le hook pre-commit sans modification manuelle.

== Rédaction avec Typst et `clean-cnam-template`

=== Typst, une alternative moderne à LaTeX

Ce mémoire n'a pas été rédigé avec un traitement de texte classique ni avec LaTeX, mais avec #link("https://typst.app/")[Typst], un système de composition de documents de nouvelle génération. Typst adopte une syntaxe légère et expressive, une compilation quasi-instantanée, et un système de packages communautaire, ce qui en fait une alternative pragmatique à LaTeX pour la rédaction de documents techniques et académiques.

=== Un package open source dédié au CNAM

Pour structurer mes documents de cours au CNAM, j'ai développé et publié le package open source *`clean-cnam-template`*, disponible dans le registre officiel de packages Typst sous l'identifiant `@preview/clean-cnam-template`. Ce mémoire lui-même l'utilise en version 1.6.7 :

#code(
    ```typst
    #import "@preview/clean-cnam-template:1.6.7": *
    ```,
    text-style: (font: "Monaspace Krypton", size: 8pt)
)

Le package est conçu de façon modulaire, avec une séparation claire entre la configuration, les composants d'interface, la gestion des polices, la mise en page et les environnements mathématiques. Ses fonctionnalités principales sont :

#my-block(
    content-align: left,
    title: "Fonctionnalités de clean-cnam-template",
    width: 100%
)[
  - *Identité visuelle CNAM* : couleurs officielles, logo, en-têtes contextuels.
  - *Page de couverture configurable* : titre, sous-titre, auteur (avec lien ORCID et mailto), logo secondaire, couleur de fond, cercles décoratifs : tout est paramétrable.
  - *Blocs de code enrichis* (`#code()`) : coloration syntaxique, numérotation des lignes, étiquette de fichier ou de langage.
  - *Environnements mathématiques* : `#definition()`, `#example()`, `#theorem()` avec styles distincts.
  - *Blocs de contenu* : `#my-block()`, `#blockquote()` pour les encadrés et citations.
  - *Plan personnalisable* : le paramètre `outline-code` accepte n'importe quel contenu Typst ; ce mémoire injecte ainsi l'arbre ASCII défini dans `custom-outline.typ`.
  - *Gestion typographique avancée* : polices distinctes pour le corps, les titres et le code, mise en évidence automatique de mots-clés avec la couleur principale.
]

=== Usage au quotidien et adoption par les camarades

Le package est utilisé pour l'ensemble de mes prises de notes et rapports de cours au CNAM. Sa cohérence visuelle et sa facilité de configuration (les paramètres couvrent polices, couleurs, dates, auteur et mise en page en un seul bloc `#show: clean-cnam-template.with(...)`) ont conduit plusieurs camarades de promotion à l'adopter pour leurs propres documents.

Ce mémoire constitue lui-même un cas d'usage avancé du template : la table des matières en arbre ASCII, les blocs de code avec la police *Monaspace Krypton*, les schémas D2 intégrés comme figures sont autant de personnalisations réalisées par-dessus le template de base.

= Glossaire <glossaire>

Ce glossaire regroupe les termes techniques utilises dans ce document, classés par categorie pour faciliter la comprehension.

#{
  // Affichage personnalisé du glossaire par groupe
  let groups = ("Developpement", "Infrastructure", "Donnees", "Methodologie", "Securite", "Entreprise")

  for group in groups {
    // Filtrer les termes de ce groupe
    let terms = my-glossary.pairs().filter(pair => {
      let entry = pair.at(1)
      entry.at("group", default: "") == group
    })

    if terms.len() > 0 {
      [== #group]

      table(
        columns: (30%, 1fr),
        inset: 6pt,
        stroke: 0.5pt + luma(180),
        align: (left, left),
        table.header([*Terme*], [*Definition*]),
        ..terms.map(pair => {
          let key = pair.at(0)
          let entry = pair.at(1)
          // Créer le label pour ce terme (gloss-key)
          let term-label = label("gloss-" + key)
          let term-display = if entry.at("long", default: none) != none and entry.long != entry.short {
            [*#entry.short* : #entry.long #term-label]
          } else {
            [*#entry.short* #term-label]
          }
          (term-display, entry.at("description", default: []))
        }).flatten()
      )
      v(1em)
    }
  }
}
