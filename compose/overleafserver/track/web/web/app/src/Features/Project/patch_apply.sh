#!/usr/bin/bash 
filename="ProjectEditorHandler.js"
patch -R --verbose ${filename} ${filename}_5.1.1.diff
