#!/bin/sh
# Copies the PDF CV (rendered by cv/cv.qmd, by default into _site/cv/) to its
# public download location, both in the project root (so it's committed
# alongside the rest of the source) and in _site (since project resource
# copying already happened before post-render scripts run). Leaves the
# original in place -- quarto's own post-render bookkeeping expects it to
# still be there, and removing/moving it caused a "stat ... NotFound" error
# from quarto itself, not from this script.
set -e

SRC="_site/cv/Srikrishnan-CV.pdf"

if [ -f "$SRC" ]; then
  mkdir -p assets/pdf
  cp "$SRC" assets/pdf/Srikrishnan-CV.pdf
  mkdir -p _site/assets/pdf
  cp "$SRC" _site/assets/pdf/Srikrishnan-CV.pdf
fi
