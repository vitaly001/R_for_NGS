setwd('Users/Vitaly/Desktop/data_rna_seq')
sri = read.csv("SraRunInfo.csv", stringsAsFactors=FALSE) #from http://www.ncbi.nlm.nih.gov/sra?term=SRP001537 (the entire experiment corresponding to GEO accession GSE18508), users can download a table of the metadata into a comma-separated tabular file “SraRunInfo.csv”. This file should be in working directory
keep = grep("CG8144|Untreated-",sri$LibraryName) #select only fiels names with given characters in names (words)
sri = sri[keep,] #select rows from a table with given names
stopifnot( all(file.exists(fs)) )  # assure FTP download was successful

for(f in fs) {
        cmd = paste("/Users/Vitaly/sratoolkit/bin/fastq-dump --split-3", f) #onvert the example data to FASTQ, use the fastq-dump command from the SRA Toolkit on each SRA file.
        cat(cmd,"\n") 
        system(cmd) # invoke command
}
