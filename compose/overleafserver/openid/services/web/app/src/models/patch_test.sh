#!/usr/bin/bash 
filename="User.js"
patch -R --dry-run --verbose ${filename} ${filename}_5.1.1.diff
