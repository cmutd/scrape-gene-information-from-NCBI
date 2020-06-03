# scrape-gene-information-from-NCBI

## xpath
* <b>Official Symbol</b>  //*[@id="summaryDl"]/dd[1]/text()
* <b>Official Full name</b> //*[@id="summaryDl"]/dd[2]/text()
* <b>Gene type</b> //*[@id="summaryDl"]/dd[5]
* <b>Summary</b> //*[@id="summaryDl"]/dd[10]
* <b>Alias</b> //*[@id="summaryDl"]/dd[9]
* <b>Cytogenetic location</b> //*[@id="padded_content"]/div[6]/div[2]/div[2]/div/div/div[1]/dl/dd/span
* <b>Exon count</b> //*[@id="padded_content"]/div[6]/div[2]/div[2]/div/div/dl/dd
* <b>Chr (GRCh38)</b> //*[@id="genomic-context-tbl-location"]//tbody/tr[1]/td[4]
* <b>Genomic location (GRCh38)</b> //*[@id="genomic-context-tbl-location"]//tbody/tr[1]/td[5]
* <b>Chr (GRCh37)</b> //*[@id="genomic-context-tbl-location"]//tbody/tr[2]/td[4]
* <b>Genomic location (GRCh37)</b> //*[@id="genomic-context-tbl-location"]//tbody/tr[2]/td[5]

## Resources 
1. Retrieve tumor suppressor gene table from <a href="https://www.cancerquest.org/cancer-biology/cancer-genes" target="_blank"> CancerQuest</a>
2. Annotate genes from <a href="https://www.ncbi.nlm.nih.gov/" target="_blank"> NCBI</a>
