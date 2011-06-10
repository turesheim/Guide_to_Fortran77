#!/bin/bash
# We should be using PNG images. But there appears to be a bug in netpbm that
# produces no images at all when in this mode.
rm -rf prof77
latex2html -split=+1 -link=0 -no_navigation -noaddress \
	-html_version 4.0,unicode -image_type=gif prof77.tex

# Attempt to clean up some more mess
tidy -clean -utf8 -asxhtml -m prof77/*.html

# Remove <hr /> at the end of each chapter
sed -i .backup -e 's/<hr \/>//g' prof77/*.html

# Fix bad quotes
sed -i .backup -e "s/\'\'/\&quot;/g" prof77/*.html
sed -i .backup -e "s/\`\`/\&quot;/g" prof77/*.html

# Headers
sed -i .backup -e "s/><a name=\"SECTION.*/ id=/g" prof77/*.html
sed -i .backup -e "s/<\/a><\/h/<\/h/g" prof77/*.html

