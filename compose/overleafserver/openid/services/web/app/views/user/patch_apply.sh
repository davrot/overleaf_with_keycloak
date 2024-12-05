#!/usr/bin/bash 
filename="login.pug"
patch -R --verbose ${filename} ${filename}_5.1.1.diff
