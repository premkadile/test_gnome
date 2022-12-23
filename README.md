GATEkeeper: Genome Alignment, Tracking and Evlutionary Analysis of COVID-19 Virus
===================

Developers: Dr. Yong Chen, Rowan University

# Introduction

GATEkeeper is an effective pipeline to detect and annotate mutations. Based on large number of sequenced COVID-19 genomes, GATkepper pipeline provides a useful tool for deep analysis of virus mutations, mutation tracing and statistical analysis.

# Download
## Github
  ```
  $ git clone https://github.com/chenyongrowan/GATEkeeper.git
  ```
to download the package of GATEkeeper.

# Requirements
BWA (http://bio-bwa.sourceforge.net/). BWA is a software package for mapping low-divergent sequences against a large reference genome, e.g. aligning sequencing reads against the human genome. You need to install it first. The Anacoda-based installation is recommendated.
 
```
$ conda install -c bioconda bwa
 ```
 
There are many other ways to install, please go to https://github.com/lh3/bwa for more details.

# Compiling

To compile GATEkeeper and the index tool, please change to GATEkeeper's folder and just type 'make' to compile GATEkeeper and bwt_index. If the compilation or the programs fail, please contact me (chenyong@rowan.edu).

 ```
$ make
 ```
You may run ./run_test.sh to test GATEkeeper with two E.coli strains.
 ```
$ sh run_test.sh
 ```
 
OR
You may run ./run_test_COVID.sh to test GATEkeeper with two COVID_19 virus strains.
 ```
$sh run_test_COVID.sh
 ```
# Instructions

To index a reference genome, GATEkeeper requires the target genome file (in fasta format) and the prefix of the index files (including the directory path).

  ```
  $ bin/bwt_index ref_file[ex. ecoli.fa] index_prefix[ex. ecoli]
  ```
or

  ```
  $ bin/GATEkeeper index ref_file[ex. ecoli.fa] index_prefix[ex. ecoli]
  ```

The above command is to index the genome file Ecoli.fa and store the index files begining with ecoli.
If the index files are not mdade beforehand, GATEkeeper will generate index files istself with the given reference genome sequences.

To align two genome sequences, GATEkeeper requires two genome files (in fasta format)

  ```
  $ bin/GATEkeeper -r fa1 -q fa2 -o output
  ```
or with a pre-built index file

  ```
  $ bin/GATEkeeper -i idx_prefix -q fa2 -o output
  ```


# File formats

- Reference and query genome files

    Both the reference genome and query genome files should be in FASTA format.

- Output file

	1. maf/aln file: it shows the pairwise alignments between two sequences (MAF/ALN format).
	2. vcf file: it shows sequence variants between two sequences (VCF format).
	3. ps  file: it shows dotplot between two sequences (gnuplot is required).

# Parameter setting

 ```
-t INT number of threads [8]

-i STR index prefix [BWT based (BWA)]

-r STR reference genome filename [fasta]

-q STR query genome filename [fasta]

-o STR prefix of output files [output]

-sen Sensitive mode [False]

-dp Output Dot-plots [false]. It may not work on MacOS.

-gp STR specify the path of gnuplot, ex: -gp /usr/bin/gnuplot

-fmt INT Set the output format [1]: 1:maf, 2:aln

-idy set the minimal sequnce identity [70]

-one set one on one aligment mode [false] (This option forces the query
sequence is only allowed to be aligned at most one position).

-unique Only output unique alignment [false]

-slen set the minimal seed length [15]. To compare two sequences of less similarity, please use smaller size seed length.

-alen set the minimal alignment length [5000]

-ind set the maximal indel size [25]. The maximal sigle indel size allowed in an alignment.

-clr set the minimal cluster size [250]. A cluster is a group of seeds, and  cluster size is the total length of its seeds. This value can filter out random clusters.

-no_vcf No VCF output [false]. Do not identify sequence variations.

  ```
