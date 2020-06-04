rm(list=ls())

library(rvest) # Easily Harvest (Scrape) Web Pages
library(RCurl) # General Network (HTTP/FTP/...) Client Interface for R

options(stringsAsFactors = F)


# The second table contains tumor suppressor genes 
Suppressor_table<- html_table(read_html("https://www.cancerquest.org/cancer-biology/cancer-genes"),header=T)[[2]]

genes <- data.frame(SYMBOL=Suppressor_table[c(1,3,4,7:10,12,14:16),"Tumor Suppressor"])
write.table(genes,"gene_list.txt",row.names = F,quote=F,sep='\t')
