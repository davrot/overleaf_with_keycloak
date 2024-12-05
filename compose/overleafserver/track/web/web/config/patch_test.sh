#!/usr/bin/bash 
filename="settings.defaults.js"
patch -R --dry-run --verbose ${filename} ${filename}_5.1.1.diff
