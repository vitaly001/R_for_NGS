samples$countf = paste(samples$LibraryName, "count", sep=".") #update metadata table, add column countf to sample and fill with names from LibraryName columns with extension .count
gf = "Drosophila_melanogaster.BDGP5.70.gtf" # create variable containing name of file with reference genome
cmd = paste0("/Library/Frameworks/Python.framework/Versions/2.7/bin/htseq-count -s no -a 10 ", samples$LibraryName, "_sn.sam ",
             gf," > ", samples$countf) # generate UNIX commands for HTSeq

cmd #print commands to console 

#option -s signifies that the data is not from a stranded protocol (this may vary by experiment) and the -a option specifies a minimum score for the alignment quality.

#for differential expression analysis with edgeR, follow option A for simple designs and option B for complex designs; for differential expression analysis with DESeq, follow option C for simple designs and option D for complex designs.
