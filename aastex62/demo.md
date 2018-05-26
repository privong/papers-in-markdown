---
aastexopts: [singlecolumn]
preambleinput: ["macros.tex"]
texpackages:
- name: xspace
#  opts: 
- name: amsmath
#  opts: 
bibstyle: aasjournal
bibliography: demo.bib
received: "January 1, 2018"
#revised: "January 7, 2018"
#accepted: "\\today"
#submitjournal: ApJ
title: "Preparation of Articles using Markdown and Pandoc"
shorttitle: "Articles in Markdown and Pandoc"
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
facility: []
abstract: |
  Markdown provides a straightforward way to create articles and documentation in a form where the underlying text is easily readable, while also facilitating the generation of various other formats. This includes \TeX\, HTML, docx, and PDF (via \TeX) files. This article and the associated code describe a template which can be used to write articles in Markdown and use the `pandoc` software to convert the markdown text into an \aastex-compatible tex file for submission to the AAS Journals. The advantage of this approach is ease of readability for the source files and flexibility in output formats. We note that this approach can be applied to \TeX\ submissions for other journals and only requires the creation of an appropriate \TeX\ template file and modification of the YAML header of this demonstration document.
---

# Introduction {#sec:intro}

Manuscript preparation is an integral part of disseminating research.
Currently papers are predominantly prepared in \latex\ or sometimes WYSIWYG editors such as Microsoft Word or Apple Pages.
While powerful in their own ways, each of these have their own drawbacks.
In particular \latex\ often suffers from a steep learning curve and crypic error messages while WYSIWYG editors have historically had sub-par mathematics rendering ability and suffered from difficulties with robust internal referencing.

Here we describe and demonstrate a method of preparing manuscripts by writing them in Markdown ([@sec:markdown]) and using `pandoc` ([@sec:pandoc]) to convert the Markdown file into a format suitable for submission to journals (e.g., \TeX, Microsoft Word's `.docx`).
This approach simplifies the writing process while retaining the power of \latex.

## Markdown {#sec:markdown}

The Markdown specification was released by John Gruber in 2004^[<https://daringfireball.net/projects/markdown/>].
Markdown was originally intended to specify a plain text format which could be converted to HTML but in which the source could easily be read:

> A Markdown-formatted document should be publishable as-is, as plain text, without looking like it’s been marked up with tags or formatting instructions. – John Gruber

Since its release Markdown (and its various flavors) have been extended and become widely used, and additional output formats have become supported ([Section @sec:pandoc]).
Describing Markdown is beyond this scope of this document, but we refer the reader to the `pandoc` markdown description^[<https://pandoc.org/MANUAL.html#pandocs-markdown>] and Gruber's original specification.

## Pandoc {#sec:pandoc}

`pandoc` is "a universal document converter"^[<https://pandoc.org>], originally written by John MacFarlane^[<http://johnmacfarlane.net/>].
At present it supports 25 input formats and 47 output formats (including variations of several standards such as markdown) and supports user-defined output formats.
`pandoc` is written in the Haskell programming language and supports extensions written as filters.
This template

Note that the author can write \TeX\ into the markdown file and `pandoc` will happily pass it through to the finished product.
However, this may compromise alternate (non-\TeX) output formats.
For example, the \aastex `deluxetable` environment can be used, but will not properly render in non-\TeX\ formats.
Pandoc filers^[<https://pandoc.org/filters.html>] may be crafted to convert simple `pandoc` tables into `deluxetable`s on the fly, if desired.

## Paper Organization

We broadly divide this article into demonstrations of how to prepare a manuscript in Markdown such that it generates nearly-submittable \TeX\ ([Section @sec:prep]).
This includes how to specify the article style via the YAML header of the markdown file ([Section @sec:style]).
We then demonstrate how to include images ([Section @sec:images]), tables ([Section @sec:tables]), and citations ([Section @sec:citations]).
We the conclude by discussing some practical considerations for this paper writing process ([Section @sec:notes]).

Throughout we assume the reader is familar with Markdown and do not discuss mMarkdown's text formatting.
Instead we discuss the general behavior of the template file and actions which are necessary for generating \aastex-compatible output.

The Markdown file, `pandoc` invocation, and associated filters used to create the \TeX\ for this document are available at: <https://github.com/privong/papers-in-markdown>.
We remind the reader that this approach can be extended to the templates of other journals by modifying the YAML header in the markdown file and the \TeX\ template file.


# Manuscript Preparation in Markdown {#sec:prep}

## Manuscript Metadata and Styles {#sec:style}

The markdown file can be prefixed with a header in the YAML ("YAML Ain't Markup Language") format.
Article data such as the title, relevant dates, author list, keywords, etc. is specified here.
This header information is extracted via a \TeX\ template file and passed through to the desired output file.
The `pandoc` template also derives the \aastex\ style information from this YAML header, via the `aastexopts` entry.
The YAML header given below is that used for the preparation of this document:

```{#yamlheader .yaml .numberLines}
---
aastexopts: [singlecolumn]
preambleinput: ["macros.tex"]
texpackages:
- name: xspace
#  opts: 
- name: amsmath
#  opts: 
bibstyle: aasjournal
bibliography: demo.bib
received: "January 1, 2018"
#revised: "January 7, 2018"
#accepted: "\\today"
#submitjournal: ApJ
title: "Preparation of Articles using Markdown and Pandoc"
shorttitle: "Articles in Markdown and Pandoc"
shortauthors: Privon and Carberry
author:
- name: George C. Privon
  ORCID: 0000-0003-3474-1125
  affiliation: ["Department of Astronomy, University of Florida, 211 Bryant Space Sciences Center, \
Gainesville, 32611 FL, USA"]
  nocollaboration: 1
- name: Josiah Carberry
  ORCID: 0000-0002-1825-0097
  affiliation: ["Wesleyan University, Middletown, CT", "Brown University: Providence, RI"]
  collaboration: "(ORCID Demonstration)"
keywords: [miscellaneous]
software: ["[`pandoc`](http://pandoc.org)"]
facility: []
abstract: |
  A short abstract.
---
```

Unwanted entries can be commented out with a `#` or safely deleted (here they have been commented so they appear for reference purposes).
If a different style (e.g., `twocolumn`) is desired, this can be changed in `aastexopts`.
YAML header entries and corresponding \TeX\ template code have been created to correspond to most (if not all) of the \aastex\ metadata options.

## Images {#sec:images}

## Tables {#sec:tables}

This tool will pass \latex\ tables through `pandoc` to the chosen \latex\ parser.
Thus, any tables which are part of \aastex will work for producing pdfs.
However, those will not propagate through to other output formats with which `pandoc` is compatible.

[Table @tbl:storms] is an example of a "simple table"^[<https://pandoc.org/MANUAL.html#tables>]:

Date        Day              Number of storms
----------  --------------  -----------------
2018-05-21  Monday                        ...
2018-05-22  Tuesday                         2
2018-05-23  Wednesday                       1
2018-05-24  Thursday                        3
2018-05-25  Friday                          0
2018-05-26  Saturday                        0
2018-05-27  Sunday                          0

Table: Number of imaginary thunderstorms in Gainesville, FL during the 21st week of 2018. {#tbl:storms}

## Citations {#sec:citations}

Citations can be incorporated using the pandoc-citeproc filter^[<https://pandoc.org/MANUAL.html#citations>].
These citations take the form of: `[@Astropy2018]` to correspond to [@Astropy2018].
`pandoc-citeproc` uses the Citation Style Language^[<https://citationstyles.org/>] to format citations.

## Equations {#sec:equations}

Equations can be specified and labeled in the text. `$$e^{i\pi} + 1 = 0$$ {#eq:euler}` results in this output:

$$e^{i\pi} + 1 = 0$$ {#eq:euler}

And [equation @eq:euler] can subsequently be referenced.
This method of specifying math and equations can be coupled with `pandoc`'s support for a variety of methods to render math in HTML^[<https://pandoc.org/MANUAL.html#math-rendering-in-html>].


# Notes on Preparation for Submission {#sec:notes}

## Limitations on Internal References

Naively `pandoc` does not presently support internal reference to figures or equations and does not support numbered section references.
However the `pandoc-crossref`^[<https://github.com/lierdakil/pandoc-crossref>] filter adds support for this (and has been used in the preparation of this document).
Note that `pandoc-crossref` uses the same syntax as `pandoc-citeproc`, the former filter must be invoked before the latter.
For example the \TeX\ for this document was generated with:

    pandoc demo.md -s --template aastex62_template.tex -o demo.tex \
                   -F pandoc-crossref -F pandoc-citeproc

## Document Filters

`pandoc` supports user-written filters.
We have already seen two filters, `pandoc-citeproc` and `pandoc-crossref`.
These filters enable customized processing of documents during conversion.
Commonly used languages for this include Haskell, lua, and python^[Using either the `panflute` or `pandocfilters` modules.].
Note that a lua parser is included with `pandoc` versions 2.0 and newer, and the use of lua filters is faster than other options.

With output formats besides \aastex\ in mind, the acknowledgments portion of the document has been delineated in the markdown file as a macros: `{{acknowledgments}}`.
However, is desirable to automatically convert this to an `\acknowledgments` macro when creating a \TeX\ file.
As a filter demonstration, the following lua code performs this translation:

```{#ackfilter .lua .numberLines}
return {
  {
    Str = function (elem)
      if elem.text == "{{acknowledgments}}" then
        if string.find(FORMAT, "latex") then
          return pandoc.RawInline("tex", "\\acknowledgements")
        else
          return elem
        end
      end
    end,
  }
}
```

This filter is included as `aastex62/filters/acknowledgments.lua` in the template distribution.
It can be used by with the `--lua-filter=` command-line argument.
It can be extended easily to other formats, including say HTML.

Generally, creation of filters would be more broadly useful in automating the conversion of markdown files into journal-compatible \TeX.
A opportunity for this is to write a filter that takes the markdown "simple table" format and converts it into an \aastex\ `deluxetable`.

# Summary

We have provided a brief demonstration for a method of writing research articles in Markdown and converting them to an \aastex-compatible format for submission to AAS Journals.
This method is easily extended to other research journals.
The advantage of this approach is improved ease of reading the source material and added flexibility for output formats.
The template and demonstration text are made publicly available for use and enhancement by the community: <https://github.com/privong/papers-in-markdown>.

{{acknowledgments}}

G.C.P acknowledges support from the University of Florida.
