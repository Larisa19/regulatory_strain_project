#!/bin/bash

GENES="../results/ecoli_genes.txt"
OUTPUT="../results/ecoli_summary.txt"

# Header
echo -e "Gene\tProduct\tVirulence?" > $OUTPUT

# Loop through genes
while IFS=$'\t' read -r gene product; do
    # Skip header
    if [[ "$gene" == "Gene" ]]; then
        continue
    fi
    # Check for virulence keywords
    if echo "$product" | grep -iqE "toxin|fimbriae|hemolysin|flagellin|adhesion"; then
        vir="Yes"
    else
        vir="No"
    fi
    echo -e "$gene\t$product\t$vir" >> $OUTPUT
done < "$GENES"

echo "Summary table saved to $OUTPUT"
