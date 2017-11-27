dat_IR$countf = paste(dat_IR$LibraryName, "count", sep=".") #update metadata table, add column countf to sample and fill with names from LibraryName columns with extension .count
gf = "/Volumes/HD2/Homo_sapiens_NCBI_GRCh38/Homo_sapiens/NCBI/GRCh38/Annotation/Genes/genes.gtf" # create variable containing name of file with reference genome
cmd = paste0("/Library/Frameworks/Python.framework/Versions/2.7/bin/htseq-count -s no -a 10 ", dat_IR$LibraryName, "_sn.sam ", gf," > ", dat_IR$countf) # generate UNIX commands for HTSeq

cmd #print commands to console 
for(c in cmd) system(c)
#option -s signifies that the data is not from a stranded protocol (this may vary by experiment) and the -a option specifies a minimum score for the alignment quality.

#for differential expression analysis with edgeR, follow option A for simple designs and option B for complex designs; for differential expression analysis with DESeq, follow option C for simple designs and option D for complex designs.
