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
#originalform:
author:
- name: George C. Privon
  affiliation: ["Department of Astronomy, University of Florida, 211 Bryant Space Sciences Center, Gainesville, 32611 FL, USA"]
  email: george.privon@ufl.edu
#- name: Josiah Carberry
#  affiliation: ["Department of Psychoceramics, Wesleyan University, Middletown, CT", "Department of Psychoceramics, Brown University: Providence, RI"]
keywords: [miscellaneous]
abstract:
  context: "This is a Markdown template for paper submissions to A&A."
  aim: "I intend to make manuscript preparation easier while also enabling more flexibility."
  methods: "I created a `pandoc` document template to enable preparation of astronomy manuscripts in Markdown with easy conversion to journal-defined formats."
  results: "These templates and `pandoc` invocations can be used to submit papers to Astronomy and Astrophysics."
  conclusions: "`pandoc` is a handy tool to know."
---

# Description {#sec:intro}

This is a template for the Astronomy and Astrophysics journal.
It is similar to the aastex62 template, but modified to match 
See the aastex demonstration^[<https://github.com/privong/papers-in-markdown/tree/master/aastex62>] for a description of how to use `pandoc` and Markdown together.

{{acknowledgments}}

G.C.P. acknowledges support from the University of Florida.
This work makes us of the `pandoc` universal document convertor^[<https://pandoc.org/>].
