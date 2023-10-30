#!/bin/bash

OLD_IFS=$IFS
beast="Cosmoscarta"
db="nucleotide"
efetchstuff=$(wget -qO- "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=nucleotide&term=Cosmoscarta&usehistory=y" | grep -E  "QueryKey|WebEnv")
IFS="\><"
query_key=$(echo ${efetchstuff} | awk '{print $(NF-5)}');
web_env=$(echo ${efetchstuff} | awk '{print $(NF-2)}');
wget -qO cosmoscarta_sequences.fasta "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=${db}&query_key=${query_key}&WebEnv=${web_env}&rettype=fasta&retmode=text"
echo "Number of sequences is " $(grep -c ">" cosmoscarta_sequences.fasta);
IFS=$OLD_IFS
