---
preambleinput: ["macros.tex"]
link-citations: true
texpackages:
- name: xspace
#  opts:
- name: amsmath
#  opts:
bibliography: demo.bib
title: "Preparation of MNRAS Articles using Markdown and Pandoc"
shorttitle: "MNRAS Markdown Template"
shortauthors: Privon
pubyear: 2018
#accepted:
#received:
#originalform:
author:
- name: George C. Privon
  affiliation: ["Department of Astronomy, University of Florida, 211 Bryant Space Sciences Center, Gainesville, 32611 FL, USA"]
  email: george.privon@ufl.edu
#- name: Josiah Carberry
#  affiliation: ["Department of Psychoceramics, Wesleyan University, Middletown, CT", "Department of Psychoceramics, Brown University: Providence, RI"]
keywords: [miscellaneous]
abstract: |
  This is a MNRAS version of the Markdown template. It is functionally very similar to the aastex62 template but has a reduced numbers of options, reflecting the reduced complexity/flexibility compared to \aastex.
---

# Description {#sec:intro}

This is a MNRAS Markdown template.
It is similar to the aastex62 template, but modified to match 
See the aastex demonstration^[<https://github.com/privong/papers-in-markdown/tree/master/aastex62>] for a description of how to use `pandoc` and Markdown together.

{{acknowledgments}}

G.C.P. acknowledges support from the University of Florida.
This work makes us of the `pandoc` universal document convertor^[<https://pandoc.org/>].

# References
