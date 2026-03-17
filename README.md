# Regulatory Strain Project

This is a mini-project to explore and analyze the genome of *Escherichia coli* K-12 using command-line bioinformatics tools.

##Project Objectives

1. Explore and organize bacterial genome sequences (FASTA and GenBank files)
2. Calculate genome statistics (length, GC content)
3. Extract coding sequences (CDS) and annotate genes
4. Identify potential virulence genes
5. Generate summary tables suitable for regulatory reporting
6. Document the workflow for reproducibility and clarity


## Project Structure

regulatory-strain-project/
│
├── data/ # Genome files (FASTA/GenBank)
├── scripts/ # Scripts to process sequences
├── results/ # Output tables and summaries
├── README.md # Project description (this file)
└── requirements.txt # Optional: dependencies

## How to Run

**I. Genome Exploration (FASTA)**

1. Open the terminal and go to the 'scripts/' folder:
   ```bash
   cd scripts
2. Make the script executable:
   chmod +x read_fasta.sh
3.  Run the script:
   ./read_fasta.sh
4. Check the output in the 'results/' folder.
   - This includes genome lenght and CG content.

**II. Extract coding sequences (CDS) from GenBank**

5. Place the GeneBanck file in 'data/' folder.
   Example data/ecoli_k12.gb
6. Verify the file contains CDS entries:
   ```bash
   head -n 20 data/ecoli_k12.gb
7. Extract gene names and products into a table:
   ./extract_genes.sh
8. Check the output in the results/ folder:
   File: results/ecoli_genes.txt
   Format: Gene | Product
   Note: The script will remove the duplicates for clarity.

**III. Identify Potential Virulence Genes**

9. Search for virulence-related genes in the gene table:
grep -i -E "toxin|fimbriae|hemolysin|flagellin|adhesion" ../results/ecoli_genes.txt > ../results/ecoli_virulence_genes.txt

10. Check the output in results/ecoli_virulence_genes.txt
   Contains genes whose products match common virulence keywords.

IV. Generate a summary table of the virulense found genes
   
11. Run the script ./generate_summary.sh
12. Check the resulta table 
    cat ../results/ecoli_summary.txt | head -n 10


**IV. Workflow Overview**

This workflow demonstrates a basic regulatory strain analysis using *E. coli* K-12 as an example.

1. **Genome Exploration (FASTA)**
   - Calculate genome length and GC content using `read_fasta.sh`.
2. **Gene Extraction (GenBank)**
   - Extract CDS, gene names, and products using `extract_genes.sh`.
3. **Virulence Gene Identification**
   - Filter genes using common virulence keywords (`toxin`, `fimbriae`, `hemolysin`, `flagellin`, `adhesion`) with `grep`.
4. **Summary Table Generation**
   - Generate a summary table (`ecoli_summary.txt`) with `Gene`, `Product`, and `Virulence?` columns using `generate_summary.sh`.

**V. Regulatory Relevance**

This project simulates a simplified strain safety assessment workflow based on genomic data.

The generated outputs (gene annotations and virulence screening) resemble the type of information required for:
- microbial risk assessment
- regulatory documentation
- biosafety evaluation of production strains

This approach demonstrates how bioinformatics pipelines can support regulatory decision-making.
