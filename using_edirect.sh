#!/bin/bash

esearch -db nucleotide -query "Cosmoscarta[organism]" | efetch -format fasta > Cosmoscarta.nuc.fa;
head -5 Cosmoscarta.nuc.fa
