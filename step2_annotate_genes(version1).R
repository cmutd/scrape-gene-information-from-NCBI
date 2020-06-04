rm(list=ls())

library(rvest) # Easily Harvest (Scrape) Web Pages
library(RCurl) # General Network (HTTP/FTP/...) Client Interface for R
library(stringr) # Simple, Consistent Wrappers for Common String Operations
library(XML) # Tools for Parsing and Generating XML Within R and S-Plus
library(clusterProfiler) # statistical analysis and visualization of functional profiles for genes and gene clusters 
library(org.Hs.eg.db) # Genome wide annotation for Human
library(tools) # Tools for Package Development


source("source.R")

genes <- read.table('gene_list.txt',header=T,sep='\t')
genes <- bitr(genes$SYMBOL, fromType="SYMBOL", toType="ENTREZID", OrgDb="org.Hs.eg.db")

genes$url <- paste("https://www.ncbi.nlm.nih.gov/gene/",genes$ENTREZID,sep=""); head(genes)

for(i in 1:nrow(genes)){

  doc <- getURL(genes[i,"url"])
  #cat("Successful responses\n")
  
  
  html_txt1 = htmlParse(doc, asText = TRUE)
  

  genes[i,"FullName"] <- dealNodeTxt(getNodesTxt(html_txt1,'//*[@id="summaryDl"]/dd[2]/text()'))
  #cat("writing Symbol\n")
  
  
  genes[i,"HGNC_ID"] <- str_replace_all(dealNodeTxt(getNodesTxt(html_txt1,'//*[@id="summaryDl"]/dd[3]/a')),"HGNC|:","")
  #cat("writing HGNC_ID\n")
  
  

  genes[i,"GeneType"] <- toTitleCase(dealNodeTxt(getNodesTxt(html_txt1,'//*[@id="summaryDl"]/dd[5]/text()')))
  #cat("writing GeneType\n")
  
  

  genes[i,"Summary"] <- ifelse(length(getNodesTxt(html_txt1,'//*[@id="summaryDl"]/dd[10]/text()'))!=0,getNodesTxt(html_txt1,'//*[@id="summaryDl"]/dd[10]/text()'),NA)
  #cat("writing Summary\n")
  
  genes[i,"Alias"] <-  str_replace_all(dealNodeTxt(getNodesTxt(html_txt1,'//*[@id="summaryDl"]/dd[9]'))," ","")
  #cat("writing Summary\n")
  
  genes[i, "cyto"] <- dealNodeTxt(getNodesTxt(html_txt1,'//*[@id="padded_content"]/div[6]/div[2]/div[2]/div/div/div[1]/dl/dd/span'))
  #cat("writing cyto\n")
  
  genes[i,"Exon Count"] <- dealNodeTxt(getNodesTxt(html_txt1,'//*[@id="padded_content"]/div[6]/div[2]/div[2]/div/div/dl/dd'))
  genes[i,"Chr_hg38"] <- getNodesTxt(html_txt1,'//*[@id="genomic-context-tbl-location"]//tbody/tr[1]/td[4]')
  
  tmp_hg38 <- sapply(strsplit(getNodesTxt(html_txt1,'//*[@id="genomic-context-tbl-location"]//tbody/tr[1]/td[5]'),split="[()]"),'[[',2)
  
  genes[i,"hg38_start"] <-  sapply(strsplit(tmp_hg38,"\\.."),'[[',1)
  genes[i,"hg38_end"] <- gsub(", complement","",sapply(strsplit(tmp_hg38,"\\.."),'[[',2))
  
  genes[i,"Chr_hg37"] <- getNodesTxt(html_txt1,'//*[@id="genomic-context-tbl-location"]//tbody/tr[2]/td[4]')
  
  tmp_hg37 <- sapply(strsplit(getNodesTxt(html_txt1,'//*[@id="genomic-context-tbl-location"]//tbody/tr[2]/td[5]'),split="[()]"),'[[',2)
  
  genes[i,"hg37_start"] <-  sapply(strsplit(tmp_hg37,"\\.."),'[[',1)
  genes[i,"hg37_end"] <- gsub(", complement","",sapply(strsplit(tmp_hg37,"\\.."),'[[',2))
  #cat("writing genomic location\n")
  
  print(paste("Completed",i,"genes！"))
  
}
write.csv(genes,"gene_information.csv",row.names = F)
