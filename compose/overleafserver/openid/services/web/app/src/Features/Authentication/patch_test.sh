#!/usr/bin/bash 
filename="AuthenticationController.js"
patch -R --dry-run --verbose ${filename} ${filename}_5.1.1.diff
