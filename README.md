# CNAM Engineering Internship Report

This repository contains my activity report (Rapport d'activités) for my CNAM engineering internship at Affluences, completed during the 2025-2026 academic year.

## About

This is an academic report documenting my year-long work-study experience as a backend developer in the Internal Services team at Affluences, a French company specializing in real-time crowd management and visitor flow optimization.

## Technologies

### Typst

The document is built using [Typst](https://typst.app/), a modern typesetting system written in Rust. Typst offers several advantages over traditional systems:

- **Fast compilation**: Near-instant previews thanks to Rust's performance
- **Modern syntax**: Clean, readable markup language
- **Incremental compilation**: Only recompiles changed parts
- **Package ecosystem**: Extensible through community packages
- **Open source**: Free and actively developed

### Template

The report uses the [`clean-cnam-template`](https://github.com/TomPlanche/clean-cnam-template) package (v1.3.0), which I created specifically for CNAM academic documents. I use this template for both my internship reports and course materials, providing:
- Professional CNAM branding and layout
- Customizable title page with institutional logos
- Proper academic document structure
- French language support

### Custom Outline

The table of contents features a unique tree-based rendering system inspired by the visual aesthetics of Grégoire Gamichon's thesis on [demoscene and warez art](https://www.memo-dg.fr/memoire/demoscene-et-warez-art).

The custom outline (`custom-outline.typ`) generates an ASCII-art tree structure using Unicode box-drawing characters:

```
┌┬┐
│└ Introduction.....................................2
│  └ Affluences.....................................3
└ Work Environment..................................5
   ├ Working conditions and integration.............5
   │  ├ Technical environment and tools.............6
   │  │  ├ Main technical stack.....................6
```

This visual approach transforms the traditional linear table of contents into a hierarchical tree that immediately communicates document structure, combining technical precision with aesthetic appeal.

## Project Structure

```
.
├── main.typ              # Main document entry point
├── custom-outline.typ    # Custom tree-based outline renderer
├── glossary.typ          # Technical terms glossary
├── assets/              # Logos, backgrounds, fonts
│   ├── fonts/          # Custom fonts (gitignored)
│   └── logos/          # Company and institution logos
└── notes/              # Working notes (not compiled)
```

## Document Content

The report covers:

1. **Acknowledgments** - Thanks to mentors and colleagues
2. **Introduction** - Context at Affluences
3. **Work Environment** - Technical stack, tools, and agile methodology
4. **Missions** - Key projects and optimizations
5. **Glossary** - Technical terms used throughout

## Language

All document content is in French. Code comments and technical documentation use English.
