# Thesis

Build from the project root: `latexmk` (output: `build/main.pdf`).
All paths in the `.tex` files are relative to the root (`src/...`, `assets/...`).
Requires TeX Live with `sapthesis` and `biber`. CI (`.github/workflows/build.yml`)
builds on every push/PR and uploads the PDF as an artifact; tags `v*` attach it to a release.

Layout:
- `src/main.tex`      entry point, metadata, chapter order
- `src/preamble.tex`  packages and macros
- `src/sections/`     one file per chapter
- `src/frontmatter/`  abstract, acknowledgements, acronyms
- `src/references.bib`
- `assets/plots/`     figures (prefer vector PDF)
- `assets/icons/`     logos and small graphics
