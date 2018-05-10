# AASTeX Pandoc Template

Generate a `tex` file with:

```
pandoc demo.md -s --template aastex62_template.tex -o demo.tex --filter pandoc-citeproc
```

Go straight to the pdf with:

```
pandoc demo.md -s --template aastex62_template.tex -o demo.pdf --filter pandoc-citeproc  --pdf-engine=xelatex
```

The `demo.md` file is a subset of the contents of the `sample62.tex` file which is distributed with [aastex62](https://journals.aas.org/authors/aastex.html#_download).

## Usage Notes

* If you want to include macros in anything in the article title, those must be put in a separate macro file that is incorporated via `\include{}` or `\input{}` *above* the title. An example of this is provided here.
