sri$LibraryName = gsub("S2_DRSC_","",sri$LibraryName) # trim label
samples = unique(sri[,c("LibraryName","LibraryLayout")])
for(i in seq_len(nrow(samples))) {
        rw = (sri$LibraryName==samples$LibraryName[i])
        if(samples$LibraryLayout[i]=="PAIRED") {
                samples$fastq1[i] = paste0(sri$Run[rw],"_1.fastq",collapse=",")
                samples$fastq2[i] = paste0(sri$Run[rw],"_2.fastq",collapse=",")
        } else {
                samples$fastq1[i] = paste0(sri$Run[rw],".fastq",collapse=",")
                samples$fastq2[i] = ""
        }
}
#Add important or descriptive columns to the metadata table (here, experimental group- ings are set based on the “LibraryName” column, and a label is created for plotting)

samples$condition = "CTL"
samples$condition[grep("RNAi",samples$LibraryName)] = "KD"
samples$shortname = paste( substr(samples$condition,1,2),
                           substr(samples$LibraryLayout,1,2),
                           seq_len(nrow(samples)), sep=".")
