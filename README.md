# scrape-gene-information-from-NCBI

## xpath
* Official Symbol //*[@id="summaryDl"]/dd[1]/text()
* Official Full name//*[@id="summaryDl"]/dd[2]/text()
* Gene type //*[@id="summaryDl"]/dd[5]
* Summary //*[@id="summaryDl"]/dd[10]
* Alias //*[@id="summaryDl"]/dd[9]
* Cytogenetic location //*[@id="padded_content"]/div[6]/div[2]/div[2]/div/div/div[1]/dl/dd/span
* Exon count //*[@id="padded_content"]/div[6]/div[2]/div[2]/div/div/dl/dd
* Chr (GRCh38) //*[@id="genomic-context-tbl-location"]//tbody/tr[1]/td[4]
* Genomic location (GRCh38) //*[@id="genomic-context-tbl-location"]//tbody/tr[1]/td[5]
* Chr (GRCh37) //*[@id="genomic-context-tbl-location"]//tbody/tr[2]/td[4]
* Genomic location (GRCh37) //*[@id="genomic-context-tbl-location"]//tbody/tr[2]/td[5]

## Resources 
1. Retrieve tumor suppressor gene table from <a href="https://www.cancerquest.org/cancer-biology/cancer-genes" target="_blank"> CancerQuest</a>
2. Annotate gene from <a href="https://www.ncbi.nlm.nih.gov/" target="_blank"> NCBI</a>
