---
#aastexopts: [singlecolumn]
preambleinput: ["macros.tex"]
bibstyle: aasjournal
received: "January 1, 2018"
revised: "January 7, 2018"
accepted: "\\today"
submitjournal: ApJ 
title: "An Example Article using \\aastex v6.2^[Released on January, 8th, 2018]"
shorttitle: Sample article
shortauthors: Schwarz et al.
author:
- name: Greg J. Schwarz
  ORCID: 0000-0002-0786-7307
  affiliation: ["American Astronomical Society \\ 2000 Florida Ave., NW, Suite 300 \\ Washington, DC 20009-1231, USA"]
- name: August Muench
  affiliation: ["American Astronomical Society \\ 2000 Florida Ave., NW, Suite 300 \\ Washington, DC 20009-1231, USA"]
  collaboration: "(AAS Journals Data Scientists collaboration)"
- name: Butler Burton
  affiliation: ["National Radio Astronomy Observatory", "AAS Journals Associate Editor-in-Chief"]
  nocollaboration: 1
- name: Amy Hendrickson
  affiliation: ["TeXnology Inc."]
  collaboration: "(LaTeX collaboration)"
- name: Julie Steffen
  affiliation: ["AAS Director of Publishing", "American Astronomical Society \\ 2000 Florida Ave., NW, Suite 300 \\ Washington, DC 20009-1231, USA"]
- name: Jeff Lewandowski
  affiliation: ["IOP Senior Publisher for the AAS Journals", "IOP Publishing, Washington, DC 20005"]
keywords: ["editorials, notices", miscellaneous, catalogs, surveys]
software: ["pandoc", "astropy [@astropy2013]", "Cloudy [@Ferland2013]", "SExtractor [@Bertin1996]"]
facility: ["HST(STIS)", "Swift(XRT and UVOT)", "AAVSO", "CTIO:1.3m", "CTIO:1.5m", "CXO"]
abstract: |
  This example manuscript is intended to serve as a tutorial and template for authors to use when writing their own AAS Journal articles. The manuscript includes a history of \aastex\ and documents the new features in the previous versions as well as the new features in version 6.2. This manuscript includes many figure and table examples to illustrate these new features.  Information on features not explicitly mentioned in the article can be viewed in the manuscript comments or more extensive online documentation. Authors are welcome replace the text, tables, figures, and bibliography with their own and submit the resulting manuscript to the AAS Journals peer review system.  The first lesson in the tutorial is to remind authors that the AAS Journals, the Astrophysical Journal (ApJ), the Astrophysical Journal Letters (ApJL), and Astronomical Journal (AJ), all have a 250 word limit for the abstract^[Note that manuscripts submitted to the new Research Notes of the American Astronomical Society (RNAAS) do **not** have abstracts.].  If you exceed this length the Editorial office will ask you to shorten it.
---

# Introduction {#sec:intro}

\latex\ ^[\url{http://www.latex-project.org/}] is a document markup language that is particularly well suited for the publication of mathematical and scientific articles [@lamport94].
\latex\ was written in 1985 by Leslie Lamport who based it on the \TeX\ typesetting language which itself was created by Donald E. Knuth in 1978.
In 1988 a suite of \latex\ macros were developed to investigate electronic submission and publication of AAS Journal articles [@1989BAAS...21..780H].
Shortly afterwards, Chris Biemesdefer merged these macros and more into a \latex\ 2.08 style file called \aastex.
These early \aastex\ versions introduced many common commands and practices that authors take for granted today.
Substantial revisions were made by Lee Brotzman and Pierre Landau when the package was updated to v4.0.
AASTeX v5.0, written in 1995 by Arthur Ogawa, upgraded to \latex\ 2e which uses the document class in lieu of a style file.
Other improvements to version 5 included hypertext support, landscape deluxetables and improved figure support to facilitate electronic submission.
\aastex\ v5.2 was released in 2005 and introduced additional graphics support plus new mark up to identifier astronomical objects, datasets and facilities.

In 1996 Maxim Markevitch modified the AAS preprint style file, aaspp4.sty, to closely emulate the very tight, two column style of a typeset Astrophysical Journal article.
The result was emulateapj.sty.
A year later Alexey Vikhlinin took over development and maintenance.
In 2001 he converted emulateapj into a class file in \latex\ 2e and in 2003 Vikhlinin completely rewrote emulateapj based on the APS Journal's RevTEX class.

During this time emulateapj gained growing acceptance in the astronomical community as it filled an author need to obtain an approximate number of manuscript pages prior to submission for cost and length estimates.
The tighter typeset also had the added advantage of saving paper when printing out hard copies.

Even though author publication charges are no longer based on print pages^[see Section \ref{sec:pubcharge} in the Appendix for more details about how current article costs are calculated.] the emulateapj class file has proven to be extremely popular with AAS Journal authors.
An informal analysis of submitted \latex\ manuscripts in 2015 revealed that $\sim$ 65\% either called emulateapj or have a commented emulateapj classfile call indicating it was used at some stage of the manuscript construction.
Clearly authors want to have access to a tightly typeset version of the article when corresponding with co-authors and for preprint submissions.

When planning the next \aastex\ release the popularity of emulateapj played an important roll in the decision to drop the old base code and adopt and modify emulateapj for \aastex\ v6.+ instead.
The change brings \aastex\ inline with what the majority of authors are already using while still delivering new and improved features.
\aastex\ v6.0 through v6.2 were written by Amy Hendrickson and released in January 2016 (v6.0), October 2016 (v6.1), and January 2018 (v6.2), respectively.
Some of the new features in v6.0 included:

1. improved citations for third party data repositories and software,

2. easier construction of matrix figures consisting of multiple encapsulated postscript (EPS) or portable document format (PDF) files,

3. figure set mark up for large collections of similar figures,

4. color mark up to easily enable/disable revised text highlighting,

5. improved url support, and

6. numerous table options such as the ability to hide columns, column decimal alignment, automatic column math mode and numbering, plus splitting of wide tables.

The features in v6.1 were:

1. ORCID support for preprints,

2. improved author, affiliation and collaboration mark up,

3. reintroduced the old AASTeX v5.2 `\received`, `\revised`, `\accepted`, and `\published` commands plus added the new `\submitjournal` command to document which AAS Journal the manuscript was submitted to, plus

4. new typeset style options.

The new features in v6.2 are:

1. A new RNAAS style option for Research Note manuscripts,

2. Titles no longer put in all caps,

3. No page skip between the title page and article body,

4. re-introduce RevTeX's widetext environment for long lines in two column style formats, and

5. upgrade to the `\doi` command.

The rest of this article provides information and examples on how to create your own AAS Journal manuscript with v6.2.
Special emphasis is placed on how to use the full potential of \aastex\ v6+.
The next section describes the different manuscript styles available and how they differ from past releases.
Section \ref{sec:floats} describes how tables and figures are placed in a \latex\ document.
Specific examples of tables, Section \ref{subsec:tables}, and figures, Section \ref{subsec:figures}, are also provided.
Section \ref{sec:displaymath} discusses how to display math and incorporate equations in a manuscript while Section \ref{sec:highlight} discuss how to use the new revision mark up.
The last section, \ref{sec:cite}, shows how recognize software and external data as first class references in the manuscript bibliography.
An appendix is included to show how to construct one and provide some information on how article charges are calculated.
Additional information is available both embedded in the comments of this \latex\ file and in the online documentation at <http://journals.aas.org/authors/aastex.html>.


# Manuscript styles {#sec:style}

The default style in \aastex\ v6.2 is a tight single column style, e.g.  10
point font, single spaced.  The single column style is very useful for
article with wide equations. It is also the easiest to style to work with
since figures and tables, see Section \ref{sec:floats}, will span the
entire page, reducing the need for address float sizing.

To invoke a two column style similar to the what is produced in
the published PDF copy use \

\noindent `\documentclass[twocolumn]{aastex62}`. \

\noindent Note that in the two column style figures and tables will only
span one column unless specifically ordered across both with the "*" flag,
e.g. \

\noindent`\begin{figure*}` ... `\end{figure*}`, \
\noindent`\begin{table*}` ... `\end{table*}`, and \
\noindent`\begin{deluxetable*}` ... `\end{deluxetable*}`. \

\noindent This option is ignored in the onecolumn style.

Some other style options are outlined in the commented sections of this 
article.  Any combination of style options can be used.

Two style options that are needed to fully use the new revision tracking
feature, see Section \ref{sec:highlight}, are `linenumbers` which 
uses the lineno style file to number each article line in the left margin and 
`trackchanges` which controls the revision and commenting highlight
output.

There is also a new `modern` option that uses a Daniel
Foreman-Mackey and David Hogg design to produce stylish, single column
output that has wider left and right margins. It is designed to have fewer
words per line to improve reader retention. It also looks better on devices
with smaller displays such as smart phones.

For a Research Note use the `RNAAS` option which will produce a
manuscript with no abstract and in the `modern` style.

# Floats {#sec:floats}

Floats are non-text items that generally can not be split over a page.
They also have captions and can be numbered for reference.  Primarily these
are figures and tables but authors can define their own. \latex\ tries to
place a float where indicated in the manuscript but will move it later if
there is not enough room at that location, hence the term "float".

Authors are encouraged to embed their tables and figures within the text as
they are mentioned.  Please do not place the figures and text at the end of
the article as was the old practice.  Editors and the vast majority of
referees find it much easier to read a manuscript with embedded figures and
tables.

Depending on the number of floats and the particular amount of text and
equations present in a manuscript the ultimate location of any specific
float can be hard to predict prior to compilation. It is recommended that
authors textbf{not} spend significant time trying to get float placement
perfect for peer review.  The AAS Journal's publisher has sophisticated
typesetting software that will produce the optimal layout during
production.

Note that authors of Research Notes are only allowed one float, either one
table or one figure.

\startlongtable
\begin{deluxetable}{c|cc}
\tablecaption{ApJ costs from 1991 to 2013\tablenotemark{a} \label{tab:table}}
\tablehead{
\colhead{Year} & \colhead{Subscription} & \colhead{Publication} \\
\colhead{} & \colhead{cost} & \colhead{charges\tablenotemark{b}}\\
\colhead{} & \colhead{(\$)} & \colhead{(\$/page)}
}
\colnumbers
\startdata
1991 & 600 & 100 \\
1992 & 650 & 105 \\
1993 & 550 & 103 \\
1994 & 450 & 110 \\
1995 & 410 & 112 \\
1996 & 400 & 114 \\
1997 & 525 & 115 \\
1998 & 590 & 116 \\
1999 & 575 & 115 \\
2000 & 450 & 103 \\
2001 & 490 &  90 \\
2002 & 500 &  88 \\
2003 & 450 &  90 \\
2004 & 460 &  88 \\
2005 & 440 &  79 \\
2006 & 350 &  77 \\
2007 & 325 &  70 \\
2008 & 320 &  65 \\
2009 & 190 &  68 \\
2010 & 280 &  70 \\
2011 & 275 &  68 \\
2012 & 150 &  56 \\
2013 & 140 &  55 \\
\enddata
\tablenotetext{a}{Adjusted for inflation}
\tablenotetext{b}{Accounts for the change from page charges to digital quanta in April, 2011}
\tablecomments{Note that {\tt \string \colnumbers} does not work with the 
vertical line alignment token. If you want vertical lines in the headers you
can not use this command at this time.}
\end{deluxetable}

For authors that do want to take the time to optimize the locations of
their floats there are some techniques that can be used.  The simplest
solution is to placing a float earlier in the text to get the position
right but this option will break down if the manuscript is altered, see
Table \ref{tab:table}.  A better method is to force \latex\ to place a
float in a general area with the use of the optional `[placement
specifier]` parameter for figures and tables. This parameter goes after
`\begin{figure}`, `\begin{table}`, and
`\begin{deluxetable}`.  The main arguments the specifier takes
are "h", "t", "b", and "!".  These tell \latex\ to place the float
\underline{h}ere (or as close as possible to this location as possible), at
the \underline{t}op of the page, and at the \underline{b}ottom of the page.
The last argument, "!", tells \latex\ to override its internal method of
calculating the float position.  A sequence of rules can be created by
using multiple arguments.  For example, `\begin{figure}[htb!]`
tells \latex\ to try the current location first, then the top of the page
and finally the bottom of the page without regard to what it thinks the
proper position should be.  Many of the tables and figures in this article
use a placement specifier to set their positions.

Note that the \latex\ `tabular` environment is not a float.  Only
when a `tabular` is surrounded by `\begin{table}` ...
`\end{table}` is it a true float and the rules and suggestions
above apply.

In AASTeX v6.2 all deluxetables are float tables and thus if they are
longer than a page will spill off the bottom. Long deluxetables should
begin with the `\startlongtable` command. This initiates a
longtable environment.  Authors might have to use `\clearpage` to
isolate a long table or optimally place it within the surrounding text.

\begin{deluxetable*}{ccCrlc}[b!]
\tablecaption{Column math mode in an observation log \label{tab:mathmode}}
\tablecolumns{6}
\tablenum{2}
\tablewidth{0pt}
\tablehead{
\colhead{UT start time\tablenotemark{a}} &
\colhead{MJD start time\tablenotemark{a}} &
\colhead{Seeing} & \colhead{Filter} & \colhead{Inst.} \\
\colhead{(YYYY-mm-dd)} & \colhead{(d)} &
\colhead{(arcsec)} & \colhead{} & \colhead{}
}
\startdata
2012-03-26 & 56012.997 & \sim 0.\arcsec5 & H$\alpha$ & NOT \\
2012-03-27 & 56013.944 & 1.\arcsec5 & grism & SMARTS \\
2012-03-28 & 56014.984 & \nodata & F814M & HST \\
2012-03-30 & 56016.978 & 1.\arcsec5\pm0.25 & B\&C & Bok \\
\enddata
\tablenotetext{a}{At exposure start.}
\tablecomments{The "C" command column identifier in the 3 column turns on
math mode for that specific column. One could do the same for the next
column so that dollar signs would not be needed for H$\alpha$
but then all the other text would also be in math mode and thus typeset
in Latin Modern math and you will need to put it back to Roman by hand.
Note that if you do change this column to math mode the dollar signs already
present will not cause a problem. Table \ref{tab:mathmode} is published 
in its entirety in the machine readable format.  A portion is
shown here for guidance regarding its form and content.}
\end{deluxetable*}

## Tables {#subsec:tables}

Tables can be constructed with \latex's standard table environment or the
\aastex's deluxetable environment. The deluxetable construct handles long
tables better but has a larger overhead due to the greater amount of
defined mark up used set up and manipulate the table structure.  The choice
of which to use is up to the author.  Examples of both environments are
used in this manuscript. Table \ref{tab:table} is a simple deluxetable
example that gives the approximate changes in the subscription costs and
author publication charges from 1991 to 2013.

Tables longer than 200 data lines and complex tables should only have a
short example table with the full data set available in the machine
readable format.  The machine readable table will be available in the HTML
version of the article with just a short example in the PDF. Authors are
required to indicate to the reader where the data can be obtained in the
table comments.  Suggested text is given in the comments of Table
\ref{tab:mathmode}.  Authors are encouraged to create their own machine
readable tables using the online tool at
<http://authortools.aas.org/MRT/upload.html>.

\aastex\ v6 introduces five new table features that are designed to make
table construction easier and the resulting display better for AAS Journal
authors.  The items are:

1. Declaring math mode in specific columns,

2. Column decimal alignment, 

3. Automatic column header numbering,

4. Hiding columns, and

5. Splitting wide tables into two or three parts.

Each of these new features are illustrated in following Table examples.
All five features work with the regular \latex\ tabular environment and in
\aastex's deluxetable environment.  The examples in this manuscript also
show where the two process differ.

### Column math mode

Both the \latex\ tabular and \aastex\ deluxetable require an argument to
define the alignment and number of columns.  The most common values are
"c", "l" and "r" for \underline{c}enter, \underline{l}eft, and
\underline{r}ight justification.  If these values are capitalized, e.g.
"C", "L", or "R", then that specific column will automatically be in math
mode meaning that \$s are not required.  Note that having embedded dollar
signs in the table does not affect the output.  The third and forth columns
of Table \ref{tab:mathmode} shows how this math mode works.

### Decimal alignment

Aligning a column by the decimal point can be difficult with only center,
left, and right justification options.  It is possible to use phantom calls
in the data, e.g. `\phn`, to align columns by hand but this can
be tedious in long or complex tables.  To address this \aastex\ introduces
the `\decimals` command and a new column justification option,
"D", to align data in that column on the decimal.  In deluxetable the
`\decimals` command is invoked before the `\startdata`
call but can be anywhere in \latex's tabular environment.  

Two other important thing to note when using decimal alignment is that each
decimal column \textit{must end with a space before the ampersand}, e.g.
"\&\&" is not allowed.  Empty decimal columns are indicated with a decimal,
e.g. ".".  Do not use deluxetable's `\nodata` command.

The "D" alignment token works by splitting the column into two parts on the
decimal.  While this is invisible to the user one must be aware of how it
works so that the headers are accounted for correctly.  All decimal column
headers need to span two columns to get the alignment correct. This can be
done with a multicolumn call, e.g `\multicolumn2c{}` or
`\multicolumn{2}{c}{}`, or use the new
`\twocolhead{}` command in deluxetable.  Since \latex\ is
splitting these columns into two it is important to get the table width
right so that they appear joined on the page.  You may have to run the
\latex\ compiler twice to get it right.  Table \ref{tab:decimal}
illustrates how decimal alignment works in the tabular environment with a
$\pm$ symbol embedded between the last two columns.

\setcounter{table}{2}
\begin{table}[h!]
\centering
\caption{Decimal alignment made easy} \label{tab:decimal}
\begin{tabular}{cD@{$\pm$}D}
\tablewidth{0pt}
\hline
\hline
Column & \multicolumn2c{Value} & \multicolumn2c{Uncertainty}\\
\hline
\decimals
A & 1234     & 100.0     \\
B &  123.4   &  10.1     \\
C &  12.34   &   1.01    \\
D &   1.234  &   0.101   \\
E &    .1234 &   0.01001 \\
F &   1.0    &    .      \\
\hline
\multicolumn{5}{c}{NOTE. - Two decimal aligned columns}
\end{tabular}
\end{table}

\subsubsection{Automatic column header numbering} \label{subsubsec:autonumber}

The command `\colnumbers` can be included to automatically number
each column as the last row in the header. Per the AAS Journal table format
standards, each column index numbers will be surrounded by parentheses. In
a \latex\ tabular environment the `\colnumbers` should be invoked
at the location where the author wants the numbers to appear, e.g. after
the last line of specified table header rows. In deluxetable this command
has to come before `\startdata`.  `\colnumbers` will
not increment for columns hidden by the "h" command, see Section
\ref{subsubsec:hide}.  Table \ref{tab:table} uses this command to
automatically generate column index numbers.

Note that when using decimal alignment in a table the command 
`\decimalcolnumbers` must be used instead of 
`\colnumbers` and `\decimals`. Table \ref{tab:messier}
illustrates this specific functionality.

### Hiding columns {#subsubsec:hide}

Entire columns can be \underline{h}idden from display simply by changing
the specified column identifier to "h".  In the \latex\ tabular environment
this column identifier conceals the entire column including the header
columns.   In \aastex's deluxetables the header row is specifically
declared with the `\tablehead` call and each header column is
marked with `\colhead` call.  In order to make a specific header
disappear with the "h" column identifier in deluxetable use 
`\nocolhead` instead to suppress that particular column header.

Authors can use this option in many different ways.  Since column data can
be easily suppressed authors can include extra information and hid it
based on the comments of co-authors or referees.  For wide tables that will
have a machine readable version, authors could put all the information in
the \latex\ table but use this option to hid as many columns as needed until
it fits on a page. This concealed column table would serve as the
example table for the full machine readable version.  Regardless of how
columns are obscured, authors are responsible for removing any unneeded
column data or alerting the editorial office about how to treat these
columns during production for the final typeset article.

Table \ref{tab:messier} provides some basic information about the first ten
Messier Objects and illustrates how many of these new features can be used
together.  It has automatic column numbering, decimal alignment of the
distances, and one concealed column.  The Common name column
is the third in the \latex\ deluxetable but does not appear when the article
is compiled. This hidden column can be shown simply by changing the "h" in
the column identifier preamble to another valid value.  This table also
uses `\tablenum` to renumber the table because a \latex\ tabular
table was inserted before it.

\begin{deluxetable*}{cchlDlc}
\tablenum{4}
\tablecaption{Fun facts about the first 10 messier objects\label{tab:messier}}
\tablewidth{0pt}
\tablehead{
\colhead{Messier} & \colhead{NGC/IC} & \nocolhead{Common} & \colhead{Object} &
\multicolumn2c{Distance} & \colhead{} & \colhead{V} \\
\colhead{Number} & \colhead{Number} & \nocolhead{Name} & \colhead{Type} &
\multicolumn2c{(kpc)} & \colhead{Constellation} & \colhead{(mag)}
}
\decimalcolnumbers
\startdata
M1 & NGC 1952 & Crab Nebula & Supernova remnant & 2 & Taurus & 8.4 \\
M2 & NGC 7089 & Messier 2 & Cluster, globular & 11.5 & Aquarius & 6.3 \\
M3 & NGC 5272 & Messier 3 & Cluster, globular & 10.4 & Canes Venatici &  6.2 \\
M4 & NGC 6121 & Messier 4 & Cluster, globular & 2.2 & Scorpius & 5.9 \\
M5 & NGC 5904 & Messier 5 & Cluster, globular & 24.5 & Serpens & 5.9 \\
M6 & NGC 6405 & Butterfly Cluster & Cluster, open & 0.31 & Scorpius & 4.2 \\
M7 & NGC 6475 & Ptolemy Cluster & Cluster, open & 0.3 & Scorpius & 3.3 \\
M8 & NGC 6523 & Lagoon Nebula & Nebula with cluster & 1.25 & Sagittarius & 6.0 \\
M9 & NGC 6333 & Messier 9 & Cluster, globular & 7.91 & Ophiuchus & 8.4 \\
M10 & NGC 6254 & Messier 10 & Cluster, globular & 4.42 & Ophiuchus & 6.4 \\
\enddata
\tablecomments{This table "hides" the third column in the \latex\ when compiled.
The Distance is also centered on the decimals.  Note that when using decimal
alignment you need to include the `\decimals` command before `\\startdata` and all of the values in that column have to have a space before the next ampersand.}
\end{deluxetable*}

\subsubsection{Splitting a table into multiple horizontal components}

Since the AAS Journals are now all electronic with no print version there is
no reason why tables can not be as wide as authors need them to be.
However, there are some artificial limitations based on the width of a
print page.  The old way around this limitation was to rotate into 
landscape mode and use the smallest available table font
sizes, e.g. `\tablewidth`, to get the table to fit.
Unfortunately, this was not alway enough but now along with the hide column
option outlined in Section \ref{subsubsec:hide} there is a new way to break
a table into two or three components so that it flows down a page by
invoking a new table type, splittabular or splitdeluxetable. Within these
tables a new "B" column separator is introduced.  Much like the vertical
bar option, "$\vert$", that produces a vertical table lines, e.g. Table
\ref{tab:table}, the new "B" separator indicates where to \underline{B}reak
a table.  Up to two "B"s may be included.

Table 5 % \ref{tab:deluxesplit} this freaks it out when it is used!
shows how to split a wide deluxetable into three parts with
the `\splitdeluxetable` command.  The `\colnumbers`
option is on to show how the automatic column numbering carries through the
second table component, see Section \ref{subsubsec:autonumber}.

The last example, Table \ref{tab:tablesplit}, shows how to split the same
table but with a regular \latex\ tabular call and into two parts. Decimal
alignment is included in the third column and the "Component" column is
hidden to illustrate the new features working together.

\begin{splitdeluxetable*}{lccccBcccccBcccc}
\tabletypesize{\scriptsize}
\tablewidth{0pt} 
\tablenum{5}
\tablecaption{Measurements of Emission Lines: two breaks \label{tab:deluxesplit}}
\tablehead{
\colhead{Model} & \colhead{Component}& \colhead{Shift} & \colhead{FWHM} &
\multicolumn{10}{c}{Flux} \\
\colhead{} & \colhead{} & \colhead{($\rm
km~s^{-1}$)}& \colhead{($\rm km~s^{-1}$)} & \multicolumn{10}{c}{($\rm
10^{-17}~erg~s^{-1}~cm^{-2}$)} \\
\cline{5-14}
\colhead{} & \colhead{} &
\colhead{} & \colhead{} & \colhead{Ly$\alpha$} & \colhead{N\,{\footnotesize
V}} & \colhead{Si\,{\footnotesize IV}} & \colhead{C\,{\footnotesize IV}} &
\colhead{Mg\,{\footnotesize II}} & \colhead{H$\gamma$} & \colhead{H$\beta$}
& \colhead{H$\alpha$} & \colhead{He\,{\footnotesize I}} &
\colhead{Pa$\gamma$}
} 
\colnumbers
\startdata 
{       }& BELs& -97.13 &    9117$\pm      38$&    1033$\pm      33$&$< 35$&$<     166$&     637$\pm      31$&    1951$\pm      26$&     991$\pm 30$&    3502$\pm      42$&   20285$\pm      80$&    2025$\pm     116$& 1289$\pm     107$\\ 
{Model 1}& IELs& -4049.123 & 1974$\pm      22$&    2495$\pm      30$&$<     42$&$<     109$&     995$\pm 186$&      83$\pm      30$&      75$\pm      23$&     130$\pm      25$& 357$\pm      94$&     194$\pm      64$& 36$\pm      23$\\
{       }& NELs& \nodata &     641$\pm       4$&     449$\pm 23$&$<      6$&$<       9$&       --            &     275$\pm      18$& 150$\pm      11$&     313$\pm      12$&     958$\pm      43$&     318$\pm 34$& 151$\pm       17$\\
\hline
{       }& BELs& -85 &    8991$\pm      41$& 988$\pm      29$&$<     24$&$<     173$&     623$\pm      28$&    1945$\pm 29$&     989$\pm      27$&    3498$\pm      37$&   20288$\pm      73$& 2047$\pm     143$& 1376$\pm     167$\\
{Model 2}& IELs& -51000 &    2025$\pm      26$& 2494$\pm      32$&$<     37$&$<     124$&    1005$\pm     190$&      72$\pm 28$&      72$\pm      21$&     113$\pm      18$&     271$\pm      85$& 205$\pm      72$& 34$\pm      21$\\
{       }& NELs& 52 &     637$\pm      10$&     477$\pm 17$&$<      4$&$<       8$&       --            &     278$\pm      17$& 153$\pm      10$&     317$\pm      15$&     969$\pm      40$&     325$\pm 37$&
     147$\pm       22$\\
\enddata
\tablecomments{This is an example of how to split a deluxetable. You can
split any table with this command into two or three parts.  The location of
the split is given by the author based on the placement of the "B"
indicators in the column identifier preamble.  For more information please
look at the new \aastex\ instructions.}
\end{splitdeluxetable*}

%\clearpage

\setcounter{table}{5}
\begin{table*}[h!]
\caption{Measurements of Emission Lines: one break\label{tab:tablesplit}}
\begin{splittabular}{lhDccccBccccccc}
%\multicolumn{5}{c}{Table 6} \\
%\multicolumn{5}{c}{Measurements of Emission Lines} \\
\hline 
\hline 
Model & Component & \multicolumn2c{Shift} & FWHM & 
\multicolumn{10}{c}{Flux} \\
 & & \multicolumn2c{($\rm km~s^{-1}$)} & {($\rm km~s^{-1}$)} & 
\multicolumn{10}{c}{($\rm 10^{-17}~erg~s^{-1}~cm^{-2}$)} \\
\cline{5-15}
 & & & & & {Ly$\alpha$} & {N\,{\footnotesize V}} & 
{Si\,{\footnotesize IV}} & {C\,{\footnotesize IV}} &
{Mg\,{\footnotesize II}} & {H$\gamma$} & {H$\beta$}
& {H$\alpha$} & {He\,{\footnotesize I}} & {Pa$\gamma$} \\
%\hline
\decimalcolnumbers
 & BELs& -97.13 &    9117$\pm      38$&    1033$\pm      33$&$< 35$&$<     166$&     637$\pm      31$&    1951$\pm      26$&     991$\pm 30$&    3502$\pm      42$&   20285$\pm      80$&    2025$\pm     116$& 1289$\pm     107$\\
Model 1 & IELs& -4049.123 & 1974$\pm      22$&    2495$\pm      30$&$<     42$&$<     109$&     995$\pm 186$&      83$\pm      30$&      75$\pm      23$&     130$\pm      25$& 357$\pm      94$&     194$\pm      64$& 36$\pm      23$\\
 & NELs& . &     641$\pm       4$&     449$\pm 23$&$<      6$&$<       9$&       --            &     275$\pm      18$& 150$\pm      11$&     313$\pm      12$&     958$\pm      43$&     318$\pm 34$& 151$\pm       17$\\
\hline
 & BELs& -85 &    8991$\pm      41$& 988$\pm      29$&$<     24$&$<     173$&     623$\pm      28$&    1945$\pm 29$&     989$\pm      27$&    3498$\pm      37$&   20288$\pm      73$& 2047$\pm     143$& 1376$\pm     167$\\
Model 2 & IELs& -51000 &    2025$\pm      26$& 2494$\pm      32$&$<     37$&$<     124$&    1005$\pm     190$&      72$\pm 28$&      72$\pm      21$&     113$\pm      18$&     271$\pm      85$& 205$\pm      72$& 34$\pm      21$\\
 & NELs& 52 &     637$\pm      10$&     477$\pm 17$&$<      4$&$<       8$&       --            &     278$\pm      17$& 153$\pm      10$&     317$\pm      15$&     969$\pm      40$&     325$\pm 37$& 147$\pm       22$\\
\hline
\end{splittabular}
\end{table*}

