# Run from the project root with just `latexmk`; compiled from the root so that
# every path in the .tex files (src/..., assets/...) is relative to the root.
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$bibtex_use = 2;                 # run biber when needed
@default_files = ('src/main.tex');
$out_dir = 'build';
$aux_dir = 'build';
$pdf_previewer = 'xdg-open %O %S';
