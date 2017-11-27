samplesDESeq = with(samples, data.frame(
        shortname = I(shortname),
        countf = I(countf),
        condition = condition,
        LibraryLayout = LibraryLayout))

library("DESeq")

cds = newCountDataSetFromHTSeqCount(samplesDESeq)
cds = estimateSizeFactors(cds)
sizeFactors(cds)
cdsB = estimateDispersions(cds, method="blind")
vsd = varianceStabilizingTransformation(cdsB)
p = plotPCA(vsd, intgroup=c("condition","LibraryLayout"))
cds = estimateDispersions(cds, method = "pooled-CR",
                          modelFormula = count ~ LibraryLayout + condition)
fit1 = fitNbinomGLMs(cds, count ~ LibraryLayout + condition)
fit0 = fitNbinomGLMs(cds, count ~ LibraryLayout)
pval = nbinomGLMTest(fit1, fit0)
padj = p.adjust(pval, method="BH")
res = cbind(fit1, pval=pval, padj=padj)
resSig = res[which(res$padj < 0.1),]
head( resSig[ order(resSig$conditionKD, decreasing=TRUE), ] )
head( resSig[ order(resSig$conditionKD, decreasing=FALSE), ] )
table( res$padj < 0.1 )
write.csv(res, file="res_DESeq1.csv")
hist(res$pval, breaks=100)
