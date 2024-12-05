#!/usr/bin/bash 
filename="router.js"
patch -R --verbose ${filename} ${filename}_5.1.1.diff
