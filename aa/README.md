# Astronomy & Astrophysics Pandoc Template

Generate a `tex` file with:

```
pandoc demo-structured_abstract.md -s --template aa_template.tex -o demo-structured_abstract.tex -F pandoc-crossref -F pandoc-citeproc --lua-filter=filters/acknowledgments.lua
```

Go straight to the pdf with:

```
pandoc demo-structured_abstract.md -s --template aa_template.tex -o demo-structured_abstract.pdf -F pandoc-crossref -F pandoc-citeproc --lua-filter=filters/acknowledgments.lua --pdf-engine=xelatex
```

There are two demonstration files containing sample articles:

* [`demo-structured_abstract.md`](demo-structured_abstract.md): A&A structured abstract
* [`demo-traditional_abstract.md`](demo-traditional_abstract.md): A&A traditional abstract

## Usage Notes

* If you want to include macros in anything contained within the YAML header, those must be put in a separate macro file that is incorporated via `\include{}` or `\input{}` *above* the title. This is demonstrated in [demo.md](demo.md).

### Collaborations

* For collaborations, authors will be grouped until there is a `collaboration: ` entry in the YAML header. If a co-author that is not part of a listed collaboration is listed before co-authors that are part of collaborations, put `nocollaboration: 1` in the YAML header to signify as such and avoid them being grouped with the later batch. See [demo.md](demo.md) for an example.

## Known Issues

* The A&A template requires manual enumeration and de-duplication of affilations but this likely requires construction of a pandoc filter to properly handle. For now, all affilations are given the same superscript code and the user must manually adjust to suit.
* A&A table environments pass through to LaTeX without trouble. But note that these will not translate to other outputs (HTML, epub, etc.). So consider what your desired outputs will be before you put lots of effort into tables. Or write a [pandoc filter](https://pandoc.org/filters.html) to handle tables.
* The A&A bibliography format is not part of the [Zotero (citation) Style Repository](https://www.zotero.org/styles) so `pandoc-citeproc` does not have access to the correct citation style. Dealing with this is beyond the scope of this particular repository, but hopefully that spec will eventually be translated into [Citation style language](https://citationstyles.org/).
