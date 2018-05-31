# AASTeX Pandoc Template

Generate a TeX file with:

```
pandoc demo.md -s --template aastex62_template.tex -o demo.tex -F pandoc-crossref -F pandoc-citeproc --lua-filter=filters/acknowledgments.lua --no-highlight --natbib
```

Go straight to the pdf with:

```
pandoc demo.md -s --template aastex62_template.tex -o demo.pdf -F pandoc-crossref -F pandoc-citeproc --lua-filter=filters/acknowledgments.lua --pdf-engine=xelatex --no-highlight
```

The [`demo.md`](demo.md) file contains a sample article describing the use of this template in generating AASTeX output via pandoc.

## Usage Notes

* If you want to include macros in anything contained within the YAML header, those must be put in a separate macro file that is incorporated via `\include{}` or `\input{}` *above* the title. This is demonstrated in [demo.md](demo.md).

### Collaborations

* For collaborations, authors will be grouped until there is a `collaboration: ` entry in the YAML header. If a co-author that is not part of a listed collaboration is listed before co-authors that are part of collaborations, put `nocollaboration: 1` in the YAML header to signify as such and avoid them being grouped with the later batch. See [demo.md](demo.md) for an example.

### Output to HTML (and Other Formats)

In addition to TeX and PDF pandoc can output to a [variety of formats](https://pandoc.org/MANUAL.html#general-options) and pandoc ships with default templates for each.
However, in order to take full advantage of the additional information contained in the YAML header, a custom template should be written.
A bare-bones example HTML template is provided in the [`aastex62_website_template.html`](aastex62_website_template.html) file.
This, along with `demo.md`, can be converted to a HTML page with:

```
pandoc demo.md -s --template aastex62_website_template.html -o demo.html -F pandoc-crossref -F pandoc-citeproc --lua-filter=filters/acknowledgments.lua
```

## Known Issues

* AASTeX table environments pass through to LaTeX without trouble. But note that these will not translate to other outputs (HTML, epub, etc.). So consider what your desired outputs will be before you put lots of effort into tables. Or write a [pandoc filter](https://pandoc.org/filters.html) to handle tables.
* The AAS bibliography format is not part of the [Zotero (citation) Style Repository](https://www.zotero.org/styles) so `pandoc-citeproc` does not have access to the correct citation style. Dealing with this is beyond the scope of this particular repository, but hopefully that spec will eventually be translated into [Citation style language](https://citationstyles.org/).
