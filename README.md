# pandocco

> simple PDF output for docco

Just an example script and templates.

- [docco][] + plain-markdown template
- [pandoc][] + pandocco latex template


## How does it work?

The example script checks out some git repos. Some are for the needed tempate, some are just example content.

1. **Covert the source code to markdown** (`docco`)  
   - `docco` converts your source code by seperating the code (the programm) from the comments
     - code is outputed in HTML `<pre>` elements (plus syntax higlighting etc)
     - the comments are seperated, the comment markers (like `#` and `//`) are removed and run through a markdown to HTML converter
   - since `docco` originally generates HTML (already converting the markdown), I made a very minimal template which outputs just plain markdown.
     - the code is just put into <kbd>```</kbd> "code fences", which are supported by pandoc (and github!)
     - the comments just have their marker removed and are otherwise untouched (since markdown conversion is handled by pandoc)

2. **Convert the generated markdown to PDF**
   - `pandoc` can output to not just HTML, but also LaTeX and directly to PDF (you'll still need a LaTeX installation, for the minimum ask your package manager for `pdflatex`.)
   - there are lots of options and flags, you can use the example script as a starting point


## examples:
- [docco.pdf](http://code.papermill.in/pandocco/examples/docco.pdf)
- [backbone.pdf](http://code.papermill.in/pandocco/examples/backbone.pdf)
- coffeescript's [scope.js](http://code.papermill.in/pandocco/examples/scope.pdf)
- [underscore.pdf](http://code.papermill.in/pandocco/examples/underscore.pdf)

## Screenshot

---

![docco.pdf screenshot](http://code.papermill.in/pandocco/examples/docco-screenshot.png)

---

## bonus:
- [underscore.epub](http://code.papermill.in/pandocco/examples/underscore.epub)
- [underscore.latex.txt](http://code.papermill.in/pandocco/examples/underscore.latex.txt)
- [underscore.asciidoc.txt](http://code.papermill.in/pandocco/examples/underscore.asciidoc.txt)
- [underscore.mediawiki.txt](http://code.papermill.in/pandocco/examples/underscore.mediawiki.txt)


[docco]: https://github.com/jashkenas/docco
[pandoc]: http://johnmacfarlane.net/pandoc/README.html
