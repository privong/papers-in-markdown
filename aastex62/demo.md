---
aastexopts: [modern]
preambleinput: ["macros.tex"]
bibstyle: aasjournal
received: "January 1, 2018"
#revised: "January 7, 2018"
#accepted: "\\today"
#submitjournal: ApJ
title: "Using Markdown and Pandoc to Write Articles in AASTeX"
shorttitle: Sample article
shortauthors: Privon and Carberry
author:
- name: George C. Privon
  ORCID: 0000-0003-3474-1125
  affiliation: ["Department of Astronomy, University of Florida, 211 Bryant Space Sciences Center, Gainesville, 32611 FL, USA"]
  nocollaboration: 1
- name: Josiah Carberry
  ORCID: 0000-0002-1825-0097
  affiliation: ["Wesleyan University, Middletown, CT", "Brown University: Providence, RI"]
  collaboration: "(ORCID Demonstration)"
keywords: [miscellaneous]
software: ["[`pandoc`](http://pandoc.org)"]
facility: ["VLT"]
abstract: |
  Markdown provides a straightforward way to create articles and documentation in a form where the underlying text is easily readable, while also facilitating the generation of various other formats. This includes \TeX\, HTML, docx, and PDF (via \TeX) files. This article and the associated code describe a template which can be used to write articles in Markdown and use the `pandoc` software to convert the markdown text into an \aastex-compatible tex file for submission to the AAS Journals. The advantage of this approach is ease of readability for the source files and flexibility in output formats. We note that this approach can be applied to \TeX\ submissions for other journals and only requires the creation of an appropriate \TeX\ template file and modification of the YAML header of this demonstration document.
---

# Introduction {#sec:intro}

## Markdown {#sec:markdown}

The Markdown specification was released by John Gruber in 2004^[<https://daringfireball.net/projects/markdown/>].
Markdown was originally intended to specify a plain text format which could be converted to `html` but in which the source could easily be read.
Since its release Markdown (and its various flavors) have been extended and become widely used, and additional output formats have become supported ([@sec:pandoc]).

## Pandoc {#sec:pandoc}

`pandoc` is "a universal document converter"^[<https://pandoc.org>], originally written by John MacFarlane^[<http://johnmacfarlane.net/>].
At present it supports 25 input formats and 47 output formats (including variations of several standards such as markdown).
Pandoc is written in the Haskell programming language and supports extensions written as filters.
This template

Note that the author can write \TeX\ into the markdown file and `pandoc` will happily pass it through to the finished product.
However, this may compromise alternate (non-\TeX) output formats.
For example, the \aastex `deluxetable` environment can be used, but will not properly render in non-\TeX\ formats.
Pandoc filers^[<https://pandoc.org/filters.html>] may be crafted to convert simple `pandoc` tables into `deluxetable`s on the fly, if desired.

## Paper Organization

We broadly divide this article into demonstrations of how to prepare a manuscript in Markdown such that it generates nearly-submittable \TeX\ ([@sec:prep]).
This includes how to specify the article style via the YAML header of the markdown file ([@sec:style]).
We then demonstrate how to include images ([@sec:images]), tables ([@sec:tables]), and citations ([@sec:citations]).
We the conclude by discussing some practical considerations for this paper writing process ([@sec:notes]).

We remind the reader that this approach can be extended to the templates of other journals by modifying the YAML header in the markdown file and the \TeX\ template file.

The Markdown file, `pandoc` invocation, and associated filters used to create the \TeX\ for this document are available at: <https://github.com/privong/papers-in-markdown>.

# Manuscript Preparation in Markdown {#sec:prep}

## Manuscript styles {#sec:style}

## Images {#sec:images}

## Tables {#sec:tables}

This tool will pass \latex tables through `pandoc` to the chosen \latex parser.
Thus, any tables which are part of \aastex will work for producing pdfs.
However, those will not propagate through to other output formats with which `pandoc` is compatible.

This is an example of a "simple table"^[<https://pandoc.org/MANUAL.html#tables>]:

Year  Subscription    Publication
----  --------------  -----------
1991  600             100
1992  650             105
1993  550             103
1994  450             110
1995  410             112
1996  400             114
1997  525             115
1998  590             116
1999  575             115
2000  450             103
2001  490              90
2002  500              88
2003  450              90
2004  460              88
2005  440              79
2006  350              77
2007  325              70
2008  320              65
2009  190              68
2010  280              70
2011  275              68
2012  150              56
2013  140              55

Table: ApJ costs from 1991 to 2013.

## Citations {#sec:citations}

Citations can be incorporated using the pandoc-citeproc filter^[<https://pandoc.org/MANUAL.html#citations>].
These citations take the form of: `[@Astropy2018]` to correspond to [@Astropy2018].

# Notes on Preparation for Submission {#sec:notes}

## Limitations on Internal References

Naively `pandoc` does not presently support internal reference to figures or equations and does not support numbered section references.
However the `pandoc-crossref`^[<https://github.com/lierdakil/pandoc-crossref>] filter adds support for this (and has been used in the preparation of this document).
Note that `pandoc-crossref` uses the same syntax as `pandoc-citeproc`, the former filter must be invoked before the latter.
For example the \TeX\ for this document was generated with:

    pandoc demo.md -s --template aastex62_template.tex -o demo.tex \
                   -F pandoc-crossref -F pandoc-citeproc

## Creating New Filters

`pandoc` supports user-written filters.
We have already seen two filters, `pandoc-citeproc` and `pandoc-crossref`.
These filters enable customizable processing of documents during conversion and can be written in Haskell, lua, or python^[Using either the `panflute` or `pandocfilters` modules.].

With output formats besides \aastex\ in mind, the acknowledgements portion of the document has been delineated in the markdown file as a top-level section.
However, is desirable to automatically convert this to a `\acknowledgements` macros when creating a \TeX\ file.
As a filter demonstration, the following lua code performs this translation:



If can be invoked by adding `--lua-filter=filters/acknowledgments.lua` to the `pandoc` invocation.

# Acknowledgments

G.C.P acknowledges support from the University of Florida.
