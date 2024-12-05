#!/usr/bin/bash 
filename="LatexRunner.js"
patch -R --verbose ${filename} ${filename}_5.1.1.diff
