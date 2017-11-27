library("edgeR")
counts = readDGE(samples$countf)$counts
noint = rownames(counts) %in%
        c("no_feature","ambiguous","too_low_aQual",
          "not_aligned","alignment_not_unique")
cpms = cpm(counts)
keep = rowSums(cpms>1)>=3 & !noint
counts = counts[keep,]
colnames(counts) = samples$shortname
head( counts[,order(samples$condition)], 5 )
d = DGEList(counts=counts, group=samples$condition)
d = calcNormFactors(d)
d$samples
plotMDS(d, labels=samples$shortname,
        col=c("darkgreen","blue")[factor(samples$condition)])

d = estimateCommonDisp(d)
d = estimateTagwiseDisp(d)
plotMeanVar(d, show.tagwise.vars=TRUE, NBline=TRUE)
plotBCV(d)
de = exactTest(d, pair=c("CTL","KD"))
tt = topTags(de, n=nrow(d))
head(tt$table)
nc = cpm(d, normalized.lib.sizes=TRUE)
rn = rownames(tt$table)
head(nc[rn,order(samples$condition)],5)
deg = rn[tt$table$FDR < .05]
plotSmear(d, de.tags=deg)
write.csv(tt$table, file="toptags_edgeR.csv")
