#let my-glossary = (
  // === Development / Developpement ===
  backend: (
    short: "Backend",
    description: "Partie d'une application qui s'execute sur le serveur. Elle gere la logique metier, les bases de donnees et les communications avec d'autres services. Invisible pour l'utilisateur final, c'est le \"moteur\" de l'application.",
    group: "Developpement",
  ),
  frontend: (
    short: "Frontend",
    description: "Partie visible d'une application avec laquelle l'utilisateur interagit directement (boutons, formulaires, affichage). C'est l'interface graphique.",
    group: "Developpement",
  ),
  api: (
    short: "API",
    long: "Application Programming Interface",
    description: "Interface permettant a deux applications de communiquer entre elles. Par exemple, une application mobile utilise une API pour recuperer des donnees depuis un serveur.",
    group: "Developpement",
  ),
  graphql: (
    short: "GraphQL",
    description: "Langage de requete pour les API, permettant au client de demander exactement les donnees dont il a besoin, ni plus ni moins. Alternative moderne aux API REST traditionnelles.",
    group: "Developpement",
  ),
  microservices: (
    short: "Microservices",
    description: "Approche de developpement ou une application est decomposee en petits services independants, chacun responsable d'une fonction specifique. Cela facilite la maintenance et permet de faire evoluer chaque partie separement.",
    group: "Developpement",
  ),
  typescript: (
    short: "TypeScript",
    description: "Langage de programmation base sur JavaScript qui ajoute un systeme de types. Cela permet de detecter des erreurs avant l'execution du programme et d'ameliorer la qualite du code.",
    group: "Developpement",
  ),
  nodejs: (
    short: "Node.js",
    description: "Environnement d'execution permettant d'utiliser JavaScript cote serveur (backend). Tres utilise pour creer des applications web rapides et scalables.",
    group: "Developpement",
  ),
  nestjs: (
    short: "NestJS",
    description: "Framework backend moderne pour Node.js utilisant TypeScript. Il suit les principes d'architecture modulaire et d'injection de dependances, facilitant la creation d'applications serveur robustes et maintenables.",
    group: "Developpement",
  ),
  flutter: (
    short: "Flutter",
    description: "Framework de Google permettant de developper des applications mobiles pour iOS et Android avec un seul code source. Utilise le langage Dart.",
    group: "Developpement",
  ),
  angular: (
    short: "Angular",
    description: "Framework JavaScript/TypeScript developpe par Google pour creer des applications web interactives et structurees.",
    group: "Developpement",
  ),
  ioc: (
    short: "IoC",
    long: "Inversion of Control",
    description: "Principe de conception logicielle ou le controle du flux d'execution est delegue a un framework. Cela rend le code plus modulaire et plus facile a tester.",
    group: "Developpement",
  ),
  di: (
    short: "DI",
    long: "Dependency Injection",
    description: "Technique de programmation ou les dependances d'un composant lui sont fournies de l'exterieur plutot que creees en interne. Facilite les tests et la maintenance.",
    group: "Developpement",
  ),

  // === Infrastructure ===
  cicd: (
    short: "CI/CD",
    long: "Integration Continue / Deploiement Continu",
    description: "Pratique d'automatisation qui permet de tester et deployer automatiquement le code a chaque modification. Cela reduit les erreurs humaines et accelere la mise en production des nouvelles fonctionnalites.",
    group: "Infrastructure",
  ),
  docker: (
    short: "Docker",
    description: "Technologie de conteneurisation qui permet d'empaqueter une application avec toutes ses dependances dans un \"conteneur\" isole. Cela garantit que l'application fonctionnera de la meme maniere sur n'importe quel serveur.",
    group: "Infrastructure",
  ),
  kubernetes: (
    short: "Kubernetes",
    description: "Systeme d'orchestration de conteneurs qui automatise le deploiement, la mise a l'echelle et la gestion d'applications conteneurisees.",
    group: "Infrastructure",
  ),
  cloud: (
    short: "Cloud",
    long: "Cloud Computing",
    description: "Modele de fourniture de ressources informatiques (serveurs, stockage, bases de donnees) via Internet, sans avoir a gerer physiquement les machines.",
    group: "Infrastructure",
  ),
  rabbitmq: (
    short: "RabbitMQ",
    description: "Logiciel de messagerie permettant a differentes applications de communiquer de maniere asynchrone via des files d'attente de messages. Utile pour decoupler les systemes et gerer les pics de charge.",
    group: "Infrastructure",
  ),
  redis: (
    short: "Redis",
    description: "Base de donnees en memoire tres rapide, souvent utilisee comme cache pour stocker temporairement des donnees frequemment consultees et accelerer les reponses.",
    group: "Infrastructure",
  ),
  kafka: (
    short: "Kafka",
    long: "Apache Kafka",
    description: "Plateforme de streaming distribuee qui permet de publier et s'abonner a des flux de donnees en temps reel. Utilisee pour construire des pipelines de donnees en temps reel et des applications de streaming.",
    group: "Infrastructure",
  ),
  airflow: (
    short: "Airflow",
    long: "Apache Airflow",
    description: "Plateforme open-source de gestion de flux de travail (workflow) qui permet de definir, planifier et surveiller des pipelines de donnees complexes. Automatise les taches de traitement de donnees.",
    group: "Infrastructure",
  ),
  argoworkflow: (
    short: "Argo Workflow",
    description: "Outil d'orchestration de workflows natif pour Kubernetes. Permet d'executer des taches complexes et des processus batch dans des conteneurs, facilitant l'automatisation et la gestion des pipelines de traitement.",
    group: "Infrastructure",
  ),

  // === Donnees et IoT ===
  iot: (
    short: "IoT",
    long: "Internet of Things",
    description: "Ensemble d'objets physiques connectes a Internet capables de collecter et transmettre des donnees. Chez Affluences, ce sont les capteurs qui mesurent l'affluence en temps reel.",
    group: "Donnees",
  ),
  rgpd: (
    short: "RGPD",
    long: "Reglement General sur la Protection des Donnees",
    description: "Reglementation europeenne qui encadre le traitement des donnees personnelles. Elle impose des regles strictes sur la collecte, le stockage et l'utilisation des donnees des utilisateurs.",
    group: "Donnees",
  ),
  sql: (
    short: "SQL",
    long: "Structured Query Language",
    description: "Langage standard pour interroger et manipuler des bases de donnees relationnelles. Permet de creer, lire, modifier et supprimer des donnees.",
    group: "Donnees",
  ),
  nosql: (
    short: "NoSQL",
    long: "Not Only SQL",
    description: "Type de base de donnees qui ne suit pas le modele relationnel classique. Adapte pour stocker de grands volumes de donnees non structurees ou semi-structurees.",
    group: "Donnees",
  ),
  json: (
    short: "JSON",
    long: "JavaScript Object Notation",
    description: "Format de donnees textuel leger et lisible, tres utilise pour echanger des informations entre applications, notamment via les API.",
    group: "Donnees",
  ),

  // === Methodologie ===
  agile: (
    short: "Agile",
    description: "Approche de gestion de projet qui privilegie les cycles courts, l'adaptation au changement et la collaboration. Le travail est divise en petites iterations permettant de livrer regulierement de la valeur.",
    group: "Methodologie",
  ),
  sprint: (
    short: "Sprint",
    description: "Periode de travail courte et fixe (generalement 1 a 4 semaines) pendant laquelle une equipe s'engage a realiser un ensemble de taches definies. A la fin du sprint, un produit fonctionnel est livre.",
    group: "Methodologie",
  ),
  scrum: (
    short: "Scrum",
    description: "Framework agile populaire organisant le travail en sprints avec des roles definis (Product Owner, Scrum Master, Equipe) et des ceremonies regulieres (daily meeting, retrospective).",
    group: "Methodologie",
  ),
  semver: (
    short: "SemVer",
    long: "Semantic Versioning",
    description: "Convention de numerotation des versions logicielles au format MAJEUR.MINEUR.CORRECTIF. Permet de comprendre rapidement l'impact d'une mise a jour.",
    group: "Methodologie",
  ),
  monorepo: (
    short: "Monorepo",
    long: "Monolithic Repository",
    description: "Architecture de gestion de code ou plusieurs projets ou services sont stockes dans un seul et meme depot. Facilite le partage de code, la gestion des dependances communes et la coordination des modifications entre projets.",
    group: "Methodologie",
  ),

  // === Securite et Qualite ===
  iso27001: (
    short: "ISO 27001",
    long: "ISO/IEC 27001",
    description: "Norme internationale de reference pour la gestion de la securite de l'information. La certification atteste qu'une organisation a mis en place des processus robustes pour proteger ses donnees.",
    group: "Securite",
  ),
  ssl: (
    short: "SSL/TLS",
    long: "Secure Sockets Layer / Transport Layer Security",
    description: "Protocoles de securite qui chiffrent les communications sur Internet. C'est ce qui permet d'avoir des connexions securisees (le cadenas dans la barre d'adresse du navigateur).",
    group: "Securite",
  ),
  sentry: (
    short: "Sentry",
    description: "Outil de monitoring qui detecte et signale automatiquement les erreurs dans les applications en production, permettant aux developpeurs de les corriger rapidement.",
    group: "Securite",
  ),
  apm: (
    short: "APM",
    long: "Application Performance Monitoring",
    description: "Outils de surveillance des performances des applications qui permettent d'identifier les lenteurs, les goulots d'etranglement et d'optimiser les temps de reponse.",
    group: "Securite",
  ),
  datadog: (
    short: "Datadog",
    description: "Plateforme de monitoring et d'observabilite cloud. Permet de surveiller les performances des applications, analyser les logs, detecter les anomalies et visualiser l'etat de l'infrastructure en temps reel.",
    group: "Securite",
  ),

  // === Termes metier ===
  scaleup: (
    short: "Scale-up",
    description: "Entreprise en forte croissance qui a depasse le stade de startup. Elle a valide son modele economique et cherche a se developper rapidement tout en structurant son organisation.",
    group: "Entreprise",
  ),
)
