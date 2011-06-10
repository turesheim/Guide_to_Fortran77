#!/bin/bash
# We should be using PNG images. But there appears to be a bug in netpbm that
# produces no images at all when in this mode.
rm -rf prof77
latex2html -split=+1 -html_version 3.2,unicode -image_type=gif prof77.tex

# Attempt to clean up some more mess
tidy -config tidy.txt -m prof77/*.html

# Remove <hr /> at the end of each chapter
#sed -i .backup -e 's/<hr \/>//g' prof77/*.html

# Fix bad quotes
#sed -i .backup -e "s/\'\'/\&quot;/g" prof77/*.html
#sed -i .backup -e "s/\`\`/\&quot;/g" prof77/*.html

# Fix headers
sed -i .backup -e "s/><a name=\"SECTION.*/ id=/g" prof77/*.html
sed -i .backup -e "s/<\/a><\/h/<\/h/g" prof77/*.html

# Various HTML
sed -i .backup -e "s/<br clear=\"all\" \/>/<br\/>/g" prof77/*.html
