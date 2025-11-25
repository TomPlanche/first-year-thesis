# Rapport d'Activités - Ingénieur CNAM

Ce dépôt contient mon rapport d'activités pour mon alternance d'ingénieur CNAM chez Affluences, réalisée durant l'année scolaire 2025-2026.

## À propos

Ce rapport académique documente mon année d'alternance en tant que développeur backend dans l'équipe Internal Services chez Affluences, une entreprise française spécialisée dans la gestion de l'affluence en temps réel et l'optimisation des flux de visiteurs.

## Technologies

### Typst

Le document est construit avec [Typst](https://typst.app/), un système de composition moderne écrit en Rust. Typst offre plusieurs avantages par rapport aux systèmes traditionnels :

- **Compilation rapide** : Aperçus quasi-instantanés grâce aux performances de Rust
- **Syntaxe moderne** : Langage de balisage clair et lisible
- **Compilation incrémentale** : Ne recompile que les parties modifiées
- **Écosystème de packages** : Extensible via des packages communautaires
- **Open source** : Gratuit et activement développé

### Template

Le rapport utilise le package [`clean-cnam-template`](https://github.com/TomPlanche/clean-cnam-template) (v1.3.0), que j'ai développé spécifiquement pour les documents académiques du CNAM. J'utilise ce template à la fois pour mes rapports d'alternance et mes cours, offrant :
- Branding et mise en page professionnels CNAM
- Page de titre personnalisable avec logos institutionnels
- Structure de document académique appropriée
- Support de la langue française

### Sommaire personnalisé

La table des matières présente un système de rendu unique en forme d'arbre, inspiré de l'esthétique visuelle de la thèse de Grégoire Gamichon sur [la demoscene et l'art warez](https://www.memo-dg.fr/memoire/demoscene-et-warez-art).

Le sommaire personnalisé (`custom-outline.typ`) génère une structure arborescente en art ASCII utilisant des caractères Unicode de tracé de boîtes :

```
┌┬┐
│└ Introduction.....................................2
│  └ Affluences.....................................3
└ Environnement de Travail..........................5
   ├ Conditions de travail et intégration...........5
   │  ├ Environnement technique et outils...........6
   │  │  ├ Stack technique principale...............6
```

Cette approche visuelle transforme la table des matières linéaire traditionnelle en un arbre hiérarchique qui communique immédiatement la structure du document, combinant précision technique et attrait esthétique.

## Structure du projet

```
.
├── main.typ              # Point d'entrée principal du document
├── custom-outline.typ    # Rendu personnalisé du sommaire en arbre
├── glossary.typ          # Glossaire des termes techniques
├── assets/              # Logos, arrière-plans, polices
│   ├── fonts/          # Polices personnalisées (gitignorées)
│   └── logos/          # Logos entreprise et institutions
└── notes/              # Notes de travail (non compilées)
```

## Contenu du document

Le rapport couvre :

1. **Remerciements** - Remerciements aux tuteurs et collègues
2. **Introduction** - Contexte chez Affluences
3. **Environnement de Travail** - Stack technique, outils et méthodologie agile
4. **Missions** - Projets clés et optimisations
5. **Glossaire** - Termes techniques utilisés dans le document

## Langue

Tout le contenu du document est en français. Les commentaires de code et la documentation technique utilisent l'anglais.
