# Papers in Markdown

It might be nice to write astronomy papers in Markdown instead of directly in TeX.
This is a set of templates for [pandoc](https://pandoc.org/) to enable that.

There is currently support for [AASTeX](https://journals.aas.org/authors/aastex/), [MNRAS](https://academic.oup.com/mnras/), and [A&A](https://www.aanda.org/).
I welcome contributions for other journals.

In case you are hesitant about committing to Markdown when writing your papers, if you eventually come to a point where it seems easier to do something in LaTeX, pandoc will pass LaTeX through so you can directly embedd it into the Markdown file.
Alternately you can convert the Markdown file into a LaTeX file and simply pick up editing the LaTeX directly, just as if you had been writing in LaTeX all along.

## Journal Templates

Templates are included for the following journals:

* [aastex62](aastex62/): use for all [American Astronomical Society Journals](https://aas.org/publications/publishing)
* [MNRAS](mnras/): [Monthly Notices of the Royal Astronomical Society](https://academic.oup.com/mnras/)
* [aa](aa/): [Astronomy & Astrophysics](https://www.aanda.org/)

Note that the aastex62 template has the most descriptive information while the others are relatively bare-bones.
Additionally, the necessary style files are *not* included in this distribution; you must obtain those from the relevant journal.

# Licensing

## Documentation

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />The document template and sample document are licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

## Code

Code is licensed under the GNU General Public License Version 3 (or later).
