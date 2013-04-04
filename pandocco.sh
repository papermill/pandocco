#!/bin/sh

# simple PDF output with 
# - docco + plain-markdown template
# - pandoc + pandocco latex template

#
# # DEMO: 
#

mkdir -p /tmp/p

git clone --depth=1 https://gist.github.com/5293300.git /tmp/p/pandocco
git clone --depth=1 git://github.com/eins78/docco.git /tmp/p/docco
git clone --depth=1 git://github.com/eins78/underscore.git /tmp/p/underscore
git clone --depth=1 git://github.com/documentcloud/backbone.git /tmp/p/backbone
git clone --depth=1 git://github.com/jashkenas/coffee-script.git /tmp/p/coffeescript

cd /tmp/p

docco -t /tmp/p/pandocco/docco.jst \
  docco/docco.litcoffee \
  coffeescript/src/scope.litcoffee \
  underscore/underscore.js \
  backbone/backbone.js

NAME="J. Ashkenas"
DOCS="docco scope underscore backbone"

for DOC in $DOCS ; do
  
  echo "making PDF: $DOC"
  
  pandoc \
    -f markdown --standalone \
    --template="/tmp/p/pandocco/pandocco.latex" \
    --table-of-contents \
    --listings --chapters \
    -V links-as-notes \
    -V documentclass="report" \
    -V title="$DOC.js" \
    -V author="$NAME" \
    -V date="$(date +%d-%m-%Y)" \
    -o "docs/$DOC.pdf" \
    "docs/$DOC.html" \
      && \
      if [[ $(uname) == "Darwin" ]]; then
        open "docs/$DOC.pdf"
      fi
done

# further option: -V colors

#
# # PLUG:
#
# Trust me, it does not make sense to go much further in shell.
# I did, and I am currently rewriting everything from scratch (in nodejs).
# It is supposed to make scripts like this obsolete.
# Think Makefile+package.json for documents, (scientific) papers, books, etc..
# See <http://github.com/papermill>.

