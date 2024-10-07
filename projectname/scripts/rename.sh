#!/usr/bin/bash

for f in *.1.*; do echo mv "$f" "${f/"Part to remove"/"Part to replace with"}"; done
