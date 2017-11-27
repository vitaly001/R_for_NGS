for(i in seq_len(nrow(samples))) {
        lib = samples$LibraryName[i]
        ob = file.path(lib, "accepted_hits.bam")
        # sort by name, convert to SAM for htseq-count
        cat(paste0("samtools sort -n ",ob," ",lib,"_sn"),"\n")
        cat(paste0("samtools view -o ",lib,"_sn.sam ",lib,"_sn.bam"),"\n")
        # sort by position and index for IGV
        cat(paste0("samtools sort ",ob," ",lib,"_s"),"\n")
        cat(paste0("samtools index ",lib,"_s.bam"),"\n\n")
}
