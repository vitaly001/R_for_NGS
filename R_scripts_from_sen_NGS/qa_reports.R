# add column with list of files to each condition
rw= list.files(path= '/Volumes/HD2/GudkovRS', pattern="RS")

       
for(i in rw) {
        fqQC = qa(dirPath=i, pattern=".fastq$", type="fastq")
        report(fqQC, type="html", dest=paste0("fastqQAreport","-", i, collapse=""))
        }
