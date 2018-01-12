#!/usr/bin/perl
$latex = 'platex -synctex=1 -interaction=nonstopmode -halt-on-error %O %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$bibtex = 'pbibtex';
$pdf_mode = 3; # use dvipdf
$max_repeat = 5;
$pdf_previewer = 'open -ga /Applications/Skim.app';
