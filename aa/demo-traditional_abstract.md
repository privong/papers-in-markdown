---
preambleinput: ["macros.tex"]
texpackages:
- name: xspace
#  opts:
- name: amsmath
#  opts:
bibliography: demo.bib
title: "Preparation of A and A Articles using Markdown and Pandoc"
shorttitle: "A and A Markdown Template"
shortauthors: Privon
pubyear: 2018
#accepted:
#received:
author:
- name: George C. Privon
  affiliation: ["Department of Astronomy, University of Florida, 211 Bryant Space Sciences Center, Gainesville, 32611 FL, USA"]
  email: george.privon@ufl.edu
#- name: Josiah Carberry
#  affiliation: ["Department of Psychoceramics, Wesleyan University, Middletown, CT", "Department of Psychoceramics, Brown University: Providence, RI"]
keywords: [miscellaneous]
abstract: |
  This is an A and A version of the Markdown template. It is functionally very similar to the aastex62 template. This is the "traditional abstract" format.
---

# Description {#sec:intro}

This is a A\&A Markdown template.
It is similar to the aastex62 template, but modified to match the A\&A template.
See the aastex demonstration^[<https://github.com/privong/papers-in-markdown/tree/master/aastex62>] for a description of how to use `pandoc` and Markdown together.

{{acknowledgments}}

G.C.P. acknowledges support from the University of Florida.
This work makes us of the `pandoc` universal document convertor^[<https://pandoc.org/>].

{{end_acknowledgments}}
