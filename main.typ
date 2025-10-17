#import "@local/clean-cnam-template:1.2.0": *
#import "custom-outline.typ": *


#show: clean-cnam-template.with(
    author: "Tom Planche",
    title: "Rapport d'activités",
    outline-code: tree-outline(
        symbol-font: "Snap-it mono-1.6",
        text-font: "Zed Plex Mono",
        number-font: "Zed Plex Mono",
        text-size: 2em,
        max-depth: 3
    ),
)

= Remerciements
#pagebreak()

= Introduction

Dans le cadre de ma deuxième année de formation d'ingénieur au CNAM Paris, j'ai intégré en alternance l'équipe backend d'Affluences,
une entreprise française innovante spécialisée dans la gestion de l'affluence et l'optimisation des flux de visiteurs.
J'intègre la partie *Internal Services* en tant que développeur *backend*.


= Environnement de Travail

== Conditions de travail et intégration

=== Environnement technique et outils

L'environnement technique chez Affluences repose sur une infrastructure moderne et des outils soigneusement sélectionnés pour faciliter le développement et la collaboration.

==== Stack technique principale

L'entreprise utilise un ensemble d'outils standardisés pour tous les développeurs :

#my-block(
    content-align: left
)[
  *IDE* : Les développeurs peuvent choisir leur environnement (VS Code, WebStorm, ou autres) \
  *Gestion de versions* : Git avec GitLab comme plateforme de dépôt \
  *Conteneurisation* : Docker et Docker Compose pour l'isolation des environnements \
  *Runtime JavaScript* : Node.js avec npm, avec possibilité d'utiliser des gestionnaires de version (nvm, nodev) \
  *Base de données* : MySQL (production et staging), MongoDB, Redis/Valkey \
  *Messagerie* : Kafka pour les systèmes événementiels
]

==== Langages et frameworks

La stack technique privilégie certains langages et frameworks pour garantir la cohérence entre les projets :

- *Backend* : Node.js, TypeScript, Python
- *Frameworks* : TypeORM pour les ORM
- *Formats de logs* : logfmt (format structuré obligatoire)

==== Infrastructure et déploiement

L'infrastructure d'Affluences est organisée autour de plusieurs environnements distincts :

#definition(title: "Environnements")[
  - *Staging* : environnement de pré-production accessible via les URLs en `.dev` ou `.io`
  - *Production* : environnement client accessible via les URLs en `.com` ou `.live`
]

==== Outils de productivité

Pour la visualisation et les tests, l'entreprise met à disposition :

- *Postman* et/ou *Swagger UI* : pour tester les services et la documentation des APIs
- *Workbench ou DataGrip* : pour la visualisation des bases de données
- *Portainer* : gestionnaire d'images Docker où les environnements sont déployés

==== Sécurité et accès aux ressources

L'accès aux ressources internes est sécurisé par plusieurs mécanismes :

#my-block(
    content-align: left,
    title: "Cloudflare Access et Tunnels"
)[

  Affluences utilise Cloudflare Access comme reverse-proxy authentifié pour protéger les services privés. L'authentification se fait via les comptes Google Affluences. Cette solution permet d'accéder aux bases de données et APIs internes sans VPN traditionnel.
]

Pour les connexions aux environnements distants, l'entreprise utilise également *Fast Travel*, une solution VPN interne basée sur Wireguard, avec deux réseaux distincts :
- Réseau de production : `prod.affluences.network` (172.30.0.0/16)
- Réseau de staging : `staging.affluences.network` (172.31.0.0/16)

==== Observabilité et monitoring

L'infrastructure de monitoring comprend :

- *Datadog* : plateforme centralisée d'agrégation et d'analyse des logs (région EU)
- *Prometheus* : collecte des métriques applicatives
- *Open Telemetry* : pour le tracing distribué (en cours de déploiement)
- *Kafka-UI* : interface de visualisation des topics Kafka

#example(title: "Accès aux outils de monitoring")[
  Les outils nécessitent une authentification via Cloudflare Access :
  - Staging : `https://kafka-ui.affluences.dev/`
  - Production : `https://kafka-ui.affluences.live/`
]

==== Outils collaboratifs

L'équipe utilise une suite d'outils pour la communication et la documentation :

- *GitLab* : hébergement du code et CI/CD
- *Jira* : gestion de projet en mode Agile
- *Gmail/Chat* : communication interne
- *Confluence, Whimsical, KB/KB tech* : documentation
- *Portail Affluences* : portail interne centralisant tous les outils et informations

==== Gestion des déploiements

Le déploiement suit une méthodologie rigoureuse avec :

- *ArgoCD* : pour le déploiement continu
  - Staging : `https://cd.affluences.dev/`
  - Production : `https://cd.affluences.live/`
- *Registry GitLab* : stockage des images Docker
- *Portainer* : gestion des conteneurs en production

=== Organisation du travail en mode agile

==== Méthodologie de développement

Affluences applique une méthodologie Agile structurée avec des étapes de développement clairement définies.

#definition(title: "Workflow de développement")[
  1. Création d'une branche à partir de `staging`
  2. Commits avec référence au ticket Jira (format `DP-XXX : description`)
  3. Phase de modification avec commits et push réguliers
  4. Après vérification, merge sur `staging`
]

==== Pipeline CI/CD

Le processus d'intégration et de déploiement continu suit des étapes standardisées :

#my-block(
    content-align: left,
    title: "Pipeline Staging"
)[
  1. Compilation
  2. Tests automatisés
  3. Publication sur le registry
  4. Déploiement automatique
]

#my-block(
    content-align: left,
    title: "Pipeline Production"
)[
  1. Compilation
  2. Tests automatisés
  3. Publication sur le registry
  4. Déploiement manuel après validation
]

==== Versionnage sémantique

L'entreprise applique le standard Semantic Versioning 2.0.0 pour tous ses projets :

#example(title: "Convention de nommage des versions")[
  - Format : `x.y.z` où :
    - `x` : refonte majeure du projet
    - `y` : changement de structure
    - `z` : fonctionnalité mineure

  - Tags pour staging : `release-x.y.z-rc.w` (release candidate)
  - Tags pour production : `release-x.y.z` (version stable)

  Exemple : `release-1.8.3-rc.0` pour staging, `release-1.8.3` pour production
]

==== Architecture orientée services

Affluences suit une architecture microservices avec des principes clairs :

#definition(title: "Principes architecturaux")[
  - Chaque service est *stateless* et *indépendant*
  - Un service est responsable de sa propre base de données
  - Les services ne partagent pas de bases de données
  - Communication entre services via REST ou GraphQL
  - Approche événementielle avec Kafka
]

L'architecture cible sépare trois couches :

1. *Applications* : clients publics (APIs, web apps) ou internes (algorithmes, scrapers)
2. *Services* : interface entre applications et sources de données
3. *Sources de données* : bases de données et caches

==== Standards de qualité

L'équipe applique des standards stricts pour maintenir la qualité du code :

#my-block(
    content-align: left,
    title: "Logging"
)[
  - Format obligatoire : logfmt (structuré)
  - Logs en une seule ligne
  - Timestamps en UTC ISO 8601 avec précision milliseconde
  - Niveaux : debug, info, notice, warning, error, critical
  - Envoi automatique vers Datadog
]

#my-block(
    content-align: left,
    title: "Variables d'environnement"
)[
  - Nommage en UPPER_CASE avec underscores
  - Préfixes pour grouper les variables liées
  - Unités explicites dans les noms (ex: `_SECONDS`, `_MILLISECONDS`)
  - Feature toggles préfixés par `ENABLE_`
]

==== Sécurité Docker

Des guidelines strictes de sécurité sont appliquées pour les conteneurs :

- Utilisation d'images de base minimales (Alpine)
- Multi-stage builds obligatoires
- Utilisateurs non-root pour l'exécution
- Scan régulier des vulnérabilités (Snyk, Hadolint)
- Tags de version fixes (pas de `:latest`)
- Fichiers `.dockerignore` pour exclure les données sensibles

==== Onboarding et documentation

Le processus d'intégration est structuré avec un guide détaillé pour les nouveaux développeurs :

#example(title: "Guide de démarrage rapide")[
  Le Quick Start Guide couvre :
  - Installation et configuration de l'environnement
  - Accès aux différents services (GitLab, Jira, etc.)
  - Configuration SSH et registres
  - Mise en place des tunnels Cloudflare
  - Lancement des projets en local ou via Docker
]

==== Communication et collaboration

La communication au sein de l'équipe s'organise autour de plusieurs canaux :

- *Chat* : canaux thématiques (\#Technical Team, \#Internal Services)
- *Jira* : suivi des tickets et sprints
- *GitLab* : revues de code via merge requests
- *Documentation* : Confluence et KB pour la documentation technique

Cette organisation permet une collaboration efficace tout en maintenant la traçabilité des décisions et des modifications.

== Conclusion partielle

L'environnement de travail chez Affluences se caractérise par une infrastructure technique moderne et des processus bien définis. L'utilisation d'outils standardisés et de méthodologies éprouvées facilite l'intégration des nouveaux développeurs et assure la qualité des livrables. L'approche microservices couplée à une forte culture DevOps permet à l'équipe de maintenir et faire évoluer efficacement une infrastructure complexe au service de nombreux clients.
