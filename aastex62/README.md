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

### Collaborations

* For collaborations, authors will be grouped until there is a `collaboration: ` entry in the YAML header. If a co-author that is not part of a listed collaboration is listed before co-authors that are part of collaborations, put `nocollaboration: 1` in the YAML header to signify as such and avoid them being grouped with the later batch. See [demo.md](demo.md) for an example.

## Known Issues

* Tables of any sort are fully un-tested
* The AAS bibliography format is not part of the [Zotero (citation) Style Repository](https://www.zotero.org/styles) so `pandoc-citeproc` does not have access to the correct citation style. Dealing with this is beyond the scope of this particular repository, but hopefully that spec will eventually be translated into [Citation style language](https://citationstyles.org/).
