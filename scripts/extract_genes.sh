#!/bin/bash

#Script that extracts the CDS genes from bacteria fasta file.

GENBANK="../data/ecoli_k12.gb"
OUTPUT="../results/ecoli_genes.txt"

echo -e "Gene\tProduct" > $OUTPUT

awk '
/\/gene=/ {gene=$0; gsub(/.*\/gene="/,"",gene); gsub(/"/,"",gene)}
/\/product=/ {product=$0; gsub(/.*\/product="/,"",product); gsub(/"/,"",product); print gene "\t" product}
' $GENBANK | sort | uniq >> $OUTPUT

echo "Gene list saved to $OUTPUT (duplicates removed)"
