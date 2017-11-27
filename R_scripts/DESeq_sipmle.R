samplesDESeq = with(samples, data.frame(
        shortname = I(conditions),
        countf = I(countf),
        condition = conditions,
        LibraryLayout = LibraryLayout))

library("DESeq")

cds = newCountDataSetFromHTSeqCount(samplesDESeq)
cds = estimateSizeFactors(cds, method='pooled-CR')
sizeFactors(cds)
cdsB = estimateDispersions(cds, method='pooled-CR')
vsd = varianceStabilizingTransformation(cdsB)
p = plotPCA(vsd, intgroup=c("condition","LibraryLayout"))
cds = estimateDispersions(cds, method='pooled-CR')
plotDispEsts(cds)
res = nbinomTest(cds,"NT","LPS")
plotMA(res)
resSig = res[which(res$padj < 0.1),]
head( resSig[ order(resSig$log2FoldChange, decreasing=TRUE), ] )
head( resSig[ order(resSig$log2FoldChange, decreasing=FALSE), ] )
table( res$padj < 0.1 )
write.csv(res, file="res_DESeq.csv")
hist(res$pval, breaks=100)
