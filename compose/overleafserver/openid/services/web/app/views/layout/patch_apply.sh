#!/usr/bin/bash 
filename="navbar-marketing-bootstrap-5.pug"
patch -R --verbose ${filename} ${filename}_5.1.1.diff

filename="navbar-marketing.pug"
patch -R --verbose ${filename} ${filename}_5.1.1.diff

filename="navbar-website-redesign.pug"
patch -R --verbose ${filename} ${filename}_5.1.1.diff
