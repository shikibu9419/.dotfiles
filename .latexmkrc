#!/usr/bin/perl
$latex = 'platex -interaction=nonstopmode -halt-on-error %O %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$bibtex = 'pbibtex';
$pdf_mode = 3; # use dvipdf
$pdf_previewer = 'open -a /Applications/Skim.app';
