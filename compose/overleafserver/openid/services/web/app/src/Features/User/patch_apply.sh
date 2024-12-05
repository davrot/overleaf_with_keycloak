#!/usr/bin/bash 
filename="UserPrimaryEmailCheckHandler.js"
patch -R --verbose ${filename} ${filename}_5.1.1.diff
