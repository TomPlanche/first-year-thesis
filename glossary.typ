#let my-glossary = (
  // === Development / Développement ===
  backend: (
    short: "Backend",
    description: "Partie d'une application qui s'exécute sur le serveur. Elle gère la logique métier, les bases de données et les communications avec d'autres services. Invisible pour l'utilisateur final, c'est le \"moteur\" de l'application.",
    group: "Développement",
  ),
  frontend: (
    short: "Frontend",
    description: "Partie visible d'une application avec laquelle l'utilisateur interagit directement (boutons, formulaires, affichage). C'est l'interface graphique.",
    group: "Développement",
  ),
  api: (
    short: "API",
    long: "Application Programming Interface",
    description: "Interface permettant à deux applications de communiquer entre elles. Par exemple, une application mobile utilise une API pour récupérer des données depuis un serveur.",
    group: "Développement",
  ),
  graphql: (
    short: "GraphQL",
    description: "Langage de requête pour les API, permettant au client de demander exactement les données dont il a besoin, ni plus ni moins. Alternative moderne aux API REST traditionnelles.",
    group: "Développement",
  ),
  microservice: (
    short: "Microservice",
    description: "Approche de développement où une application est décomposée en petits services indépendants, chacun responsable d'une fonction spécifique. Cela facilite la maintenance et permet de faire évoluer chaque partie séparément.",
    group: "Développement",
  ),
  typescript: (
    short: "TypeScript",
    description: "Langage de programmation basé sur JavaScript qui ajoute un système de types. Cela permet de détecter des erreurs avant l'exécution du programme et d'améliorer la qualité du code.",
    group: "Développement",
  ),
  nodejs: (
    short: "Node.js",
    description: "Environnement d'exécution permettant d'utiliser JavaScript côté serveur (backend). Très utilisé pour créer des applications web rapides et scalables.",
    group: "Développement",
  ),
  nestjs: (
    short: "NestJS",
    description: "Framework backend moderne pour Node.js utilisant TypeScript. Il suit les principes d'architecture modulaire et d'injection de dépendances, facilitant la création d'applications serveur robustes et maintenables.",
    group: "Développement",
  ),
  flutter: (
    short: "Flutter",
    description: "Framework de Google permettant de développer des applications mobiles pour iOS et Android avec un seul code source. Utilise le langage Dart.",
    group: "Développement",
  ),
  angular: (
    short: "Angular",
    description: "Framework JavaScript/TypeScript développé par Google pour créer des applications web interactives et structurées.",
    group: "Développement",
  ),
  ioc: (
    short: "IoC",
    long: "Inversion of Control",
    description: "Principe de conception logicielle où le contrôle du flux d'exécution est délégué à un framework. Cela rend le code plus modulaire et plus facile à tester.",
    group: "Développement",
  ),
  di: (
    short: "DI",
    long: "Dependency Injection",
    description: "Technique de programmation où les dépendances d'un composant lui sont fournies de l'extérieur plutôt que créées en interne. Facilite les tests et la maintenance.",
    group: "Développement",
  ),
  orm: (
    short: "ORM",
    long: "Object-Relational Mapping",
    description: "Technique qui fait le lien entre les objets d'un langage de programmation et les tables d'une base de données relationnelle. Permet de manipuler les données sous forme d'objets sans écrire de SQL manuellement.",
    group: "Développement",
  ),
  dto: (
    short: "DTO",
    long: "Data Transfer Object",
    description: "Objet dont le seul rôle est de transporter des données entre les couches d'une application ou entre services. Il ne contient pas de logique métier et définit le contrat de l'interface (requête ou réponse d'API).",
    group: "Développement",
  ),

  // === Infrastructure ===
  cicd: (
    short: "CI/CD",
    long: "Intégration Continue / Déploiement Continu",
    description: "Pratique d'automatisation qui permet de tester et déployer automatiquement le code à chaque modification. Cela réduit les erreurs humaines et accélère la mise en production des nouvelles fonctionnalités.",
    group: "Infrastructure",
  ),
  docker: (
    short: "Docker",
    description: "Technologie de conteneurisation qui permet d'empaqueter une application avec toutes ses dépendances dans un \"conteneur\" isolé. Cela garantit que l'application fonctionnera de la même manière sur n'importe quel serveur.",
    group: "Infrastructure",
  ),
  kubernetes: (
    short: "Kubernetes",
    description: "Système d'orchestration de conteneurs qui automatise le déploiement, la mise à l'échelle et la gestion d'applications conteneurisées.",
    group: "Infrastructure",
  ),
  cloud: (
    short: "Cloud",
    long: "Cloud Computing",
    description: "Modèle de fourniture de ressources informatiques (serveurs, stockage, bases de données) via Internet, sans avoir à gérer physiquement les machines.",
    group: "Infrastructure",
  ),
  redis: (
    short: "Redis",
    description: "Base de données en mémoire très rapide, souvent utilisée comme cache pour stocker temporairement des données fréquemment consultées et accélérer les réponses.",
    group: "Infrastructure",
  ),
  kafka: (
    short: "Kafka",
    long: "Apache Kafka",
    description: "Plateforme de streaming distribuée qui permet de publier et s'abonner à des flux de données en temps réel. Utilisée pour construire des pipelines de données en temps réel et des applications de streaming.",
    group: "Infrastructure",
  ),
  airflow: (
    short: "Airflow",
    long: "Apache Airflow",
    description: "Plateforme open-source de gestion de flux de travail (workflow) qui permet de définir, planifier et surveiller des pipelines de données complexes. Automatise les tâches de traitement de données.",
    group: "Infrastructure",
  ),
  argoworkflow: (
    short: "Argo Workflow",
    description: "Outil d'orchestration de workflows natif pour Kubernetes. Permet d'exécuter des tâches complexes et des processus batch dans des conteneurs, facilitant l'automatisation et la gestion des pipelines de traitement.",
    group: "Infrastructure",
  ),

  // === Données et IoT ===
  iot: (
    short: "IoT",
    long: "Internet of Things",
    description: "Ensemble d'objets physiques connectés à Internet capables de collecter et transmettre des données. Chez Affluences, ce sont les capteurs qui mesurent l'affluence en temps réel.",
    group: "Données",
  ),
  rgpd: (
    short: "RGPD",
    long: "Règlement Général sur la Protection des Données",
    description: "Réglementation européenne qui encadre le traitement des données personnelles. Elle impose des règles strictes sur la collecte, le stockage et l'utilisation des données des utilisateurs.",
    group: "Données",
  ),
  sql: (
    short: "SQL",
    long: "Structured Query Language",
    description: "Langage standard pour interroger et manipuler des bases de données relationnelles. Permet de créer, lire, modifier et supprimer des données.",
    group: "Données",
  ),
  nosql: (
    short: "NoSQL",
    long: "Not Only SQL",
    description: "Type de base de données qui ne suit pas le modèle relationnel classique. Adapté pour stocker de grands volumes de données non structurées ou semi-structurées.",
    group: "Données",
  ),
  json: (
    short: "JSON",
    long: "JavaScript Object Notation",
    description: "Format de données textuel léger et lisible, très utilisé pour échanger des informations entre applications, notamment via les API.",
    group: "Données",
  ),
  btree: (
    short: "B-Tree",
    long: "Arbre B",
    description: "Structure de données arborescente utilisée par les moteurs de bases de données pour organiser les index. Permet de localiser une entrée en O(log n) opérations plutôt qu'en O(n), quelle que soit la taille de la table.",
    group: "Données",
  ),
  fulltablescan: (
    short: "Full table scan",
    description: "Opération de base de données où le moteur lit séquentiellement toutes les lignes d'une table pour trouver celles qui correspondent à un filtre. Très coûteuse sur les grandes tables car le coût croît linéairement avec le volume de données.",
    group: "Données",
  ),
  indexseek: (
    short: "Index seek",
    description: "Opération de base de données où le moteur utilise un index (B-Tree) pour accéder directement aux lignes pertinentes, sans lire l'ensemble de la table. Le coût est proportionnel au nombre de résultats, pas à la taille totale de la table.",
    group: "Données",
  ),
  icp: (
    short: "ICP",
    long: "Index Condition Pushdown",
    description: "Optimisation MySQL qui évalue certaines conditions WHERE directement au niveau du parcours d'index, avant de récupérer la ligne complète depuis le disque. Réduit le nombre d'accès disque, mais ne remplace pas un index sur la colonne filtrée.",
    group: "Données",
  ),

  // === Méthodologie ===
  agile: (
    short: "Agile",
    description: "Approche de gestion de projet qui privilégie les cycles courts, l'adaptation au changement et la collaboration. Le travail est divisé en petites itérations permettant de livrer régulièrement de la valeur.",
    group: "Méthodologie",
  ),
  sprint: (
    short: "Sprint",
    description: "Période de travail courte et fixe (généralement 1 à 4 semaines) pendant laquelle une équipe s'engage à réaliser un ensemble de tâches définies. À la fin du sprint, un produit fonctionnel est livré.",
    group: "Méthodologie",
  ),
  scrum: (
    short: "Scrum",
    description: "Framework agile populaire organisant le travail en sprints avec des rôles définis (Product Owner, Scrum Master, Équipe) et des cérémonies régulières (daily meeting, rétrospective).",
    group: "Méthodologie",
  ),
  semver: (
    short: "SemVer",
    long: "Semantic Versioning",
    description: "Convention de numérotation des versions logicielles au format MAJEUR.MINEUR.CORRECTIF. Permet de comprendre rapidement l'impact d'une mise à jour.",
    group: "Méthodologie",
  ),
  monorepo: (
    short: "Monorepo",
    long: "Monolithic Repository",
    description: "Architecture de gestion de code où plusieurs projets ou services sont stockés dans un seul et même dépôt. Facilite le partage de code, la gestion des dépendances communes et la coordination des modifications entre projets.",
    group: "Méthodologie",
  ),

  // === Sécurité et Qualité ===
  iso27001: (
    short: "ISO 27001",
    long: "ISO/IEC 27001",
    description: "Norme internationale de référence pour la gestion de la sécurité de l'information. La certification atteste qu'une organisation a mis en place des processus robustes pour protéger ses données.",
    group: "Sécurité",
  ),
  ssl: (
    short: "SSL/TLS",
    long: "Secure Sockets Layer / Transport Layer Security",
    description: "Protocoles de sécurité qui chiffrent les communications sur Internet. C'est ce qui permet d'avoir des connexions sécurisées (le cadenas dans la barre d'adresse du navigateur).",
    group: "Sécurité",
  ),
  sentry: (
    short: "Sentry",
    description: "Outil de monitoring qui détecte et signale automatiquement les erreurs dans les applications en production, permettant aux développeurs de les corriger rapidement.",
    group: "Sécurité",
  ),
  apm: (
    short: "APM",
    long: "Application Performance Monitoring",
    description: "Outils de surveillance des performances des applications qui permettent d'identifier les lenteurs, les goulots d'étranglement et d'optimiser les temps de réponse.",
    group: "Sécurité",
  ),
  datadog: (
    short: "Datadog",
    description: "Plateforme de monitoring et d'observabilité cloud. Permet de surveiller les performances des applications, analyser les logs, détecter les anomalies et visualiser l'état de l'infrastructure en temps réel.",
    group: "Sécurité",
  ),

  // === Termes métier ===
  scaleup: (
    short: "Scale-up",
    description: "Entreprise en forte croissance qui a dépassé le stade de startup. Elle a validé son modèle économique et cherche à se développer rapidement tout en structurant son organisation.",
    group: "Entreprise",
  ),
)
