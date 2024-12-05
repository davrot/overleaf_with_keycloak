#!/usr/bin/bash 
filename="AuthenticationController.js"
patch -R --verbose ${filename} ${filename}_5.1.1.diff
