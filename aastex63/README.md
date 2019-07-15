# AASTeX Pandoc Template

Generate a TeX file with:

```
pandoc demo.md -s --template aastex63_template.tex -o demo.tex -F pandoc-crossref -F pandoc-citeproc --lua-filter=filters/acknowledgments.lua --no-highlight --natbib
```

Go straight to the PDF with:

```
pandoc demo.md -s --template aastex63_template.tex -o demo.pdf -F pandoc-crossref -F pandoc-citeproc --lua-filter=filters/acknowledgments.lua --pdf-engine=xelatex --no-highlight
```

The [`demo.md`](demo.md) file contains a sample article describing the use of this template in generating AASTeX output via pandoc.

## Usage Notes

* If you want to include macros in anything contained within the YAML header, those must be put in a separate macro file that is incorporated via `\include{}` or `\input{}` *above* the title. This is demonstrated in [demo.md](demo.md).

* To get references formatted for the AAS Journals, first convert the Markdown to TeX (as demonstrated above) with the `--natbib` switch. The resulting TeX file can then be processed with `pdflatex` and `bibtex` as usual. The template is constructed in such a way that this will result in correctly formatted references (using the `aasjournal.bst` file).

### Useful pandoc Options

I recommend reading the [pandoc manual](https://pandoc.org/MANUAL.html), but below are a few switches I have found useful for the aims of this repo.
Please consult the pandoc manual for more detailed information.

* `-F/--filter`, `--lua-filter`: invoke a filter to operate on the document during conversion.

* `-s`: create a "standalone" document

* `--listings` or `--no-highlight`: Both apply if there are code listings. The former creates TeX float listings while the latter does not apply special formatting.

* `--natbib`: Convert pandoc references to `\cite{}` calls in the output.

### Collaborations

* For collaborations, authors will be grouped until there is a `collaboration: ` entry in the YAML header. If a co-author that is not part of a listed collaboration is listed before co-authors that are part of collaborations, put `nocollaboration: 1` in the YAML header to signify as such and avoid them being grouped with the later batch. See [demo.md](demo.md) for an example.

### Output to HTML (and Other Formats)

In addition to TeX and PDF pandoc can output to a [variety of formats](https://pandoc.org/MANUAL.html#general-options) and pandoc ships with default templates for each.
However, in order to take full advantage of the additional information contained in the YAML header, a custom template should be written.
A bare-bones example HTML template is provided in the [`aastex63_website_template.html`](aastex63_website_template.html) file.
This, along with `demo.md`, can be converted to a HTML page with:

```
pandoc demo.md -s --template aastex63_website_template.html -o demo.html -F pandoc-crossref -F pandoc-citeproc --lua-filter=filters/acknowledgments.lua
```

## Known Issues

* AASTeX table environments pass through to LaTeX without trouble. But note that these will not translate to other outputs (HTML, epub, etc.). So consider what your desired outputs will be before you put lots of effort into tables. Or write a [pandoc filter](https://pandoc.org/filters.html) to handle tables.
* The AAS bibliography format is not part of the [Zotero (citation) Style Repository](https://www.zotero.org/styles) so `pandoc-citeproc` does not have access to the correct citation style. This means that using `pandoc` to output directly to PDF will not result in the correct reference formatting. See above for a method to get PDF output with AAS Journals compatible references.
