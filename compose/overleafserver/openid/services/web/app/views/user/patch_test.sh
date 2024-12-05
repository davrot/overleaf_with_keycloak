#!/usr/bin/bash 
filename="login.pug"
patch -R --dry-run --verbose ${filename} ${filename}_5.1.1.diff
