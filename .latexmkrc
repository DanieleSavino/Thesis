# Run from the project root with just `latexmk`; compiled from the root so that
# every path in the .tex files (src/..., assets/...) is relative to the root.
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$bibtex_use = 2;                 # run biber when needed
@default_files = ('src/main.tex');
# The output directory has to be absolute: given 'build', pdflatex writes main.aux
# there but does not search it for the aux/toc/lof/lot/loa files on the next pass,
# so the cross-references never resolve and the last pass exits non-zero.
use Cwd qw(abs_path);
$out_dir = abs_path('.') . '/build';
$aux_dir = $out_dir;

$clean_ext = 'loa';             # list of algorithms: latexmk does not know this one
$pdf_previewer = 'xdg-open %O %S';
