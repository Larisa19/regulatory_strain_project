#!/bin/bash

#Description: "Script that gives a summary strain" the output is a text file.

FASTA="../data/ecoli_k12.fasta"
OUTPUT="../results/ecoli_summary.txt"

echo "First 3 lines of the FASTA file:" > $OUTPUT
head -n 3 $FASTA >> $OUTPUT

echo "" >> $OUTPUT
echo "Number of sequences in the FASTA:" >> $OUTPUT
grep -c ">" $FASTA >> $OUTPUT

echo "" >> $OUTPUT
echo "Sequence length and GC content:" >> $OUTPUT
seqtk comp $FASTA >> $OUTPUT

echo "Output saved to $OUTPUT"
