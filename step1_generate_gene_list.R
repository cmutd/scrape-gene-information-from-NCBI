rm(list=ls())

library(rvest) # Easily Harvest (Scrape) Web Pages
library(RCurl) # General Network (HTTP/FTP/...) Client Interface for R
library(clusterProfiler) # statistical analysis and visualization of functional profiles for genes and gene clusters

options(stringsAsFactors = F)


# The second table contains tumor suppressor genes 
Suppressor_table<- html_table(read_html("https://www.cancerquest.org/cancer-biology/cancer-genes"),header=T)[[2]]

genes <- Suppressor_table$`Tumor Suppressor`[c(1,3,4,7:10,12,14:16)]
genes <- bitr(genes, fromType="SYMBOL", toType="ENTREZID", OrgDb="org.Hs.eg.db")
genes$url <- paste0("https://www.ncbi.nlm.nih.gov/gene/",genes$ENTREZID)
write.table(genes,"gene_list.txt",row.names = F,quote=F,sep='\t')
