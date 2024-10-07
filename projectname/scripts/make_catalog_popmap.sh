#!/usr/bin/bash

cat schh_popmap.txt | grep GAL | shuf -n 20 > catalog_popmap.txt
cat schh_popmap.txt | grep FLA | shuf -n 20 >> catalog_popmap.txt
cat schh_popmap.txt | grep SEY | shuf -n 20 >> catalog_popmap.txt
#awk '{print $1".1\t"$2}' subsample_popmap.txt > catalog_popmap.txt
