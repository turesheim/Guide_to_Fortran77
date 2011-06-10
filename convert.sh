#!/bin/bash
# We should be using PNG images. But there appears to be a bug in netpbm that
# produces no images at all when in this mode.
rm -rf prof77
latex2html -split=+1 -link=0 -no_navigation -noaddress \
	-html_version 4.0,unicode -image_type=gif prof77.tex
tidy -clean -utf8 -asxhtml -m prof77/*.html
#sed "s/\`\`//g" prof77/*html
