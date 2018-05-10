---
aastexopts: [twocolumn, tighten]
bibstle: aasjournal
received: "January 1, 2018"
revised: "January 7, 2018"
accepted: "\today"
submitjournal: ApJ 
title: "An Example Article using \aastex v6.2\footnote{Released on January, 8th, 2018}}"
shorttitle: Sample article
shortauthors: Schwarz et al.
author:
- name: Greg J. Schwarz
  ORCID: 0000-0002-0786-7307
  affiliation: ["American Astronomical Society \\ 2000 Florida Ave., NW, Suite 300 \\ Washington, DC 20009-1231, USA"]
- name: August Muench
  affiliation: ["American Astronomical Society \\ 2000 Florida Ave., NW, Suite 300 \\ Washington, DC 20009-1231, USA"]
- name: Butler Burton
  affiliation: ["National Radio Astronomy Observatory", "AAS Journals Associate Editor-in-Chief"]
- name: Amy Hendrickson
  affiliation: ["TeXnology Inc."]
- name: Julie Steffen
  affiliation: ["AAS Director of Publishing", "American Astronomical Society \\ 2000 Florida Ave., NW, Suite 300 \\ Washington, DC 20009-1231, USA"]
- name: Jeff Lewandowski
  affiliation: ["IOP Senior Publisher for the AAS Journals", "IOP Publishing, Washington, DC 20005"]
keywords: ["editorials, notices", miscellaneous, catalogs, surveys]
abstract: |
  This example manuscript is intended to serve as a tutorial and template for authors to use when writing their own AAS Journal articles. The manuscript includes a history of \aastex\ and documents the new features in the previous versions as well as the new features in version 6.2. This manuscript includes many figure and table examples to illustrate these new features.  Information on features not explicitly mentioned in the article can be viewed in the manuscript comments or more extensive online documentation. Authors are welcome replace the text, tables, figures, and bibliography with their own and submit the resulting manuscript to the AAS Journals peer review system.  The first lesson in the tutorial is to remind authors that the AAS Journals, the Astrophysical Journal (ApJ), the Astrophysical Journal Letters (ApJL), and Astronomical Journal (AJ), all have a 250 word limit for the abstract\footnote{Note that manuscripts submitted to the new Research Notes of the American Astronomical Society (RNAAS) do \textbf{not} have abstracts.}.  If you exceed this length the Editorial office will ask you to shorten it.
---

\newcommand{\vdag}{(v)^\dagger}
\newcommand\aastex{AAS\TeX}
\newcommand\latex{La\TeX}

# Introduction {#sec:intro}

\latex\ \footnote{\url{http://www.latex-project.org/}} is a document markup
language that is particularly well suited for the publication of
mathematical and scientific articles \citep{lamport94}. \latex\ was written
in 1985 by Leslie Lamport who based it on the \TeX\ typesetting language
which itself was created by Donald E. Knuth in 1978.  In 1988 a suite of
\latex\ macros were developed to investigate electronic submission and
publication of AAS Journal articles \citep{1989BAAS...21..780H}.  Shortly
afterwards, Chris Biemesdefer merged these macros and more into a \latex\
2.08 style file called \aastex.  These early \aastex\ versions introduced
many common commands and practices that authors take for granted today.
Substantial revisions
were made by Lee Brotzman and Pierre Landau when the package was updated to
v4.0.  AASTeX v5.0, written in 1995 by Arthur Ogawa, upgraded to \latex\ 2e
which uses the document class in lieu of a style file.  Other improvements
to version 5 included hypertext support, landscape deluxetables and
improved figure support to facilitate electronic submission.  
\aastex\ v5.2 was released in 2005 and introduced additional graphics
support plus new mark up to identifier astronomical objects, datasets and
facilities.

