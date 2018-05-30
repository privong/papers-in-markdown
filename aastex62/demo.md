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
received: "\\today"
#revised: "January 7, 2018"
#accepted: "\\today"
#submitjournal: ApJ
title: "Preparation of Articles using Markdown and Pandoc: General Description and Templates"
shorttitle: "Articles in Markdown and Pandoc"
shortauthors: Privon
author:
- name: George C. Privon
  ORCID: 0000-0003-3474-1125
  affiliation: ["Department of Astronomy, University of Florida, 211 Bryant Space Sciences Center, Gainesville, 32611 FL, USA"]
#  nocollaboration: 1
#- name: Josiah Carberry
#  ORCID: 0000-0002-1825-0097
#  affiliation: ["Department of Psychoceramics, Wesleyan University, Middletown, CT", "Department of Psychoceramics, Brown University: Providence, RI"]
#  collaboration: "(ORCID Demonstration)"
keywords: [miscellaneous]
software: ["[`pandoc`](http://pandoc.org)", "[`pandoc-citeproc`](https://github.com/jgm/pandoc-citeproc)", "[`pandoc-crossref`](https://github.com/lierdakil/pandoc-crossref)"]
facility: []
abstract: |
  Markdown is a markup format that can be used to create articles with readable source while making it easy to translate to other formats (e.g., \TeX\, HTML, docx, and PDF [via \TeX]).
  In this article I announce and briefly describes templates and code which use the `pandoc` software to convert Markdown into journal-compatible \TeX.
  The advantage of this approach is ease of readability of the source files and flexibility in output formats (e.g., for later output to HTML).
  This article describes and demonstrates this technique for \aastex\ output, however the source repository also includes barebones examples for MNRAS and A\&A.
  I am releasing the code and templates under free software / open culture licenses.
  Applying this to additional journals or output formats requires the creation of new template files and/or modifications of the YAML header for the Markdown source.
---

# Introduction {#sec:intro}

Manuscript preparation is an integral part of disseminating research.
Currently papers are predominantly prepared in \LaTeX\ or WYSIWYG^["What you see is what you get"] editors such as Microsoft Word or Apple Pages.
While powerful in their own ways, each of these have their own drawbacks.
\LaTeX\ often suffers from a steep learning curve and cryptic error messages.
On the other hand, WYSIWYG editors have historically had sub-par mathematics rendering ability and suffered from difficulties with robust internal referencing.
A secondary consideration is that output to other formats (e.g., HTML, EPUB) can be tedious and/or require a significant investment in tooling.
This latter effect potentially harms dissemination of scientific results.

Here I describe and demonstrate a method of preparing manuscripts by writing them in Markdown ([Section @sec:markdown]) and using `pandoc` ([Section @sec:pandoc]) to convert the Markdown file into a format suitable for submission to journals (e.g., \TeX\ or `.docx`).
This approach simplifies the writing process while retaining the power of \LaTeX's formulae and making internal references easy.

## Markdown {#sec:markdown}

Markdown is a markup format that was originally intended to specify a plain text format which could be converted to HTML, with the motivation that:

> A Markdown-formatted document should be publishable as-is, as plain text, without looking like it’s been marked up with tags or formatting instructions. – John Gruber

The Markdown specification was released by John Gruber in 2004^[<https://daringfireball.net/projects/markdown/>] and since its release, Markdown (and variants) has become widely used.
It aspires to "get out of the way and let people write" by utilizing minimally intrusive text formatting notation.
While describing Markdown is beyond this scope of this document [Table @tbl:mu_emphasis] provides a demonstration of how one might emphasize text in a few different markup formats.

Markup      Notation
----------- -------------------------
\LaTeX      `\emph{emphasize this}`
HTML        `<em>emphasize this</em>`
Markdown    `_emphasize this_`

Table: Emphasizing text in several markup specifications. {#tbl:mu_emphasis}

In comparison to \TeX\ and HTML, Markdown's emphasis method is less visually intrusive, making it easier to read the source.
For the remainder of the document I assume the reader is familiar with syntax of Markdown.
This set of templates specifically utilizes the `pandoc` Markdown flavor^[<https://pandoc.org/MANUAL.html#pandocs-markdown>] which has some differences and extensions compared to Gruber's original specification.

## Pandoc {#sec:pandoc}

`pandoc`^[<https://pandoc.org>] is "a universal document converter", originally written by John MacFarlane.
It currently supports 25 input formats and 47 output formats (including variations of standards).
Additional formats can be supported by providing user-defined writers, written in the lua language.
`pandoc` is written in the Haskell programming language and supports extensions written as filters.
During the document conversion `pandoc` can use additional metadata specific in a YAML ("YAML Ain't Markup Language") header.
This header can either be prepended to the Markdown text or incorporated from a separate file.

In order to convert Markdown source into a \TeX\ file which is compatible with journal submission requirements I have created a set of templates which instruct `pandoc` in how to generate the output.
Note that the author can write \TeX\ directly into the Markdown file and `pandoc` will happily pass it through to the finished product.
However, this may compromise alternate (non-\TeX) output formats.
For example, the \aastex\ `deluxetable` environment can be used, but it will not be rendered as a table in non-\TeX\ formats and will instead be displayed as the raw \TeX\ source (or worse).
Pandoc filters^[<https://pandoc.org/filters.html>] can be crafted to convert simple `pandoc` tables into `deluxetable`s on the fly, if desired.

## Paper Organization

I broadly divide this article into demonstrations of how to prepare a manuscript in Markdown such that it generates nearly-submittable \TeX\ ([Section @sec:prep]).
This includes how to specify the article style via the YAML header of the Markdown file ([Section @sec:style]).
I then demonstrate how to include images ([Section @sec:images]), tables ([Section @sec:tables]), and citations ([Section @sec:citations]).
I conclude by discussing some practical considerations for this paper writing process ([Section @sec:notes]).

Throughout I assume the reader is familiar with Markdown and do not discuss Markdown's text formatting.
Instead I discuss the general behavior of the template file and actions which are necessary for generating \aastex-compatible output.

The Markdown file, `pandoc` invocation, and associated filters used to create the \TeX\ for this document are available at: <https://github.com/privong/papers-in-markdown>.
I remind the reader that this approach can be extended to the templates of other journals by modifying the YAML header in the Markdown file and the \TeX\ template file.


# Manuscript Preparation in Markdown {#sec:prep}

## Manuscript Metadata and Styles {#sec:style}

The Markdown file can be prefixed with a header in the YAML format.
Article data such as the title, relevant dates, author list, keywords, etc. is specified here.
This header information is extracted via a \TeX\ template file and passed through to the desired output file.
The `pandoc` template also derives the \aastex\ style information from this YAML header, via the `aastexopts` entry.
The YAML header given below is that used for the preparation of this document:

```{#yamlheader .numberLines caption="YAML Header Example"}
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
shortauthors: Privon
author:
- name: George C. Privon
  ORCID: 0000-0003-3474-1125
  affiliation: ["Department of Astronomy, University of Florida, 211 Bryant Space Sciences Center, \
Gainesville, 32611 FL, USA"]
#  nocollaboration: 1
#- name: Josiah Carberry
#  ORCID: 0000-0002-1825-0097
#  affiliation: ["Wesleyan University, Middletown, CT", "Brown University: Providence, RI"]
#  collaboration: "(ORCID Demonstration)"
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

As a short example, this code in the `aastex62_template.tex` file processes any Received/Revised/Accepted YAML entries and inserts them into the resulting \LaTeX\ output:

```
$if(received)$
\received{$received$}
$endif$

$if(revised)$
\revised{$revised$}
$endif$

$if(accepted)$
\accepted{$accepted$}
$endif$
```

Similar code is used to process the author list, titles, etc.

## Images {#sec:images}

Images can be included, captioned, and labeled.
A demonstration is [Figure @fig:dm1647], which was included as:

```
![A r-band image of dm1647+21 in grayscale with a lookalike N-body simulation overlaid as \
the colored points. From @Privon2017b.](images/dm1647.png){#fig:dm1647 width=3in height=3in}
```

![A r-band image of dm1647+21 in grayscale with a lookalike N-body simulation overlaid as the colored points. From @Privon2017b.](images/dm1647.png){#fig:dm1647 width=3in height=3in}

## Tables {#sec:tables}

This tool will pass \LaTeX\ tables through `pandoc` to the chosen \LaTeX\ parser.
Thus, any tables which are part of \aastex\ will work for producing PDFs.
However, those will not propagate through to other output formats with which `pandoc` is compatible.

[Table @tbl:storms] is an example of a `pandoc` Markdown "simple table".

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

This table was created with:

```
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
```

## Citations {#sec:citations}

Citations can be incorporated using the `pandoc-citeproc` filter.
These citations take the form of: `[@Astropy2018]`, corresponding to [@Astropy2018] and `@Astropy2018` to cite in the format of: @Astropy2018.
`pandoc-citeproc` uses the Citation Style Language^[<https://citationstyles.org/>] to format citations.
Presently most of the main astrophysics journals lack entries in the CSL database.

## Equations {#sec:equations}

Equations can be specified and labeled in the text using standard \TeX\ macros.
For example, writing `$$e^{i\pi} + 1 = 0$$ {#eq:euler}` results in this output:

$$e^{i\pi} + 1 = 0$$ {#eq:euler}

And [Equation @eq:euler] can subsequently be referenced in the text with `[Equation @eq:euler]`.
This method of specifying math and equations can be coupled with `pandoc`'s support for a variety of methods to render math in many other output formats including HTML^[<https://pandoc.org/MANUAL.html#math-rendering-in-html>].


# Notes on Preparation for Submission {#sec:notes}

## Available Templates

I have created templates and demonstration files for the AAS Journals, Monthly Notices of the Royal Astronomical Society, and Astronomy & Astrophysics.
The AAS Journals example (which you are reading now) is the most complete, while the others are bare-bones and intended to constitute a minimal starting point.
However, the Markdown used to generate this article should work in the demonstration files for the other journals.

The templates are different because each journal has different options and handling of author lists, abstracts, and metadata.
For example collaboration information can be provided to AAS Journals, but not to MNRAS or A&A.
Hence it makes some sense to keep the Markdown templates separate for these journals.
However, if a manuscript is prepared using the Markdown template for A&A but the authors later decide to submit to MNRAS, the only major changes needed will be to the YAML header in the Markdown file.

## Document Filters

`pandoc` supports user-written filters.
These filters enable customized processing of documents during conversion.
Commonly used languages for this include Haskell, lua, and python^[Using either the `panflute` or `pandocfilters` modules.].
Note that a lua parser is included with `pandoc` versions 2.0 and newer, and the use of lua filters is faster than other options.

Simple filters are straightforward to construct and I demonstrate one here.
With output formats besides \aastex\ in mind, the acknowledgments portion of the document has been delineated in the Markdown file as a macro: `{{acknowledgments}}`.
However it is desirable to automatically convert this to the \TeX\ source appropriate for the journal's template.
For \aastex\, this is the `\acknowledgments` macro.
The following filter, written in lua, performs this translation when included as part of the `pandoc` invocation:

```{#ackfilter .numberLines caption="lua filter code for acknowledgements replacement"}
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

A variant of this filter is included as `aastex62/filters/acknowledgments.lua` in the template distribution and similar filters are included for the MNRAS and A&A templates.
It can is included by adding the `--lua-filter=` command-line argument to `pandoc`.
This filer be easily extended to other output formats, including HTML.

Generally, creation of filters would be more broadly useful in automating the conversion of Markdown files into journal-compatible \TeX.
An opportunity for this is to write a filter that takes the Markdown "simple table" format and converts it into an \aastex\ `deluxetable`.

## Internal References

Naively `pandoc` does not support internal reference to figures or equations and does not support numbered section references.
However the `pandoc-crossref`^[<https://github.com/lierdakil/pandoc-crossref>] filter adds support for this (and has been used in the preparation of this document).
`pandoc-crossref` uses the same syntax as `pandoc-citeproc`, so adds little cognitive overhead in inter-document referencing.
However in order avoid `pandoc-citeproc` processing internal references, `pandoc-crossref` must be invoked first.

## \TeX\ Clean up

A small amount of clean \TeX\ source cleanup may be necessary after running the Markdown through `pandoc`.
The YAML header elements are incorporated into the manuscript using `for` loops, which may leave trailing punctuation in lists (e.g., a trailing em dash following the list of keywords).
These will show up in the final output source unless they are removed at the intermediate stage.

# Summary

I have provided a brief demonstration for a method of writing research articles in Markdown and converting them to an \aastex-compatible format for submission to AAS Journals.
The accompanying template and source code release also includes templates for MNRAS and A&A.
The advantage of this approach is improved readability of the source files and added flexibility in output formats.
The latter makes it easier for authors to share HTML and/or EPUB versions of manuscripts, potentially improving uptake.

I emphasize that this pandoc approach does not supplant the journal-provided \LaTeX\ templates, but instead complements it by providing easier access to additional output formats.
This approach is also flexible and does not lock the author into a single format.
If at any point an author feels unable to progress in Markdown alone, \TeX\ can be embedded directly into the Markdown or `pandoc` can be used to convert the Markdown to a \TeX\ file and the author can resume writing as if they had been writing in \TeX all along.

I have made the templates and demonstration text publicly available for use and enhancement by the community: <https://github.com/privong/papers-in-markdown>.
Comments, bug reports, and enhancements are welcome.

{{acknowledgments}}

I thank Kelly Hondula for comments on this manuscript and acknowledge support from the University of Florida.
