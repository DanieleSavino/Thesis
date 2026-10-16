# Implementation of Bine Tree Algorithms in NCCL for Multi-GPU Systems

Bachelor's thesis in Computer Science (*Laurea in Informatica*, L-31), Sapienza University of Rome,
Faculty of Information Engineering, Informatics and Statistics (I3S).

- **Author:** Daniele Savino
- **Advisor:** Prof. Daniele De Sensi
- **Status:** work in progress

## About

[Bine trees](https://arxiv.org/pdf/2508.17311) are a family of collective-communication
algorithms that improve communication locality, reducing traffic over slower inter-node
links. This thesis studies how to implement them inside
[NCCL](https://github.com/NVIDIA/nccl), the de-facto standard library for collectives on
NVIDIA GPUs, and evaluates the result on multi-GPU systems.

## Related repositories

- [`DanieleSavino/nccl`](https://github.com/DanieleSavino/nccl): fork of NCCL with the
  Bine tree implementation developed for this thesis.
- [`DanieleSavino/unitccl`](https://github.com/DanieleSavino/unitccl): benchmarking library
  used for the experiments; it includes the NCCL fork above as a submodule.

The text is organised by design decision rather than chronology: tree baseline,
butterfly-style algorithms and why they do not map onto NCCL's channel model, evidence
that this is structural, staging-buffer/PatCopy adaptation, and allreduce as
reduce + broadcast, followed by evaluation and discussion.

## Download

The compiled PDF is attached to each [release](../../releases/latest).

## Building locally

Requirements: TeX Live (with the `sapthesis` class), `biber`, `latexmk`.

```sh
latexmk            # output: build/main.pdf
latexmk -pvc       # rebuild on every save
latexmk -C         # clean build/
```

Always build from the repository root: all paths in the `.tex` files (`src/...`,
`assets/...`) are relative to it.

On Arch Linux, biber lives in `/usr/bin/vendor_perl`; add it to `PATH` if needed
(`fish_add_path /usr/bin/vendor_perl` in fish).

## Repository layout

```
src/
  main.tex            entry point: metadata, chapter order
  preamble.tex        packages and macros
  references.bib      bibliography (biblatex + biber)
  frontmatter/        abstract, acknowledgements, acronyms
  sections/           one file per chapter
assets/
  plots/              figures (prefer vector PDF)
  icons/              logos and small graphics
.github/workflows/
  build.yml           CI
.latexmkrc            build configuration
```

The document uses the [`sapthesis`](https://ctan.org/pkg/sapthesis) class; its layout is
left at the defaults on purpose.

## CI and releases

`.github/workflows/build.yml` runs only when a tag `v*` is pushed: it compiles the thesis,
fails on unresolved references or citations, reports remaining `\todo{}` markers, and
publishes a GitHub release with the PDF attached.

```sh
git tag v0.1 && git push origin v0.1
```

## License

The thesis text is licensed under CC BY 4.0 (see `LICENSE`). <!-- confirm before publishing -->
