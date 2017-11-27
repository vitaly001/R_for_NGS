#Align the reads (using tophat2) to reference genome
#Using R string manipulation, construct the Unix commands to call tophat2

gf = "Drosophila_melanogaster.BDGP5.70.gtf"
bowind = "Dme1_BDGP5_70"
cmd = with(samples,
           paste("tophat -G", gf, "-p 5 -o", LibraryName, bowind,
                 fastq1, fastq2))
cmd
