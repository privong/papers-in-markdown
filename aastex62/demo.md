---
#aastexopts: [singlecolumn]
preambleinput: ["macros.tex"]
bibstyle: aasjournal
received: "January 1, 2018"
revised: "January 7, 2018"
accepted: "\\today"
submitjournal: ApJ 
title: "An Example Article using \\aastex v6.2^[Released on January, 8th, 2018]"
shorttitle: Sample article
shortauthors: Schwarz et al.
author:
- name: Greg J. Schwarz
  ORCID: 0000-0002-0786-7307
  affiliation: ["American Astronomical Society \\ 2000 Florida Ave., NW, Suite 300 \\ Washington, DC 20009-1231, USA"]
- name: August Muench
  affiliation: ["American Astronomical Society \\ 2000 Florida Ave., NW, Suite 300 \\ Washington, DC 20009-1231, USA"]
  collaboration: "(AAS Journals Data Scientists collaboration)"
- name: Butler Burton
  affiliation: ["National Radio Astronomy Observatory", "AAS Journals Associate Editor-in-Chief"]
  nocollaboration: 1
- name: Amy Hendrickson
  affiliation: ["TeXnology Inc."]
  collaboration: "(LaTeX collaboration)"
- name: Julie Steffen
  affiliation: ["AAS Director of Publishing", "American Astronomical Society \\ 2000 Florida Ave., NW, Suite 300 \\ Washington, DC 20009-1231, USA"]
- name: Jeff Lewandowski
  affiliation: ["IOP Senior Publisher for the AAS Journals", "IOP Publishing, Washington, DC 20005"]
keywords: ["editorials, notices", miscellaneous, catalogs, surveys]
software: ["pandoc", "astropy [@astropy2013]", "Cloudy [@Ferland2013]", "SExtractor [@Bertin1996]"]
facility: ["HST(STIS)", "Swift(XRT and UVOT)", "AAVSO", "CTIO:1.3m", "CTIO:1.5m", "CXO"]
abstract: |
  This example manuscript is intended to serve as a tutorial and template for authors to use when writing their own AAS Journal articles. The manuscript includes a history of \aastex\ and documents the new features in the previous versions as well as the new features in version 6.2. This manuscript includes many figure and table examples to illustrate these new features.  Information on features not explicitly mentioned in the article can be viewed in the manuscript comments or more extensive online documentation. Authors are welcome replace the text, tables, figures, and bibliography with their own and submit the resulting manuscript to the AAS Journals peer review system.  The first lesson in the tutorial is to remind authors that the AAS Journals, the Astrophysical Journal (ApJ), the Astrophysical Journal Letters (ApJL), and Astronomical Journal (AJ), all have a 250 word limit for the abstract^[Note that manuscripts submitted to the new Research Notes of the American Astronomical Society (RNAAS) do **not** have abstracts.].  If you exceed this length the Editorial office will ask you to shorten it.
---

# Introduction {#sec:intro}

\latex\ ^[\url{http://www.latex-project.org/}] is a document markup language that is particularly well suited for the publication of mathematical and scientific articles [@lamport94].
\latex\ was written in 1985 by Leslie Lamport who based it on the \TeX\ typesetting language which itself was created by Donald E. Knuth in 1978.
In 1988 a suite of \latex\ macros were developed to investigate electronic submission and publication of AAS Journal articles [@1989BAAS...21..780H].
Shortly afterwards, Chris Biemesdefer merged these macros and more into a \latex\ 2.08 style file called \aastex.
These early \aastex\ versions introduced many common commands and practices that authors take for granted today.
Substantial revisions were made by Lee Brotzman and Pierre Landau when the package was updated to v4.0.
AASTeX v5.0, written in 1995 by Arthur Ogawa, upgraded to \latex\ 2e which uses the document class in lieu of a style file.
Other improvements to version 5 included hypertext support, landscape deluxetables and improved figure support to facilitate electronic submission.
\aastex\ v5.2 was released in 2005 and introduced additional graphics support plus new mark up to identifier astronomical objects, datasets and facilities.

In 1996 Maxim Markevitch modified the AAS preprint style file, aaspp4.sty, to closely emulate the very tight, two column style of a typeset Astrophysical Journal article.
The result was emulateapj.sty.
A year later Alexey Vikhlinin took over development and maintenance.
In 2001 he converted emulateapj into a class file in \latex\ 2e and in 2003 Vikhlinin completely rewrote emulateapj based on the APS Journal's RevTEX class.

During this time emulateapj gained growing acceptance in the astronomical community as it filled an author need to obtain an approximate number of manuscript pages prior to submission for cost and length estimates.
The tighter typeset also had the added advantage of saving paper when printing out hard copies.

Even though author publication charges are no longer based on print pages^[see Section \ref{sec:pubcharge} in the Appendix for more details about how current article costs are calculated.] the emulateapj class file has proven to be extremely popular with AAS Journal authors.
An informal analysis of submitted \latex\ manuscripts in 2015 revealed that $\sim$ 65\% either called emulateapj or have a commented emulateapj classfile call indicating it was used at some stage of the manuscript construction.
Clearly authors want to have access to a tightly typeset version of the article when corresponding with co-authors and for preprint submissions.

When planning the next \aastex\ release the popularity of emulateapj played an important roll in the decision to drop the old base code and adopt and modify emulateapj for \aastex\ v6.+ instead.
The change brings \aastex\ inline with what the majority of authors are already using while still delivering new and improved features.
\aastex\ v6.0 through v6.2 were written by Amy Hendrickson and released in January 2016 (v6.0), October 2016 (v6.1), and January 2018 (v6.2), respectively.
Some of the new features in v6.0 included:

1. improved citations for third party data repositories and software,

2. easier construction of matrix figures consisting of multiple encapsulated postscript (EPS) or portable document format (PDF) files,

3. figure set mark up for large collections of similar figures,

4. color mark up to easily enable/disable revised text highlighting,

5. improved url support, and

6. numerous table options such as the ability to hide columns, column decimal alignment, automatic column math mode and numbering, plus splitting of wide tables.

The features in v6.1 were:

1. ORCID support for preprints,

2. improved author, affiliation and collaboration mark up,

3. reintroduced the old AASTeX v5.2 `\received`, `\revised`, `\accepted`, and `\published` commands plus added the new `\submitjournal` command to document which AAS Journal the manuscript was submitted to, plus

4. new typeset style options.

The new features in v6.2 are:

1. A new RNAAS style option for Research Note manuscripts,

2. Titles no longer put in all caps,

3. No page skip between the title page and article body,

4. re-introduce RevTeX's widetext environment for long lines in two column style formats, and

5. upgrade to the `\doi` command.

The rest of this article provides information and examples on how to create your own AAS Journal manuscript with v6.2.
Special emphasis is placed on how to use the full potential of \aastex\ v6+.
The next section describes the different manuscript styles available and how they differ from past releases.
Section \ref{sec:floats} describes how tables and figures are placed in a \latex\ document.
Specific examples of tables, Section \ref{subsec:tables}, and figures, Section \ref{subsec:figures}, are also provided.
Section \ref{sec:displaymath} discusses how to display math and incorporate equations in a manuscript while Section \ref{sec:highlight} discuss how to use the new revision mark up.
The last section, \ref{sec:cite}, shows how recognize software and external data as first class references in the manuscript bibliography.
An appendix is included to show how to construct one and provide some information on how article charges are calculated.
Additional information is available both embedded in the comments of this \latex\ file and in the online documentation at <http://journals.aas.org/authors/aastex.html>.

