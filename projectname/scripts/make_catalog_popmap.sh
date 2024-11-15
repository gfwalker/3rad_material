#!/usr/bin/bash

cat lib2_popmap.txt | grep GAL | shuf -n 20 > lib2_catalog_popmap.txt
cat lib2_popmap.txt | grep FLA | shuf -n 20 >> lib2_catalog_popmap.txt
cat lib2_popmap.txt | grep SEY | shuf -n 20 >> lib2_catalog_popmap.txt
